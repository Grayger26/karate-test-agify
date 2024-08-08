Feature: Age prediction v2

  Background:
    * def expectedAges = { caren: 40, george: 85, john: 73 }

  Scenario Outline: Validate predicted age for name - <name>

    # Send GET request
    Given url 'https://api.agify.io'
    And param name = '<name>'
    When method get
    Then status 200
    And match response == { count: '#number', name: '#string', age: '#number' }
    * def expectedAge = expectedAges[name]
    * match response.age == expectedAge

    Examples:
      | name    |
      | caren   |
      | george  |
      | john    |
