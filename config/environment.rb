# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Ensure the @secret is set and the key is 32 bytes long.
# Fetch from environment variable or generate a new one for development purposes.
@secret = ENV['SECRET_KEY_BASE'] || SecureRandom.hex(32)  # 32 characters for AES-256 encryption

# Set up the encryption using the correct cipher and key length.
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.key = @secret
