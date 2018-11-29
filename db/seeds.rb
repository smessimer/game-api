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
