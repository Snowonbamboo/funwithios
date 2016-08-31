//
//  ViewController.swift
//  Noted
//
//  Created by student on 8/18/16.
//  Copyright © 2016 HarlanAltepeter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var noteBodyView: UITextView!
    @IBOutlet var noteTitleView: UITextField!
    @IBOutlet var noteListView: UITableView!
    
    var notes: [Note] = [Note]()
    var currentNote : Note?
    var currentNoteNumber: Int = 0                      // new code, TODO
    
    //var tableViewController : NoteTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.tableViewController = NoteTableViewController()
        //self.tableViewController!.view.frame = self.view.frame
        //self.tableViewController!.view.addSubview(noteListView)
        //self.addChildViewController(self.tableViewController!)
        //self.view.addSubview(self.tableViewController!.view)
        //self
        
//        self.noteListView.delegate = self;
//        self.noteListView.dataSource = self;
        
        //self.noteListView.registerClass(NoteTableViewCell.self, forCellReuseIdentifier: "NoteTableViewCell")
        loadSampleNotes()
        currentNote = notes.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSampleNotes(){
        let note1 = Note(title: "Example", text: "This is an example note")
        
        let note2 = Note(title: "How to use Noted", text: "To create a note, tap + in the home screen")
        
        notes += [note1, note2]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "NoteTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! NoteTableViewCell
        
        let note = notes[indexPath.row]
        
        cell.titleLabel?.text = note.title
        cell.bodyLabel?.text = note.text
        
        
        return cell
    }
    
    @IBAction func createNote(sender: AnyObject){
        currentNote = Note(title: "", text: "")
        notes += [currentNote!]
        noteListView.beginUpdates()                             // new code
        noteListView.insertRowsAtIndexPaths([                   // new code
            NSIndexPath(forRow: notes.count-1, inSection: 0)    // new code
            ], withRowAnimation: .Automatic)                    // new code
        noteListView.endUpdates()                               // new code
        noteTitleView.text = currentNote!.text
        noteBodyView.text = currentNote!.text
    }

    @IBAction func updateTitle(sender: AnyObject) {
        currentNote!.title = noteTitleView.text!
    }
}

