# Load the Rails application.
require_relative "application"

# Ensure the secret is set correctly, use 32 characters (16 bytes will not be sufficient for aes-256-cbc)
@secret = ENV['SECRET_KEY_BASE'] || SecureRandom.hex(32) # Generates a 32-byte hex string (64 characters)

# Ensure that @secret is exactly 32 bytes for AES-256
@secret = @secret[0, 32]

# Initialize the Rails application.
Rails.application.initialize!

# Set up the encryption using the correct cipher and key length.
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.key = @secret
