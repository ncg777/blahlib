# Installation
You need KeyKit. Clone this repo wherever you want.

Make sure the KEYROOT environment variable is set to the root of your KeyKit directory and that your PATH environment variable contains the path to KeyKit's bin folder.

Then, just run KeyKit's executable (key or lowkey) from within the directory where you cloned the code in.

You should then be able to use this code however you want and run the examples.

The renderBST function defined in burst.k searches for files within the "bst" folder. You may pass it a string to a file name (without the bst extension) to generate the music. It will return a phrase and write a midi file at once.