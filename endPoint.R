
#' # Create the Endpoint.
#' @get /expression
#' # Render the response into a JSON object
#' @serializer unboxedJSON   
function(xValueE){
  
  # Evaluate the expression.
  x <- as.numeric(xValueE)   # Assign the ARG value into the 'x' variable
  exp <- expression(x^2)     # Create a R object of the given expression
  res <- eval(exp)           # Evaluate the expression object
  
  # Create the response object
  res <- list(x = as.character(x), expression = as.character(exp), result = as.character(res))
  return(res)
}


#' # Create the Endpoint
#' @get /derivative
#' # Render the response into a JSON object
#' @serializer unboxedJSON
function(xValueD){
  
  # Evaluate the Derivative
              x <- as.numeric(xValueD)      # Assign the ARG value into the 'x' variable
  exp <- expression(x^2)          # Create a R object of the given expression
  derivative <- D(exp, "x")              # Creating the object of the Derivative
  resDerivative <- eval(derivative)         # Evaluate the Derivative object
  
  # Create the response object
  resDerivative <- list(x = as.character(x), 
                        expression = as.character(exp), 
                        derivative = as.character(paste(derivative[2], derivative[1], derivative[3])), 
                        result = as.character(resDerivative))
  return(resDerivative)
}


#' @get /integration
#' @serializer unboxedJSON
function(xValueI){
  # Evaluate the Integral
           x <- as.numeric(xValueI)          # Assign the ARG value into the 'x' variable
      limSup <- x                            # Assign the 'x' variable into 'limSup' variable
#        exp <- expression(2*x)              # Creating a R object of the given expression - ### USELESS ###
      functX <- function(x) {2*x}            # Creating the function 
  integralFx <- integrate(functX, 0, limSup) # Creating the Integrate object
  ####    Can't evaluate the Integral function with expression object 'exp'.
  
  # Creating the response object
  intRes <- list(x = as.character(x), 
                 functionX = as.character(integralFx$call[2]), 
                 result = as.character(integralFx$value))
  return(intRes)
  
  ## Validate the Integrals and the Derivatives.
  ## 
  ## https://www.wolframalpha.com/input/?i=derivative+x%5E2
  ## https://www.wolframalpha.com/input/?i=integrate+2x+dx
  ## https://www.integral-calculator.com/#
}

#* @assets ./files/static /
list()
