# README: Flatiron Connect Backend API

The client repo can be found here: [client application](https://github.com/asc5025/flatiron-connect-v0-client)

## Overview
This Rails API provides authentication, the relational database and action cable implementation for the Flatiron Connect client. <br /> <br />
The backend server requires the following: <br />
Rails version 5.2.2 <br />
Ruby version 2.3.3 <br />
Database: postgresql <br />

## Installation
Please follow details as API endpoint is specific to port: 3000 <br />
Also, seed data is implemented.

```bash
bundle install
rake db:reset
rake db:migrate
rake db:seed
rails s -p 3001
```
