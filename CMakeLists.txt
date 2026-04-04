cmake_minimum_required(VERSION 3.25.2)

project(lodepng VERSION 1.0.0 LANGUAGES CXX)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_library(lodepng SHARED
    lodepng.cpp
)

set_target_properties(lodepng PROPERTIES
    WINDOWS_EXPORT_ALL_SYMBOLS ON
)

target_include_directories(lodepng
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

add_library(lodepng::lodepng ALIAS lodepng)

install(
    TARGETS lodepng
    EXPORT lodepngTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
    FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/lodepng.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
    EXPORT lodepngTargets
    FILE lodepngTargets.cmake
    NAMESPACE lodepng::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/lodepng
)

configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/lodepngConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/lodepngConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/lodepng
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/lodepngConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/lodepngConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/lodepngConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/lodepng
)
