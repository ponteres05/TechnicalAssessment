# TechnicalAssessment

1. Note! Please change the ${CHROMEDRIVER_PATH} variable value scripted in the Config.robot file under Data folder to the path where your chromedriver.exe is located.

![image](https://user-images.githubusercontent.com/56670979/164565504-4ffc9033-457d-4f45-8f9b-c7ab3e6bece3.png)


2. To execute the tests use the following command on the root of the project:

**(Part 1) UI Automation**

robot -d ./Results Test/GithubSearch.robot



**(Part 2) API Automation**

robot -d ./Results Test/API.robot

OR

**Execute All**

robot -d ./Results Test/


3. 
  a. After running the tests, you can see the HTML logs and report in the Results folder (open to a browser). 
  
  b. Also, the screenshot(s) in png format of the failures for the UI Automation can also be seen under the Results folder after test run if there are any failed test    case(s). To test this, we can intentionally fail the UI Automation test by changing the value in the assertion (i.e. expected language) scripted in the RepoResults.robot under PO folder:
  
  File: PO/RepoResults.robot
  
  *Change "JavaScript" to any language (e.g. C) from the script
  
  KEYWORD: I should see some repositories coded in "javascript"
    
    ${range}=     Get Element Count   css: .repo-list-item

    FOR     ${index}    IN RANGE       ${range}
        ${index}    Set Variable   ${index} + 1
        Run keyword And Continue On Failure     Element Text Should Be    xpath: //*[@id="js-pjax-container"]/div/div[3]/div/ul/li[${index}]/div[2]/div[2]/div/div[2]/span/span[2]     JavaScript
    END
