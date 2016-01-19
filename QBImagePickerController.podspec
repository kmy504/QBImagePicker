Pod::Spec.new do |s|
  s.name             = "QBOldImagePickerController"
  s.version          = "2.6.0"
  s.summary          = "A clone of UIImagePickerController with multiple selection support."
  s.homepage         = "https://github.com/questbeat/QBImagePicker"
  s.license          = "MIT"
  s.author           = { "questbeat" => "questbeat@gmail.com" }
  s.source           = { :git => "https://github.com/questbeat/QBImagePicker.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/questbeat"
  s.source_files     = "QBOldImagePicker/*.{h,m}"
  s.exclude_files    = "QBOldImagePicker/QBImagePicker.h"
  s.resource_bundles = { "QBOldImagePicker" => "QBOldImagePicker/*.{lproj,storyboard}" }
  s.platform         = :ios, "6.0"
  s.requires_arc     = true
  s.frameworks       = "AssetsLibrary"
end

