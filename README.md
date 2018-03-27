![alt text](https://forthebadge.com/images/badges/made-with-ruby.svg "Made With Ruby")
![alt text]

# Developer Journal
## A place to set goals and keep track of your journey as a developer
___

## Description
This app was built as a [Flatiron School](https://flatironschool.com/) project and is meant to help developers set goals and document their daily progress.  Users can set goals and specify the languages to focus on as well as the number of days to commit (pun intended 😀 ).  Once a goal has been created, users can create entires to document their progress towards that goal.  

A goal in the app is both a representation of the user's objective as well as a collection of entries documenting the user's progess to achieving their objective.  Users may create as many goals and entries as they like; however, goal progress is calculated based on the nubmer of days with entries.  

For example: A user could create a goal of `Learn Bootstrap` with a timeframe of `10 days`.  If the user created 3 entries on the first day, the total progress would be 10% (1 out of 10 days).  If the user created 1 entry on the second day, the total progress would be 20%.
___

## Installation
Clone this repository and execute `bundle install`.  Next run `rake db:migrate` to create the database then `rake db:seed` to add sample users, goals and entries to the database.  Run `shotgun` and navigate to spin-up a local server and navigate to `localhost:9393` to preview the app.
___

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/anthonygharvey/developer_news_cli_app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
___

## License
The gem is available as open source under the terms of the MIT License.
___

## Code of Conduct
Everyone interacting in the DeveloperNewsCliApp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.

