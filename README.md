This is a web application I created as a Flatiron School of Engineering student, as part of the SQL/ActiveRecord/ORM/MVC/Sinatra module.

The Covid-19 Symptom Tracker is a Model-View-Controller Sinatra application that allows a user to sign up, log in, create a case, read/view their case, edit the symptoms of their case, and delete their case (CRUD).

The symptoms are accurately captured as defined by the CDC, and can be referenced here: https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html


Installation:

Fork and clone repo to your local machine.
From the command line, run `rvm use  "2.5.5"`
Use 'bundle install' to install dependencies.

Usage:

Run `rake db:mirgrate` from the command line after changing directories into this application.
Run `shotgun` from the command line. Then you can go to your browser and type `localhost:9393` into your search bar and view the application.

License: Copyright <2020> <amkera>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
