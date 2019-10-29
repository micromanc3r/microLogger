[![Build Status](https://travis-ci.com/micromanc3r/microLogger.svg?branch=master)](https://travis-ci.com/micromanc3r/microLogger)
# microLogger
Lightweight swift logger

## Installation
Use cocoapods to install this easy-to-use logger.
```
pod 'microLogger', '~> 1.0.0'
```

## Usage

### Import the module: 
`import MicroLogger`

### Setup loglevel:
```
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MLogger.logLevel = .debug
                
        return true
    }
```
or better yet
```
        #if DEBUG
            MLogger.logLevel = .verbose
        #else
            MLogger.logLevel = .error // you don't have to worry about logging embarrassing verbose messages in production
        #endif
```
### Log everything!
```
        MLogger.logWarning(sender: self,
                           andMessage: "This should not happen.")
```
