cmake_minimum_required(VERSION 2.6)

# This will install McStas components
project(python-tools-mcdoc C)

# Choose between McStas or McXtrace
option(enable_mcstas   "Choose the McStas flavor" off)
option(enable_mcxtrace "Choose the McXtrace flavor (trumps enable_mcstas)" Off)

# Set module path
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# Set McCode values (from mkdist or defaults)
include(MCUtil)

if (${enable_mcxtrace})
  set(FLAVOR "mcxtrace")
elseif(${enable_mcstas})
  set(FLAVOR "mcstas")
else()
  message(FATAL_ERROR "No flavor specified!\n"
    "Please use either -Denable_mcstas=1 or -Denable_mcxtrace=1")
endif()

message("Enabling ${FLAVOR} flavor")
setupMCCODE("${FLAVOR}")

# Select prefix
if(${enable_mcstas})
  set(P "mc")
else()
  set(P "mx")
endif()

set(TOOLS_NAME "tools/Python/${P}doc/")

if(WINDOWS)
  set(TOOLS_LIB "${lib}/${TOOLS_NAME}")
else()
  set(TOOLS_LIB "${CMAKE_INSTALL_PREFIX}/${FLAVOR}/${MCCODE_VERSION}/${TOOLS_NAME}")
endif()


# Set some extra options for mccode_config
set(CC "${CMAKE_C_COMPILER}")
set(CFLAGS "-g -O2 -lm ${CMAKE_C_FLAGS}")

# CPack configuration
set(CPACK_PACKAGE_NAME          "${FLAVOR}-tools-Python-${P}doc-${MCCODE_VERSION}")
set(CPACK_RESOURCE_FilE_LICENSE "${PROJECT_SOURCE_DIR}/COPYING")
set(CPACK_PACKAGE_CONTACT       "pkwi@fysik.dtu.dk")

set(CPACK_PACKAGE_VERSION       "1.0")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")


# NSIS
set(NSIS_NAME "Python-based mcdoc, ${MCCODE_STRING}")
set(CPACK_NSIS_PACKAGE_NAME "${NSIS_NAME}")
set(CPACK_NSIS_DISPLAY_NAME "${NSIS_NAME}")

# Debian
set(CPACK_DEBIAN_PACKAGE_DEPENDS "${FLAVOR}-${MCCODE_VERSION}, ${FLAVOR}-comps-${MCCODE_VERSION}")

# RPM
set(CPACK_RPM_PACKAGE_REQUIRES
  "${FLAVOR}-${MCCODE_VERSION}, ${FLAVOR}-comps-${MCCODE_VERSION}"
  )


include(CPack)

set(WORK "${PROJECT_BINARY_DIR}/work")


# Configure fallback script
configure_file("${CMAKE_SOURCE_DIR}/mcdoc.in" "${WORK}/${P}doc" @ONLY)


if(WINDOWS)
  set(BINS "${PROJECT_SOURCE_DIR}/mcdoc.py")
else()
  set(BINS "${PROJECT_SOURCE_DIR}/mcdoc.py" "${WORK}/${P}doc")
endif()


if(WINDOWS)
  install(
    FILES ${BINS}
    DESTINATION "${lib}/${TOOLS_NAME}"
    RENAME "${P}doc.py"
    PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
  )
endif()

if(NOT WINDOWS)
  install(
    FILES ${BINS}
    DESTINATION "${FLAVOR}/${MCCODE_VERSION}/${TOOLS_NAME}"
    PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
  )

  # Symlink to main
  add_custom_command(
    OUTPUT "${WORK}/${P}doc"
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${WORK}"
    COMMAND "${CMAKE_COMMAND}" -E remove "${WORK}/${P}doc"
    COMMAND "${CMAKE_COMMAND}" -E create_symlink
    "${TOOLS_LIB}/mcdoc" "${WORK}/${P}doc"
    )

  add_custom_target(
    "CREATE_SYMLINK" ALL DEPENDS "${WORK}/${P}doc"
    )

  install(
    PROGRAMS "${WORK}/${P}doc"
    DESTINATION ${FLAVOR}/${MCCODE_VERSION}/bin
    RENAME "${P}doc"
    )
endif()
