Between Us
========
The Storyboard
----------

<br />
<br />

You have a friend who lives in another city, another state, across the country, or maybe just on the other side of town.

When you are visited, there is a sense of obligation to return the favor. Sometimes this is completely unnecessary and frivelous but **othertimes it can make or break a long distance relationship.**

If only there was something available to tell you both where to meet, things to do, and based on your interests…

Introducing: Between Us

<br /><br />
Verbal Wireframe
===
Main screen prompts for two locations, first one is auto-filled via IP with a button to geolocate. Both fields can be filled in manually. On the off-focus, the fields will be autocorrected via Google Maps API (js or ruby geolocator). Would be nice for a drop down to appear while typing with suggestions.

On submit, the values are sent to be geolocated and the geographic center is calculated. A location (or radius of cities) is picked according to the distance of choices. This is presented to the user as a proposed central meeting point for both (or all) parties.

The user can log-in to save searches or log-in via facebook to have location for self and friends easily accessible.

Eventually the proposed meeting point will be supplemented with recommendations from Yelp, Foursquare, Meetup.com.

There will be an option to generate travel directions via Google Maps.

With AirBNB and possibly other APIs there will be recommended places to lodge.

Any and all of which can be bragged about on Facebook with a share button.


<br /><br />
User Stories
===

2) As a user, I want to be able to sign up or log in, so I can save my progress.

1) As a user, I want to enter my address so I can see what this app does.

1) As a user, I want to enter someone else's address so I can see what this app has to offer.

2) As a user, I want to view the center point between both locations, so I can benefit from using this app.

At this point it is a working product
---
<br />

1) As a user, I want to be able to log out so I can end my session on the site.

1) As a user, I want my previous searches available to me, so I can go back see what I've searched for.

2) As a user, I want to select multiple spots around my center point, so I'm not limited to one location.

2) As a user, I want recommendations of spots to eat, so I don't have to figure that out.

4) As a user, I want transportation options provided for me, so I don't have to figure that out.

4) As a user, I want recommendations of stuff to do, so I don't have to figure that out.

4) As a user, I want lodging options, so I can stay overnight.

4) As a user, I want this site to look pretty so I can feel good while using it

2) As a user, I want to be able to log into facebook to not only create an account on Between Us but also automatically grab my information so I can use the site easier.

2) As a user, I want to be able to share my experience of Between Us on Facebook so I can brag to my friends.

2) As a user logged into Facebook, I want to be given recommendations of mutual friends who live close to the Between Us point.



I'm tired of always going to visit my friend when he never makes the effort to come to my side of town. We can never decide on a cool place to hang out and I usually end up forking the trainsportation costs. I wish there was a service to recommend something that works for both of us.

I found this site called Between Us that shows me great places to meet up with friends who live in other places. Instead of one of us having to make the long journey to go see the other, we now have options to meet in between.

I came across this site that claimed it could give and a friend a recommendation for a fun time. I'm no good at figuring out what to do, so I pressed a couple buttons and presto bango -- I had options for a fun-filled day with my friend I had not seen in ages. Instead of worrying about what we could do when we met up after all these years, I look like the cool dude in the know. Thanks Between Us!

I had been using a service called Between Us for finding cool stuff to do with a friend, when one day they added a feature that listed our mutual friends who lived in the area we were planning on hanging out. Thanks to this new feature, old friendships were re-kindled!

<br /><br />
Bare Minimum Features
===
For the sake of having this app a working product as soon as possible, I will tackle these features first:

  - User authentication for saved searches
  - Initial Routes set up
  - Geographic center of two locations

And then I will move on to:

  - Variable radius of result based on input
  - Choice of results

Eventually I will add in:

  - CSS beauty
  - Activity recommendations via Foursquare API
  - Food options via Yelp API
  - Transportation directions via Google Maps API

Hopefully I will have the time to:

  - Get AJAXy and reload-less
  - Add in Facebook Log-in to facilitate location grabbing of self and others.
  - With Facebook working, recommend mutual friends near the meet up point
  - Facebook share button for Between Us plan

<br /><br />
Tables
===

  Users
  - id
  - email
  - name
  - password
  - location

  Searches
  - id
  - location
  - user_id

  Categories
  - id
  - name


Controllers
===

  searches
  - new
  - show
  - create
  - destroy

  categories
  - new
  - edit
  - update
  - create
  - destroy

  users
  - new
  - edit
  - update
  - create
  - destroy

  session
  - create
  - new
  - destroy

Routes
===

  root to: '/searches/new'

  resources :searches, :only => [ :new, :show, :create, :destroy ]

  resources :users, :only => [ :new, :edit, :update, :create, :destroy ]

  resources :categories, :only => [ :new, :edit, :update, :create, :destroy ]



APIs
===
  Google Maps
  Facebook
  Foursquare
  Yelp
  AirBNB
  RottenTomatoes
  Hopspot
  Airline APIs?

Technologies
===
  Ruby/Rails Backend
  Javascript AJAX front-end
  JSON APIs
  Browser Geolocation

