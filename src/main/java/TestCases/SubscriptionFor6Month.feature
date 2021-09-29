@notready
Feature: Subscription
  As a user wants to subscribe for demo.
  User is able to buy subscriptions for 1month/6month or 1year.
  Also user is able to start 7days trial

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
    And User finalizes subscription
    Then User should receive reference number
    When User User chooses to go to the payment method
    Then User should be redirected to the Payment Site
    And The payment site should be <payment site>
    Examples:
      | first name | last name | email            | country | period  | payment site |
      | Bartłomiej | Dąbrowski | BDabrowski@wp.pl | Poland  | 1 month | Blue Media   |
      | Michał     | Stępien   | MStepien@wp.pl   | Poland  | 3 month | Blue Media   |
      | Krzysztof  | Krawczyk  | KKrawczyk@wp.pl  | Poland  | 1 year  | Blue Media   |
      | Marian     | Baran     | MBaran@wp.pl     | England | 1 month | Paypal       |
      | Eugeniusz  | Wójcik    | EWojcik@wp.pl    | England | 3 month | Paypal       |
      | Bogumił    | Jaworski  | BJaworski@wp.pl  | England | 1 year  | Paypal       |
# Blue Media is only for that we are able to parametrize any other test date

  @smoke
  Scenario Outline: Subscription with trial
    Given User sets First Name as <first name>
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    And User selects free Trial period
    When User continues the process
    And User finalizes subscription
    Then User should receive reference number
    When User User chooses to go to the payment method
    Then User should be redirected to the Payment Site
    And The payment site should be <payment site>
    Examples:
      | first name | last name  | email             | country | period  | payment site |
      | Miron      | Krawczyk   | MKrawczyk@wp.pl   | Poland  | 1 month | Blue Media   |
      | Milan      | Mazur      | MMazur@wp.pl      | Poland  | 3 month | Blue Media   |
      | Kacper     | Marciniak  | KMarciniak@wp.pl  | Poland  | 1 year  | Blue Media   |
      | Dorian     | Wysocki    | DWysocki@wp.pl    | England | 1 month | Paypal       |
      | Rafał      | Woźniak    | RWozniak@wp.pl    | England | 3 month | Paypal       |
      | Janusz     | Piotrowski | JPiotrowski@wp.pl | England | 1 year  | Paypal       |



