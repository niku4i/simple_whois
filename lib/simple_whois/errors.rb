module SimpleWhois

  # The base error class for all <tt>Whois</tt> error classes.
  class Error < StandardError; end

  # Raised when the connection to the WHOIS server fails.
  class ConnectionError < Error; end

end
