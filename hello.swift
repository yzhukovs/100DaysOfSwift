extension String {

    func fuzzyContains(_ a: String) -> Bool {
         return self.range(of: a, options: .caseInsensitive) != nil
}
}
print("Hello Word".fuzzyContains("blah"))

