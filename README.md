
<img src=banner.png width=100%/>

# Inshorts clone (The News App)



### Instruction
Replace the API Key field with your own key, for key visit [newsapi.org](https://themoviedb.org) and create your id.

```
  path lib/global/global.dart
```

```dart
    final String apikey = "YOUR_KEY";
```

## Features

- Dark Mode
- Share News Card As Image
- Offline Read
- Watermark on shared news card
- Webview

## Packages Used

- flutter_bloc & Dio : for http Request Handling.
- Provider : for State Management.
- Hive : for Local Strorage Management.
- esys_flutter_share : for Sharing News card.
- webview_flutter : web view inside the app.
- auto_route : Page Routing.
- photo_view : gives extra features like image scaling.

### License

```
  
MIT License

Copyright (c) 2020 Sanjay Soni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

