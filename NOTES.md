## Models
|Model		|Attributes									|
|---------|:-------------------------:|
|Users		|username, email, password	|
|Goals		|duration, language(s)			|
|Entries	|content, language(s)				|


## Relationships
|Object		|Relationship	|Object		|Relationship	|Object	|
|---------|-------------|---------|-------------|-------|
|User			|has many			|Goals		|							|				|
|Goal			|has many			|Entries	|							|				|
|User			|has many			|Entries	|through			|Goals	|
|Goals		|belongs to		|User			|							|				|
|Entries	|belongs to 	|Goal			|							|				|


