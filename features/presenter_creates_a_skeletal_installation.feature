Feature: presenter creates a skeletal installation

  Scenario: creates a skeletal installation
    Given the jekyll_and_hyde gem installed
    When I run the "jh new test" command inside folder "/"
    Then I should have a folder named "test" created
    And I should have template files/folders "_config.yml, _includes, _layouts, index.html, stylesheets, .git, .gitmodules, slippy" inside folder "test"

  Scenario: creates a skeletal installation with GitHub project page branch setup
    Given the jekyll_and_hyde gem installed
    When I run the "jh new test --github" command inside folder "/"
    Then I should have a git branch named "gh-pages" created in folder "test"