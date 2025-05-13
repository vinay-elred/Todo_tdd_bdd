Feature: Todo
    Background: setup test DI

    Scenario: When Todo list is empty
        Given: Mock Prefs empty Todos List
        Given: The app is running
        Then: I see {"No Todo Yet!"} text

    Scenario: When I tap Add Todo
        Given: Mock Prefs empty Todos List
        Given: The app is running
        When: I tap {Icons.add} icon
        Then: I see {"Add todo"} text
    
    Scenario: When I Added a new Todo
        Given: Mock prefs return Todo when added
        Given: The app is running
        When: I tap {Icons.add} icon
        When: I enter {"Test todo"} in textfield
        And: I tap {"Save"} text
        Then: I see {"Todos"} text
        And: I see {"Test todo"} text

