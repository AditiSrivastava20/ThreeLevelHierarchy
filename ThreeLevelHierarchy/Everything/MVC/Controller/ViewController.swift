//
//  ViewController.swift
//  ThreeLevelHierarchy
//
//  Created by Sierra 4 on 07/04/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import ThreeLevelAccordian

class ViewController: UIViewController, TLADelegate, UIActionSheetDelegate
{
    @IBOutlet weak var treeTableView: UITableView!
    var cells = [TLACell]()
    var delegateController: TLAViewController!
//    var top = ["a","b","c"]
//    var inner = [1,2,3]
//    var lowest = ["A","B","C"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Checklist"
        let s = UIActionSheet()
        s.delegate = self
        let backgroundColor = UIColor(red: 237.0 / 255.0, green: 254.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
        let textColor = UIColor(red: 31.0 / 255.0, green: 217.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0)
    
        cells.append(TLAHeaderItem(value: "Saloon" as AnyObject, imageURL: ""))
        cells.append(TLACell(value: "Hair" as AnyObject))
        cells.append(TLASubItem(value: "hair styling" as AnyObject))
        cells.append(TLACell(value: "Massage" as AnyObject))
        cells.append(TLASubItem(value: "xyz" as AnyObject))
        
        cells.append(TLAHeaderItem(value: "ABC" as AnyObject, imageURL: ""))
        cells.append(TLACell(value: "Bed" as AnyObject))
        cells.append(TLASubItem(value: "Remove all the dust." as AnyObject))
        cells.append(TLACell(value: "Dressing" as AnyObject))
        
        cells.append(TLAHeaderItem(value: "super market" as AnyObject, imageURL: ""))
        cells.append(TLACell(value: "Utensils" as AnyObject))
        cells.append(TLASubItem(value: "There are many type of utensils like tongs, rolling pin, pan, non stick pans. Wash them all." as AnyObject))
        cells.append(TLACell(value: "Sink" as AnyObject))
        cells.append(TLASubItem(value: "Clean the sink" as AnyObject))
    
        cells.append(TLAHeaderItem(value: "boutique" as AnyObject, imageURL: ""))
        cells.append(TLACell(value: "Stairs" as AnyObject, imageURL: ""))
        cells.append(TLASubItem(value: "One stair, two stair, three stair, all stairs clean clean." as AnyObject))
        cells.append(TLACell(value: "Hall" as AnyObject))
        cells.append(TLASubItem(value: "Clean the hall" as AnyObject, imageURL: ""))
    
        let options: [TLAOption] = [
                                        .useAccessoryIcons(true),
                                        //.expandIcon(UIImage(named: ""))!,
                                        //.collapseIcon(UIImage(named: "")),
                                        .headerTextFont(UIFont.systemFont(ofSize: CGFloat(15.0))),
                                        .headerTextColor(textColor),
                                        .headerCellBackgroundColor(backgroundColor),
                                        .subItemTextFont(UIFont.systemFont(ofSize: CGFloat(12.0))),
                                        .subItemTextColor(UIColor.black),
                                        .subItemCellBackgroundColor(UIColor.white),
                                        .itemTextFont(UIFont.systemFont(ofSize: CGFloat(14.0))),
                                        .itemTextColor(UIColor.black),
                                        .itemCellBackgroundColor(UIColor.white),
                                    ]
    
        let threeLevelAccordian = ThreeLevelAccordian.init(cells: cells, options: options, reuseIdentifier: "expandCell")
        threeLevelAccordian.delegate = self
        delegateController = threeLevelAccordian.controller
        treeTableView.dataSource = delegateController
        treeTableView.delegate = delegateController
        treeTableView.reloadData()
    }

    func didSelectItemAtIndex(_ index: Int)
    {
        if self.cells[index] as? TLASubItem != nil
        {
            let alertController = UIAlertController(title: "Clicked", message: "Clicked \(index)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}



//extension ViewController: UITableViewDelegate, UITableViewDataSource
//{
//    func numberOfSections(in tableView: UITableView) -> Int
//    {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return top.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! ExpandableTableViewCell
//        if cell == nil
//        {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "") as! ExpandableTableViewCell
//        }
//        cell.lblValues.text = top[indexPath.row]
//        cell.indentationLevel = inner[indexPath.row]
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        tableView.deselectRow(at: indexPath, animated: true)
//        var d = lowest[indexPath.row]
//        if d != nil
//        {
//            var ar = d
//            var isAlreadyInserted: Bool = false
//            for inn in ar
//            {
//                var index: Int = (top as NSArray).indexOfObjectIdentical(to: inn)
//            }
//        }
//    }
//    
//}


//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    var CellIdentifier: String = "Cell"
//    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
//    if cell == nil {
//        cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
//    }
//    cell?.textLabel?.text = arForTable[indexPath.row].value(forKey: "name")
//    cell?.indentationLevel = CInt(arForTable[indexPath.row].value(forKey: "level"))
//    return cell!
//}
//
//
//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//    var d: [AnyHashable: Any]? = (arForTable[indexPath.row] as? [AnyHashable: Any])
//    if d?.value(forKey: "Objects") {
//        var ar: [Any]? = (d?.value(forKey: "Objects") as? [Any])
//        var isAlreadyInserted: Bool = false
//        for dInner: [AnyHashable: Any] in ar {
//            var index: Int = (arForTable as NSArray).indexOfObjectIdentical(to: dInner)
//            isAlreadyInserted = (index > 0 && index != NSIntegerMax)
//            if isAlreadyInserted {
//                break
//            }
//        }
//        if isAlreadyInserted {
//            miniMizeThisRows(ar)
//        }
//        else {
//            var count: Int = indexPath.row + 1
//            var arCells = [Any]()
//            for dInner: [AnyHashable: Any] in ar {
//                arCells.append(IndexPath(row: count, section: 0))
//                arForTable.insert(dInner, at: count += 1)
//            }
//            tableView.insertRows(at: arCells as! [IndexPath], with: .left)
//        }
//    }
//}
//
//func miniMizeThisRows(_ ar: [Any]) {
//    for dInner: [AnyHashable: Any] in ar {
//        var indexToRemove: Int = (arForTable as NSArray).indexOfObjectIdentical(to: dInner)
//        var arInner: [Any]? = (dInner.value(forKey: "Objects") as? [Any])
//        if arInner && arInner?.count > 0 {
//            miniMizeThisRows(arInner)
//        }
//        if (arForTable as NSArray).indexOfObjectIdentical(to: dInner) != NSNotFound {
//            arForTable.removeObject(identicalTo: dInner)
//            tableView.deleteRows(at: [IndexPath(row: indexToRemove, section: 0)], with: .right)
//        }
//    }
//}
