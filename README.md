
# 📝 Ruby on Rails Blog Application
 simple blog application built with Ruby on Rails. Users can create, edit, delete, report, and archive articles.

## 🚀 Features

- User Authentication with **Devise**
- Authorization using **Pundit**
- Image uploads using **CarrierWave**
- Article reporting and auto-archiving
- Archived article management
- Modern styled UI with **custom CSS**
- SVG icons for actions like edit, delete, report

## 💎 Versions

- Ruby: `3.4.4` 
- Rails: `8.0.2`
## 💎 Key Gems

- devise – User authentication
- pundit – Authorization
- carrierwave – File uploads


## 🔐 Authorization with Pundit

- Fine-grained permissions with `ArticalePolicy`
- Users can only:
  - Edit/Delete **their own articles**
  - View **published articles** unless they are the author
  - Report/unarchive actions are limited to signed-in users


