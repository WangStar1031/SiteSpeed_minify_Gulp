var gulp = require('gulp');

var imagemin = require('gulp-imagemin');
var changed = require('gulp-changed');

var autoprefix = require('gulp-autoprefixer');
var minifyCSS = require('gulp-minify-css');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

var watch = require('gulp-watch');

gulp.task('imagemin', done => {
	console.log("Starting image minifying.");
	var img_src = 'src/view/theme/default/image/**/*', img_dest = 'build/images';

	gulp.src(img_src)
	.pipe(changed(img_dest))
	.pipe(imagemin())
	.pipe(gulp.dest(img_dest));
	console.log('All images are minimized.');
	done();
});

gulp.task('styles', done => {
	console.log("Starting stylesheets compiling.");
	gulp.src([
			'src/view/theme/default/stylesheet/inline1.css',
			'src/view/javascript/outside/jquery-ui/jquery-ui.css',
			'src/view/javascript/bootstrap/css/bootstrap.min.css',
			'src/view/javascript/font-awesome/css/font-awesome.min.css',
			'src/view/theme/default/font/stylesheet.css',
			'src/view/theme/default/stylesheet/bootstrap.css',
			'src/view/theme/default/stylesheet/style.css',
			'src/view/theme/default/stylesheet/responsive.css',
			'src/view/theme/default/stylesheet/stylesheet-pure-css.css',
			'src/view/javascript/flipclock/compiled/flipclock.css',

			// 'src/view/javascript/bootstrap/css/bootstrap.css',
			// 'src/view/javascript/font-awesome/css/font-awesome.min.css',
			// 'src/view/theme/default/font/stylesheet.css',
			// 'src/view/theme/default/stylesheet/style.css',
			// 'src/view/theme/default/stylesheet/responsive.css',
			// 'src/view/theme/default/stylesheet/stylesheet-pure-css.css',
			// 'src/view/javascript/flipclock/compiled/flipclock.css',
			// 'src/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css',
			// 'src/view/theme/default/stylesheet/fb_login.css',
			// 'src/view/theme/default/stylesheet/*.css'
		])
	.pipe(concat('all_styles.css'))
	// .pipe(autoprefix('last 2 versions'))
	.pipe(minifyCSS())
	.pipe(gulp.dest('build/styles/'));
	console.log("All stylesheets are compiled.");
	done();
});

gulp.task('js', done => {
	console.log("Starting script minimization.");
	
	gulp.src(['src/view/javascript/inlineScripts/inline_1.js'])
	.pipe(uglify())
	.pipe(gulp.dest('build/scripts'));

	gulp.src(['src/view/javascript/inlineScripts/inline_2.js'])
	.pipe(uglify())
	.pipe(gulp.dest('build/scripts'));

	gulp.src([
		'src/view/javascript/outside/google/jquery.min.js',
		'src/view/javascript/outside/sweetalert/sweetalert.min.js',
		'src/view/javascript/inlineScripts/inline1.js',
		'src/view/javascript/outside/google/platform.js',
		'src/view/javascript/inlineScripts/inline2.js',
		'src/view/javascript/inlineScripts/inline3.js',
		'src/view/javascript/inlineScripts/inline4.js',
		'src/view/javascript/inlineScripts/inline5.js',
		'src/view/javascript/jquery/jquery-2.1.1.min.js',
		'src/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js',
		'src/view/javascript/outside/jquery-ui/jquery-ui.js',
		'src/view/javascript/bootstrap/js/bootstrap.min.js',
		'src/view/javascript/bootbox/bootbox.js',
		'src/view/javascript/common.js',
		'src/view/javascript/inlineScripts/inline6.js',
		'src/view/javascript/inlineScripts/inline7.js',
		'src/view/javascript/inlineScripts/inline8.js',
		'src/view/javascript/inlineScripts/inline9.js',
		'src/view/javascript/inlineScripts/inline10.js',
		'src/view/javascript/inlineScripts/inline11.js',
		'src/view/javascript/inlineScripts/inline12.js',
		'src/view/javascript/inlineScripts/inline13.js',
		'src/view/javascript/inlineScripts/inline14.js',

		// 'src/scripts/*.js'
		// 'src/view/javascript/jquery/jquery-2.1.1.min.js',
		// 'src/view/javascript/bootstrap/js/bootstrap.min.js',
		// 'src/view/javascript/bootbox/bootbox.js',
		// 'src/view/javascript/common.js',
		// 'src/view/javascript/jquery/jquery.fblogin.js',
		// 'src/view/javascript/jquery/datetimepicker/moment.js',
		// 'src/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js',
		// 'src/view/theme/default/js/iframe/iframeResizer.contentWindow.min.js',
		// 'src/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js',
		])
	.pipe(concat('all_scripts.js'))
	.pipe(uglify())
	.pipe(gulp.dest('build/scripts'));
	console.log("All js files are minimized.");
	done();
});

