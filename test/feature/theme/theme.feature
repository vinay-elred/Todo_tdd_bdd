Feature: Theme
    Background:
        Given The setup Test DI

    Scenario: Default Theme will system setting
        Given The app is running
        When I tap {Icons.settings} icon
        Then I see {Icons.check} on {"System"}

    Scenario: User changed System Theme to Dark
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"Dark"} text
        Then I see {Icons.check} on {"Dark"}

    Scenario: User changed System Theme to Light
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"Light"} text
        Then I see {Icons.check} on {"Light"}

    Scenario: User changed Dark Theme to System
        Given App Theme setting is Dark
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"System"} text
        Then I see {Icons.check} on {"System"}
