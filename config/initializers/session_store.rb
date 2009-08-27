# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photopoll_session',
  :secret      => '877066bcc0fc1108b3678de3f653728e48af4acd1ed2595f22bcef1a542371bc9d118e8e738456a6b600c7a6863845ddc20d0b7a2feae2f3f6dad8f30b4d66ff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
