Feature: Age Prediction


  Scenario Outline: Verify the predicted age for different names

    # Send GET request
    Given url 'https://api.agify.io'
    And param name = name
    When method get
    Then status 200
    And match response == { count: '#number', name: '#string', age: '#number' }
    And match response.age == <expectedAge>

    # Names and their expected ages
    Examples:
    | name   | expectedAge |
    | caren  | 40          |
    | george | 85          |
    | john   | 73          |

