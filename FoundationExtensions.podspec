Pod::Spec.new do |s|
  s.name         = "FoundationExtensions"
  s.version      = "0.0.1"
  s.summary      = "Collection of extensions for Foundation framework."
  # s.description  = <<-DESC
  #                   An optional longer description of FoundationExtensions
  #
  #                   * Markdown format.
  #                   * Don't worry about the indent, we strip it!
  #                  DESC
  s.homepage     = "https://github.com/stanislaw/FoundationExtensions"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Stanislaw Pankevich" => "s.pankevich@gmail.com" }

  s.source       = { :git => "https://github.com/stanislaw/FoundationExtensions.git", :tag => "0.0.1" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source_files = 'FoundationExtensions/**/*.{h,m}'

  s.framework  = 'Foundation'

  s.requires_arc = true
end
