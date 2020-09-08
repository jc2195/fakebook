# Fakebook
The goal of this project is to build a Facebook clone on Rails.

The spec for this app is as follows:
1. Users must sign in to see anything except the sign in page.
2. Users can send Friend Requests to other Users.
3. A User must accept the Friend Request to become friends.
4. The Friend Request shows up in the notifications section of a User’s navbar.
5. Users can create Posts with just text, or with an image and text.
6. Users can Like Posts.
7. Users can Comment on Posts.
8. Posts should always display with the post content, author, comments and likes.
9. The feed should show all posts made by the logged in user and their friends.
10. Users can create a Profile with a Photo.
11. The My Account page contains Profile information, photo, and Posts.
12. Other user's profiles can be viewed by clicking on their name - the pages contain their Profile information, photo, friends and posts (but only if the user is friends with the logged in user).
13. The People page contains a list of the logged in users's friends, all of the people who the user is not friends with (with buttons to send a friend request), and the users which have been sent a friend request by the logged in user but have not accepted it yet.
14. Users can log in/sign up with their own Facebook account using the Facebook API.
15. Users get sent a welcome email after signing up. (This had to be disabled in the live heroku version.)

The live version of the site can be found here: https://whispering-mesa-77843.herokuapp.com/

This project was completed as part of The Odin Project - Ruby On Rails - FINAL PROJECT, which can be found here: https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project?ref=lnav