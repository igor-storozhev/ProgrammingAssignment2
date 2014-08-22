## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than computing 
## it repeatedly
##


## makeCacheMatrix: This function creates a special "matrix" object that 
##                  can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inv_mtx <- NULL          # inverse matrix
    # set new matrix
    set <- function(mtx) {  
        x <<- mtx            # save new matrix
        inv_mtx <<- NULL     # clear inverse matirx
    }
    # get matrix
    get <- function() {
        return(x)
    }
    # get inverse matrix
    get_inverse() {
        return(inv_mtx)
    }
    # make inverse matrix and return it
    solve_mtx() {
        # check if inverse has made
        # inverse exists return it
        # solve inverse
        # return inverse
    }
}

## cacheSolve: This function computes the inverse of the special 
##             "matrix" returned by makeCacheMatrix above. If the 
##             inverse has already been calculated (and the matrix 
##             has not changed), then cacheSolve should retrieve the 
##             inverse from the cache.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    # check if the this is the same matrix
    # if 
}
