
Introduction slider for Flutter apps.
Customizable slides that can be displayed to introduce the app or explain its functionality.

## Features

Configure a slider to show the functionality of your app.

![alt text](http://puigtowers.com/plugins/flutter/intro_slider.png)

## Getting started

This plugin is not yet published into pub.dev, but it can also be used from the repo.

## Usage

It can be used like so:

```dart
IntroSlider.getInstance().show(
    context: context,
    color: Theme.of(context).colorScheme.inversePrimary,
    items: [
        const CarouselItem(
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                            FlutterLogo(size: 80.0),
                            Text('This is a slide'),
                    ],
                ),
            ),
        ),
    ],
);
```
