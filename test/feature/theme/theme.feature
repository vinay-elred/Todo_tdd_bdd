Feature: Theme
    Background:
        Given The setup Test DI

    Scenario: Default Theme will system setting
        Given Phone Theme setting is Dark
        Given The app is running
        Then I see {"Todos"} text color as {Colors.white}

    Scenario: Default Theme will system setting
        Given Phone Theme setting is Light
        Given The app is running
        Then I see {"Todos"} text color as {Colors.black}

    Scenario: User changed System Theme to Dark
        Given App Theme setting is Light
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"Dark"} text
        Then I see {"Todos"} text color as {Colors.white}

    Scenario: User changed System Theme to Light
        Given App Theme setting is Dark
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"Light"} text
        Then I see {"Todos"} text color as {Colors.black}

    Scenario: User changed Dark Theme to System
        Given Phone Theme setting is Light
        Given App Theme setting is Dark
        Given The app is running
        When I tap {Icons.settings} icon
        And I tap {"System"} text
        Then I see {"Todos"} text color as {Colors.black}    
