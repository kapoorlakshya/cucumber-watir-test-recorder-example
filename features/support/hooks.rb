Before('@watir') do

  #
  # Setup Browser & Webdrivers gem
  #
  @browser_name          = :firefox
  Webdrivers.install_dir = 'webdrivers_bin'

  #
  # Setup Recorder
  #
  opts      = { input:     'Mozilla Firefox',
                output:    'test-recording.mp4',
                framerate: 15,
                log:       'recorder.log'
  }
  @recorder = FFMPEG::ScreenRecorder.new(opts)

  #
  # Start recording and launch browser
  #
  caps = {
    platform:    'Windows 10',
    browserName: 'Chrome',
    version:     '70'
  }


  sauce_user = ENV['sauce_user']
  sauce_key  = ENV['sauce_key']
  sauce_url  = "https://#{sauce_user}:#{sauce_key}@ondemand.saucelabs.com:443/wd/hub"
  @browser   = Watir::Browser.new(@browser_name, url: sauce_url, desired_capabilities: caps)
  @recorder.start
end

#
# Close browser and stop recording
#
After('@watir') do
  @recorder.stop
  @browser.quit
end