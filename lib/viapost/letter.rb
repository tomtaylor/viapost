module Viapost

  class Letter
  
    attr_reader :id, :file_name, :number_of_pages, :uploaded_at
    
    def LetterID
      self.id
    end
    
    def LetterFileName
      self.file_name
    end
    
    def NumberOfPages
      self.number_of_pages
    end
    
    def DateUploaded
      self.uploaded_at
    end
  
    def initialize(id, file_name, number_of_pages, uploaded_at)
      @id = id
      @file_name = file_name
      @number_of_pages = number_of_pages
      @uploaded_at = uploaded_at
    end
  
    def self.build_from_soap_object(soap_object)
      file_name = soap_object.letterFileName
      id = soap_object.letterID.to_i
      number_of_pages = soap_object.numberOfPages.to_i
      uploaded_at = Time.parse(soap_object.dateUploaded)
      return new(id, file_name, number_of_pages, uploaded_at)
    end
  
  end
  
end