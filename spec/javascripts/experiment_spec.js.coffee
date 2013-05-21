describe "Funk", ->
  it "has sounds", ->
    funk = new Funk("jazz")
    expect(funk.style).toBe("jazz")

