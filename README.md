# PTSideBarMenu

Version 1.1.0

Below are the details to configure SideMenu into your project


/// import Library:
import PTSideBarMenu

/*
Define variables which is neccessary for Library
*/

/// Controls display of sidebar
@State private var hideSidebar = true

/// to keep track of Selected Index
@State private var selectedIndex = 0

/// Items to configure
var items = [PTSideBarModel(withtitle: "Profile", image: Image(systemName: "person")), PTSideBarModel(withtitle: "Home", image: Image(systemName: "person")), PTSideBarModel(withtitle: "Configure Items", imageName: "person"),PTSideBarModel(withtitle: "Row 4", image: Image(systemName: "person"))]

/// Set seperator design
let divider: DividerDesigns = .ZigZag

/// define configuration 
var configuration: PTSiderBarConfiguration?


/*
    Configuration object need to initialise and create the enviornment object of it so that subviews can use property of this object for configuring the Menus
*/

init() {
    self.configuration = try! PTSiderBarConfiguration(dividerdesign: divider, items: items)
}


/*
   In Body property include Structure PTSideBarMenu object to show and hide the Side Bar. In content view: Define the view you want to show in the screen
*/

PTSideBarMenu(selectedRow: { (index) in
                   selectedIndex = index
                    hideSidebar.toggle()

}, contentView: AnyView(Text(items[selectedIndex].title ?? "No Values")), hideSideBar: $hideSidebar).environmentObject(configuration!)
.navigationBarTitleDisplayMode(.inline)
.navigationBarItems(leading:
                        Button("Tap", action: {
                            hideSidebar.toggle()
                        })
                        .background(Color.white)
    )

