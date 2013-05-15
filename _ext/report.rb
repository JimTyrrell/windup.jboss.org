require 'nokogiri'

# Extension to import docs from github wiki and render as a single page with TOC
module JBoss
  module Windup
    module Awestruct
      module Extensions
        class Report 

          def initialize(report_source, opts = {})
            @report_source = report_source
          end

          def execute(site)
            site.pages.each do |page|
              if ( page.relative_source_path =~ /^\/#{@report_source}\/index.html/ )

                content =  Nokogiri::HTML(page.content)
                styles = []
                scripts = []
                content.css('script').each do |script|
                  if script.has_attribute?('src')
                    scripts << "#{@report_source}/#{script['src']}"
                  end
                end
                content.css('link').each do |link|
                  if link['rel'] == 'stylesheet'
                    styles << "#{@report_source}/#{link['href']}"
                  end
                end

                content.css("img").each do |img|
                  img['src'] =  "#{@report_source}/#{img['src']}"
                end
                
                report = OpenStruct.new({
                  :body=>content.css("body"),
                  :javascripts=>scripts,
                  :stylesheets=>styles
                })

                site.send("#{@report_source}_report=", report)

              end
            end
          end

          def relative?(url)
            not url.match(/^[a-z]+:[\/]{2}/)
          end
        end
      end
    end
  end
end
