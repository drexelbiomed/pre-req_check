# Pre-requisite Check

Web application that identifies pre-requisites, co-requisites, and post-requisites for entered course. Made with [Sinatra](http://sinatrarb.com/), [Ruby](http://www.ruby-lang.org/en/), and the [Bulma CSS Framework](https://bulma.io/).

## App Link
Current state of application can be viewed here: [Pre-req Check](https://pre-req-check.herokuapp.com/).
Anything from the [Course Descriptions page](http://catalog.drexel.edu/coursedescriptions/quarter/undergrad/) will work, but enter MATH 300 or BMES 202 for a quick test.

## Known Issues
* Some courses begin result with "And" or "Or". Known courses: BMES 325, BMES 451.
* Does not recognize course without space. (BMES302)

## To-do list

* Output should contain minimum grade.
* Account for all input edge cases.
* Add post-requisites.

## Wish List

* Auto-complete for input.
