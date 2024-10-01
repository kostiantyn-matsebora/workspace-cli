#!/bin/bash

sync_onedrive() {
	onedrive --skip-dir "Docs|Pictures" --synchronize --download-only
}

