require 'timeout'

require 'simple_whois/record'
require 'simple_whois/socket_handler'

module SimpleWhois

  class Client

    # The maximum time to run a WHOIS query, expressed in seconds.
    #
    # @return [Fixnum] Timeout value in seconds.
    DEFAULT_TIMEOUT = 10

    # Default WHOIS request port.
    DEFAULT_WHOIS_PORT = 43
    # Default bind hostname.
    DEFAULT_BIND_HOST = "0.0.0.0"

    attr_accessor :server, :port, :timeout
    attr_accessor :socket_handler # useful in testing

    def initialize(server, opts = {})
      @server = server
      @port = opts[:port] || DEFAULT_WHOIS_PORT
      @timeout = opts[:timeout] || DEFAULT_TIMEOUT
      @socket_handler = SocketHandler.new
    end

    def lookup(name)
      Timeout::timeout(@timeout) do
        Record.new(query(name, @server, @port))
      end
    end

    private

    # @param [String] name 
    # @param [String] server
    # @param [String] port
    # @return [String]
    def query(name, server, port = nil)
      args = []
      args.push(server)
      args.push(port.to_s)
      args.push(DEFAULT_BIND_HOST)
      @socket_handler.call(name, args)
    end

  end
end
