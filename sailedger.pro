# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = sailedger

CONFIG += sailfishapp

SOURCES += src/sailedger.cpp \
    src/jsonstorage.cpp

OTHER_FILES += qml/sailedger.qml \
    qml/cover/CoverPage.qml \
    rpm/sailedger.changes.in \
    rpm/sailedger.spec \
    rpm/sailedger.yaml \
    translations/*.ts \
    sailedger.desktop \
    qml/pages/LedgerView.qml \
    qml/pages/LedgerModel.qml \
    qml/pages/AddItem.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/sailedger-de.ts

HEADERS += \
    src/jsonstorage.hpp

