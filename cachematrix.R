## cache a matrix to save on time by spending more memory


## performs 4 simple functions as follows
## here <<- operator checks the value in the parent env

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  setmat <- function(y) {
    x <<- y
    inv <<- NULL
  }
  getmat <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(setmat = setmat, getmat = getmat,
       setinv = setinv,
       getinv = getinv)
}


## computes the inv iff it is null before

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$getmat()
  inv <- solve(data)
  x$setinv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
