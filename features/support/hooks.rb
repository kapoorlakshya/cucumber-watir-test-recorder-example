Before do |scenario|

  #
  # Setup Browser & Webdrivers gem
  #
  @browser_name          = :firefox
  Webdrivers.install_dir = 'webdrivers_bin'
  recording_name         = scenario.name.gsub(/\s/, '-').downcase + '-fail.mp4'

  #
  # Setup Recorder
  #
  opts      = { input:     'Mozilla Firefox',
                output:    recording_name,
                framerate: 15,
                log:       'recorder.log'
  }
  @recorder = FFMPEG::ScreenRecorder.new(opts)

  #
  # Start recording and launch browser
  #
  @browser = Watir::Browser.new @browser_name
  @recorder.start
end

#
# Close browser and stop recording
#
After do |scenario|
  @recorder.stop
  @browser.quit
end