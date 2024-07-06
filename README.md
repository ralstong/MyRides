# MyRides App

## Summary:

This is an app built in Swift with UIKit, that displays a driver's trip schedule information in an organized table view.

## Implementation summary:

1. Designed the app using MVVM, reactive programming and protocol-delegate patterns.
2. Utilized UIKit and programmatic AutoLayout to build out the UI.
3. Included an error/empty state if the data is not available.
4. Created reusable views for the table row and header.
5. Created an alert view that can be customized for the title and description text and alignment, the number of action buttons, button styles and view theme color.
6. The table is setup to show trip headers and trip detail rows within it in chronological order.
7. Tapping on a card will open the confirmation alert, which can be dismissed by any of the action buttons, including the X close button.
8. Utilized helper classes and extensions to keep functionality modular but intuitively accessible.
9. Added unit and integration tests to cover key areas of the code.


## Assumptions:

As per the current implementation, the following are some important assumptions to note:
1. For the alert view, I am assuming a limit of 6 buttons based on the available screen area on the last released small iPhone SE (3rd gen).
2. The data is already cleaned and verified to remove any overlaps or inconsistencies where start time received may incorrectly be later than end time.
3. The font used for the app is the system font, which differs from custom font seen in the UI mockups.
4. As suggested on the requirements document, I didn't add functionality to actually cancel the trip on tapping "Yes". Both buttons will simply just dismiss the alert.
5. The app is optimized for English language only. If we're supporting different languages, we could discuss how the UI should change if the rider string has to expand, and also localize time and currency formats.
6. Some properties were ignored from the JSON parsing as I didn't require them for the purpose of this project.
7. The properties sent in the sample json will always be available, and I did not support optional decoding.
8. The hamburger menu button located top-left of the navigation bar is ignored as suggested in the requirements document.

## Edge cases handled:

1. The address will go to the next line if it is too long.
2. Error/empty state shown if the table cannot be populated.

## Possible improvements:

1. The alert view can be further customizable if needed to support font changes, more labels, button orientation etc. However, we should be wary of how many items we should support as the view expands to the limits as it might then require scrollability.
2. Any string creation logic for the tableview cell/header can be modularized into a separate supporting view model for better separation of concerns and testability.
3. The protocol-delegate patterns could be replaced with Combine reactive patterns for consistency.
4. We could possibly implement pluralization through localization but I felt it was overkill for this project.
5. For this API, the response is static, but if it was dynamic or in case the request failed the first time, we could add pull to refresh capability on the tableview to retry the fetch request.
6. A logger class can be created to print error/debug logs.

## Screenshots:

<img src="https://github.com/ralstong/MyRides/assets/20563830/a84a385b-3d2f-411b-991c-2de573981aa3" width="300" height="650" />
<img src="https://github.com/ralstong/MyRides/assets/20563830/dbaa2b4a-aa23-4688-b560-0b7fef32917a" width="300" height="650" />

## Build tools and version:

Xcode 15.4 and iOS 17.5
