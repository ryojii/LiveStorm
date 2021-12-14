# BS_Formatter.rb

# BS_Formatter is used to send result to BrowserStack.
# It add failure description in order to ease debbug from BrowserStack.
#
# Note: It also close the driver to avoid timeout in browserStack, which will waste remaining timev 
# I think there is a better way to do this as it is really ugly.
#

class BS_Formatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed

  def initialize(out)
    @out = out
  end

  def example_passed notification # ExampleNotification
    reason = notification.example.execution_result.status.to_s
    $driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "' + reason  + '"}}')
    $driver.quit
  end

  def example_failed notification # FailedExampleNotification
    reason = notification.message_lines.join("\n")
    $driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "' + reason + '"}}')
    $driver.quit
  end

end

RSpec.configure do |c|
  c.add_formatter 'progress'
  c.add_formatter BS_Formatter
end
