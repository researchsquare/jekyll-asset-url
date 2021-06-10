# Jekyll::AssetUrl

This is a Jekyll plugin to map javascript files to their generated file names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-asset-url'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-asset-url

## Usage

This plugin is intended to be used in conjunction with [`WebpackManifestPlugin`](https://github.com/shellscape/webpack-manifest-plugin). To use, add the following to `_config.yml`:

```yml
# _config.yml
assetManifest: '<relative path to manifest>'
```

Then, in your code, use the {{asset_url}} filter:

```html
<!-- footer.html -->
<script type="text/javascript" src="{{ /dist/scripts/app.js | asset_url }}"></script>
```
