require 'jekyll_and_hyde'

RSpec.configure do |config|
  def destination_root
    File.expand_path('../test_target', File.dirname(__FILE__))
  end
end