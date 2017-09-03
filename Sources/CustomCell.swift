/*
 
 MIT License
 
 Copyright (c) 2016 Maxim Khatskevich (maxim@khatskevi.ch)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

// -----------------------------------------------------------------------------

import UIKit

//===

public
protocol Reusable: class
{
    static
    var reuseIdentifier: String { get }
}

//===

public
extension Reusable
{
    static
    var reuseIdentifier: String
    {
        return String(reflecting: self)
    }
}

//===

public
protocol CustomCell: Reusable { }

//===

public
extension UITableView
{
    func register(_ cell: CustomCell.Type)
    {
        self.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func checkAndRegister(_ cell: CustomCell.Type) -> Bool
    {
        if
            cell is UITableViewCell.Type
        {
            self.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
            return true
        }
        else
        {
            return false
        }
    }
    
    func dequeue(
        _ cell: CustomCell.Type,
        for indexPath: IndexPath
        ) -> UITableViewCell
    {
        return dequeueReusableCell(
            withIdentifier: cell.reuseIdentifier,
            for: indexPath
        )
    }
}

//===

public
extension UICollectionView
{
    func register(_ cell: CustomCell.Type)
    {
        self.register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    func checkAndRegister(_ cell: CustomCell.Type) -> Bool
    {
        if
            cell is UICollectionViewCell.Type
        {
            self.register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
            return true
        }
        else
        {
            return false
        }
    }
    
    func dequeue(
        _ cell: CustomCell.Type,
        for indexPath: IndexPath
        ) -> UICollectionViewCell
    {
        return dequeueReusableCell(
            withReuseIdentifier: cell.reuseIdentifier,
            for: indexPath
        )
    }
}

//===

public
extension CustomCell where Self: UITableViewCell
{
    static
    func register(in table: UITableView)
    {
        table.register(self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    static
    func dequeue(
        from table: UITableView,
        for indexPath: IndexPath
        ) -> Self?
    {
        return table.dequeue(self, for: indexPath) as? Self
    }
}

//===

public
extension CustomCell where Self: UICollectionViewCell
{
    static
    func register(in collection: UICollectionView)
    {
        collection.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static
    func dequeue(
        from collection: UICollectionView,
        for indexPath: IndexPath
        ) -> Self?
    {
        return collection.dequeue(self, for: indexPath) as? Self
    }
}
