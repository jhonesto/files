##Adding scully in your project

ng add @scullyio/init 

### Build your angular app
ng build --prod

### Exec scully to generate static files
npm run scully

### Add the configs generated to your git
git add .
git commit -m "Adding scully!"
git push

## If you're using JamStack
### In your netlify.toml 

vi netlify.toml

publish = "dist/static"
command = "ng build --prod && npm run scully"

