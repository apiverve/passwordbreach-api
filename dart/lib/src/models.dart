/// Response models for the Password Breach Checker API.

/// API Response wrapper.
class PasswordbreachResponse {
  final String status;
  final dynamic error;
  final PasswordbreachData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PasswordbreachResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PasswordbreachResponse.fromJson(Map<String, dynamic> json) => PasswordbreachResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PasswordbreachData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Password Breach Checker API.

class PasswordbreachData {
  bool? breached;
  num? breachCount;
  String? riskLevel;
  String? inputType;
  String? hashPrefix;

  PasswordbreachData({
    this.breached,
    this.breachCount,
    this.riskLevel,
    this.inputType,
    this.hashPrefix,
  });

  factory PasswordbreachData.fromJson(Map<String, dynamic> json) => PasswordbreachData(
      breached: json['breached'],
      breachCount: json['breachCount'],
      riskLevel: json['riskLevel'],
      inputType: json['inputType'],
      hashPrefix: json['hashPrefix'],
    );
}

class PasswordbreachRequest {
  String? password;

  PasswordbreachRequest({
    this.password,
  });

  Map<String, dynamic> toJson() => {
      if (password != null) 'password': password,
    };
}
