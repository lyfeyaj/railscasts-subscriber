## This is RailsCasts Subscriber with a little hack

## Pre-requirements

+ You need to have a subscription code such as: 

XJHhjlfjkdLIfd3ffdsfds

### Usage

+ Download it and install.

```bash
git clone https://github.com/lyfeyaj/railscasts-subscriber.git
cd railscasts-subscriber
rake install
```

+ Enjoy it.

``` bash
railscasts update                # Update the newest episodes
railscasts upgrade               # Update the newest episodes and download
railscasts download              # Download all the episodes
railscasts list                  # List all the available episodes
railscasts info                  # Information about railscasts
railscasts -h/--help/help        # Output the help doc
railscasts -v/--version/version  # Output the version info
```

## About config file: ~/.railscasts.yml

```yaml
subscription-code: XJHhjlfjkdLIfd3ffdsfds # subscription code, replace yours in here
file-type: mp4                            # choose file type that your want to download(mp4, m4v, webm, ogv)
download-path: ~/felix/railscasts         # download path is where your want to put railscasts in
```

### TODO
+ Publish as a gem in rubygem.org
+ Add valid check for file
