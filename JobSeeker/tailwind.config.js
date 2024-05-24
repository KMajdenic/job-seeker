/** @type {import('tailwindcss').Config} */


module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim,rb}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
