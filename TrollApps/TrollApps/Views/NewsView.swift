//
//  NewsView.swift
//  TrollApps
//
//  Created by Cleopatra on 2023-12-15.
//

import SwiftUI

struct NewsView: View {
    @State private var showFullVersion: Bool = false
    
    @State private var repos: [RepoMemory] = []
    @EnvironmentObject var repoManager: RepositoryManager

    var body: some View {
        NavigationView {
            List {
//                ForEach(repos) { repo in
//                    ForEach(repo.data.news ?? [], id: \.self) { news in
//                        ForEach(repoManager.fetchAppsInRepo(repoInput: repo.data, bundleIdInput: featuredAppId), id: \.self) { app in
//
//                            let version = (app.versions?[0].version != nil && app.versions?[0].version != "" ? (app.versions?[0].version ?? "") : "")
//                            let devName = (app.developerName != nil && app.developerName != "" ? (app.developerName ?? "") : "")
//                            
//                            HStack {
//                                if(app.iconURL != "") {
//                                    WebImage(url: URL(string: app.iconURL))
//                                        .resizable()
//                                        .frame(width: 48, height: 48)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                        .padding(.trailing, 7)
//                                    
//                                } else {
//                                    Image("MissingApp")
//                                        .resizable()
//                                        .frame(width: 48, height: 48)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                        .padding(.trailing, 7)
//                                }
//                                VStack(alignment: .leading) {
//                                    Text(app.name)
//                                    CollapsibleText(text: devName , isExpanded: $showFullVersion, maxLines: 1)
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                    CollapsibleText(text: version , isExpanded: $showFullVersion, maxLines: 1)
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                }
//                                Spacer()
//                                DynamicInstallButton(appDetails: app, selectedVersionIndex: 0, buttonStyle: "Main")
//                            }
//                            
//                            .background(
//                                NavigationLink("", destination: AppDetailsView(appDetails: app))
//                                    .opacity(0)
//                            )
//                        }
//                    }
//                }
            }
            .environment(\.defaultMinListRowHeight, 50)
            .listStyle(PlainListStyle())
            .navigationTitle("NEWS")
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: OtherView()) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        
        //
        .navigationViewStyle(.stack)
        .onAppear {
            repos = repoManager.ReposData
        }
        .onChange(of: repoManager.hasFinishedFetchingRepos) { _ in
            repos = repoManager.ReposData
        }
    }
}
