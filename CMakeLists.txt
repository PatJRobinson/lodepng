cmake_minimum_required(VERSION 3.25.2)

project(lodepng)

add_library(${PROJECT_NAME} lodepng.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})