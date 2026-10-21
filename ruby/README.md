# Password Breach Checker API - Ruby Gem

Password Breach Checker tells you whether a password appears in the Pwned Passwords corpus of passwords exposed in data breaches. Send the password or its SHA-1 hash and get a breached flag. Paid plans add how many times it was seen and a risk level.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_passwordbreach'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_passwordbreach
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_passwordbreach'

# Initialize the client
client = APIVerve::Passwordbreach::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  password: "password123",
  hash: "5BAA61E4C9B93F3F0682250B6CF8331B7EE68FD8"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ password: "password123" })
  puts response["data"]
rescue APIVerve::Passwordbreach::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Passwordbreach::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Passwordbreach::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "breached": true,
    "breachCount": 2266543,
    "riskLevel": "critical",
    "inputType": "password",
    "hashPrefix": "CBFDA"
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/passwordbreach?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/passwordbreach?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/passwordbreach?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
