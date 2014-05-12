# RailsCasts Subscriber with a little hack

## Pre-requirements

+ To use this tool, you must have ruby environment installed.

## Notes

#### For railscasts free user
+ You can update and download all free railscasts episodes with this tools

#### For railscasts pro user
+ You need to have a subscription code (license) such as: XJHhjlfjkdLIfd3FfdRfSD.
+ Trust me, XJHhjlfjkdLIfd3FfdRfSD is a fake one ^_^

## Usage

#### Download it and install.

```bash
git clone https://github.com/lyfeyaj/railscasts-subscriber.git
cd railscasts-subscriber
rake install
```

#### Enjoy it by below commands.

``` bash
rcs update                # Update the newest episodes
rcs upgrade               # Update the newest episodes and download
rcs download              # Download all the episodes
rcs list                  # List all the available episodes
rcs info                  # Information about railscasts
rcs links                 # List all the railscasts download links
rcs open                  # Open the RailsCasts directory with default browser
rcs -h/--help/help        # Output the help doc
rcs -v/--version/version  # Output the version info
```

## About config file: ~/.railscasts.yml

```yaml
subscription-code: your_license           # subscription code, replace yours in here
file-type: mp4                            # choose file type that your want to download(mp4, m4v, webm, ogv)
download-path: ~/felix/railscasts         # download path is where your want to put railscasts in
```

## TODO
+ Publish as a gem in rubygem.org
+ Add valid check for file
