## The function "makeCacheMatrix" can cache the matrix and the inverse of a 
## given matrix. Therefore it can create a new matrix or use an allready 
## existing matrix.

makeCacheMatrix <- function() {
        set <- function(y = NULL) { 
                if(is.matrix(y)) {
                        matrix <<- y
                }
                else {
                        matrix <<- matrix(sample(1:100, 9), 3, 3)
                }
                s <<- NULL
                dput(matrix, "cachedmatrix")
        }
        ## This function creates the matrix "matrix" from y or randomly. 
        ## Additionally it resets the calculated inverse in vector s after
        ## creating a new matrix.
        get <- function() {
                matrix <<- dget("cachedmatrix")
                s <<- NULL
        ## loads the "matrix" out of the cache
        }
        setmean <- function(matrix) {
                s <<- solve(matrix)
                dput(s, "cachedmean")
        ## computes the inverse of a given matrix and writes it in 
        ## vector s, which gets cached afterwards
        }
        getmean <- function() {
                s <<- dget("cachedmean")
        ## loads the already computed inverse s for matrix "matrix" out of the 
        ## cache
        }
        listcache <<- list("set" = set, "get" = get, 
                           "setmean" = setmean, "getmean" = getmean)
        ## writes the functions set, get, setmean and getmean in the list 
        ## "listcache" under their repective name
}


## This function computes the inverse of the matrix which was created by the 
## function "makeCacheMatrix". If the inverse of "matrix" has allready been 
## calculated this function will load the inverse from the cache.

cacheSolve <- function() {
        
        ## uses the in listcache listed function getmean() to load the cached
        ## mean s from the cache
        listcache$getmean()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
                ## if "s" is allready cached return the allready calculated mean
        }
        else {
                message("getting cached matrix")
                message("computing and caching the new inverse matrix")
                listcache$setmean(data)
                return(s)
                ## If "s" is not defined the cached matrix will be loaded  
                ## again and inverted.
        }
}