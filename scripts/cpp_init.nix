{ pkgs }:

pkgs.writeShellApplication {
  name = "cpp-init";
  runtimeInputs = [ pkgs.coreutils ];
  text = ''
    if [ -z "''${1:-}" ]; then
      echo "Usage: cpp-init <project-name>"
      exit 1
    fi

    PROJECT="$1"

    if [ -d "$PROJECT" ]; then
      echo "Error: directory '$PROJECT' already exists"
      exit 1
    fi

    mkdir -p "$PROJECT"/{src,include,libs,build,tests,docs}

    cat > "$PROJECT/CMakeLists.txt" << EOF
cmake_minimum_required(VERSION 3.20)
project($PROJECT LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Output binaries to build/
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \''${CMAKE_BINARY_DIR}/bin)

include_directories(include)

# Collect source files
file(GLOB_RECURSE SOURCES src/*.cpp)

add_executable(\''${PROJECT_NAME} \''${SOURCES})

# Tests
enable_testing()
add_subdirectory(tests)
EOF

    cat > "$PROJECT/tests/CMakeLists.txt" << EOF
# Add test executables here, e.g.:
# file(GLOB_RECURSE TEST_SOURCES *.cpp)
# add_executable(tests \''${TEST_SOURCES})
# add_test(NAME tests COMMAND tests)
EOF

    cat > "$PROJECT/src/main.cpp" << EOF
#include <iostream>

int main() {
    std::cout << "Hello from $PROJECT!" << std::endl;
    return 0;
}
EOF

    echo "Created project '$PROJECT' with structure:"
    find "$PROJECT" -not -path "$PROJECT/build/*" | sort
  '';
}
