Feature: presenter creates slides

  Scenario: creates a slide
    Given I run the "jh new test" command inside folder "/"
    When I run the "jh generate test-slide" command inside folder "test"
    Then I should have a file named "test-slide.markdown" prefixed with timestamp created in posts folder "test/_posts"