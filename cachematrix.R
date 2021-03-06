#Matrix inversion is usually a costly computation and there may be some benefit 
#to caching the inverse of a matrix rather than compute it repeatedly. The
#following two functions are used to cache the inverse of a matrix.  

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
    
  }
  get <- function() x
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m 
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

cacheSolve <- function(x...) {
  m <- x$getInverse()
  if(!is.null(m) ){
    message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve (data) %*% data
x$setInverse(m)
m
}
