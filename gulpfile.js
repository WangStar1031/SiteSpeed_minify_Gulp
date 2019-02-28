var gulp = require('gulp');

var imagemin = require('gulp-imagemin');
var changed = require('gulp-changed');

var autoprefix = require('gulp-autoprefixer');
var minifyCSS = require('gulp-minify-css');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

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
		'src/view/theme/default/stylesheet/*.css'
		])
	// .pipe(concat('styles.css'))
	.pipe(autoprefix('last 2 versions'))
	.pipe(minifyCSS())
	.pipe(gulp.dest('build/styles/'));
	console.log("All stylesheets are compiled.");
	done();
});

gulp.task('js', done => {
	console.log("Starting script minimization.");
	gulp.src([
		// 'src/scripts/*.js'
		'src/view/javascript/bootstrap/js/bootstrap.min.js',
		'src/view/javascript/bootbox/bootbox.js',
		'src/view/javascript/common.js',
		'src/view/javascript/jquery/jquery.fblogin.js',
		'src/view/javascript/jquery/datetimepicker/moment.js',
		])
	// .pipe(concat('script.js'))
	.pipe(uglify())
	.pipe(gulp.dest('build/scripts'));
	console.log("All js files are minimized.");
	done();
});

gulp.task('default', gulp.series(['imagemin', 'styles', 'js'], done => {
	console.log("All tasks are finished successfully.");
	done();
}));
