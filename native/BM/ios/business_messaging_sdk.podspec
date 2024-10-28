#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint business_messaging_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'business_messaging_sdk'
  s.version          = '1.0.1'
  s.summary          = 'The Business Messaging mobile SDK'
  s.description      = <<-DESC
The Business Messaging user experience is simple, familiar, and relatable, and has the potential to accelerate the adaptation of instant messaging for effective business communications.
                        DESC
  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/developer-space/business-messaging'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'BusinessMessagingSDK', '1.3.3'
  s.platform = :ios, '13.0'
end
