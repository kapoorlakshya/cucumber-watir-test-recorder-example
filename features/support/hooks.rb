Before do
  opts      = { input:     'desktop',
                output:    'test-recording.mp4',
                framerate: 15,
                log:       'recorder.log',
                advanced:  { preset: 'ultrafast',
                             crf:    22 }
  }
  @recorder = FFMPEG::ScreenRecorder.new(opts)
  @browser  = Watir::Browser.new @browser_name
end

After do
  @recorder.stop
  @browser.quit
end