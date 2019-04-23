module Geocoder::Lookup
  class HereCalculateMatrix < Base
    def name
      "HereCalculateMatrix"
    end

    def required_api_key_parts
      ["app_id", "app_code"]
    end

    private

    def base_query_url(query)
      "#{protocol}://autocomplete.geocoder.api.here.com/routing/7.2/calculatematrix.json"
    end

    def results(query)
      return [] unless doc = fetch_data(query)
      return [] unless doc['suggestions']

      r = doc['suggestions']

      if r.is_a?(Array)
        return r
      else
        return []
      end
    end

    def query_url_here_options(query)
      query_options = query.options

      options = {
        app_id: api_key,
        app_code: api_code,
        language: (query.language || configuration.language)
      }

      unless (country = query_options[:country]).nil?
        options[:country] = country
      end

      unless (mapview = query_options[:bounds]).nil?
        options[:mapview] = mapview.map{ |point| "%f,%f" % point }.join(';')
      end

      query_options.slice!(:bounds, :country)

      options.merge(query_options)
    end

    def query_url_params(query)
      super.merge(query_url_here_options(query)).merge(
        query: query.sanitized_text
      )
    end

    def api_key
      if (a = configuration.api_key)
        return a.first if a.is_a?(Array)
      end
    end

    def api_code
      if (a = configuration.api_key)
        return a.last if a.is_a?(Array)
      end
    end
  end
end
