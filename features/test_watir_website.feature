@watir
Feature: Navigation Links on Watir.com
  As an automated tester, I want to verify the navigation links in the header of Watir.com work and
  open the expected pages.

  Background:
    Given I navigate to 'watir.com'

    Scenario: Test Navigation Links
      When I access the 'News' link
      Then I should be on the 'Watir News' page
      When I access the 'Guides' link
      Then I should be on the 'Guides' page
      When I access the 'Help' link
      Then I should be on the 'Help' page
      When I access the 'About' link
      Then I should be on the 'About Watir' page