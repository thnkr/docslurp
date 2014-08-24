DocSlurp
========
Grab the entire documents folder on any Mac. No password required.

## Introduction
This was built as a proof of concept and to help you understand the risks of "ghosting" USB ports. I do not condone or support illicite behavior or manipulation of this script. By cheating (hacks) you are just proving you are not good enough for the game.

## Getting Started
1. You will need a $39 [USB Rubber Ducky](https://hakshop.myshopify.com/products/usb-rubber-ducky-deluxe)
2. Open the *uploader.sh* and change the S3 credentials to your own (or impliment Dropbox--whatever you want).
3. Create a gist and paste your new uploader.sh script in it. Make sure you leave the .sh extension.
4. Edit the GIST address in *duckscript.txt* then compile it to *inject.bin* with this online [encoder](http://www.ducktoolkit.com/Encoder.jsp). Or use the duckencode.jar for JAVA.
5. Transfer the *inject.bin* script on the root of the microsd for the Rubber Ducky.

And you are done. Plug the ducky into any logged in Mac and watch the magic run.

## Under the hood.
The Rubber Ducky is quickly opening and quiting terminal piping a downloaded gist to a child process with nohup. The rest is a tricky bash script which cleans up files and performs the upload.

## Closing
Don't be stupid. You are also playing the grey side the internet, it's dark out there. I take no responsibility for your behavior or the outcome of this script of services. Use at your own risk.
