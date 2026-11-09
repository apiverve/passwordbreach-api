# Password Breach Checker API - Dart/Flutter Client

Password Breach Checker tells you whether a password appears in the Pwned Passwords corpus of passwords exposed in data breaches. Send the password or its SHA-1 hash and get a breached flag. Paid plans add how many times it was seen and a risk level.

[![pub package](https://img.shields.io/pub/v/apiverve_passwordbreach.svg)](https://pub.dev/packages/apiverve_passwordbreach)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Password Breach Checker API](https://apiverve.com/marketplace/passwordbreach?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_passwordbreach: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_passwordbreach/apiverve_passwordbreach.dart';

void main() async {
  final client = PasswordbreachClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'password': 'password123'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Password Breach Checker API](https://apiverve.com/marketplace/passwordbreach?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/passwordbreach](https://docs.apiverve.com/ref/passwordbreach?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
