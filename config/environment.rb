# Load the Rails application.
require_relative "application"

# Ensure the secret is set correctly
@secret = ENV['SECRET_KEY_BASE'] || SecureRandom.hex(16) # Generates a 32-character hex string

# If @secret is not 32 bytes long, ensure it is
@secret = @secret[0, 32] if @secret.length > 32

# Initialize the Rails application.
Rails.application.initialize!

# Set up the encryption using the correct cipher and key length.
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.key = @secret
