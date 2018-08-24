# Free-SMDR
This is a Free SMDR daemon originally created by [Gabriele Tozzi](https://github.com/gtozzi/Free-SMDR)

## Install:
Ensure you have Python, MySQL and the Python MySQL module

#### CentOS 7:
The install script should install everything needed. 

```./install.sh```

You will need to set up your MySQL server as well if you don't already have one and run the `freesmdr.sql` script.

Don't forget to add your local ip address to the config file so the service will know what address and port to bind to.

# Credits
Origonal Author [Gabriele Tozzi](https://github.com/gtozzi/Free-SMDR)

Origonaly forked from [Steven Horner](https://github.com/stevenhorner/Free-SMDR)

Config file modifications from [aseques](https://github.com/aseques/Free-SMDR)
