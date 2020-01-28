# Gitlab remote

This app helps you create students and folders / groups in Gitlab.

You supply:

* Gitlab URL to your Gitlab api
* Your Gitlab API token
* Gitlab ID of the folder / group to operate on.
* A CSV file with students.

## Application workflow

1. Import the CSV
1. Show a Student list with checkboxes
1. The user can select which students he needs to operate on, or select all
1. Perform 'actions' (clicking a button) like:
  * Create the folders in Gitlab
  * Create students account in Gitlab
  * Add instructors to labs in Gitlab
  * etc.
1. In **Phase 2** we would need:
  * Fetch GitLab API issue statistics:
    * Open / Closed issues
  * Grade each student?
