##Overview
JUCollectionView aims to be a drop in replacement for the extremely slow NSCollectionView. Instead of loading every possible cell at once, JUCollectionView only displays the visible cells. To improve the performance even further, JUCollectionView also reuses cells where possible. This means that it only has to load a batch of cells to cover the view and then reuse them its whole lifetime.

Unlike NSCollectionView, JUCollectionView doesn't use NIB instantiating but a approach similar to UITableView on iOS. It asks its data source for a cell (a subclass of JUCollectionViewCell). It also provides identifier and identifier based dequeuing of cells, allowing you to display various kinds of cells while still having the benefit of reusable cells.

##Features
JUCollectionView is currently at its very beginning, it features simple mouse selection (no multiple selection at the moment) and a very primitive cell class which can display an NSImage and draw a selection (although you can extend that easily). It can display a few hundred thousand cells without lags on an old 2007 MacBook Pro (try this with an NSCollectionView) and can also be used as a tile map renderer by fixed the number of columns and rows.

##License
JUCollectionView is under the MIT license so basically: Do whatever you want to do with it! This also includes forking it and adding new features ;)