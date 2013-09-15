== README
Brief introduction

Time Bank is a website that people can share their free time with families, groups and communities.

Signed in users can render their time tasks in this website. And others can accept the time tasks assigned on the website to earn time.

How to use

1. When you are in the website, you need to click "sign up now" button to create a new user.

2. Once you log in, the website will redirect you to your profile page.

3. Click the right corner "Home". You can go to your own home page where you can render your time task. It will show on the right of this page. 
		You can also click the delete button in the tasks column and delete the task.

4. In this page, you can see how many tasks you have accepted and how many tasks rendered.

5. You can see all the users when you click the USERS in the right top corner.

6. When you in the USERS page, you can click any user you want to see.

7. In their user page, you can see their tasks and click the accept button to accept their tasks. And cancel button after you accept their tasks.

8. In the right top corner, you can click the account dropdown button and click the settings button. Then you can change your password.


Requirements:
1.Create at least two controllers and two models that are related to each other.

In this website, there are 4 controllers and 3 models.

users_controller ---- users

session_controller ---- signin and signout

relationships_controller ---- accept and cancel tasks

microposts_controller ---- tasks

user model -- users

microposts model --- tasks

relationship --- accepted tasks relationship between users


user is one to many relationship to tasks

users connect each other through a relationship table and use user_id as the foreign key

2. Use migrations to incrementally build your database.

Check the db/migrate

3. Write unit, functional, and integration tests for the more interesting parts of your system.

all the tests file are in the spec folder

unit tests are in models folder

functional tests are in the controllers folder

integration tests are in the requests folder like authentication_pages_spec.rb

4. Have one AJAX operation.

Click the users button on the right top corner. And choose anyone in the list.
The accept/cancel toggle button is made by AJAX

Check the code in _follow.html.erb and _unfollow.html.erb and two other .js.erb file in views/relationships/

5. Have one REST API and be able to test it with an XML request
Check the userscontroller. 

You can use REST API here. 

e.g. http://localhost:3000/users/1.xml

The user information will be returned to the website page.
