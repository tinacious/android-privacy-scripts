# Android privacy scripts

A set of scripts related to privacy on your Android device.


- [Tools](#tools)
- [Scripts](#scripts)
  - [appops\_report.sh](#appops_reportsh)
  - [clipboard\_permissions\_view.sh](#clipboard_permissions_viewsh)
  - [clipboard\_permissions\_deny.sh](#clipboard_permissions_denysh)
  - [clipboard\_permissions\_allow.sh](#clipboard_permissions_allowsh)
- [Motivation](#motivation)

## Tools

| Tool                                                              | Required?    | Description                                                                                         |
| ----------------------------------------------------------------- | ------------ | --------------------------------------------------------------------------------------------------- |
| [Android command line tools](https://developer.android.com/tools) | ❗️ required | Required for running the `adb` commands in these scripts.                                           |
| [AboutApps](https://github.com/tinacious/about-apps-android)      | 💁🏻‍♀️ optional  | An optional Android app you can install to view app information and search for apps by package name |

## Scripts

### appops_report.sh

View which apps are allowed to perform which operations.

Outputs a timestamped report to `./output/appops_output_*.txt`.

### clipboard_permissions_view.sh

View which apps are allowed to read from your clipboard.

### clipboard_permissions_deny.sh

Related to the previous script, allows you to provide a list of apps to remove clipboard read permissions for. This is the inverse of the allow script.

Run the script:

```sh
sh clipboard_permissions_deny.sh
```

The script will hang, allowing you to paste a list of packages to deny clipboard permissions for. Here's a sample list of packages I needed to do this for:

```text
com.linkedin.android
com.shopify.arrive
```

Once you've finished pasting your list (1 package per line), press Ctrl+D to allow it to continue running.


### clipboard_permissions_allow.sh

Related to the previous script, allows you to provide a list of apps to give clipboard read permissions to. This is the inverse of the deny script.

Provide the list the same way as you would for the deny script.


## Motivation

It can be concerning when you open an app and Android tells you the app pasted from your clipboard without you expecting. This can help you prevent that before opening the app.