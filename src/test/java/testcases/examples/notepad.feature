Feature: windows calculator

  Scenario:
    * robot { window: '^Car Rental', fork: 'C:/Program Files/LogiGear/TestArchitect/samples/CarRental/CarRental.exe', highlight: true, highlightDuration: 500 }
    * click('{eng}Login')
