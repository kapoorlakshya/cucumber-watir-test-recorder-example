Before do |scenario|

  #
  # Browser browser
  #
  @browser_name          = :firefox
  Webdrivers.install_dir = 'webdrivers_bin'
  recording_name         = scenario.name.gsub(/\s/, '-').downcase + '.mp4'
  @browser               = Watir::Browser.new @browser_name

  #
  # Start recording
  #
  window_title = ScreenRecorder::Titles.fetch(@browser_name).first
  @recorder    = ScreenRecorder::Window.new(title: window_title, output: recording_name)
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