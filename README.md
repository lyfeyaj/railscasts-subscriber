## This is RailsCasts Subscriber with a little hack

### Usage

+ Doneload it first.

```bash
git clone https://github.com/lyfeyaj/railscasts-subscriber.git
cd railscasts-subscriber
```
+ Then build the gem and install it.

```bash
gem build railscasts.gemspec
gem install railscasts-0.0.1.gem
```
+ Copy the config file and add your own subscription code

```bash
cp config/railscasts.yml.example ~/.railscasts.yml
```

+ Finally enjoy it.

``` bash
railscasts update                # Update the newest episodes
railscasts update_all            # Update the newest episodes
railscasts download              # Doneload all the episodes
railscasts list                  # List all the available episodes
railscasts -h/--help/help        # Output the help doc
railscasts -v/--version/version  # Output the help doc
```

### TODO
+ Publish as a gem in rubygem.org