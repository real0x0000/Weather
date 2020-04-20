# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def shared_pods
    pod 'Alamofire', '5.0.5', :inhibit_warnings => true
    pod 'Kingfisher', '5.13.2', :inhibit_warnings => true
    pod 'NVActivityIndicatorView', '4.8.0', :inhibit_warnings => true
    pod 'SwiftGen', '6.1.0', :inhibit_warnings => true
    pod 'SwiftyJSON', '5.0.0', :inhibit_warnings => true
end

post_install do |installer|
    installer.pods_project.build_configurations.each do
        |config| config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

target 'Weather' do
    shared_pods
end