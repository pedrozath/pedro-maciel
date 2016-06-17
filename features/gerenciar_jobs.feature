Feature: Admin adds new jobs
    As an admin
    I want to add a new jobs
    In order to build the portfolio

    Scenario: Not seing forms before logging in
        Given I am not logged in
        When I go to the job list
        Then I should not see any forms

    Scenario: Adding a job while logged in
        Given I am logged in
        When I go to the job list
        Then I should see forms