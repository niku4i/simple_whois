# encoding: utf-8

require 'socket'
require 'simple_whois/errors'

module SimpleWhois
  class SocketHandler

    # Array of connection errors to rescue
    # and wrap into a {Whois::ConnectionError}
    RESCUABLE_CONNECTION_ERRORS = [
      SystemCallError,
      SocketError,
    ]

    # Performs the Socket request.
    #
    # @param  [String] query
    # @param  [Array] args
    # @return [String]
    #
    def call(query, args)
      execute(query, args)
    rescue *RESCUABLE_CONNECTION_ERRORS => error
      raise ConnectionError, "#{error.class}: #{error.message}"
    end

    private

    # Executes the low-level Socket connection.
    #
    # It opens the socket passing given +args+,
    # sends the +query+ and reads the response.
    #
    # @param  [String] query
    # @param  [Array] args
    # @return [String]
    #
    def execute(query, args)
      client = TCPSocket.new(*args)
      client.write("#{query}\r\n")
      client.read
    ensure
      client.close if client
    end

  end
end
