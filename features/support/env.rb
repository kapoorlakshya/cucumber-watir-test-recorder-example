World(HelperMethods)

@browser_name = ENV['browser'] || :chrome
@record       = true?(ENV['record']) || false