UITableViewFlicker
==================

In this sample project, we demonstrate a bug in which UITableView will render cells with their estimated height, and shrink them down to their real sizes with an (unwanted) animation.

#### Steps:

1. Launch the sample app on the iPhone 5s simulator.
2. Press the Push button.

#### Results:

Row with IndexPath (0,1) will be displayed with the estimated height, and then will get shrunk (with an animation).

