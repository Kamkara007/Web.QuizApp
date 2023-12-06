module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './config/initializers/heroicon.rb', // 👈
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
}