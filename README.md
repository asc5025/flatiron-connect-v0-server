# README: Flatiron Connect Backend API

The client repo can be found here: [pip](https://github.com/asc5025/flatiron-connect-v0-client)

## Overview
This backend API that interacts with the Flatiron Connect client. <br /> <br />
Server is running on the following: <br />
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
