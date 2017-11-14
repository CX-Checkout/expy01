# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test
  def test_subtract_offer
    subtract_offer_from?({"A" => 2}, )
  end
end