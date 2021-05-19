qt_add_executable(qqc2-demo)
target_sources(qqc2-demo
    PRIVATE
        main.cpp
        qml.qrc
)

target_compile_definitions(qqc2-demo
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(qqc2-demo PRIVATE Qt6::QuickControls2)

# Hide the console window in Visual Studio projects
if(MSVC AND CMAKE_BUILD_TYPE STREQUAL Release)
    set_target_properties(qqc2-demo PROPERTIES LINK_FLAGS "/SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup")
endif()

set_target_properties(qqc2-demo PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

qt_import_qml_plugins(qqc2-demo)
qt_finalize_executable(qqc2-demo)

if(WIN32)
    add_custom_command(TARGET qqc2-demo POST_BUILD COMMAND
        ${CMAKE_PREFIX_PATH}/bin/windeployqt --qmldir "${CMAKE_CURRENT_SOURCE_DIR}" "$<TARGET_FILE:qqc2-demo>"
    )
endif()
