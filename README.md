# Pre-requisite Check

Pre-requisite Check is a web application that identifies pre-requisites, co-requisites, and post-requisites for entered course. Made with [Sinatra](http://sinatrarb.com/), [Ruby](http://www.ruby-lang.org/en/), CSS Grid for layout, and [Bootstrap](https://getbootstrap.com/) for minor styling. Styled with the [Drexel University Website Design & Branding Standards](https://drexel.edu/identity/web/design-standards/) in mind.

Current state of application can be viewed here: [Pre-req Check](https://pre-req-check.herokuapp.com/). This application works for any course from the University. A complete list can be found on the [Course Descriptions page](http://catalog.drexel.edu/coursedescriptions/quarter/undergrad/). But if you want to just do a quick search you can enter MATH 300 or BMES 202.

## Usage

Use the Ruby version manager [rbenv](https://github.com/rbenv/rbenv#installation) to install Ruby.

Then install the Sinatra gem with `gem install sinatra`.

Clone the repo with `git clone git@github.com:drexelbiomed/pre-req_check.git`

Once in the project directory, run it locally with `ruby main.rb` and go to `http://localhost:4567/`in your browser to view.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
