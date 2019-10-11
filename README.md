# Pre-requisite Check

Web application that identifies pre-requisites, co-requisites, and post-requisites for entered course. Made with [Sinatra](http://sinatrarb.com/), [Ruby](http://www.ruby-lang.org/en/), and the [Bulma CSS Framework](https://bulma.io/).

Current state of application can be viewed here: [Pre-req Check](https://pre-req-check.herokuapp.com/).
Anything from the [Course Descriptions page](http://catalog.drexel.edu/coursedescriptions/quarter/undergrad/) will work, but enter MATH 300 or BMES 202 for a quick test.

## To-do

* Extract and order information from hashes.
* Create user interface with the [Bulma CSS Framework](https://bulma.io/).

## Known Issues

* Entered Course & output are not vertically aligned.
* Courses with no pre-requisites return an empty value. Should present text indicating no pre-requisites.
* Some courses begin result with "And" or "Or". Known courses: BMES 325, BMES 451.
* Output should contain minimum grade.
* Input field should accept upper and lower case entries.

## Wish List

* Auto-complete for input.
