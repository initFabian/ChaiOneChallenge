# ChaiOne Code Challenge

###Goals 
One goal of this project was to demonstrate how to pull data from an API and display it on a device. Another goal of this project was to make any `ViewController` as small as possible to promote re-usability as well keeping all code separated for ease of testing. 

##Project Structure(Notable Files)

├── Models  
│   └── User.swift  
├── Networking  
│   └── APIManager.swift  
├── ChaiCell  
│   ├── ChaiCell.swift  
│   └── ChaiCell.xib  
├── TableViewDelegates  
│   ├── MyTableViewDataSource.swift  
│   └── MyTableViewDelegate.swift  
├── ViewControllers  
│  └── ChaiTableViewController.swift  
├── Supporting Files  
│   ├── Constants.swift  
└── Frameworks  
   ├── Alamofire.framework  
   ├── EZSwiftExtensions.framework  
   ├── SwiftyJSON.framework  
   └── WebImage.framework  


##Classes

###User(Models)
A `NSObject` subclass containing a user's information.

+ Variables
    *   *userName*
    *   *userText*
    *   *avatarURL*


###APIManager(Networking)
A `NSObject` subclass that handles all network calls.

+ Methods
  +   **getUsers**


###ChaiCell.swift(ChaiCell)
A `UITableViewCell` subclass that handles all cell configuration.

  + Methods
    + Class
        + **identifier**
        + **nib**
    + Instance
        + Public
            + **configureCell**
        + Private
            + **getImage**


###MyTableViewDataSource(TableViewDelegates)
Template to handle multiple UITableView DataSources.

+ Variables(private)
    * *items*
    * *cellIdentifier*
    * *configureCellBlock*

+ Methods(internal)
  + **itemAtIndexPath**
  + **numberOfSectionsInTableView**
  + **numberOfRowsInSection**
  + **cellForRowAtIndexPath**


###MyTableViewDelegate(TableViewDelegates)
Template to handle multiple UITableView Delegates.

  + Variables
      * *cellHeight*
      * *selectRowBlock*

  - Methods
    - **didSelectRowAtIndexPath**
    - **heightForRowAtIndexPath**
    - **estimatedHeightForRowAtIndexPath**

###ChaiTableViewController(ViewControllers)
Handles calling `APIManager` to get users as well as connecting dataSource and delegate for `UITableView`.

  + Methods
    + **reloadTableData**
    + **displayTableData**

###Constants(Supporting Files)
Contains `Result` enum that determines whether or not an API call was successful. Contains any variable constants.

  - Variables
    - *API_URL*
    - *kUSER*
    - *kUSERNAME*
    - *kTEXT*
    - *kAVATAR_IMAGE*
    - *kURL*
