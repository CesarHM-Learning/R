
if(!require(plumber)){        # Load the Plumber library, if not installed then
  install.packages("plumber") # Install the Plumber package
}

root <- pr("endPoint.R")      # Create a Plumber object and translate the R file into a Plumber AP
root                          # Show the created Plumber Router object
root %>% pr_run(port = 9598)  # Start the API - (root %>% pr_run(host = '127.0.0.1', port = 9598))