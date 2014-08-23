## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than computing 
## it repeatedly. Usage example:
## >source("cachematrix.R")
## >hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
## >mtx <- hilbert(2)
## >cmtx <- makeCacheMatrix(mtx)
## >cacheSolve(cmtx)
## >mtx %*% cacheSolve(cmtx)

## makeCacheMatrix: This function creates a special "matrix" object that 
##                  can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inv_mtx <- NULL          # inverse matrix
    # set new matrix
    set <- function(mtx) {  
        x <<- mtx            # save new matrix
        inv_mtx <<- NULL     # clear inverse matirx
    }
    # get original matrix
    get <- function() {
        return(x)
    }
    # get inverse matrix
    get_inverse <- function() {
        return(inv_mtx)
    }
    # make inverse matrix and return it
    solve_mtx <- function() {
        # check if inverse has been already solved
        if(!is.null(inv_mtx)) {
            # inverse exists return it
            return(inv_mtx)
        }
        # else solve inverse
        inv_mtx <<- solve(x)
        # return inverse
        return(inv_mtx)
    }
    # make list of methods to manipulate matrix data
    list( set = set, get = get, get_inverse = get_inverse,
          solve_mtx = solve_mtx)
}

## cacheSolve: This function computes the inverse of the special 
##             "matrix" returned by makeCacheMatrix above. If the 
##             inverse has already been calculated (and the matrix 
##             has not changed), then cacheSolve should retrieve the 
##             inverse from the cache.
cacheSolve <- function(x, ...) {
    # check if the inverse is already in cache
    inv_x <- x$get_inverse()
    if(!is.null(inv_x)) {
        # return inverse matrix from cache
        return(inv_x)
    }
    # else solve matrix
    inv_x <- x$solve()
    ## Return a matrix that is the inverse of 'x'
    return(inv_x)
}
