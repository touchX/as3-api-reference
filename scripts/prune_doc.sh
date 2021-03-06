#!/bin/sh
#
# Removes undesired top-level AS3 packages from the destination directory to reduce size and clutter. 

cd "$(dirname "$0")/.."
. ./config.sh

scripts/fix_toc.sh

cd "$dest_dir"

echo -e "\nRemoving packages:\n"
for pkg in $prune_packages; do
	echo $pkg
	rm -rf $pkg 2>/dev/null
	test "$regexp" && regexp+="|$pkg" || regexp="$pkg"
done

prune_toc="$tmp_dir/as3_api_prune_toc"
cat <<-EOT >"$prune_toc" 
	/<topic label="Index" href="all-index/ {
		next;
	}
	
	/<topic .*href="($regexp)\/.*">/ { 
		++depth; 
	}
	
	{
		if (depth == 0)
			print;
	}
	
	/<\/topic>/ {
		if (depth > 0) --depth; 
	}
EOT
echo -ne "\nPruning TOC file: "
awk -f "$prune_toc" "$prune_toc_file" >"$prune_toc_file".new && mv -f "$prune_toc_file".new "$prune_toc_file"
echo done
rm -f "$prune_toc"
