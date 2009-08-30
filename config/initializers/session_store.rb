# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TweetNozzle_session',
  :secret      => '97bf7c7a04cb825c4bb69a7cc5b0350303cc7529ef3418106231fa057b645c525cf381b3d7133fb212a1b3e6965f6c5f1e53e8c102a1410df3b03ee242b8cb96'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
