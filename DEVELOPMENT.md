# Prerequisites

- Flutter with atleast

<pre>
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
<span style="color: green">[√]</span> Flutter (Channel stable, 3.13.9, on Microsoft Windows [Version 10.0.19045.3693], locale en-GB)
<span style="color: green">[√]</span> Windows Version (Installed version of Windows is version 10 or higher)
<span style="color: green">[√]</span> Android toolchain - develop for Android devices (Android SDK version 31.0.0)
<span style="color: red">[X]</span> Chrome - develop for the web (Cannot find Chrome executable at
    .\Google\Chrome\Application\chrome.exe)
    <span style="color: yellow">!</span> Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.
<span style="color: red">[X]</span> Visual Studio - develop Windows apps
    <span style="color: red">X</span> Visual Studio not installed; this is necessary to develop Windows apps.
      Download at https://visualstudio.microsoft.com/downloads/.
      Please install the "Desktop development with C++" workload, including all of its default      
      components
<span style="color: yellow">[!]</span> Android Studio (not installed)
<span style="color: green">[√]</span> VS Code (version 1.85.0)
<span style="color: green">[√]</span> Connected device (3 available)
<span style="color: green">[√]</span> Network resources
</pre>

- Node (optional)

```json
  "scripts": {
   "emulator": "cd wsl2-avd-connector && connector.bat",
   "app": "flutter run",
   "format": "dart fix --apply"
 }
```

---

# Setup

`git clone https://github.com/AminoffZ/roskis.git`
`cd roskis`
`flutter pub get`

## Tileserver

For development we are using [openmaptiles](https://github.com/openmaptiles/openmaptiles).

[Quickstart Guide](https://github.com/openmaptiles/openmaptiles/blob/master/QUICKSTART.md)

1. Install WSL (If on Windows)

2. Clone the project.

```bash
git clone https://github.com/openmaptiles/openmaptiles.git
cd openmaptiles
# Build the imposm mapping, the tm2source project and collect all SQL scripts
make
```

3. Generate the .mbtiles.

```bash
./quickstart.sh <area>
```

4. In openmaptiles/style/config.json we need to point to the correct domain(s) and tile-path. [Info about domains](https://stackoverflow.com/questions/47372568/how-to-point-to-localhost8000-with-the-dart-http-package-in-flutter)

```diff
 {
   "options": {
     "paths": {
       "fonts": "/data/fonts",
       "sprites": "/build/style",
       "styles": "/build/style"
-     }
+     },
+    "domains": [
+      "<IPV4 Address>:<port>"
+    ]
   },
   "styles": {
     "OSM OpenMapTiles": {
       "style": "style.json",
       "tilejson": {
         "type": "overlay"
       }
     }
   },
   "data": {
     "openmaptiles": {
-       "mbtiles": "/data/tiles.mbtiles"
+       "mbtiles": "/data/<area>.mbtiles"
     }
   }
 }
```

5. Start the tilesever, and go to the domain added to config.json to verify it's working.

```bash
make start-tileserver
```

6. Create a .env file at the Flutter project root and add the tileserver domain:

`MAP_URL=<IPV4 Address>:<port>`

---

Run the emulator with npm

```bash
npm run emulator
```

Run the flutter app

```bash
flutter run
```
