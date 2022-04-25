*** Settings ***
Documentation       Landing Page Keywords Repository
Library             SeleniumLibrary
Resource            ../Data/InputData.robot

*** Variables ***
${SEARCH_FIELD}      name: q

*** Keywords ***
I want repositories coded in "javascript"
    Set Global Variable    ${SEARCH_INPUT}    language:javascript

I search Github
    [Arguments]     ${search_input}
    input text      ${SEARCH_FIELD}               ${search_input}
    Press Keys      ${SEARCH_FIELD}               ENTER
