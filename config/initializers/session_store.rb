# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_NBDD_session',
  :secret      => 'b7b89e07fa816e05d930c1662bcc0fe08a48fcb6d7ce3b5029eac895152602251431ee27e1e9a59a4de06e640535ec6b6e06e784f450e6fbbc7457e7572d9ddb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
