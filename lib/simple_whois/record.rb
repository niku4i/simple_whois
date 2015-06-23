module SimpleWhois
  class Record

    attr_reader :body

    # @body raw [String] of whois server response.
    def initialize(body)
      @body = body
    end

    def to_s
      body
    end

    # @pattern [Regex]
    # @return [MetaData]
    def match(pattern)
      body.match(pattern)
    end

    # @pattern [Regex]
    # @return [Boolean]
    def match?(pattern)
      !body.match(pattern).nil?
    end

  end
end
