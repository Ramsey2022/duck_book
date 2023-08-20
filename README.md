# Duck_book

## Live Project

You can try it out [here](https://duck-book-b3cc562963fa.herokuapp.com/) via Heroku.
Username: test Password: password

## Screenshots
<p>
  <img src="img/duck-book-home.png" alt="duck_book login" width="250" height="200">
  <img src="img/duck-book-timeline.png" alt="duck_book timeline" width="250" height="200">
  <img src="img/duck-book-notifications.png" alt="duck_book notifications" width="250" height="200">
</p>


## About

Duck_book was created based on The Odin Project's final project for building a [Facebook Clone](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project).

This is my third iteration. The first version was clunky, but functional. The second version was mainly focusing on clean code and adding turbo for smooth functionality. The third is what you see here.

I learned alot building this project. I mostly furthered my knowledge of associations and using turbo. I also learned how to use ActiveStorage and how to login through Devise with a third-party app. If I had to change anything, I would have made notifications polymorphic rather then using foreign keys. However, this is the most complex project I've worked on so far and I'm very happy with how it turned out.

## Features

- Log in / Log out

  - utilized [Devise](https://github.com/heartcombo/devise) for user authentication
  - OAuth allows users to login with Github

- Profile

  - User profile showcases tabs for posts created by user, posts liked by user, and posts commented on
  - users can also upload a profile picture in settings to replace the default image
 
## Turbo-features
  Used turbo streams to avoid page reloads and create smooth reponses.

- Posts

  - users can write posts and attach an image
  - posts can have many likes and comments
 
- Likes

  - can have many likes
  - like count updates with turbo

- Comments

  - can have many comments
  - appended comments, and updates the comment count with turbo

- Friendship

  - users can add other users as friends
  - uses turbo streams to avoid page reloads when requests are created, canceled, declined, or accepted

- Notifications

  - notified when comments are made on user's post
  - notified when post recives likes
  - notified when friendships are requested

- Styling

  - styled with vanilla CSS, mostly flexbox and some CSSgrid
  - icons from [featherIcons](https://feathericons.com/)
  
