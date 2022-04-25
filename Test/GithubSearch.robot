*** Settings ***
Documentation       To validate that repositories coded in "javascript" are displayed after search
Library             SeleniumLibrary
Test Setup          Common.Open Website
Test Teardown       Common.Close Website
Resource            ../PO/Common.robot
Resource            ../PO/LandingPage.robot
Resource            ../PO/RepoResults.robot

#robot -d ../Results Test/GithubSearch.robot

*** Test Cases ***
Search for javascript projects
    Given I want repositories coded in "javascript"
    When I search Github    ${SEARCH_INPUT}
    Then I should see some repositories coded in "javascript"


