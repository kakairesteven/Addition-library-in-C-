#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Addition::addition" for configuration ""
set_property(TARGET Addition::addition APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Addition::addition PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libaddition.a"
  )

list(APPEND _cmake_import_check_targets Addition::addition )
list(APPEND _cmake_import_check_files_for_Addition::addition "${_IMPORT_PREFIX}/lib/libaddition.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
