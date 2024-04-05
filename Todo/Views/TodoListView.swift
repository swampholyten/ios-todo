//
//  TodoListItemsView.swift
//  Todo
//
//  Created by junkai ji on 04/04/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(
            wrappedValue: TodoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) {
                    item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(itemID: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("TODO List")
            .toolbar {
                Button {
//                    Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userID: "tOJ3ytdgl5gIFhe0T3TMakVoYwi1")
}
