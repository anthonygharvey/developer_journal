## Models
|Model		|Attributes										|
|---------|:---------------------------:|
|Users		|username, email, password		|
|Goals		|duration_in_days, language(s)|
|Entries	|content, language(s)					|


## Relationships
|Object		|Relationship	|Object		|Relationship	|Object	|
|---------|-------------|---------|-------------|-------|
|User			|has many			|Goals		|							|				|
|Goal			|has many			|Entries	|							|				|
|User			|has many			|Entries	|through			|Goals	|
|Goals		|belongs to		|User			|							|				|
|Entries	|belongs to 	|Goal			|							|				|


Features TODO
- [x] Add first and last name attributes to User
- [x] Add name attribute to Goal
- [x] Add date_created attribute to Entry
- [x] Add start_date to Goal
- [x] Refactor valid_signup? helper method to check for unique username and email address prior to creating a new user.



---
General TODO

TODO: Update favicon
TODO: Add rack-flash3 gem for messages (error, success, etc.) and style with Bootstrap