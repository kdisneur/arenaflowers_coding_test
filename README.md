# Arena Flowers Coding Test

## Dictionary import

* I decided to add a form containing the dictionary name and the dictionary file to upload.
* A dictionary can be uploaded if there is not already a pending upload.
* A dictionary can't be uploaded if there is aleady a pending upload or if the upload has been aborted due to an error (the user should remove the dictionary before importing a new one)

The import process is asynchronous, we iterate over the dictionary and, for each word, we insert the word in its own anagram file containing all the words with the same letters (ie: the word "pencil" will be stored with all the words of 6 characters containing the letters "ceilnp"). So finding anagrams will be blazing fast. 
To do this app I take the assumption the main objective of this app is to search anagram, not to load dictionaries. So I focused my work on the better search time result over the import time.

For the moment we poll every 2sec the server to know if the pending import is finished but, if the app go to production, I think we should add a websocket solution (via [sync](https://github.com/chrismccord/sync) for example) to not hit the webapp heavily.

## Anagram search

* I just added a list of available dictionaries and an input text.

I didn't do any asynchronous task for that because we just have to open the file containing the sorted characters of the user input (ie: if a user insert "pencil", we search the file "ceilnp") and returns all the results (less the pencil word itself of course).
