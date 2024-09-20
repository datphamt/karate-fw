function fn() {
    karate.configure('afterScenario', function(){ quitAll() })
    init()
}