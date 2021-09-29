@notready
Feature: Fields Validations
  As a User wants to validate fields
  Users cannot provide more than 150 characters for the field First name and Last name and 64 in the email.
  Same situation if user does not select the country.
  So that when user provides more than expected characters different validations message occurs.

  Background:
    Given User logs in to formsmarts

  @Critical
  Scenario Outline: Form Validations
    Given User sets First Name as <first name>
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    Then User should receive validation error <error message>
    Examples:
      | first name | last name   | email            | country              | error message                            |
      | Kewin21    | Gajewska    | KGajewska@wp.pl  | Polska               | Tylko litery, spacje i znaki "-".        |
      | Grzegorz   | Dąbrowski13 | GDabrowski@wp.pl | Polska               | Tylko litery, spacje i znaki "-".        |
      | Heronim    | Tomaszewski | HTomaszewski@pl  | Polska               | Adres e-mail, jak np. alice@example.com. |
      | Grzegorz   | Witkowski   | GWitkowski@wp.pl | Select your country: | Dwuliterowy kod krajowy ISO.             |
  #Or we can do it also like that. It is dependent from the standards in the company
      | Kewin21    | Gajewska!@  | KGajewska@pl     | Select your country: | Validation message occurs                |

  @critical
  Scenario Outline: Field length Validations option 1
    Given User sets First Name as <first name>
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    Then User should receive validation error <error message>
    Examples:
      | first name               | last name                | email                                | country              | error message                                               |
      | More than 150 characters | Adamska                  | BAdamska@wp.pl                       | Polska               | Tylko litery, spacje i znaki "-". Za długie, usuń 1 znaków. |
      | Alex                     | More than 150 characters | AMróz@wp.pl                          | Polska               | Tylko litery, spacje i znaki "-". Za długie, usuń 1 znaków. |
      | Marian                   | Makowski                 | mmakowski@pl                         | Polska               | Adres e-mail, jak np. alice@example.com.                    |
    #Same here. We can do it also like that. It is dependent from the standards in the company
      | More than 150 characters | More than 150 characters | More than 63 characters before@wp.pl | Select your country: | Adres e-mail, jak np. alice@example.com.                    |

    #Or we can do it also like that

  Scenario Outline: Field length Validations option 2
    Given User fills First Name as <fnumber> character
    And User fills Last Name as <lnumber> character
    And User fills Email Address as <enumber> character
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    Then User should receive validation error <error message>
    Examples:
      | fnumber | lnumber | enumber | country              | error message             |
      | 151     | 151     | 64      | Select your country: | Validation message occurs |