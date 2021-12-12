# BS_Formatter.rb

# BS_Formatter is used to send result to BrowserStack.
# It add failure description in order to ease debbug from BrowserStack.
#
# Note: It also close the driver to avoid timeout in browserStack, which will use time for nothing. 
# I think there is a better way to do this as it is really ugly.

class BS_Formatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed

  def initialize(out)
    @out = out
  end

  def example_passed notification # ExampleNotification
    @driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "' + notification.description + '"}}')
    @driver.quit
  end

  def example_failed notification # FailedExampleNotification
    @driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "' + notification.description + '"}}')
    @driver.quit
  end
end

RSpec.configure do |c|
  c.add_formatter 'progress'
  c.add_formatter BS_Formatter
end
