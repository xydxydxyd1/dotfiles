import os

DIR_OF_THIS_SCRIPT = os.path.abspath( os.path.dirname( __file__ ) )

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-x',
        'c++',
        '-std=c++11'
        ]

def IsHeaderFile( filename ):
    extension = os.path.splitext( filename )[ 1 ]
    return extension in [ '.h', '.hxx', '.hpp', '.hh' ]

def FindCorrespondingSourceFile( filename ):
    if IsHeaderFile( filename ):
        basename = os.path.splitext( filename )[ 0 ]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
            if os.path.exists( replacement_file ):
                return replacement_file
    return filename

def Settings( **kwargs ):
    if kwargs[ 'language' ] == 'cfamily':
        # If the file is a header, try to find the corresponding source file and
        # retrieve its flags from the compilation database if using one. This is
        # necessary since compilation databases don't have entries for header files.
        # In addition, use this source file as the translation unit. This makes it
        # possible to jump from a declaration in the header file to its definition
        # in the corresponding source file.
        filename = FindCorrespondingSourceFile( kwargs[ 'filename' ] )

    return {
            'flags': flags,
            'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT,
            'override_filename': filename
            }
