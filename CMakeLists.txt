cmake_minimum_required(VERSION 3.10)

project(Nisse C)

set(my_input "my-input.txt")
set(my_output "my-header.h")
set(compiler "${CMAKE_SOURCE_DIR}/my-gen.sh")

add_custom_command(OUTPUT "${my_output}"
  COMMAND "${compiler}" ARGS "${CMAKE_CURRENT_SOURCE_DIR}/${my_input}" "${my_output}"
  DEPENDS "${my_input}")

add_custom_target(mytarget DEPENDS
  "${my_output}")

add_executable(nisse nisse.c)
target_include_directories(nisse PRIVATE "${CMAKE_BINARY_DIR}")
add_dependencies(nisse mytarget)
