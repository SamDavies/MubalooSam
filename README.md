# Sam's Implementation of the Mubaloo Test

## The Task

iOS Developer Test: Interactive organisation chart  
Task: To create a interactive organisation chart app for Mubaloo.  
App type: A master / detail style application that runs on iPad and iPhone The application should fulfil the following criteria:

- Render a list all Mubaloo team members grouped by team from the JSON feed provided.
- Highlight the team leads visually in order to distinguish them from the rest of the team.
- Show a detail view of each team member in a new screen when tapped.
- Store the data so it can be used offline.

Once complete:  
Zip up the source code and send it over along so we can build it and run it on a device.

Resources:  
JSON feed: http://developers.mub.lu/resources/team.json

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
