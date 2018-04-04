Pod::Spec.new do |s|

  s.name         = "microLogger"
  s.module_name   = "MicroLogger"
  s.version      = "1.0.0"
  s.summary      = "Lightweight logger for your swift app."
  s.description  = <<-DESC
Ideal sollution for your swift app when you want to have a simple control over your logged messages.

Just select appropriate loglevel for your debug or production build and you do not have to worry about printing something inappropriate in production.
                   DESC

  s.homepage     = "https://github.com/micromanc3r/microLogger"
  s.license      = "MIT"
  s.author             = { "Miroslav Sliacky" => "micromanc3r@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/micromanc3r/microLogger.git", :tag => "#{s.version}" }
  s.source_files  = "microLogger/**/*.{h,m,swift}"
  s.exclude_files = "**/microLoggerTests/**/*.{swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
