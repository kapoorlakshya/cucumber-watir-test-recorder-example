Before do |scenario|

  #
  # Browser browser
  #
  @browser_name          = :chrome
  Webdrivers.install_dir = 'webdrivers_bin'
  recording_name         = scenario.name.gsub(/\s/, '-').downcase + '.mp4'
  @browser               = Watir::Browser.new @browser_name

  #
  # Start recording
  #
  @recorder    = ScreenRecorder::Desktop.new(output: recording_name)
  @recorder.start
end

#
# Stop recording and close browser
#
After do |scenario|
  @recorder.stop
  @browser.quit
  # @recorder.discard if scenario.passed?
end