@notready
Feature: Subscription Form
  As a user wants to change subscription plan
  User is able to buy subscriptions for 1month/6month/1year or start seven days free trial.
  So that when user is moved to step two and wants to make some changes there is a possibility to back to the first page.

  Background:
    Given User logs in to formsmarts

  @smoke
  Scenario Outline: Subscription without trial
    Given User sets First Name as <first name>
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    And User undo changes
    Then User should be moved to the first page
    And User should be able to make changes
    Examples:
      | first name | last name | email            | country | period  | payment site |
      | Bartłomiej | Dąbrowski | BDabrowski@wp.pl | Poland  | 1 month | Blue Media   |
      | Michał     | Stępien   | MStepien@wp.pl   | Poland  | 3 month | Blue Media   |
      | Krzysztof  | Krawczyk  | KKrawczyk@wp.pl  | Poland  | 1 year  | Blue Media   |
      | Marian     | Baran     | MBaran@wp.pl     | England | 1 month | Paypal       |
      | Eugeniusz  | Wójcik    | EWojcik@wp.pl    | England | 3 month | Paypal       |
      | Bogumił    | Jaworski  | BJaworski@wp.pl  | England | 1 year  | Paypal       |
# Blue Media is only for that we are able to parametrize any other test date