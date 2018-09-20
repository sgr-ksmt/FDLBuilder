Pod::Spec.new do |s|
  s.name             = "FDLBuilder"
  s.version          = "0.1.0"
  s.summary          = "FDL(Firebase Dynamic Links) builder."
  s.homepage         = "https://github.com/sgr-ksmt/FDLBuilder"
  s.license          = 'MIT'
  s.author           = { "Suguru Kishimoto" => "melodydance.k.s@gmail.com" }
  s.source           = { :git => "https://github.com/sgr-ksmt/FDLBuilder.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = "FDLBuilder/Sources/*.swift"
  s.static_framework = true
  s.dependency "Firebase/DynamicLinks", "~> 5.0"
end
