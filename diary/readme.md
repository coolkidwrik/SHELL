# Diary
### with file encryption

It need not be a diary. If you need a secure place to store info or data in text format, this can be used. The Diary is an encrypted .diary.txt.enc file. Any attempt to access this file's contents will fail without decryption. 

This program will request a password from the user. If correct, it will decript the file and open it in a text editor. Once user closes the text editor, the program will automatically encript the file again.

If you don't yet have a .diary.txt.enc file in this directory, this program will create it for you.

The code for encripting the file is given in the <a href="./encription">encription</a> directory.

The code to run the program is in <a href="./diary.sh">diary.sh</a> and here is how to use it:
<pre>
    <code>
        ./diary
    </code>
</pre>

##
Note: to properly close and encript the file after opened using the program, user must quit the text editor. Closing the editor is not enough.