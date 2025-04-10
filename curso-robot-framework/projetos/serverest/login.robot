*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      
${BROWSER}  

*** Keywords ***


*** Test Cases ***
Login Test
    Open Browser    https://front.serverest.dev/login    chrome
    Sleep    5s
    Input Text      id=email    horadoqa@teste.com
    Input Text      id=password    1q2w3e4r
    Sleep    5s
    Click Button    //*[@id="root"]/div/div/form/button
    Sleep    5s
    Wait Until Page Contains    Este é seu sistema para administrar seu ecommerce.    timeout=10s
    Close Browser