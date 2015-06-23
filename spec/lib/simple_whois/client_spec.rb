require 'spec_helper'

describe SimpleWhois::Client do
  let(:opts) { {} }
  let(:client) { described_class.new(server, opts) }

  describe '#lookup' do
    let(:server) { 'whois.dummy.local' }
    let(:name) { '1.2.3.4' }
    it "can lookup" do
      # Setup client
      socket_handler = double(:socket_handler)
      client.socket_handler = socket_handler

      # Set message expectation
      expect(socket_handler).to receive(:call).with(name, [server, "43", "0.0.0.0"]) { "string" }

      # Lookup
      ret = client.lookup(name)
      expect(ret).to be_a_kind_of SimpleWhois::Record
      expect(ret.body).to eq "string"
    end
  end

  describe '#lookup (with actual whois server)' do
    let(:server) { 'whois.radb.net' }
    let(:name) { '1.2.3.4' }
    it "can lookup" do
      ret = client.lookup(name)
      expect(ret).to be_a_kind_of SimpleWhois::Record
    end
  end
end

