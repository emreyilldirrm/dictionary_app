# Sözlük Uygulaması

Bu Flutter uygulaması, SQLite veritabanını kullanarak bir sözlük oluşturmayı amaçlar. Kullanıcı, sözlükteki kelimeleri görebilir, arayabilir ve filtreleyebilir.

![d1](https://github.com/emreyilldirrm/dictionary_app/assets/149498114/f04de73b-3e1c-4b63-802b-4f9df9f87d7d)
![d2](https://github.com/emreyilldirrm/dictionary_app/assets/149498114/8afcb975-bbdf-4c79-93ed-63bdf931ce33)



## Özellikler

1. **Veritabanı Bağlantısı:** Uygulama, SQLite veritabanına bağlanarak kelime verilerini saklar. Veritabanına erişim için `sqflite` paketi kullanılır.

2. **Kelime Listesi:** Ana ekran, veritabanındaki tüm kelimeleri listeler. Her kelimenin yanında, kelimenin anlamını gösteren bir kısa açıklama bulunur.

3. **Arama:** Kullanıcı, üst tarafta bulunan bir arama çubuğunu kullanarak kelime arayabilir. Arama sonuçları otomatik olarak güncellenir.

## Kullanılan Paketler

- `sqflite`: SQLite veritabanına erişim için kullanılır.
- `flutter_bloc`: Uygulama durum yönetimi için kullanılır.
- `provider`: Durum yönetimini destekler.
