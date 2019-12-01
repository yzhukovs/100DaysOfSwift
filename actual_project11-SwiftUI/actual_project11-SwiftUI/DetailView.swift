//
//  DetailView.swift
//  actual_project11-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/30/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                    
            
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(self.book.review ?? "No review")
                .padding()
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoed it"
        return NavigationView {
        DetailView(book: book)
    }
}
}
