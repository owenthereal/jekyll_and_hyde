Feature: presenter creates a skeletal installation

    Scenario: creates a skeletal installation
      Given the jekyll_and_hyde gem installed
      When I run the "jh new slides" command
      Then I should have a folder named "slides" created