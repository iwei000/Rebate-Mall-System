module.exports = {
  presets: [
    '@vue/cli-plugin-babel/preset'
  ],
  plugins: [
	  [
		  'import',{
			  libraryName: 'Vant',
			  libraryDirectory: 'es',
			  style: true
		  },'vant'
	  ]
  ]
}
