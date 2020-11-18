# FullStackTemplate
Templates Pages Starter Code and set up Readme for building a Full Stack app with C#/ASP.NET and React.js using Firebase for maintaining registration and login


## Set up project

1. Create new Repo on Github
1. Create Web API project in Visual Studio
1. Create [.gitignore](https://github.com/MandasK/FullStackTemplate/blob/main/.gitignore)
1. Run `git init` from the root of your project
1. Add Nuget Packages `Microsoft.Data.SqlClient` and `Microsoft.AspNetCore.Authentication.JwtBearer` to connect SQL DB and Firebase Authentication.
    **NOTE:** Check to be sure your dependency version matches the ASP.NET core version your using.
1. Navigate to `Project > Debug > `. In `Environemnt Variables` update the `ASPNETCORE_ENVIRONMENT` Value to `Local`	
1. Inside of `Project > Debug > ` update App URL to `https://localhost:5001;http://localhost:5000`

## Setup SQL Server
1. Create a `SQL` folder in the root of your project
1. Add a SQL script called `01_Db_Create.sql` that creates your database (start by either copying and modifying [Script](https://github.com/MandasK/FullStackTemplate/blob/main/01_Db_Create.sql) or generate one from [DBDiagram](https://dbdiagram.io/))
1. (Optional) Add a SQL script called  `02_Seed_Data.sql` to insert [seed data records](https://github.com/MandasK/FullStackTemplate/blob/main/02_Seed_Data.sql) into your database tables. **Note** You could also add the seed data in the first script if you prefer
1. Run the script(s) to create and seed your database.

## Set up Firebase

1. Go to Firebase console and create a new project
1. Enable a "Sign-in method"
    > **NOTE:** In the course we used the `Email/Password` sign-in method.
1. Go to project settings to view API Key and Project ID (you'll need these in future steps)

## Server Side

1. Rename `appsettings.Development.json` to `appsettings.Local.json
1. Review contents in [Template]() appsettings.json and appsettings.Development.json files to make sure you have correct
1. Create Models by adding `Models` folder at sln level and then add new class for each model needed see `Models > UserProfile` as reference
1. Update `Startup.cs` to handle JWTs review Startup.cs file in templates for accuracy
1. copy in DBUtils file from Template
1. Copy in the `UserProfileRepository` and `UserProfileController` from Template and modify as needed

> **NOTE:** Make sure to update the `namespace` of any classes you copy/paste from another project.

## Client Side

1. Create client directory and run `npx create-react-app .`
1. Setup proxy in `package.json` see line 2 in package.json Template
1. Install firebase and react router using `npm install react-router-dom firebase`
1. Install whatever component library you want( `npm install --save react-helmet` for dynamic title change or `npm install --save reactstrap react react-dom` for reactstrap--see index.html and index.js for add ins)
1. Create a `.env.local` file in your `client` folder (DON'T forget the leading `.`) and add the firebase API Key
1. Update the `index.js` file to add the call to `firebase.initializeApp`
1. Copy in `UserProfileProvider.js`, `Login.js`, `Register.js` from Template
1. Copy in `ApplicationViews.js` and `Header.js` from Template
1. Modify `App.js` to use the `Router`, `UserProfileProvider`, `Header.js`, and `ApplicationViews` components
