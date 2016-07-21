# Assignment 2

In this assignment, you'll make a more rounded iOS application.

We're going to hold your hand less on this one. How you approach the application is up to you.

## Details

Your task is to create an app that:

* Has a table view.
* Uses an Add button to display a new screen.
* On that screen, take input.
* Add that to an array.
* Save that array to a JSON file.
* Populate the table view with this.
* Load the data on app launch.

### Notes

* You'll want to use the `NSJSONSerialization` class to read and write the JSON data.
* We suggest using two view controllers: one for the table view, and one for the "add" screen.
* The table view controller and the add view controller will need a way to communicate, because the add view controller needs a way to tell the table view controller that new data is available.
* The `reloadData` method on `UITableView` reloads all data in a tableview, refreshing the screen.