Feature: Signing in

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When she submits invalid signin information
    Then she should see an error message

  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
    Then she should see her profile page
      And she should see a signout link