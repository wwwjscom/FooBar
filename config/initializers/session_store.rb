# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FooBar_session',
  :secret      => '6fa39da7f06945d467a2bd448e6ce02bcb2ec1b84b77b0df4c1a40678f790d31c3b28f7392d4d0d949c6f53d77f7badb028156652b036d688af6aa52bae34580'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
