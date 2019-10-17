# frozen_string_literal: true

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

target 'Lotus' do
end

target 'LotusTests' do
  inherit! :search_paths
  pod 'Quick'
  pod 'Nimble'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug' && defined?(target.product_type)
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
      end
    end
  end
end
