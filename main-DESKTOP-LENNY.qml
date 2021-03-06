import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 1920
    height: 1280

    property int iconWidth: 210
    property int iconHeight: 210
    property int distanceBetweenIcons: 30
    property int increaseValue: 35

    property string previousState

    Image {         // BACKGROUND IMAGE WITH STARS
        id: background
        source: "assets/background.png"
        anchors.fill: parent
    }
    Image {         // ANIMATION IMAGE WHICH SLIDES OVER SCREEN
        id: wisherNextScreen
        source:"assets/wisherScreens.png"
        height: root.height - 120
        width: 30
        x: root.width
        y: -22
    }
    Rectangle {     // STATE MACHINE RECTANGLE
        id:stateMachine
        states: [
            State {     // DEFAULT
                name: "DEFAULT"
                PropertyChanges {
                    target: wisherNextScreen
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
                    target: officeScreen
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
            },
            State {     // SHARED SERVICES
                name:"SHAREDSERVICES"
                PropertyChanges {
                    target: musicScreen
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
            }
        ]
        //        onStateChanged: {
        //            letDefaultScreenDissapear.start()
        //            setHoverEnabledFalse()
        //            wisherScreens.start()
        //            showingProperText.start()
        //        }
    }

    // DEFAULT SCREEN CONTAINS ALL ICONS
    Rectangle {
        id: defaultScreen
        width: root.width - 250
        height: menuBar.y
        x: 250
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
            x: (defaultScreen.x - iconWidth*1.5) + iconWidth + distanceBetweenIcons
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
            x: (defaultScreen.x - iconWidth*1.5) + iconWidth + distanceBetweenIcons
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
                    } else if (defaultScreen.check == false){
                        parent.height = parent.height - increaseValue
                        parent.width = parent.width - increaseValue
                        parent.x += increaseValue/2
                        parent.y += increaseValue/2
                        parent.opacity = 0.8
                        defaultScreen.check = true
                    }
                }
                onClicked: {
                    previousState = stateMachine.state
                    letDefaultScreenDissapear.start()
                    wisherScreens.start()
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
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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
            x: (officeScreen.x - iconWidth*1.5) + 3*iconWidth + distanceBetweenIcons
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
            x: (officeScreen.x - iconWidth*1.5) + 2*iconWidth
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
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // CAR SETTINGS SCREEN
        id: carSettingsScreen
        visible: false
        color: "transparent"
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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
        Image{      // EQUALIZER ICON
            id: equalizerIcon
            opacity: 0.8
            width: iconWidth
            height: iconHeight
            x: (carSettingsScreen.x - iconWidth*1.5) + 3*iconWidth + 2*distanceBetweenIcons
            y: carSettingsScreen.height / 2 + 80
            source: "assets/CAR SETTINGS/equalizerIcon.png"
            MouseArea {                 // highlights the hovered/ current icon
                anchors.fill: parent
                id: equalizerMouse
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
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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
                //                onClicked: {
                //                    previousState = stateMachine.state
                //                    stateMachine.state = "OFFICE"
                //                }
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
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // MUSIC SCREEN
        id: musicScreen
        visible: false
        color: "transparent"
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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
                // onClicked: officePowerPointSlide.visible = true
            }
        }
    }
    Rectangle {     // NAVIGATION SCREEN
        id: navigationScreen
        visible: false
        color: "transparent"
        x: 250
        width: defaultScreen.width
        height: defaultScreen.height
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

    // TEXTES FOR THE CUSTOMER ON THE LEFT HAND SIDE
    Rectangle { //OFFICE
        id: officeText
        x: 70
        y: 210
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "OFFICE"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // CONNECTIVITY
        id: connectivityText
        x: 70
        y: 180
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "CONNECTIVITY"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // MUSIC
        id: musicText
        x: 70
        y: 210
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "MUSIC"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // INTERNET
        id: internetText
        x: 70
        y: 210
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "INTERNET"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // SMARTPHONE
        id: smartphoneText
        x: 70
        y: 180
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "SMARTPHONE"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // SHARED SERVICES
        id: sharedText
        x: 70
        y: 160
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "SHARED SERVICES"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // CAR SETTINGS
        id: carsettingsText
        x: 70
        y: 180
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "CAR SETTINGS"
        }
        transform: Rotation { angle: 90}
    }
    Rectangle { // NAVIGATION
        id: navigationText
        x: 70
        y: 200
        visible: false
        Text {
            font.family: "Century Gothic"
            font.pixelSize: 45
            color: "#ff944d"
            text: "NAVIGATION"
        }
        transform: Rotation { angle: 90}
    }

    Image {         // SEPARATOR BETWEEN BUTTONS AND ICONS
        id: menuBar     // MENU BAR AS SEPARATOR BETWEEN SCREENS AND BUTTONS
        source:"assets/menuBarSeparator.png"
        width: root.width
        height: 20
        y: root.height - 170
    }
    Image {         // BACK BUTTON
        id: backButton
        opacity: 0.9
        source:"assets/backButton.png"
        width: iconWidth/2
        height: iconHeight/2
        x: 300
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
        }
    }
    Image {         // HOME BUTTON
        id: homeButton
        opacity: 0.9
        source:"assets/homeButton.png"
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
    Image {         // AUTONOMOUS BUTTON
        id: autonomousButton
        opacity: 0.9
        source:"assets/autonomousButton.png"
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
        }
    }

    Timer { // TIMER THAT THE TEXT IS DISPLAYED AT THE RIGHT TIME
        id: showingProperText
        interval: 2200
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
    }
    function setProperText() {  // SETS THE TEXT FALSE AND TRUE AGAIN
        console.log("In function")
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

    NumberAnimation {       // ANIMATES THE WISHER OVER THE SCREEN
        id: wisherScreens
        target: wisherNextScreen
        property: "x"
        duration: 2500
        easing.type: Easing.InOutQuad
        from: root.width
        to: 65
    }
    ParallelAnimation{      // ANIMATES THE OPACITY AND X PROPERTY OF THE ICONS
        id: letDefaultScreenDissapear
        NumberAnimation {
            target: defaultScreen
            properties: "x"
            duration: 3000
            easing.type: Easing.InOutQuad
            to: - defaultScreen.width
            from: defaultScreen.x
        }
        NumberAnimation {
            target: defaultScreen
            properties: "opacity"
            duration: 1500
            from: 1
            to: 0.3
        }
    }
    ParallelAnimation{      // ANIMATION LETS THE ICONS APPEAR
        id: letDefaultScreenAppear
        NumberAnimation {
            target: defaultScreen
            properties: "x"
            duration: 1500
            easing.type: Easing.InOutQuad
            from: - defaultScreen.width
            to: defaultScreen.x + 1.2 * defaultScreen.width
        }
        NumberAnimation {
            target: defaultScreen
            properties: "opacity"
            duration: 1500
            from: 0.3
            to: 0.8
        }
    }
}
