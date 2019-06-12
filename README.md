# Rock Paper Scissors
This is an iOS Application developed to digitise the Rock Paper Scissors game on an iOS powered device. 

## Game rules
Each game can be played between a computer (aka BOT) and player or between computer. When the game is being played between computers, users can sit back relax and witness the BOTs battle. 

Each game has minimum number of rounds. By default it is set to 3. But it can be reduced or increased inside the `GameEngine.swift` file by updating the `numberOfRounds` variable. 

User has to respond within 5 seconds. Otherwise the it is assumed that the BOT / Computer won the round. The number of seconds can be configured in the `GameEngine.swift` file by updating the `waitingTime` variable.

## How to run
Simply open the RPS.xcodeproj in XCode and run the solution. If you have XCode command line tools installed you can invoke it using command line too.

## Run Tests
Open the solution in XCode and press `Ctrl + U`

## Sample UI Mocks
Adobe XD is used to design the inital layout and can be found inside the zipped file under the name **design**.

## Other Details
* Language: Swift 5
* Design Pattern: MVC
* Other Technical details: Protocol, Storyboard, UI Automation (Integration Test) & Unit Testing
* Libraries: No libraries or dependancy managers (eg. Cocoapods / Carthage) were used.
* Code Coverage: More than 90%
