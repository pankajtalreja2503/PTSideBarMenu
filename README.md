# PTSideBarMenu

Version 1.1.0

Below are the details to configure SideMenu into your project

Step 1)  Go to Xcode > File > Swift Packages > Add Package Dependancy > Paste the git URL "https://github.com/pankajtalreja2503/PTSideBarMenu.git"

Step 2)

    ///Import Library:
        import PTSideBarMenu

Step 3)  
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


Step 4) 
    Configuration object need to initialise and create the enviornment object of it so that subviews can use property of this object for configuring the Menus

    init() {
        self.configuration = try! PTSiderBarConfiguration(dividerdesign: divider, items: items)
    }


Step 5) 
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

This is the 1st version of this library & there are many changes has been planned to include in it. 

Feel free to reach out to me on my below email id -
phtalrejaios@gmail.com

Sample gif file:
![Screen Recording 2021-02-21 at 1 47 47 PM](https://user-images.githubusercontent.com/66989834/108619557-a6847580-744b-11eb-8eda-f2d7053869e5.gif)
