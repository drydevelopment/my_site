tinymce.create('tinymce.plugins.ExamplePlugin', {
    createControl: function(n, cm) {
        switch (n) {
            case 'mylistbox':
                var mlb = cm.createListBox('mylistbox', {
                     title : 'Code',
                     onselect : function(v) {
						//tinyMCE.activeEditor.windowManager.alert(tinyMCE.activeEditor.selection.getContent());
						tinyMCE.activeEditor.execCommand('mceInsertContent', false, '<pre class=\'code\'><code class=\'' + v + '\'>' + tinyMCE.activeEditor.selection.getContent() + '</code></pre');
                     }
                });

                // Add some values to the list box
                mlb.add('CSS', 'css');
                mlb.add('JavaScript', 'javascript');
                mlb.add('PHP', 'php');
				mlb.add('Ruby', 'ruby');
				mlb.add('SQL', 'sql');
				mlb.add('XML', 'xml');

                // Return the new listbox instance
                return mlb;
        }

        return null;
    }
});

// Register plugin with a short name
tinymce.PluginManager.add('example', tinymce.plugins.ExamplePlugin);