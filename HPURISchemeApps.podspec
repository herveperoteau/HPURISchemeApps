Pod::Spec.new do |s|
  s.name     = 'HPURISchemeApps'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Scheme API search'
  s.author   = { 'Herve Peroteau' => 'herve.peroteau@gmail.com' }
  s.description = 'API Scheme search'
  s.platform = :ios
  s.source = { :git => "https://github.com/herveperoteau/HPURISchemeApps.git"}
  s.source_files = 'HPURISchemeApps'
  s.requires_arc = true
end

