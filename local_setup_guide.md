# PlanIt Back-end Setup

Clone down the [back-end repo](https://github.com/planit-2201/planit_be):
```
git clone git@github.com:planit-2201/planit_be.git
```

Change your working directory to the repo's root directory:
```
cd planit_be
```

(If you have not installed Ruby before, consider following [this tutorial](https://mod0.turing.io/setup-instructions) and then [this tutorial](https://github.com/turingschool-examples/backend_module_0_capstone/blob/master/README.md).)

Install Bundler if you have not before:
```
gem install bundler
```

Use it to install the project's gem dependencies:
```
bundle install
```

Set up the database:
```
rake db:{create,migrate,seed}
```

Run the Rails server with:
```
rails s
```

You may now run the front-end and open it on `localhost:3000` and it will make GraphQL queries to the Rails server at `localhost:3001/graphql`.

You can shut down the Rails server process by entering Cmd-C in the terminal window.

Run the test suite with:
```
bundle exec rspec
```

To access test coverage files, run:
```
open coverage/index.html
```

### Access PlanIt Back-end server via Postman virtual environment

