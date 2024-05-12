# Encryption/Decription
### using Openssl

The files <a href="./encript.sh">encript.sh</a> and <a href="./decript.sh">decript.sh</a> will take in a file and a password from the user.

Here is how to use them:
<pre>
    <code>
        # To Encript
        ./encrypt.sh &ltfile&gt &ltpassword&gt

        # To Decript
        ./decrypt.sh &ltfile&gt &ltpassword&gt
    </code>
</pre>

If no password is provided, then it will encript the file without a password. To decript an encrypted file, the password used to encrypt must be used, else the decryption will fail.

test.txt.enc is an encrypted test file. It is encrypted with no password. To decrypt it's file, try the following:
<pre>
    <code>
        ./decrypt.sh test.txt 
    </code>
</pre>

##
Note: do not include the .enc extention when decrypting the file.