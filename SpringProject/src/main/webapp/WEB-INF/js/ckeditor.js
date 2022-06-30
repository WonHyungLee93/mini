let editor;

ClassicEditor
.create( document.querySelector( '#content' ) , {language: "ko"} ,{
	ckfinder: {
		uploadUrl: 'http://localhost:8080/SpringProjcet/board/imageUpload'
	}
})
.then( newEditor => {
        editor = newEditor;
    } )

.then( editor => {
	window.editor = editor;

} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
	console.error( error );
} );