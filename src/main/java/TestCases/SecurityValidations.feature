@notready
Feature: Security Validations
  As a User wants to check there is no possibility to broke security
  User tries to put some Xss/SQL Injection validations to the fields.
  So that when users provide XSS or SQL Injection in to the fields validation occurs.

  Background:
    Given User logs in to formsmarts

  @critical
  Scenario Outline: XSS Validations
    Given User sets First Name as <first name>,
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    Then User should receive validation error <error message>
    Examples:
      | first name                | last name                 | email                     | error message                            |
      | <script>alert(1)</script> | Cieślak                   | ACieslak@wp.pl            | Tylko litery, spacje i znaki "-".        |
      | Juliusz                   | <script>alert(1)</script> | JKazimierczak@wp.pl       | Tylko litery, spacje i znaki "-".        |
      | Dominik                   | Wróblewski                | <script>alert(1)</script> | Adres e-mail, jak np. alice@example.com. |
#Or we can do it also like that. It is dependent from the standards in the company
      | <script>alert(1)</script> | <script>alert(1)</script> | <script>alert(1)</script> | Validation message occurs                |

  @critical
  Scenario Outline: SQL Injection Validations
    Given User sets First Name as <first name>
    And User sets Last Name as <last name>
    And User sets Email Address as <email>
    And User chooses country <country>
    And User chooses <period> subscription
    When User continues the process
    Then User should receive validation error <error message>
    Examples:
      | first name  | last name   | email            | error message                            |
      | " or ""="   | Jankowski   | BJankowski@wp.pl | Tylko litery, spacje i znaki "-".        |
      | Marian      | " or ""="   | Mmakowski@wp.pl  | Tylko litery, spacje i znaki "-".        |
      | Cyprian     | Kozłowski   | " or ""="        | Adres e-mail, jak np. alice@example.com. |
      | ' OR '1'='1 | Sawicki     | RSawicki@wp.pl   | Tylko litery, spacje i znaki "-".        |
      | Dominik     | ' OR '1'='1 | DKucharski@wp.pl | Tylko litery, spacje i znaki "-".        |
      | Jacek       | Szewczyk    | ' OR '1'='1      | Adres e-mail, jak np. alice@example.com. |
    #Or we can do it also like that. It is dependent from the standards in the company
      | " or ""="   | " or ""="   | " or ""="        | Validation message occurs                |
      | ' OR '1'='1 | ' OR '1'='1 | ' OR '1'='1      | Validation message occurs                |