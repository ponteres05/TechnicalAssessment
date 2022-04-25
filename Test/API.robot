*** Settings ***
Documentation       API Automation
Library             Collections
Library             RequestsLibrary

*** Variables ***
${URL}          https://api.github.com
${QUERY}        tetris+language:${LANGUAGE}
${LANGUAGE}     Assembly
${SORT_BY}      stars
${SORT_ORDER}   desc


#robot -d ../Results Test/API.robot

*** Test Cases ***

Search Repositories in Github

    #Execute GET call
    ${get_response}=    GET   ${URL}/search/repositories    params=q=${QUERY}&sort=${SORT_BY}&order=${SORT_ORDER}     expected_status=200

    #Log GET response in JSON format
    log     ${get_response.json()}

    #1 Validate that if a repository has has_issues of false then it should also have open_issues equal to 0
    ${items_list}   Set Variable    ${get_response.json()}[items]
    ${range}=     Get Length   ${items_list}

    FOR     ${index}    IN RANGE       ${range}
        ${get_has_issues_value}     Set Variable    ${get_response.json()}[items][${index}][has_issues]
        log     ${get_has_issues_value}
        IF  "${get_has_issues_value}" == "False"
            ${get_open_issues_value}     Set Variable    ${get_response.json()}[items][${index}][open_issues]
            Run keyword And Continue On Failure     Should be equal as Strings     0   ${get_open_issues_value}
            log     ${get_open_issues_value}
        END
    END

    #2 Validate that when a language filter is given then all returned repositories should be written in that language
    FOR     ${index}    IN RANGE       ${range}
        ${get_language_value}     Set Variable    ${get_response.json()}[items][${index}][language]
        log     ${get_language_value}
        Run keyword And Continue On Failure     Should be equal as Strings     ${LANGUAGE}   ${get_language_value}
    END

    #3 Validate that some attributes in the response have correct datatype

    #name
    FOR     ${index}    IN RANGE       ${range}
        ${get_name_value}  Set Variable    ${get_response.json()}[items][${index}][name]
        ${is_string}=      Evaluate     isinstance($get_name_value, str)
        Run keyword And Continue On Failure     Should be equal as Strings     True   ${is_string}
    END

    #fork
    FOR     ${index}    IN RANGE       ${range}
        ${get_fork_value}  Set Variable    ${get_response.json()}[items][${index}][fork]
        ${is_boolean}=      Evaluate     isinstance($get_fork_value, bool)
        Run keyword And Continue On Failure     Should be equal as Strings     True   ${is_boolean}
    END

    #url
    FOR     ${index}    IN RANGE       ${range}
        ${get_url_value}    Set Variable    ${get_response.json()}[items][${index}][url]
        ${is_string}=      Evaluate     isinstance($get_url_value, str)
        Run keyword And Continue On Failure     Should be equal as Strings     True   ${is_string}
    END
