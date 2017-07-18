import QtQuick 2.6
import QtQuick.Window 2.2

/*
  TODO Halbkreis mit Favoriten um Favoriten Button
 Highlighting was sich durchdreht
 Keine Animation fürs wechseln der Seiten
 Besser Icons --> weniger Overload / Bilder
 Autonom weg
 Schrift an der Seite nach oben für Menüführung
 Menü Bar weiter runter
  */

Window {
    id: root
    visible: true
    width: 1920
    height: 1280

    property int iconWidth: 210
    property int iconHeight: 210
    property int distanceBetweenIcons: 30
    property int increaseValue: 60
    property int moveXAway: 40
    property bool global: true

    property string previousState

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Left) {
                console.log("move left");
                event.accepted = true;
            }
        }
    }

    Image {         // BACKGROUND IMAGE WITH STARS
        id: background
        source: "assets/background.png"
        anchors.fill: parent
    }
    Rectangle {     // STATE MACHINE RECTANGLE
        id:stateMachine
        states: [
            State {     // DEFAULT
                name: "DEFAULT"
                PropertyChanges {
                    target: shoppingScreen
                    visible: false
                    opacity: 0
                }
                PropertyChanges {
                    target: shoppingText
                    visible: false
                }
                PropertyChanges {
                    target: musicText
                    visible: false
                }
                PropertyChanges {
                    target: navigationText
                    visible: false
                }
                PropertyChanges {
                    target: officeText
                    visible: false
                }
                PropertyChanges {
                    target: carsettingsText
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneText
                    visible: false
                }
                PropertyChanges {
                    target: sharedText
                    visible: false
                }
                PropertyChanges {
                    target: internetText
                    visible: false
                }
                PropertyChanges {
                    target: connectivityText
                    visible: false
                }
            },
            State {     // MUSIC
                name:"MUSIC"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: true
                }
            },
            State {     // CONNECTIVITY
                name:"CONNECTIVITY"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: true
                }
            },
            State {     // CAR SETTINGS
                name:"CARSETTINGS"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: true
                }
            },
            State {     // OFFICE
                name:"OFFICE"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: true
                }
            },
            State {     // SMARTPHONE
                name:"SMARTPHONE"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: true
                }
            },
            State {     // SHARED SERVICES
                name:"SHAREDSERVICES"
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: true
                }
            },
            State {     // NAVIGATION
                name:"NAVIGATION"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: true
                }
            },
            State {     // INTERNET
                name:"INTERNET"
                PropertyChanges {
                    target: sharedServicesScreen
                    visible: false
                }
                PropertyChanges {
                    target: officeScreen
                    visible: false
                }
                PropertyChanges {
                    target: smartphoneScreen
                    visible: false
                }
                PropertyChanges {
                    target: carSettingsScreen
                    visible: false
                }
                PropertyChanges {
                    target: connectivityScreen
                    visible: false
                }
                PropertyChanges {
                    target: navigationScreen
                    visible: false
                }
                PropertyChanges {
                    target: musicScreen
                    visible: false
                }
                PropertyChanges {
                    target: internetScreen
                    visible: true
                }
            }
        ]
        //        onStateChanged: {
        //            letDefaultScreenDissapear.start()
        //            setHoverEnabledFalse()
        //            showingProperText.start()
        //        }
    }

    // DEFAULT SCREEN CONTAINS ALL ICONS
    Rectangle {
        id: defaultScreen
        width: root.width - defaultScreen.x
        height: menuBar.y
        x: 220
        color:"transparent"
        property bool check: true
        Image{      // OFFICE ICON
            id:officeIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5)
            y: defaultScreen.height / 2 - iconHeight/2
            source: "assets/OFFICE/officeIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: officeMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }

                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    showingProperText.start()
                    stateMachine.state = "OFFICE"
                }
            }
        }
        Image{      // CONNECTIVITY ICON
            id: connectivityIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + iconWidth + 0.8 * distanceBetweenIcons
            y: defaultScreen.height / 2 - iconHeight - 30
            source: "assets/CONNECTIVITY/ConnectivityIcon.png"
            MouseArea {
                anchors.fill: parent
                id: connectivityMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    stateMachine.state = "CONNECTIVITY"
                    showingProperText.start()
                }
            }
        }
        Image{      // MUSIC ICON
            id: musicIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + 2*iconWidth + 2*distanceBetweenIcons
            y: defaultScreen.height / 2 - 1.4*iconHeight
            source: "assets/MUSIC/musicIcon.png"
            MouseArea {
                anchors.fill: parent
                id: musicMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    stateMachine.state = "MUSIC"
                    showingProperText.start()
                }
            }
        }
        Image{      // INTERNET  ICON
            id: internetIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + 3*iconWidth + 3*distanceBetweenIcons
            y: defaultScreen.height / 2 - iconHeight - 30
            source: "assets/INTERNET/internetIcon.png"
            MouseArea {
                anchors.fill: parent
                id: internetMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    stateMachine.state = "INTERNET"
                    showingProperText.start()
                }
            }
        }
        Image{      // SMARTPHONE ICON like Mirror Link
            id: smartphoneIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + 4*iconWidth + 4*distanceBetweenIcons
            y: defaultScreen.height / 2 - iconHeight/2
            source: "assets/smartphoneIcon.png"
            MouseArea {
                anchors.fill: parent
                id: smartphoneMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    stateMachine.state = "SMARTPHONE"
                    showingProperText.start()
                }
            }
        }
        Image{      // SHARED SERVICES  ICON
            id: sharedServicesIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + 3*iconWidth + 3*distanceBetweenIcons
            y: defaultScreen.height / 2 + iconHeight/4.5
            source: "assets/SHARING/sharedServicesIcon.png"
            MouseArea {
                anchors.fill: parent
                id: sharedServicesMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height-= moveXAway
                            connectivityIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    stateMachine.state = "SHAREDSERVICES"
                    showingProperText.start()
                }
            }
        }
        Image{      // CAR SETTINGS  ICON
            id: carSettingsIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + iconWidth + 0.8 * distanceBetweenIcons
            y: defaultScreen.height / 2 + iconHeight/4.5
            source: "assets/CAR SETTINGS/carsettingsIcon.png"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                id: carSettingsMouse
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            navigationIcon.width -= moveXAway
                            navigationIcon.height -= moveXAway
                            navigationIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            navigationIcon.width += moveXAway
                            navigationIcon.height += moveXAway
                            navigationIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    stateMachine.state = "CARSETTINGS"
                    showingProperText.start()
                }
            }
        }
        Image{      // NAVIGATION ICON
            id: navigationIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (defaultScreen.x - iconWidth*1.5) + 2*iconWidth + 2*distanceBetweenIcons
            y: defaultScreen.height / 2 + iconHeight / 1.8
            source: "assets/NAVIGATION/navigationIcon.png"
            MouseArea {
                anchors.fill: parent
                id: navigationMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(defaultScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        defaultScreen.check = false
                        if(global){
                            officeIcon.width -= moveXAway
                            officeIcon.height -= moveXAway
                            officeIcon.x += moveXAway/2

                            musicIcon.width -= moveXAway
                            musicIcon.height -= moveXAway
                            musicIcon.x += moveXAway/2

                            internetIcon.width -= moveXAway
                            internetIcon.height -= moveXAway
                            internetIcon.x += moveXAway/2

                            smartphoneIcon.width -= moveXAway
                            smartphoneIcon.height -= moveXAway
                            smartphoneIcon.x += moveXAway/2

                            sharedServicesIcon.width -= moveXAway
                            sharedServicesIcon.height-= moveXAway
                            sharedServicesIcon.x += moveXAway/2

                            connectivityIcon.width -= moveXAway
                            connectivityIcon.height -= moveXAway
                            connectivityIcon.x += moveXAway/2

                            carSettingsIcon.width -= moveXAway
                            carSettingsIcon.height -= moveXAway
                            carSettingsIcon.x += moveXAway/2
                        }
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                        if(global){
                            connectivityIcon.width += moveXAway
                            connectivityIcon.height += moveXAway
                            connectivityIcon.x -= moveXAway/2

                            musicIcon.width += moveXAway
                            musicIcon.height += moveXAway
                            musicIcon.x -= moveXAway/2

                            internetIcon.width += moveXAway
                            internetIcon.height += moveXAway
                            internetIcon.x -= moveXAway/2

                            smartphoneIcon.width += moveXAway
                            smartphoneIcon.height += moveXAway
                            smartphoneIcon.x -= moveXAway/2

                            sharedServicesIcon.width += moveXAway
                            sharedServicesIcon.height += moveXAway
                            sharedServicesIcon.x -= moveXAway/2

                            officeIcon.width += moveXAway
                            officeIcon.height += moveXAway
                            officeIcon.x -= moveXAway/2

                            carSettingsIcon.width += moveXAway
                            carSettingsIcon.height += moveXAway
                            carSettingsIcon.x -= moveXAway/2
                        }
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()

                    stateMachine.state = "NAVIGATION"
                    showingProperText.start()
                }
            }
        }
    }

    // SCREENS FOR EVERY ICON
    Rectangle {     // OFFICE SCREEN
        id: officeScreen
        visible: false
        color: "transparent"
        x: defaultScreen.x
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // BANKING ICON
            id:bankingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (officeScreen.x - iconWidth*1.5) + iconWidth
            y: officeScreen.height / 2 - iconHeight/2
            source: "assets/OFFICE/bankingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: bankingMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        officeScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // EMAIL ICON
            id:emailIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (officeScreen.x - iconWidth*1.5) + 2.5*iconWidth + distanceBetweenIcons
            y: officeScreen.height / 2 - 1.25*iconHeight
            source: "assets/OFFICE/emailIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: emailMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        officeScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // MS OFFICE ICON
            id:msOfficeIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (officeScreen.x - iconWidth*1.5) + 4*iconWidth + 2*distanceBetweenIcons
            y: officeScreen.height / 2 - iconHeight/2
            source: "assets/OFFICE/msOfficeIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: msOfficeMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        officeScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // MULTIPLE DESKTOPS ICON
            id:desktopsIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (officeScreen.x - iconWidth*1.5) + 3*iconWidth + 1.5*distanceBetweenIcons
            y: officeScreen.height / 2 + 100
            source: "assets/OFFICE/expandDesktopIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: desktopsMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        officeScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // NEWS ICON
            id:newsIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (officeScreen.x - iconWidth*1.5) + 2*iconWidth + 0.5* distanceBetweenIcons
            y: officeScreen.height / 2 + 100
            source: "assets/OFFICE/newsIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: newsMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        officeScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{     // INFO BUTTON
            id: infoButton
            opacity: 0.9
            source:"assets/infoIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: officeScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(officeScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        officeScreen.check = false
                    } else if (officeScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        officeScreen.check = true
                    }
                }
                onClicked: {
                    aRSlideStreet.visible = true
                }
            }
        }
        Image {
            id: aRSlideStreet
            source: "assets/OFFICE/AugmentedReality.PNG"
            width: defaultScreen.width + 25
            height: defaultScreen.height
            x: -70
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    aRSlideStreet.visible = false
                    aRSlideOffice.visible = true
                }
            }
        }
        Image {
            id: aRSlideOffice
            source: "assets/OFFICE/arOffice.PNG"
            width: aRSlideStreet.width
            height: aRSlideStreet.height
            x: aRSlideStreet.x
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    aRSlideOffice.visible = false
                    rearSeatEntertainment.visible = true
                }
            }
        }
        Image {
            id: rearSeatEntertainment
            source: "assets/OFFICE/rearSeat.PNG"
            width: aRSlideStreet.width
            height: aRSlideStreet.height
            x: aRSlideStreet.x
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rearSeatEntertainment.visible = false
                    aRSlideOffice.visible = false
                    aRSlideStreet.visible = false
                }
            }
        }
    }
    Rectangle {     // CAR SETTINGS SCREEN
        id: carSettingsScreen
        visible: false
        color: "transparent"
        x: defaultScreen.x
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // AMG ICON
            id:amgIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + iconWidth
            y: carSettingsScreen.height / 2 - iconHeight/2
            source: "assets/CAR SETTINGS/amgModeIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: amgMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // WIFI ICON
            id:wifiIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: carSettingsScreen.height / 2 - 1.25*iconHeight
            source: "assets/CAR SETTINGS/wifiIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: wifiMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // DISPLAY SETTINGS ICON
            id: displaySettingsIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 3*iconWidth + 2*distanceBetweenIcons
            y: carSettingsScreen.height / 2 - 1.25*iconHeight
            source: "assets/CAR SETTINGS/DISPLAYsETTINGSiCON.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: displaySettingsMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // DRIVETRAIN ICON
            id:drivetrainIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 4*iconWidth + 3*distanceBetweenIcons
            y: carSettingsScreen.height / 2 - iconHeight/2
            source: "assets/CAR SETTINGS/drivetrainIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: drivetrainMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // PERSONALIZATION ICON
            id: personalizationIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 3*iconWidth + 2*distanceBetweenIcons
            y: carSettingsScreen.height / 2 + 80
            source: "assets/CAR SETTINGS/personalizationIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: personalizationMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // MULTIPLE DESKTOPS ICON
            id:expandDesktopIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: carSettingsScreen.height / 2 + 80
            source: "assets/CAR SETTINGS/expandDesktopIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: expandDesktopMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        carSettingsScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{     // INFO BUTTON
            opacity: 0.9
            source:"assets/infoIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: carSettingsScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(carSettingsScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        carSettingsScreen.check = false
                    } else if (carSettingsScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        carSettingsScreen.check = true
                    }
                }
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // CONNECTIVITY SCREEN
        id: connectivityScreen
        visible: false
        color: "transparent"
        x: defaultScreen.x
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // CLOUD ICON
            id: cloudIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5)
            y: connectivityScreen.height / 2 - iconHeight/2
            source: "assets/CONNECTIVITY/cloudIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: cloudMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // HOME ASSISTANT ICON
            id:homeAssistantIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + iconWidth + distanceBetweenIcons
            y: connectivityScreen.height / 2 - 1.1*iconHeight
            source: "assets/CONNECTIVITY/homeAssistantIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: homeAssistantMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // WEARABLES ICON
            id: wearablesIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + 2*iconWidth + 2*distanceBetweenIcons
            y: connectivityScreen.height / 2  - 1.6*iconHeight
            source: "assets/CONNECTIVITY/wearablesIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: wearablesMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // SHOPPING ICON
            id: shoppingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + 3*iconWidth + 3*distanceBetweenIcons
            y: connectivityScreen.height / 2 - 1.1*iconHeight
            source: "assets/CONNECTIVITY/shoppingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: shoppingMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    connectivityScreen.visible = false
                    shoppingScreen.visible = true // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    shoppingText.visible = true
                }
            }
        }
        Image{      // SOCIAL MEDIA ICON
            id: socialMediaIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + 4*iconWidth + 4*distanceBetweenIcons
            y: connectivityScreen.height / 2 - iconHeight/2
            source: "assets/CONNECTIVITY/socialMediaIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: socialMediaMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // SOCIAL REVIEW ICON
            id: socialReviewIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + 3*iconWidth + 3*distanceBetweenIcons
            y: connectivityScreen.height / 2 + 50
            source: "assets/CONNECTIVITY/SOCIALrEVIEWiCON.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: socialReviewMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // VIRTUAL REALITY ICON
            id:vrIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + 2*iconWidth + 2*distanceBetweenIcons
            y: connectivityScreen.height / 2 + 110
            source: "assets/CONNECTIVITY/vrIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: vrMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // WEATHER ICON
            id: weatherIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (connectivityScreen.x - iconWidth*1.5) + iconWidth + distanceBetweenIcons
            y: connectivityScreen.height / 2 + 50
            source: "assets/CONNECTIVITY/waetheriCON.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: weatherMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        connectivityScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{     // INFO BUTTON
            opacity: 0.9
            source:"assets/infoIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: connectivityScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(connectivityScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        connectivityScreen.check = false
                    } else if (connectivityScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        connectivityScreen.check = true
                    }
                }
                onClicked: {
                    wearablesPic.visible = true
                }
            }
        }
        Image {
            id: wearablesPic
            source: "assets/CONNECTIVITY/wearablesPic.JPG"
            width: defaultScreen.width + 25
            height: defaultScreen.height
            x: -70
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    wearablesPic.visible = false
                    car2XSlide.visible = true
                }
            }
        }
        Image {
            id: car2XSlide
            source: "assets/CONNECTIVITY/car2X.JPG"
            width: defaultScreen.width + 25
            height: defaultScreen.height
            x: -70
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    car2XSlide.visible = false
                    smartHomeSlide.visible = true
                }
            }
        }
        Image {
            id: smartHomeSlide
            source: "assets/CONNECTIVITY/smartHome.PNG"
            width: car2XSlide.width
            height: car2XSlide.height
            x: car2XSlide.x
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    cloudServicesSlide.visible = true
                    smartHomeSlide.visible = false
                }
            }
        }
        Image {
            id: cloudServicesSlide
            source: "assets/CONNECTIVITY/cloudServices.PNG"
            width: car2XSlide.width
            height: car2XSlide.height
            x: car2XSlide.x
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    car2XSlide.visible = false
                    cloudServicesSlide.visible = false
                    smartHomeSlide.visible = false
                }
            }
        }
    }
    Rectangle {     // MUSIC SCREEN
        id: musicScreen
        visible: false
        color: "transparent"
        x: defaultScreen.x
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // EQUALIZER ICON
            id: equalizerIcon2
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (musicScreen.x - iconWidth*1.5) + iconWidth
            y: musicScreen.height / 2 - iconHeight/2
            source: "assets/MUSIC/equalizerIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: equalizerMouse2
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        musicScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // INTERNET RADIO ICON
            id: internetRadioIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (musicScreen.x - iconWidth*1.5) + 2.5*iconWidth + distanceBetweenIcons
            y: musicScreen.height / 2 - 1.25*iconHeight
            source: "assets/MUSIC/internetRadioIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: internetRadioMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        musicScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // RADIO ICON
            id:radioIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (musicScreen.x - iconWidth*1.5) + 4*iconWidth + 2*distanceBetweenIcons
            y: musicScreen.height / 2 - iconHeight/2
            source: "assets/MUSIC/radioIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: radioMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        musicScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // SPOTIFY ICON
            id:spotifyIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (musicScreen.x - iconWidth*1.5) + 3*iconWidth + distanceBetweenIcons
            y: musicScreen.height / 2 + 100
            source: "assets/MUSIC/spotifyIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: spotifyMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        musicScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // STREAMING ICON
            id:pandoraIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (musicScreen.x - iconWidth*1.5) + 2*iconWidth
            y: musicScreen.height / 2 + 100
            source: "assets/MUSIC/streamingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: pandoraMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        musicScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{     // INFO BUTTON
            opacity: 0.9
            source:"assets/infoIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: musicScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(musicScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        musicScreen.check = false
                    } else if (musicScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        musicScreen.check = true
                    }
                }
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // SHARING SCREEN
        id: sharedServicesScreen
        visible: false
        color: "transparent"
        x: defaultScreen.x
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // FOOD ICON
            id: foodIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (sharedServicesScreen.x - iconWidth*1.5) + iconWidth
            y: sharedServicesScreen.height / 2 - iconHeight/2
            source: "assets/SHARING/foodSharingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: foodMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(sharedServicesScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        sharedServicesScreen.check = false
                    } else if (sharedServicesScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        sharedServicesScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // HOUSE SHARING ICON
            id: houseSharingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (sharedServicesScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: sharedServicesScreen.height / 2 - 1.25*iconHeight
            source: "assets/SHARING/houseSharingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: houseSharingMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(sharedServicesScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        sharedServicesScreen.check = false
                    } else if (sharedServicesScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        sharedServicesScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // MOOVEL ICON
            id:moovelIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (sharedServicesScreen.x - iconWidth*1.5) + 3*iconWidth + 2*distanceBetweenIcons
            y: sharedServicesScreen.height / 2 - iconHeight/2
            source: "assets/SHARING/moovelIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: moovelMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(sharedServicesScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        sharedServicesScreen.check = false
                    } else if (sharedServicesScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        sharedServicesScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // RIDE SHARING ICON
            id:rideSharingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (sharedServicesScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: sharedServicesScreen.height / 2 + 100
            source: "assets/SHARING/rideSharingIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: rideSharingMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(sharedServicesScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        sharedServicesScreen.check = false
                    } else if (sharedServicesScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        sharedServicesScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{     // INFO BUTTON
            opacity: 0.9
            source:"assets/infoIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: sharedServicesScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(sharedServicesScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        sharedServicesScreen.check = false
                    } else if (sharedServicesScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        sharedServicesScreen.check = true
                    }
                }
                onClicked: {
                    sharingStatement.visible = true
                }
            }
        }
        Image {
            id: sharingStatement
            source: "assets/SHARING/SharingStatement.PNG"
            width: defaultScreen.width + 25
            height: defaultScreen.height
            x: -70
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sharingFacts.visible = true
                    sharingStatement.visible = false
                }
            }
        }
        Image {
            id: sharingFacts
            source: "assets/SHARING/sharingFacts.jpg"
            width: defaultScreen.width - 270
            height: defaultScreen.height
            x: 50
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sharingFacts.visible = false
                    sharingStatement.visible = false
                }
            }
        }

    }
    Rectangle {     // NAVIGATION SCREEN
        id: navigationScreen
        visible: false
        color: "transparent"
        x: 160
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // MAP PICTURE
            id: mapPicture
            width: navigationScreen.width
            height: navigationScreen.height
            source: "assets/NAVIGATION/3DMap.jpg"
        }
        Image{     // PARKING BUTTON
            opacity: 0.9
            source:"assets/NAVIGATION/PARKINGiCON.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: navigationScreen.width - infoButton.width - 25
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(navigationScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        navigationScreen.check = false
                    } else if (navigationScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        navigationScreen.check = true
                    }
                }
                // onClicked: officePowerPointSlide.visible = true
            }
        }
        Image{     // CHARGING BUTTON
            opacity: 0.9
            source:"assets/NAVIGATION/chargingIcon.png"
            width: iconWidth/2.5
            height: iconHeight/2.5
            x: navigationScreen.width - 2*infoButton.width - 35
            y: 25
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if(navigationScreen.check == true){
                        parent.height = parent.height + increaseValue/2
                        parent.width = parent.width + increaseValue/2
                        parent.x -= increaseValue/5
                        parent.y -= increaseValue/5
                        parent.opacity = 1
                        navigationScreen.check = false
                    } else if (navigationScreen.check == false){
                        parent.height = parent.height - increaseValue/2
                        parent.width = parent.width - increaseValue/2
                        parent.x += increaseValue/5
                        parent.y += increaseValue/5
                        parent.opacity = 0.9
                        navigationScreen.check = true
                    }
                }
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // INTERNET SCREEN
        id: internetScreen
        visible: false
        color: "transparent"
        x: 135
        width: root.width - defaultScreen.x
        height: menuBar.y
        Image{      // INTERNET PICTURE
            id: internetPicture
            width: internetScreen.width
            height: internetScreen.height
            source: "assets/INTERNET/internetScreen.PNG"
        }
    }
    Rectangle {     // SMARTPHONE SCREEN
        id: smartphoneScreen
        visible: false
        color: "transparent"
        x: 245
        y: 5
        width: root.width - defaultScreen.x - 50
        height: menuBar.y - 20
        Image{      // MIRROR LINK PICTURE
            id: smartphonePicture
            anchors.fill: parent
            source: "assets/mirrorLink.jpg"
        }
    }
    //SUBSCREENS
    Rectangle {     // Shopping SCREEN
        id: shoppingScreen
        visible: false
        color: "transparent"
        x: 250
        width: root.width - defaultScreen.x
        height: menuBar.y
        property bool check: true
        Image{      // GROCERY ICON
            id: groceryShoppingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (shoppingScreen.x - iconWidth*1.5) + iconWidth
            y: shoppingScreen.height / 2 - iconHeight/2
            source: "assets/CONNECTIVITY/GroceryIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: groceryMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(shoppingScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        shoppingScreen.check = false
                    } else if (shoppingScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        shoppingScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // CLOTHES ICON
            id: clothesShoppingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (shoppingScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: shoppingScreen.height / 2 - 1.25*iconHeight
            source: "assets/CONNECTIVITY/clothesIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: clothesMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(shoppingScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        shoppingScreen.check = false
                    } else if (shoppingScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        shoppingScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // CAR PARTS ICON
            id: carpartsShoppingIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (shoppingScreen.x - iconWidth*1.5) + 3*iconWidth + 2*distanceBetweenIcons
            y: shoppingScreen.height / 2 - iconHeight/2
            source: "assets/CONNECTIVITY/carPartsIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: carpartsMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(shoppingScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        shoppingScreen.check = false
                    } else if (shoppingScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        shoppingScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
        Image{      // AMAZON ICON
            id: amazonIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (shoppingScreen.x - iconWidth*1.5) + 2*iconWidth + distanceBetweenIcons
            y: shoppingScreen.height / 2 + 100
            source: "assets/CONNECTIVITY/AMAZONiCON.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: amazonMouse
                hoverEnabled: true
                onHoveredChanged: {
                    if(shoppingScreen.check == true){
                        parent.height = parent.height + increaseValue
                        parent.width = parent.width + increaseValue
                        parent.x -= increaseValue/2
                        parent.y -= increaseValue/2
                        parent.opacity = 1
                        shoppingScreen.check = false
                    } else if (shoppingScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        shoppingScreen.check = true
                    }
                }
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
            }
        }
    }

    // TEXTES FOR THE CUSTOMER ON THE LEFT HAND SIDE
    Rectangle { //OFFICE
        id: officeText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "OFFICE"
        }
    }
    Rectangle { // CONNECTIVITY
        id: connectivityText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "CONNECTIVITY"
        }
    }
    Rectangle { // MUSIC
        id: musicText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "MUSIC"
        }
    }
    Rectangle { // INTERNET
        id: internetText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "INTERNET"
        }
    }
    Rectangle { // SMARTPHONE
        id: smartphoneText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "SMARTPHONE"
        }
    }
    Rectangle { // SHARED SERVICES
        id: sharedText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "SHARED SERVICES"
        }
    }
    Rectangle { // CAR SETTINGS
        id: carsettingsText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "CAR SETTINGS"
        }
    }
    Rectangle { // NAVIGATION
        id: navigationText
        x: 70
        y: 10
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "NAVIGATION"
        }
    }
    Rectangle { // SHOPPING
        id: shoppingText
        x: 70
        y: 100
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "SHOPPING"
        }
    }

    Image {         // SEPARATOR BETWEEN BUTTONS AND ICONS
        id: menuBar     // MENU BAR AS SEPARATOR BETWEEN SCREENS AND BUTTONS
        source:"assets/menuBarSeparator.png"
        width: root.width
        height: 20
        y: root.height/1.2
    }
    Image {         // BACK BUTTON
        id: backButton
        opacity: 0.9
        source:"assets/backButton.png"
        width: iconWidth/2
        height: iconHeight/2
        x: 500
        y: menuBar.y + 40
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: {
                if(defaultScreen.check == true){
                    parent.height = parent.height + increaseValue/2
                    parent.width = parent.width + increaseValue/2
                    parent.x -= increaseValue/4
                    parent.y -= increaseValue/4
                    parent.opacity = 1
                    defaultScreen.check = false
                } else if (defaultScreen.check == false){
                    parent.height = parent.height - increaseValue/2
                    parent.width = parent.width - increaseValue/2
                    parent.x += increaseValue/4
                    parent.y += increaseValue/4
                    parent.opacity = 0.9
                    defaultScreen.check = true
                }
            }
            onClicked: stateMachine.state = previousState
        }
    }
    Image {         // FAVORITES BUTTON
        id: favoritesButton
        opacity: 0.9
        source:"assets/favoritesIcon.png"
        width: iconWidth/2
        height: iconHeight/2
        x: 700
        y: menuBar.y + 40
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: {
                if(defaultScreen.check == true){
                    parent.height = parent.height + increaseValue/2
                    parent.width = parent.width + increaseValue/2
                    parent.x -= increaseValue/4
                    parent.y -= increaseValue/4
                    parent.opacity = 1
                    defaultScreen.check = false
                    rounded1.visible = true
                    rounded2.visible = true
                    rounded3.visible = true
                } else if (defaultScreen.check == false){
                    parent.height = parent.height - increaseValue/2
                    parent.width = parent.width - increaseValue/2
                    parent.x += increaseValue/4
                    parent.y += increaseValue/4
                    parent.opacity = 0.9
                    defaultScreen.check = true
                    rounded1.visible = false
                    rounded2.visible = false
                    rounded3.visible = false
                }
            }
        }
    }
    Rectangle{
        id: rounded1
        width:iconWidth/3
        height: iconHeight/3
        radius: 50
        x: 635
        y: menuBar.y
        visible: false
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "assets/MUSIC/spotifyIcon.png"
        }
    }
    Rectangle{
        id: rounded2
        width:iconWidth/3
        height: iconHeight/3
        radius: 50
        x: 630 + rounded1.width + 20
        y: menuBar.y - 40
        visible: false
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "assets/CAR SETTINGS/amgModeIcon.png"
        }
    }
    Rectangle{
        id: rounded3
        width:iconWidth/3
        height: iconHeight/3
        radius: 50
        x: 630 + 2*rounded1.width + 40
        y: menuBar.y
        visible: false
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "assets/OFFICE/emailIcon.png"
        }
    }

    Image {         // HOME BUTTON
        id: homeButton
        opacity: 0.9
        source:"assets/homeButton.png"
        width: iconWidth/2
        height: iconHeight/2
        x: 900
        y: menuBar.y + 40
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: {
                if(defaultScreen.check == true){
                    parent.height = parent.height + increaseValue/2
                    parent.width = parent.width + increaseValue/2
                    parent.x -= increaseValue/4
                    parent.y -= increaseValue/4
                    parent.opacity = 1
                    defaultScreen.check = false
                } else if (defaultScreen.check == false){
                    parent.height = parent.height - increaseValue/2
                    parent.width = parent.width - increaseValue/2
                    parent.x += increaseValue/4
                    parent.y += increaseValue/4
                    parent.opacity = 0.9
                    defaultScreen.check = true
                }
            }
            onClicked: {
                previousState = stateMachine.state
                setProperIcons()
                letDefaultScreenAppear.start()
                stateMachine.state = "DEFAULT"
            }
        }
    }

    Timer { // TIMER THAT THE TEXT IS DISPLAYED AT THE RIGHT TIME
        id: showingProperText
        interval: 10
        onTriggered: {
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
            showingProperText2.start()
        }
    }
    Timer { // TIMER THAT THE TEXT IS DISPLAYED AT THE RIGHT TIME
        id: showingProperText2
        interval: 200
        onTriggered: setProperText()
    }
    function setProperIcons() { // SETS THE ICONS FALSE AND TRUE AGAIN THAT THEY ARE VISIBLE
        console.log("Icon function called")
        musicIcon.opacity = 0
        musicIcon.visible = false
        navigationIcon.opacity = 0
        navigationIcon.visible = false
        smartphoneIcon.opacity = 0
        smartphoneIcon.visible = false
        officeIcon.opacity = 0
        officeIcon.visible = false
        internetIcon.opacity = 0
        internetIcon.visible = false
        carSettingsIcon.opacity = 0
        carSettingsIcon.visible = false
        connectivityIcon.opacity = 0
        connectivityIcon.visible = false
        sharedServicesIcon.opacity = 0
        sharedServicesIcon.visible = false

        musicIcon.opacity = 1
        musicIcon.visible = true
        navigationIcon.opacity = 1
        navigationIcon.visible = true
        smartphoneIcon.opacity = 1
        smartphoneIcon.visible = true
        officeIcon.opacity = 1
        officeIcon.visible = true
        internetIcon.opacity = 1
        internetIcon.visible = true
        carSettingsIcon.opacity = 1
        carSettingsIcon.visible = true
        connectivityIcon.opacity = 1
        connectivityIcon.visible = true
        sharedServicesIcon.opacity = 1
        sharedServicesIcon.visible = true

        shoppingScreen.visible = false
        shoppingScreen.opacity = 0
    }
    function setProperText() {  // SETS THE TEXT FALSE AND TRUE AGAIN
        if(stateMachine.state == "MUSIC"){
            musicText.visible = true
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "CONNECTIVITY"){
            musicText.visible = false
            connectivityText.visible = true
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "INTERNET"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = true
        }  else if(stateMachine.state == "OFFICE"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = true
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "NAVIGATION"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = true
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "SHAREDSERVICES"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = true
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "CARSETTINGS"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = true
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }  else if(stateMachine.state == "SMARTPHONE"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = true
            internetText.visible = false
        }  else if(stateMachine.state == "DEFAULT"){
            musicText.visible = false
            connectivityText.visible = false
            officeText.visible = false
            navigationText.visible = false
            carsettingsText.visible = false
            sharedText.visible = false
            smartphoneText.visible = false
            internetText.visible = false
        }
    }

    function setHoverEnabledFalse() { // DISABLE HOVERING THAT THE ICONS ALIGN PROPERLY AFTERWARDS
        if(stateMachine.state != "DEFAULT"){
            officeMouse.hoverEnabled = false
            connectivityMouse.hoverEnabled = false
            internetMouse.hoverEnabled = false
            sharedServicesMouse.hoverEnabled = false
            carSettingsMouse.hoverEnabled = false
            navigationMouse.hoverEnabled = false
            smartphoneMouse.hoverEnabled = false
            musicMouse.hoverEnabled = false
        } else {
            officeMouse.hoverEnabled = true
            connectivityMouse.hoverEnabled = true
            internetMouse.hoverEnabled = true
            sharedServicesMouse.hoverEnabled = true
            carSettingsMouse.hoverEnabled = true
            navigationMouse.hoverEnabled = true
            smartphoneMouse.hoverEnabled = true
            musicMouse.hoverEnabled = true
        }
    }



   NumberAnimation { // ANIMATES THE OPACITY AND X PROPERTY OF THE ICONS
            id: letDefaultScreenDissapear
            target: defaultScreen
            properties: "opacity"
            duration: 250
            from: 1
            to: 0
        }
   NumberAnimation {  // ANIMATION LETS THE ICONS APPEAR
            id: letDefaultScreenAppear
            target: defaultScreen
            properties: "opacity"
            duration: 250
            from: 0
            to: 0.9
        }

}
