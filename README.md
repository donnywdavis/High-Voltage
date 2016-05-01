### Homework 12

## High-Voltage

Great job on the time circuits! We were able to get you here to 1955 so you can ensure your parents end up together. Now we need to get you back to the future, but I'm afraid I've fallen and hit my head on the toilet again (another late night clock adjustment). Unfortunately I can't remember the equations to ensure we get 1.21 gigawatts from the lightning bolt that will hit the clocktower. I'm sure you've got a reference for them in your pocket computer. We'll need to do these calculations quickly on the night of the storm, so could you build an app that will allow us to enter the values we have and then calculate the values we need? It must work quickly, as we won't get another chance to get this right. Your future depends on this!

- Doc Brown

### Objectives
After completing this assignment, you should...

feel comfortable with separating view logic from business logic
be able to use popovers to display a view over an existing view
understand how to conditionally present different tableview cells based on need

### Requirements
#### Explorer Mode

Let's build a universal app for Doc so he can perform those crucial calculations on the fly. The main view will be a tableview with dynamically added cells, one for each value type. The + button will create a popover when tapped to allow the user to select the value type they want to add. Once two values are entered, the app should disable the + button and perform the necessary calculations to add the two remaining value types to the screen. The clear button will empty the table and prepare the app for a new transaction.

See [this site](http://www.rapidtables.com/calc/electric/watt-volt-amp-calculator.htm) for the list of equations as well as a web implementation of this app you can use for testing.

Here are some tips to get you started:

* Design your cells in the storyboard and see if you can get one of each on the screen
* Create the view controller in the storyboard that will show each of the types (the one you'll use as a popover)
* Make the app show the types view as a modal when you tap the + button
* Switch the presentation style to a popover
* Implement the popoverpresentationcontroller delegate methods to ensure the view appears as a popover
* Create a class to perform all the calculations