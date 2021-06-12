'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/app_icons/briefcase.png": "12e9358e8dbae5cb406a7abeec84d4f5",
"assets/app_icons/call.png": "9e299bb392428812cffbdadaf9272b15",
"assets/app_icons/coding.png": "c8150fc2000e8674220bcd485b30e68f",
"assets/app_icons/coffee.png": "19e4f65ea926133b771bf82daa35f5d4",
"assets/app_icons/design.png": "c59f68c8be347d0a5231b2b714421b24",
"assets/app_icons/double-up-arrow.png": "d758827b82d3262d54d19f7482c36b63",
"assets/app_icons/email.png": "ecf609bb48c645251a898c5527f7c781",
"assets/app_icons/facebook.png": "d03d1cb8afb8da75756264994a9ce4d4",
"assets/app_icons/github.png": "0918d78648457def080137b179fc5608",
"assets/app_icons/happy.png": "3837c30afeb5b40886a787810f553fc3",
"assets/app_icons/linkedin.png": "3c963b14a58df80613b15c7e9e4e9c57",
"assets/app_icons/list.png": "4e63ee6122b58866f4a2d2408c02f9ef",
"assets/app_icons/menu.png": "3ca1d45f78b3acb1d2a89a53271a21db",
"assets/app_icons/pencil.png": "4566fb93d2196b9b2b74be9cfe23d0c8",
"assets/app_icons/pin.png": "c40700870fa15459e94f3ffd6eccfcfd",
"assets/app_icons/twitter.png": "cadd7c4e3a3a29ddfa395393e652012a",
"assets/app_images/background.jpg": "346c1daab54715d3701cddb8b2ee0999",
"assets/app_images/cover.jpg": "1d39c3dd934e44b95eb2ad8533aa8068",
"assets/app_images/defaultUser.png": "1300018473cc0038187aaa0e2604fa27",
"assets/app_images/drawerBackground.jpg": "63e1cad34b9c37bd55bdb30c0cb56e5a",
"assets/app_images/icon.jpg": "7d592b1688dfb9f3dd9b1d069855e11f",
"assets/app_images/ouahid.png": "40f28ccd5e901cba913ec4c55b9b314a",
"assets/app_images/profileImage.jpg": "040780acde8d5f42b39d8013f521b87a",
"assets/app_images/ticketIcon.png": "7620f5ea197a3ad3d662a2d2b4f6266e",
"assets/app_images/train.png": "0afffbd21d776ae171a4cf376d14fac8",
"assets/AssetManifest.json": "0bf02415a0e77681d76dd5ab2b56e537",
"assets/assets/icons/avatar.svg": "bd4b521552ed6b582e702d5b7c40b07c",
"assets/assets/icons/children.svg": "c9aa42327e696ca6019cdeb546c6863a",
"assets/assets/icons/Documents.svg": "51896b51d35e28711cf4bd218bde185d",
"assets/assets/icons/doc_file.svg": "552a02a5a3dbaee682de14573f0ca9f3",
"assets/assets/icons/drop_box.svg": "3295157e194179743d6093de9f1ff254",
"assets/assets/icons/excle_file.svg": "dc91b258ecf87f5731fb2ab9ae15a3ec",
"assets/assets/icons/Figma_file.svg": "0ae328b79325e7615054aed3147c81f9",
"assets/assets/icons/folder.svg": "40a82e74e930ac73aa6ccb85d8c5a29c",
"assets/assets/icons/google_drive.svg": "9a3005a58d47a11bfeffc11ddd3567c1",
"assets/assets/icons/logo.svg": "b3af0c077a73709c992d7e075b76ce33",
"assets/assets/icons/media.svg": "059dfe46bd2d92e30bf361c2f7055c3b",
"assets/assets/icons/media_file.svg": "2ac15c968f8a8cea571a0f3e9f238a66",
"assets/assets/icons/men.svg": "b1feb53aa8a62f2498b4dfb468359614",
"assets/assets/icons/menu_dashbord.svg": "b2cdf62e9ce9ca35f3fc72f1c1fcc7d4",
"assets/assets/icons/menu_doc.svg": "09673c2879de2db9646345011dbaa7bb",
"assets/assets/icons/menu_notification.svg": "460268d6e4bdeab56538d7020cc4b326",
"assets/assets/icons/menu_profile.svg": "fe56f998a7c1b307809ea3653a1b62f9",
"assets/assets/icons/menu_setting.svg": "d0e24d5d0956729e0e2ab09cb4327e32",
"assets/assets/icons/menu_store.svg": "2fd4ae47fd0fca084e50a600dda008cd",
"assets/assets/icons/menu_task.svg": "1a02d1c14f49a765da34487d23a3093b",
"assets/assets/icons/menu_tran.svg": "6c95fa7ae6679737dc57efd2ccbb0e57",
"assets/assets/icons/one_drive.svg": "aa908c0a29eb795606799385cdfc8592",
"assets/assets/icons/pdf_file.svg": "ca854643eeee7bedba7a1d550e2ba94f",
"assets/assets/icons/Search.svg": "396d519c18918ed763d741f4ba90243a",
"assets/assets/icons/sound_file.svg": "fe212d5edfddd0786319edf50601ec73",
"assets/assets/icons/toddlers.svg": "81ef19577f7be0d636b80f20c7c4fc70",
"assets/assets/icons/train1.svg": "a70bbcb960e4bb70446175c36bc29840",
"assets/assets/icons/unknown.svg": "b2f3cdc507252d75dea079282f14614f",
"assets/assets/icons/women.svg": "ba990168c778df6c68a52116970e9af7",
"assets/assets/icons/xd_file.svg": "38913b108e39bcd55988050d2d80194c",
"assets/assets/images/admin.png": "0f56c8d5111a289faaff55d289c2eb42",
"assets/assets/images/logo.png": "5315be9d0a7602fb12a0ad4c2e3006e9",
"assets/assets/images/profile_pic.png": "5f56c3070f1c066ae15ecad12fb44f54",
"assets/FontManifest.json": "56a6be909b7a2d8103740792f4ede9ff",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/images/projects/juda.png": "47dd713dafca0915de28fee247372661",
"assets/images/projects/nataloe.png": "f2e32e0341fcde78352c4fb7fd364d7b",
"assets/images/projects/omran.png": "ca5fe45e4998ba2cd53c795537419014",
"assets/images/projects/topfood.png": "2e85bf80bf3965f6b85fb19fe1c6d3af",
"assets/images/projects/toptaxi.png": "25fc761abc220c62a31a61a41542872f",
"assets/NOTICES": "0301cd3c94cc33e792a3f84e763d9a54",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "b34364dc4002262cadc399e1c1523917",
"/": "b34364dc4002262cadc399e1c1523917",
"main.dart.js": "f65e9b5925137ffd843b72259f20e3dc",
"manifest.json": "e6a23416093f051eabe00985e2b1efac",
"version.json": "cb0f18689f3e83b28706db20e3305b5c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
