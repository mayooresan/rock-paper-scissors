# Rock Paper Scissors
This is an iOS Application developed to digitise the Rock Paper Scissors game on an iOS powered device. 

## Download
Now [available in appstore](https://apps.apple.com/app/id1467890259) for iOS powered devices for ***free*** (No ads or hidden in app purchases)

[![Avilable for download](https://developer.apple.com/app-store/marketing/guidelines/images/badge-example-preferred_2x.png)](https://apps.apple.com/app/id1467890259)

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

## License 
Copyright 2019 J Mayooresan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Images / Icons in this project is not part of MIT license. You should replace them with your own images / icons if you are to reuse this project.
