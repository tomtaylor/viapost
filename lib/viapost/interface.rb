require 'base64'

module Viapost
  
  class Interface
    
    TEST_WSDL = 'http://apitest.viapost.com/viapostcustomer.asmx?WSDL'
    LIVE_WSDL = 'http://api.viapost.com/Viapostcustomer.asmx?WSDL'
    
    class UnknownEnvironment < Exception; end
    class InvalidUserOrPass < Exception; end
    
    attr_reader :driver, :login_token
    
    def initialize(user, pass, environment = :live)
      @driver = SOAP::WSDLDriverFactory.new(wsdl(environment)).create_rpc_driver
      @user = user
      @pass = pass
    end
    
    def balance
      response = @driver.GetBalance(:sLoginToken => login_token)
      response.dBalance.to_f
    end
    
    def letters(query = '')
      response = @driver.GetLetters(:sLoginToken => login_token, :sSearchDocumentName => query)
      soap_letters = response.returnLetters.anyType
      
      # for some reason their API returns just the letter instead of an array if it only returns one letter
      if soap_letters.is_a?(Array)
        soap_letters.map { |l| Letter.build_from_soap_object(l) }
      else
        [Letter.build_from_soap_object(soap_letters)]
      end
    end
    
    def upload_letter(file, title, colour = false, double_sided = false)
      file = File.open(file, 'r') if file.is_a?(String) # allow path instead of file
      
      response = @driver.UploadDocument(:sLoginToken => login_token, :sDocumentName => title, :DocumentData => file.read, :Colour => colour, :DoubleSided => double_sided)
    end
    
    def send_letter(letter, name, address_1, address_2, address_3, address_4, address_5, postcode)
      response = @driver.SendLetter(:sLoginToken => login_token, :myCustomerAPILetter => letter, :addressName => name, :address1 => address_1, :address2 => address_2, :address3 => address_3, :address4 => address_4, :address5 => address_5, :postcode => postcode)
    end
    
    def letter(letter_id)
      @driver.GetLetterByID(:sLoginToken => login_token, :LetterID => letter_id)
    end
    
    # private
    
    def login_token
      @login_response ||= @driver.SignIn(:sUserName => @user, :sPassword => @pass)
      
      if @login_response.signInResult == 'true' # i hate soap.
        return @login_response.sLoginToken
      else
        raise InvalidUserOrPass
      end
    end
    
    def wsdl(environment)
      case environment.to_sym
      when :live
        wsdl = LIVE_WSDL
      when :test
        wsdl = TEST_WSDL
      else
        raise UnknownEnvironment
      end
    end
    
  end
  
end