CarrierWave.configure do |config|
 config.fog_provider = 'fog'                        # required
 config.fog_credentials = {
   provider:              'AWS',                        # required
   aws_access_key_id:     'AKIAIVUK7YU3V3YY7BLQ',                        # required
   aws_secret_access_key: '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',                        # required
   region:                'us-east-2',                  # optional, defaults to 'us-east-1'
   host:                  's3.amazonaws.com',             # optional, defaults to nil
 }
 config.fog_directory  = 'elasticbeanstalk-us-east-2-885412341913'                                   # required
 config.fog_public     = false                                                 # optional, defaults to true
end