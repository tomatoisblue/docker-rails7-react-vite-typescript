cd /src
# Create new Rails application with minimal setup
rails new . --force --minimal

# Create a database
rails db:create

# Install "vite_rails" gem
echo 'gem "vite_rails"' >> Gemfile
bundle install
bundle exec vite install

# Create React project with typescript and vite
cd app/frontend
npm create vite@latest . -- --template react-ts
rm package.json vite.config.ts index.html src/main.tsx

cd /setup 
cp package.json vite.config.ts start-*  /src

cd /src
npm install

cp /setup/application.html.erb		app/views/layouts/

mkdir /src/app/frontend/entrypoints
cp /setup/home.tsx			app/frontend/entrypoints/

rails g controller home index

cp /setup/index.html.erb		app/views/home/
cp /setup/routes.rb			config/
