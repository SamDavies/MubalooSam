# Sam's Implementation of the Mubaloo Test

## Redux with ReSwift
I've used a Redux architecture instead of MCV, this gives a unidirectional data flow and a centralized datastore so that the application in more maintainable and extendable.

## Persistent Data with Realm
Realm is used The data persistence and is treated as a separate service which saves the Redux in memory store to disk.

## Code Structure

MubalooSam/
    AppDelegate.swift  
    AppReducer.swift    -- the root reducer for the app
    Storyboards/        -- all Storyboards
    Company/            -- the only project module
        actions/        -- Company actions
        components/     -- 'Dumb' Components such as cells
        containers/     -- 'Smart' Components such as ViewControllers
        models/         -- Plain Swift objects which are stored in Realm
        reducers/       -- Company reducer

## installation

``` pod install ```
