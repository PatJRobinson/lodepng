cmake_minimum_required(VERSION 3.25.2)

project(lodepng)

# 1) Build a real shared library (DLL + .lib)
add_library(${PROJECT_NAME} SHARED
    lodepng.cpp
)

# 2) Export *all* public symbols automatically (no __declspec needed)
#    (alternative: write your own DLLEXPORT/DLLIMPORT macros)
set_target_properties(${PROJECT_NAME}
    PROPERTIES
      WINDOWS_EXPORT_ALL_SYMBOLS ON
      # (optional) where the .lib ends up
    #   ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
    #   RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

# 3) Include headers for consumers
target_include_directories(${PROJECT_NAME}
    PUBLIC
      $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
      $<INSTALL_INTERFACE:include>
)
