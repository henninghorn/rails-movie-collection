module.exports = {
  purge: {
    content: ["./app/**/*.html.erb"]
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {
        backgroundColor: ['odd']
    },
  },
  plugins: [],
}
