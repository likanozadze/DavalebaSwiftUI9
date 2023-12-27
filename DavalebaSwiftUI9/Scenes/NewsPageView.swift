//
//  NewsPageView.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import SwiftUI

struct NewsPageView: View {
    
    @StateObject var viewModel: NewsPageViewModel
    
    // MARK: - Body
    var body: some View {
        
           VStack {
               
        UITableViewRepresentableView(data: viewModel.News)
           }
          
       }
   }

struct UITableViewRepresentableView: UIViewRepresentable {
    var data: [News]
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = context.coordinator
      
       
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.data = data
        DispatchQueue.main.async {
            uiView.reloadData()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data)
    }
    
    class Coordinator: NSObject, UITableViewDataSource {
        var data: [News]
        
        init(data: [News]) {
            self.data = data
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            tableViewCell.textLabel?.numberOfLines = 0
            tableViewCell.textLabel?.text = data[indexPath.row].title
       
            return tableViewCell
        }
    }
}

#Preview {
    NewsPageView(viewModel: NewsPageViewModel())
}


