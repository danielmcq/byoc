component name="HTML" hint="HTML Helper Class" {
	public string function arrayToHTMLList ( required array input ) {
		var i = 0;
		var output = "";

		output &= Chr(60) & "ul" & Chr(62);
		for ( i = 1; i <= ArrayLen( Arguments.input ); i++ ) {
			output &= Chr(60) & "li" & Chr(62);
			if ( IsSimpleValue( Arguments.input[i] ) ) {
				output &= Arguments.input[i];
			} else if ( IsStruct( Arguments.input[i] ) ) {
				output &= structToHTMLList( Arguments.input[i] );
			} else if ( IsArray( Arguments.input[i] ) ) {
				output &= arrayToHTMLList( Arguments.input[i] );
			} else {
				output &= "[Complex Object]";
			}
			output &= Chr(60) & "/li" & Chr(62);
		}
		output &= Chr(60) & "/ul" & Chr(62);

		return output;
	}


	public string function structToHTMLList ( required struct input ) {
		var key = "";
		var output = "";

		output &= Chr(60) & "ul" & Chr(62);
		for ( key in Arguments.input ) {
			output &= Chr(60) & "li" & Chr(62);
			output &= key & ": ";
			if ( IsSimpleValue( Arguments.input[key] ) ) {
				output &= Arguments.input[key];
			} else if ( IsStruct( Arguments.input[key] ) ) {
				output &= structToHTMLList( Arguments.input[key] );
			} else if ( IsArray( Arguments.input[key] ) ) {
				output &= arrayToHTMLList( Arguments.input[key] );
			} else {
				output &= "[Complex Object]";
			}
			output &= Chr(60) & "/li" & Chr(62);
		}
		output &= Chr(60) & "/ul" & Chr(62);

		return output;
	}
}