CenitIO store over Stripe Membership Saas
=========================================

## Installation:

    ```bash
    git clone https://github.com/cenit-io/cenit-store
    cd cenit-store
    bundle install
    bundle exec rake db:migrate
    ```
    
## Configuration:

###Needed environment vars:

```yaml
ADMIN_NAME:             "Cenit.IO Store"
ADMIN_EMAIL:            "cenit.io.store@gmail.com"
ADMIN_PASSWORD:         "********"
GMAIL_USERNAME:         "cenit.io.store@gmail.com"
GMAIL_PASSWORD:         "********"
DOMAIN_NAME:            "cenit-store.io"
MAILCHIMP_API_KEY:      "*************************************"
MAILCHIMP_LIST_ID:      "******"
STRIPE_API_KEY:         "********************************"
STRIPE_PUBLISHABLE_KEY: "********************************"
```

## Load default data and plans:

    ```bash
    bundle exec rake db:seed
    ```

