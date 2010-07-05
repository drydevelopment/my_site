# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_DryDevelopment_session',
  :secret      => '2923b20cdd7f65afda34a214067501bb997ae66043c043552372c474ecc4a6b076f9c833c20b58392cb29acb28ea92edb35b6091a0bcfd1eecc69bbcdc7d04b4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
