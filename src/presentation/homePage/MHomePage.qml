import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import Librum.extensions.sidebar
import CustomComponents
import Librum.style
import Librum.icons
import "toolbar"
import "indexbar"


Page
{
    id: root
    property bool empty : true
    
    horizontalPadding: 64
    rightPadding: 70
    background: Rectangle
    {
        anchors.fill: parent
        color: Style.pagesBackground
    }
    
    ListModel
    {
        id: model
        
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
        ListElement { spaceHolder: "" }
    }
    
    
    ColumnLayout
    {
        id: contentLayout
        
        width: parent.width
        spacing: 0
        
        
        RowLayout
        {
            id: headerRow
            Layout.fillWidth: true
            spacing: 0
            
            MTitle
            {
                id: title
                Layout.topMargin: 44
                titleText: "Home"
                descriptionText: "You have 10 books"
            }
            
            Item { Layout.fillWidth: true }
            
            MButton
            {
                id: addBooksButton
                Layout.preferredWidth: 140
                Layout.preferredHeight: 40
                Layout.topMargin: 22
                Layout.alignment: Qt.AlignBottom
                borderWidth: 0
                backgroundColor: Style.colorBasePurple
                text: "Add books"
                fontColor: Style.colorBackground
                fontWeight: Font.Bold
                fontSize: 13
                imagePath: Icons.plusWhite
                
                onClicked: fileDialog.open()
            }
        }
        
        MToolbar
        {
            id: toolbar
            visible: !root.empty
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            Layout.topMargin: 45
            z: 2
        }
        
        Pane
        {
            id: bookGridContainer
            Layout.fillWidth: true
            Layout.preferredHeight: 695
            Layout.topMargin: 30
            visible: !root.empty
            padding: 0
            background: Rectangle
            {
                color: "transparent"
            }
            
            
            GridView
            {
                id: bookGrid
                property int bookWidth: 190
                property int bookHeight: 300
                property int horizontalSpacing: 64
                property int verticalSpacing: 48
                
                anchors.fill: parent
                cellWidth: bookWidth + horizontalSpacing
                cellHeight: bookHeight + verticalSpacing
                rightMargin: -horizontalSpacing
                interactive: true
                boundsBehavior: Flickable.StopAtBounds
                flickDeceleration: 10000
                clip: true
                
                model: indexBar.selectedAmountOfBooks
                delegate: MBook
                { 
                    onClicked: loadPage(readingPage)
                }
            }
        }
        
        MEmptyScreenContent
        {
            id: emptyScreenContent
            visible: root.empty
            Layout.fillWidth: true
            Layout.topMargin: 32
            
            onClicked: root.empty = false
        }
        
        MIndexBar
        {
            id: indexBar
            visible: !root.empty
            Layout.fillWidth: true
            Layout.topMargin: 46
        }
    }
    
    FileDialog
    {
        id: fileDialog
        acceptLabel: "Import"
        fileMode: FileDialog.OpenFiles
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        nameFilters: ["Text files (*.txt)", "PDF files (*.pdf)", "MOBI files (*.pdf)",
                       "WOLF files (*.wol)", "RTF files (*.rtf)", "PDB files (*.pdb)",
                       "HTML files (*.html *.htm)", "EPUB files (*.epub)", "MOBI files (*mobi)",
                       "DJVU files (*.djvu)"]
    }
}