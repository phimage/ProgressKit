Pod::Spec.new do |spec|
  spec.name = 'ProgressKit'
  spec.version = '0.0.1'
  spec.license = 'MIT'
  spec.summary = 'ProgressViews for Mac'
  spec.homepage = 'https://github.com/kaunteya/ProgressKit'
  spec.authors = { 'Kaunteya Suryawanshi' => 'k.suryawanshi@gmail.com' }
  spec.source = { :git => 'https://github.com/kaunteya/ProgressKit.git', :tag => spec.version }

  spec.platform = :osx, '10.9'
  spec.requires_arc = true

  spec.source_files = 'Determinate/*.swift', 'InDeterminate/*.swift', 'ProgressUtils.swift', 'BaseView.swift'
end
