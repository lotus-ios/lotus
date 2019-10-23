# frozen_string_literal: true

Pod::Spec.new do |s|
  s.name         = 'Lotus'
  s.version      = '0.2.0'
  s.summary      = 'Layer animation DSL'
  s.description  = <<-DESC
  Light and easy to use DSL for animating layers with help of CoreAnimation
  DESC
  s.homepage     = 'https://github.com/vkondrashkov/lotus'
  s.license      = 'MIT'
  s.author       = { 'Vladislav Kondrashkov' => 'vladislav.kondrashkov@gmail.com' }
  s.source       = { git: 'https://github.com/vkondrashkov/lotus.git', tag: s.version.to_s }
  s.platform     = :ios, '10.0'
  s.swift_version = '5.0'
  s.source_files  = 'Source/*.swift'
end
