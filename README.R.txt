Computation environment
======================

The computation environment of this project is stored in a Singularity
container (https://sylabs.io). Therefore, it can be run anywhere Singularity is
installed without further dependencies.

Any program that runs inside the container this way sees sees your project
files under the path 

   /proj

You cannot access any files that are outside of
the project folder except if you explicitly include them as external
dependencies in the file "container_settings". This behaviour is intended to
increase the reproducibility of your work.  


Start programs from the container
=================================

To start an interactive bash shell within the container, execute

  ./shell

The script `./cexec` can be used to launch any program that is included in the
container, like python or bash. Just append the program call to `./cexec`. This
approach is good to launch non-interactive scripts like computations.

Example uses:

  * `./cexec R`: Start an interactive R session
  * `./cexec Rscript example.R`: Execute an R script non-interactively
  * `./cexec bash script.sh`: Execute a bash script
  * `./cexec python script.py`: Execute a Python 3 script
  * `./cexec make`: Run the Makefile of your project (if you have one)
 
Internet access and proxy server
================================

As the container is isolated from the host machine it is running on, proxy
server settings are not imported. Therefore, the environment variables
"HTTP_PROXY" and "HTTPS_PROXY" must be set.

If you are behind a proxy server, create a file named `.Renviron`. On 
Windows, take care that the file doesn't get a `.txt` file extension. Save
the the needed environment variables. For example, for a HTTP proxy:

    http_proxy="http://proxy.example.com:3128"
    https_proxy="http://proxy.example.com:3128"

If you have another proxy, check the cURL manual and contact your local
administrator to see which environment variables you have to set.


