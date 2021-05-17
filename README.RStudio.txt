This project contains a RStudio Server installation within a Singularity 
Container Instance (https://sylabs.io). It is controlled by a script called
`rstudio` within this directory.

Start RStudio
=============

 1. If not done already, open a shell and change the working directory to your 
    project folder.

 2. If you started an RStudio session in this project before, you can look up
    the web address by calling 
    
      ./rstudio list
 
 3. To start a new instance of RStudio Server, run `./rstudio start`. If you
    have not set an RStudio password yet, you are asked to do so. The password
    is used to prevent other users logged in at your machine from logging into
    your RStudio session. It is independent from your normal user password.
    Afterwards, A URL is printed to the screen. Enter that URL into your
    browser to access RStudio. Depending on your cluster configuration, the URL
    might be different. Ask your administrator.

    To change your RStudio password at a later time, type `./rstudio passwd`.

 4. To stop a running RStudio instance, type `./rstudio list` to find out the
    ID of the instance. It is listed in the first column. Then, execute

      ./rstudio stop ID

    replacing "ID" with the respective number.


Multiple parallel instances of RServer Studio
=============================================

Accessing multiple instances of RStudio Server in the same browser at the same
time leads to problems. You might get logged out of one RStudio when you access
the other one. Use Add-ons like
[Firefox Multi-Account Containers](https://addons.mozilla.org/de/firefox/addon/multi-account-containers/)
to prevent those.

