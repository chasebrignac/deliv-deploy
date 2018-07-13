# Deliv::Deploy

Pushes code to [OpsWorks](https://aws.amazon.com/opsworks/).

## Installation

Add this line to your application's Gemfile:

    gem 'deliv-deploy'

## Usage

Deploy with the following commands:

  * `rake deploy:staging`
  * `rake deploy:qa`
  * `rake deploy:sandbox`
  * `rake deploy:production`

## Environment

You will need to have the following environmental variables set:

  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY
  * AWS_OPSWORKS_STACK_ID
  * AWS_OPSWORKS_APP_ID

## Acknowledgements

Based on [opsworks-deploy](https://github.com/hayesgm/opsworks-deploy).

Fork it and make it your own.
This gem is **not** intended to be used outside [Deliv](https://www.deliv.co/). It's API is subject to change without notice.
