Given(/^I navigate to '(.+)'$/) do |url|
  @browser.goto url
end

When(/^I access the '(.+)' link$/) do |link_title|
  @browser.link(text: link_title).wait_until(&:present?).wait_while(&:obscured?).click
end

Then(/^I should be on the '(.+)' page$/) do |page_title|
  @browser.wait
  expect(@browser.h2(text: page_title).present?).to be(true)
end