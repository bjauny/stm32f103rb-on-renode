*** Settings ***
Suite Setup     Setup
Suite Teardown  Teardown
Test Teardown   Test Teardown
Resource        ${RENODEKEYWORDS}

*** Test Cases ***
LED toggle
    Execute Command     include @${CURDIR}/load_and_start_renode.resc
    Execute Command     sysbus LogPeripheralAccess sysbus.gpioPortA
    
    Create Log Tester   20
    Start Emulation
    
    Execute Command     sysbus.gpioPortC.UserButton PressAndRelease
    Wait For Log Entry  WriteUInt32 to 0x10 (BitSetReset), value 0x20.
