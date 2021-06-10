module Jekyll
    require 'json'
    require 'open-uri'

    module AssetUrl
        def asset_url(input)
            begin
                manifest_location = @context.registers[:site].config['assetManifest']
                manifest_data = JSON.parse(open(manifest_location).read)
            rescue
                return input
            end

            mapped_file_name = ""
            manifest_data.each do |key, value|
                if input.include? key
                    mapped_file_name = File.basename(value)
                    break
                end
            end

            return input if mapped_file_name.empty?

            return input.gsub(File.basename(input), mapped_file_name)
        end
    end

    Liquid::Template.register_filter(Jekyll::AssetUrl)
end
