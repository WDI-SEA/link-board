#Link Board - Part 2

To finish up the Link Board assignment, implement **at least 5 of the following:**

* Add comments
* Add voting to comments
* Use modals for auth
* Use modals for adding posts or comments
* Add AJAX Delete to comments
* Change the color scheme/styling using SASS
* Add User Profile page
* Display vote counts
* Display comment counts

rails g model comment content:text user:references post:references

belongs to User - user has many comments
belongs to Post - post has many comments

add points to post model

rails generate migration add_points_to_post points:integer

rails generate migration RemovePointsFromUser points:integer
