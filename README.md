# Pre-requisite Check

Web application that identifies pre-requisites, co-requisites, and post-requisites for entered course. Made with [Sinatra](http://sinatrarb.com/), [Ruby](http://www.ruby-lang.org/en/), CSS Grid for layout, and [Bootstrap](https://getbootstrap.com/) for minor styling.

## App Link
Current state of application can be viewed here: [Pre-req Check](https://pre-req-check.herokuapp.com/).
Anything from the [Course Descriptions page](http://catalog.drexel.edu/coursedescriptions/quarter/undergrad/) will work, but enter MATH 300 or BMES 202 for a quick test.

## Known Issues
* Some courses begin result with "And" or "Or". Known course(s): BMES 325, BMES 451.
* Some courses end with "And" or "Or". Known course(s): MATH 121.
* Does not recognize course without space. (BMES302)

## To-do list

* Impliment error handling for input.
* Output should contain minimum grade.
* Account for all input edge cases.
* Add post-requisites.

## Wish List

* Auto-complete for input.
