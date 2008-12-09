module Viapost
  
  class Interface
    
    TEST_WSDL = 'http://apitest.viapost.com/viapostcustomer.asmx?WSDL'
    LIVE_WSDL = 'http://api.viapost.com/Viapostcustomer.asmx?WSDL'
    
    class UnknownEnvironment < Exception; end
    class InvalidUserOrPass < Exception; end
    
    def initialize(user, pass, environment = :live)
      @driver = SOAP::WSDLDriverFactory.new(wsdl(environment)).create_rpc_driver
      @user = user
      @pass = pass
    end
    
    def get_balance
      response = @driver.GetBalance(:sLoginToken => login_token)
      response.dBalance.to_f
    end
    
    private
    
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