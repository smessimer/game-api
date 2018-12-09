# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Relationship Status LUT
RelationshipStatus.create status: 'PENDING'
RelationshipStatus.create status: 'APPROVED'
RelationshipStatus.create status: 'DECLINED'
RelationshipStatus.create status: 'BLOCKED'

# Some users
User.create email: 'sethmessimer@gmail.com',
            password: 'password',
            password_confirmation: 'password'

User.create email: 'sethmessimer+2@gmail.com',
            password: 'password',
            password_confirmation: 'password'

# Make the users friends
Relationship.create user_1_id: 1,
                    user_2_id: 2,
                    relationship_status_id: 2,
                    activity_by_user_id: 1

# Create a steam user for each user (need real steamid's, hence the duplications)
SteamUser.create  user_id: 1,
                  username: 'MrMessy',
                  steamid: '76561197961166136'

SteamUser.create  user_id: 2,
                  username: 'MrsMessy',
                  steamid: '76561197961166136'

# Posts
Post.create caption: 'Just playing some CS:GO',
            upvotes: 2,
            user_id: 1

Post.create caption: 'Chicken dinner on PUBG!',
            upvotes: 10,
            user_id: 2,
            media_url: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FDZwZ9FBVAAE_A4N.jpg&imgrefurl=https%3A%2F%2Ftwitter.com%2Fpubgmobile%2Fstatus%2F980782901532004352&docid=0R8dNCIliFVnWM&tbnid=59mq-JdqQsWZjM%3A&vet=10ahUKEwig37XA0pDfAhXKz4MKHaAvBpUQMwhBKAIwAg..i&w=1200&h=675&client=ubuntu&bih=1308&biw=1700&q=chicken%20dinner%20pubg&ved=0ahUKEwig37XA0pDfAhXKz4MKHaAvBpUQMwhBKAIwAg&iact=mrc&uact=8'
