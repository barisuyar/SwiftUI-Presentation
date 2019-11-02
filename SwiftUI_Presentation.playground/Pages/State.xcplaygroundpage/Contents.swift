/*:
 State, Swift 5.1 ile ortaya çıkan property wrapper'lara bir örnektir.
 
 State bir View'ın sahip olduğu veri ile UI arasında bağ kurar.
 
 State tarafından tutulan ve gösterilen bir veride meydana gelen değişiklik hemen UI'a haber verilir ve güncellenir.
 
 class ile bir UI yaratmak istersek ve içerisinde State ile değişen
 
 elemanlar kullanırsak bu başarılı olmayacaktır.
 
 Çünkü State struct yapısı için kurgulanmıştır. Swift'te struct'a ait bir property değiştirildiğinde bu instance yeniden oluşturulur. class'ta ise property direkt olarak değiştirilebilir.
 
 Struct'ta bir değişkeni direkt olarak değiştirmek içinse "mutating" fonksiyonlar kullanırız.
 
 Bunlar ışığında State yeni oluşan struct'a göre UI'i günceller ve class bu şekilde çalışmaz ve UI'ı güncellemez.
 
  ````
 struct Pokemon() {
  var name: String = "Charmander"
 }
 
 struct ContentView : View {
   @State var pokemon = Pokemon()
   var body: some View {
     VStack {
       Text(pokemon.name)
         .frame(
           width: UIScreen.main.bounds.width,
           height: 50
         )
         .background(Color.blue)
         .foregroundColor(Color.white)
         .padding(10)
       Button(
         action: { self.switchPokemon() },
         label: { Text("Switch") }
       )
     }
   }
   func switchPokemon() {
     let list = ["Squirtle", "Bulbasaur", "Charmander", "Pikachu"]
     pokemon = Pokemon(name: list.randomElement() ?? "")
   }
 }
  ````
 
 Yukarıdaki örnekte, ekrana bir pokemon adı gösteren uygulama geliştirdik. pokemonName @State olarak tanımlandı. Text de ekrana pokemonName'i basacak şekilde oluşturuldu.
 
 switchPokemon() fonksiyonu ekranda yer alan butona her tıklandığında listeden rastgele bir pokemon seçerek adını pokemonName'e veriyor.
 
 pokemonName state olarak tanımlandığı için değiştiği anda ekrana sonuç UI'a yansıyor.
 
 [devam](Giris)
 */
