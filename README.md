# kubenav Plugin

The kubenav Plugin is used within the [kubenav](https://github.com/kubenav/kubenav) app. It contains the native parts for the kubenav app, using JavaScript for the web implementation and the bindings from the [bind](https://github.com/kubenav/bind) repository.

## Development

Create a directory `kubenav` and clone the `kubenav-plugin` and `kubenav` repository:

```sh
mkdir kubenav
cd kubenav

git clone git@github.com:kubenav/kubenav-plugin.git
git clone git@github.com:kubenav/kubenav.git
```

Build the package using:

```sh
npm run build
```

To use your local changes from the `kubenav-plugin` in the kubenav app change the following line in the [package.json](https://github.com/kubenav/kubenav/blob/master/package.json) file:

```diff
  "dependencies": {
-    "kubenav-plugin": "1.0.0",
+    "kubenav-plugin": "file:../kubenav-plugin",
  }
```

Then run the following commands in the clones `kubenav` repository:

```sh
npm install
npx cap sync
```

Now you are ready to test your changes in the kubenav app.
