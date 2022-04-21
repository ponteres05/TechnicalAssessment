# TechnicalAssessment

Note! Please change the ${CHROMEDRIVER_PATH} variable value scripted in the Config.robot file under Data folder to the path where your chromedriver.exe is located

To execute the tests use the following command on the root of the project:

**(Part 1) UI Automation**

cd Test

robot -d ../Results GithubSearch.robot



**(Part 2) API Automation**

cd Test

robot -d ../Results API.robot
