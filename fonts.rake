require 'yaml'

desc "updates the font combination on the stylesheet"
task :update_font do
  jekyll_config = YAML.load IO.read('_config.yml')
  typography_stylesheet = File.expand_path(File.dirname(__FILE__) + "/../sass/base/_typography.scss")
  if File.exists? typography_stylesheet
    content = File.read typography_stylesheet
    File.open(typography_stylesheet, 'w') do |f|
      case jekyll_config['font_combination']
      when 'droid'
        f.puts content.gsub(/^\$sans: "([^"]+)"/, '$sans: "Droid Sans"').gsub(/^\$serif: "([^"]+)"/, '$serif: "Droid Serif"')

      when 'open-gentium'
        f.puts content.gsub(/^\$sans: "([^"]+)"/, '$sans: "Open Sans"').gsub(/^\$serif: "([^"]+)"/, '$serif: "Gentium Book Basic"')

      when 'arvo-ubuntu'
        f.puts content.gsub(/^\$sans: "([^"]+)"/, '$sans: "Ubuntu"').gsub(/^\$serif: "([^"]+)"/, '$serif: "Arvo"')

      when 'lato-lora'
        f.puts content.gsub(/^\$sans: "([^"]+)"/, '$sans: "Lato"').gsub(/^\$serif: "([^"]+)"/, '$serif: "Lora"')

      else
        f.puts content.gsub(/^\$sans: "([^"]+)"/, '$sans: "PT Sans"').gsub(/^\$serif: "([^"]+)"/, '$serif: "PT Serif"')
      end
    end
  else
    puts "## The typography stylesheet is not found. Is the theme installed?"
  end
end
