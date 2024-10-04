/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb', // Include all your Rails views
    './app/helpers/**/*.rb', // If you use helper files with classes
    './app/assets/javascripts/**/*.js', // JavaScript files with Tailwind classes
    './app/javascript/**/*.js', // If using Webpacker or ESBuild for JavaScript
    './app/assets/stylesheets/**/*.css', // CSS files with Tailwind classes
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
