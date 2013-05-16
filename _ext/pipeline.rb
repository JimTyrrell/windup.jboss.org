require File.join File.dirname(__FILE__), 'documentation'
require File.join File.dirname(__FILE__), 'report'
require File.join File.dirname(__FILE__), 'nav'
require 'wget_wrapper'
require 'js_minifier'
require 'css_minifier'
require 'html_minifier'
require 'file_merger'
require 'compass_config'

Awestruct::Extensions::Pipeline.new do
  extension JBoss::Windup::Awestruct::Extensions::Documentation.new('/windup.wiki', '.adoc')
  extension JBoss::Windup::Awestruct::Extensions::Report.new('sample')
  extension JBoss::Windup::Awestruct::Extensions::Nav.new
  helper Awestruct::Extensions::Partial
  extension Awestruct::Extensions::WgetWrapper.new
  transformer Awestruct::Extensions::JsMinifier.new
  transformer Awestruct::Extensions::CssMinifier.new
  transformer Awestruct::Extensions::HtmlMinifier.new
  extension Awestruct::Extensions::FileMerger.new
  extension Awestruct::Extensions::CompassConfig.new
end

