Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in

    Scenario: User signs up with valid data
      When I sign up with valid user data
      Then I should see a successful sign up message
      
    Scenario: User signs up with non-unique data
      Given I exist as a user
      When I sign up with valid user data
      Then I should see non-unique data messages
      
    Scenario: User signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid email message

    Scenario: User signs up without password
      When I sign up without a password
      Then I should see a missing password message

    Scenario: User signs up without name
      When I sign up without a name
      Then I should see a missing name message

    Scenario: User signs up without password confirmation
      When I sign up without a password confirmation
      Then I should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message
