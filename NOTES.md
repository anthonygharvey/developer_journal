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


TODO
- [x] Add first and last name attributes to User
- [x] Add name attribute to Goal
- [x] Add date_created attribute to Entry
- [ ] Add start_date to Goal

