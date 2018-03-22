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
- [x] '/entries' should show all of the entries for the current_user in a condensed form.
	- [ ] show an edit and delete tag at the bottom
		- [x] edit link should go to '/entries/:entry_id/edit' and display the edit form
		- [ ] delete link should open a modal and ask the user to confirm if they want to delete the entry (and that it cannot be undone if they delete it)
	- [x] the title should be a link to the full view '/entries/:entry_id'
- [x] '/entries/:entry_id' should show a particular entry in full form.
- [x] include [md_simple_editor](https://github.com/rderoldan1/md_simple_editor) as the editor for creating a new entry! (This will be implemented in a Rails version of the app)



---
General TODO

TODO: Update favicon
TODO: Add rack-flash3 gem for messages (error, success, etc.) and style with Bootstrap


---
Future Features
- [ ] Instead of deleting an entry upon a user's confirmation, move it to a 'deleted' table
	- [ ] save the entry and its corresponding goal and user
- [ ] Add the ability to tweet an entry
