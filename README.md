# PTSideBarMenu

Version 1.1.0

Below are the details to configure SideMenu into your project

Step 1) 
    ///Import Library:
        import PTSideBarMenu

Step 2)  
    Define Properties which is neccessary for Library

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


Step 3) 
    Configuration object need to initialise and create the enviornment object of it so that subviews can use property of this object for configuring the Menus

    init() {
        self.configuration = try! PTSiderBarConfiguration(dividerdesign: divider, items: items)
    }


Step 4) 
    In Body property include Structure PTSideBarMenu object to show and hide the Side Bar. In content view: Define the view you want to show in the screen. Below are the example how to initiate the sideBar

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



Configuration present at the moment:
1)    Select The border design
        .ZigZag or Straight

2) List of Items which need to display
        let sideBarItems: [PTSideBarModel]

3) Set Hide sidebar
    @Binding public var hideSideBar: Bool

4) Selected Items from the Menu
public var selectedRow = 0

5) Set Backgroud Color of Row
public var backgroudColorOfRow: Color = . accentColor

6) Set Backgroud Color of Menu
public var backgroundColorOfMenu: Color = .accentColor

7) Set Text Color of Menu
public var menuTextColor: Color = .white

8) Set ZigZag Pattern Height
public var zigZagHeight:CGFloat  = 5

9) Set ZigZag Pattern width
public var zigZagWidth: CGFloat = 40

More changes coming to your way stay tune :)
