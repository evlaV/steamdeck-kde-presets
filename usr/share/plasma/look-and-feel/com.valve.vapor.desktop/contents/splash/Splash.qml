import QtQuick
import QtCore
import org.kde.plasma.lookandfeel

Loader {
    property int stage
    Settings {
        id: settings
        location: StandardPaths.locate(StandardPaths.RuntimeLocation, "plasma-is-deck")
        category: "Device"
        property bool isDeck
        Component.onCompleted: console.log(isDeck)
    }
    source: settings.isDeck ?  "Splash_deck.qml" :  LookAndFeel.fallbackFileUrl("splashmainscript")
    onLoaded: item.stage = Qt.binding(() => stage)
}
