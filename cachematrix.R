## Below are two function that are used to create a special obect that stores a matrix and cache's its inverse. 

##The function "makeCacheMatix is to create a list containing a function to "set the value of the matrix, 
## "get the value of the matrix", "set the value of the inversion matrix", "get the value of the inversion matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}

## The following function calculates the inverse of the special "matrix" created with 
## the above function.  It first checks to see if the inverse has already been calculated. 
## if so, it gets the inverse from the cache. otherwise, it calculated te inverse and sets
## sets the value of the inverse in the cache. 

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
  ## Return a matrix that is the inverse of 'x'      
}