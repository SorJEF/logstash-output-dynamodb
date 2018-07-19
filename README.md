# Logstash DynamoDB Output Plugin

[![Build Status](https://travis-ci.org/jasonpilz/logstash-output-dynamodb.svg?branch=master)](https://travis-ci.org/jasonpilz/logstash-output-dynamodb)

[Logstash]: https://github.com/elastic/logstash
[central location]: http://www.elastic.co/guide/en/logstash/current/
[logstash-plugins]: https://github.com/logstash-plugins
[example plugins]: https://github.com/logstash-plugins?query=example
[discussion forum]: https://discuss.elastic.co/c/logstash
[asciidoc reference]: https://github.com/elastic/docs#asciidoc-guide
[CONTRIBUTING]: https://github.com/elastic/logstash/blob/master/CONTRIBUTING.md

This is a plugin for [Logstash].

It is fully free and fully open source. The license is Apache 2.0, meaning you
are pretty much free to use it however you want in whatever way.

## Overview

## Configuration

Example [logstash config](https://www.elastic.co/guide/en/logstash/current/configuration.html)

```sh
output {
  dynamodb {
    aws_access_key_id     => "${AWS_ACCESS_KEY_ID}",    # Optional
    aws_secret_access_key => "${AWS_SECRET_ACCESS_KEY}" # Optional
    region                => "us-east-1"                # Optional, default = "us-east-1"
    table_name            => "Music"                    # Required
    create_table          => true                       # Optional, default = false
    primary_key           => "Artist"                   # Optional, used if `create_table => true`
    sort_key              => "SongTitle"                # Optional, used if `create_table => true`
    read_capacity_units   => 10                         # Optional, default = 5, used if `create_table => true`
    write_capacity_units  => 10                         # Optional, default = 5, used if `create_table => true`
  }
}
```

## Documentation

Logstash provides infrastructure to automatically generate documentation for this
plugin. We use the asciidoc format to write documentation so any comments in the
source code will be first converted into asciidoc and then into html. All plugin
documentation are placed under one [central location].

- For formatting code or config example, you can use the asciidoc `[source,ruby]` directive
- For more asciidoc formatting tips, see the excellent [asciidoc reference]

## Need Help?

Need help? Try #logstash on freenode IRC or the [discussion forum].

## Developing

### 1. Plugin Developement and Testing

#### Code

- To get started, you'll need JRuby with the Bundler gem installed.
- Create a new plugin or clone and existing from the GitHub [logstash-plugins]
organization. We also provide [example plugins].

Install dependencies
```sh
bundle install
```

#### Test

Update your dependencies

```sh
bundle install
```

Run tests

```sh
bundle exec rspec
```

### 2. Running your unpublished Plugin in Logstash

#### 2.1 Run in a local Logstash clone

Edit Logstash `Gemfile` and add the local plugin path, for example:
```ruby
gem "logstash-filter-awesome", :path => "/your/local/logstash-filter-awesome"
```

Install plugin
```sh
bin/logstash-plugin install --no-verify
```

Run Logstash with your plugin
```sh
bin/logstash -e 'filter {awesome {}}'
```

At this point any modifications to the plugin code will be applied to this local
Logstash setup. After modifying the plugin, simply rerun Logstash.

#### 2.2 Run in an installed Logstash

You can use the same **2.1** method to run your plugin in an installed Logstash
by editing its `Gemfile` and pointing the `:path` to your local plugin development
directory or you can build the gem and install it using:

Build your plugin gem
```sh
gem build logstash-filter-awesome.gemspec
```

Install the plugin from the Logstash home
```sh
bin/logstash-plugin install /your/local/plugin/logstash-filter-awesome.gem
```

Start Logstash and proceed to test the plugin

## Contributing

All contributions are welcome: ideas, patches, documentation, bug reports, complaints,
and even something you drew up on a napkin.

Programming is not a required skill. Whatever you've seen about open source and
maintainers or community members  saying "send patches or die" - you will not see
that here.

It is more important to the community that you are able to contribute.

For more information about contributing, see the [CONTRIBUTING] file.
