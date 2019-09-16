.PHONY: lock unlock lock-file unlock-file harvest restore
.SILENT: lock unlock lock-file unlock-file harvest restore

lock:
	read -s -p "Encryption Passcode: " pswd
	find secrets -type f -iname *.secret -exec ./scripts/encrypt_file.sh {} $pswd \;

unlock:
	find secrets -type f -iname *.gpg -exec ./scripts/decrypt_file.sh {} \;

lock-file:
	./scripts/encrypt_file.sh $(file)

unlock-file:
	./scripts/decrypt_file.sh $(file)

harvest:
	./scripts/harvest_files.sh

restore:
	./scripts/restore_files.sh
