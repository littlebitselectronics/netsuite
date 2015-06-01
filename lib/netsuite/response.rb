module NetSuite
  class Response
    attr_accessor :header, :body, :errors, :request_body, :response_body

    def initialize(attributes = {})
      @success  = attributes[:success]
      @header   = attributes[:header]
      @body     = attributes[:body]
      @errors   = attributes[:errors] || []
      @request_body     = attributes[:request_body]
      @response_body     = attributes[:response_body]
    end

    def success!
      @success = true
    end

    def success?
      @success
    end
  end
end
