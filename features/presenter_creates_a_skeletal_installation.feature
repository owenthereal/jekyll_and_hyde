Feature: presenter creates a skeletal installation

    Scenario: creates a skeletal installation
      Given the jekyll_and_hyde gem installed
      When I run the "jh new test" command
      Then I should have a folder named "test" created
      And I should have template files/folders "_config.yml, _includes, _layouts, index.html, stylesheets, .git, .gitmodules, slippy" inside folder "test"