gulp.task('watch', function(){
	gulp.watch([
			'src/view/theme/default/stylesheet/inline1.css',
			'src/view/javascript/outside/jquery-ui/jquery-ui.css',
			'src/view/javascript/bootstrap/css/bootstrap.min.css',
			'src/view/javascript/font-awesome/css/font-awesome.min.css',
			'src/view/theme/default/font/stylesheet.css',
			'src/view/theme/default/stylesheet/bootstrap.css',
			'src/view/theme/default/stylesheet/style.css',
			'src/view/theme/default/stylesheet/responsive.css',
			'src/view/theme/default/stylesheet/stylesheet-pure-css.css',
			'src/view/javascript/flipclock/compiled/flipclock.css',

		// 'src/view/javascript/bootstrap/css/bootstrap.css',
		// 'src/view/javascript/font-awesome/css/font-awesome.min.css',
		// 'src/view/theme/default/font/stylesheet.css',
		// 'src/view/theme/default/stylesheet/style.css',
		// 'src/view/theme/default/stylesheet/responsive.css',
		// 'src/view/theme/default/stylesheet/stylesheet-pure-css.css',
		// 'src/view/javascript/flipclock/compiled/flipclock.css',
		// 'src/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css',
		// 'src/view/theme/default/stylesheet/fb_login.css',
		],  gulp.series(['styles'], done => {
		console.log("CSS files changed.");
		done();
	}));
	gulp.watch([
		'src/view/javascript/outside/google/jquery.min.js',
		'src/view/javascript/outside/sweetalert/sweetalert.min.js',
		'src/view/javascript/inlineScripts/inline1.js',
		'src/view/javascript/outside/google/platform.js',
		'src/view/javascript/inlineScripts/inline2.js',
		'src/view/javascript/inlineScripts/inline3.js',
		'src/view/javascript/inlineScripts/inline4.js',
		'src/view/javascript/inlineScripts/inline5.js',
		'src/view/javascript/jquery/jquery-2.1.1.min.js',
		'src/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js',
		'src/view/javascript/outside/jquery-ui/jquery-ui.js',
		'src/view/javascript/bootstrap/js/bootstrap.min.js',
		'src/view/javascript/bootbox/bootbox.js',
		'src/view/javascript/common.js',
		'src/view/javascript/inlineScripts/inline6.js',
		'src/view/javascript/inlineScripts/inline7.js',
		'src/view/javascript/inlineScripts/inline8.js',
		'src/view/javascript/inlineScripts/inline9.js',
		'src/view/javascript/inlineScripts/inline10.js',
		'src/view/javascript/inlineScripts/inline11.js',
		'src/view/javascript/inlineScripts/inline12.js',
		'src/view/javascript/inlineScripts/inline13.js',
		'src/view/javascript/inlineScripts/inline14.js',

		// 'src/view/javascript/bootstrap/js/bootstrap.min.js',
		// 'src/view/javascript/bootbox/bootbox.js',
		// 'src/view/javascript/common.js',
		// 'src/view/javascript/jquery/jquery.fblogin.js',
		// 'src/view/javascript/jquery/datetimepicker/moment.js',
		// 'src/view/javascript/jquery/jquery-2.1.1.min.js',
		// 'src/view/theme/default/js/iframe/iframeResizer.contentWindow.min.js',
		// 'src/view/javascript/PawelDecowski-jquery-creditcardvalidator-ec16ea1/jquery.creditCardValidator.js',
		], gulp.series(['js'], done => {
		console.log("JS files changed.");
		done();
	}));
	gulp.watch([
		'src/view/theme/default/image/**/*',
	], gulp.series(['imagemin'], done => {
		console.log("Image files changed.");
		done();
	}));
});

gulp.task('default', gulp.series(['imagemin', 'styles', 'js'], done => {
	console.log("All tasks are finished successfully.");
	done();
}));
