*** Settings ***
Documentation       Repository Results Page Keywords Repository
Library             SeleniumLibrary
Resource            ../Data/Config.robot
Resource            ../Data/InputData.robot

*** Keywords ***
I should see some repositories coded in "javascript"
    ${range}=     Get Element Count   css: .repo-list-item

    FOR     ${index}    IN RANGE       ${range}
        ${index}    Set Variable   ${index} + 1
        Run keyword And Continue On Failure     Element Text Should Be    xpath: //*[@id="js-pjax-container"]/div/div[3]/div/ul/li[${index}]/div[2]/div[2]/div/div[2]/span/span[2]     JavaScript
    END
