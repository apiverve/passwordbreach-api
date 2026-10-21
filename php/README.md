# Password Breach Checker API - PHP Package

Password Breach Checker tells you whether a password appears in the Pwned Passwords corpus of passwords exposed in data breaches. Send the password or its SHA-1 hash and get a breached flag. Paid plans add how many times it was seen and a risk level.

## Installation

Install via Composer:

```bash
composer require apiverve/passwordbreach
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Passwordbreach\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'password' => 'password123',
    'hash' => '5BAA61E4C9B93F3F0682250B6CF8331B7EE68FD8'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Passwordbreach\Client;
use APIVerve\Passwordbreach\Exceptions\APIException;
use APIVerve\Passwordbreach\Exceptions\ValidationException;

try {
    $response = $client->execute(['password' => 'password123']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/passwordbreach?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/passwordbreach?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/passwordbreach?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
