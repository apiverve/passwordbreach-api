Pod::Spec.new do |s|
  s.name             = 'APIVervePasswordBreachChecker'
  s.version          = '1.2.3'
  s.summary          = 'Password Breach Checker tells you whether a password appears in the Pwned Passwords corpus of passwords exposed in data breaches.'
  s.description      = <<-'DESC'
Password Breach Checker tells you whether a password appears in the Pwned Passwords corpus of passwords exposed in data breaches. Send the password or its SHA-1 hash and get a breached flag. Paid plans add how many times it was seen and a risk level.

This iOS/macOS SDK provides a convenient way to access the Password Breach Checker from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/passwordbreach?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/passwordbreach-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVervePasswordBreachChecker/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
