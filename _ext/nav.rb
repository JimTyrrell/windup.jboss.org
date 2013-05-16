module JBoss
  module Windup
    module Awestruct
      module Extensions
        class Nav
          def initialize()
          end

          def execute(site)
            if site.nav
              nav = {}
              site.nav.each do |k, v|
                nav[k.to_s] = build(v, '', k, site)
              end
              site.nav = nav
            end
          end

          def build(object, href, parent, site)
            if parent != nil
              href = "#{href}/#{parent}.html"
            end
            r = {} 
            if Hash === object
              object.each do |key, value|
                if key.to_s == 'label' || key.to_s == 'href' || key.to_s == 'description'
                  r[key] = value
                end
              end
            end
            s = OpenStruct.new(r)
            s.href ||= href
            if s.href !~ /^http[s]?:\/\//
              s.href = site.base_url + s.href
            end 
            s.label ||= parent.to_s.split('-').each{|word| word.capitalize!}.join(' ')
            s
          end
        end
      end
    end
  end
end

