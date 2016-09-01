require 'erb'
require 'fileutils'
require 'rubygems'

name "fluentd"
maintainer "ZipRecruiter"
homepage "ziprecruiter.com"
description "Fluentd: A data collector for ZipRecruiter"

install_dir     "/opt/fluentd"
build_version   "2.3.1"
build_iteration 2

# creates required build directories
dependency "preparation"

override :ruby, :version => '2.1.8'
override :zlib, :version => '1.2.8'
override :rubygems, :version => '2.4.8'
override :postgresql, :version => '9.3.5'

# td-agent dependencies/components
dependency "td-agent"
dependency "td-agent-files"
#dependency "td"
#dependency "td-agent-ui"
dependency "td-agent-cleanup"

# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"

compress :dmg do
end
