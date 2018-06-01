## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix creates a list containing a function to

# 1. set the value of the matrix

# 2. get the value of the matrix

# 3. set the value of inverse of the matrix

# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    #<<- operator is used for assigning to variables in the parent environments 
    #initialize inverse matrix as null
    mInvMatrix <- NULL
    #mlocalCopy <- NULL
    
    set <- function(m) {
      #assign the matrix to a common variable, to be used later
      x <<- m
      #delete any references to previous inverse matrix
      mInvMatrix <<- NULL
    
    }
    get <- function(){
      #return the matrix local copy 
      x 
    }
   
    #assign the inverse matrix value to global variable
    setinverse <- function(inverse) {
      #assign invers matrix to global variable
      mInvMatrix <<- inverse
    }
  
    getinverse <- function() {
      #returns the invers matrix local copy
      mInvMatrix
    }
  
    #return list value with all the functions defined
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    #using the value from the matrix list
    inverseMatrix <- x$getinverse()
    #check if inverse matrix is already available and return
    if(!is.null(inverseMatrix)) {
      message("inverse matrix is already available")
      return(inverseMatrix)
    }
  
    m <- x$get()
    #calculate the invers matrix
    inverseMatrix <- solve(m)
    #assign value for next time
    x$setinverse(inverseMatrix)
    #return inverse matrix
    inverseMatrix
}
