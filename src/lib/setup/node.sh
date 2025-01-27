makeDir(){
    ssh $node mkdir -p ${cache} ${src_tmp}
}

syncDepends(){
    # only Sync if Snap. Apt has bundled dependencies:
    if [ ! $type == "apt" ]; then
        if [ ${#depends[@]} -gt 0 ]; then
            echo "Has dependencies ${depends}"
            rsync -av --progress ${HOME}/${cache}/$depends $node:./$cache/
        fi
    fi
}

syncCache(){
    if [ $node != "localhost" ]; then   # No need to sync if localhost! Mirror already there
        rsync -av --progress ${HOME}/${cache}/$name $node:./$cache/
    fi
}

syncSrc(){
    delete='--delete'
    rsync -av --progress $delete $repo_path $node:./${src_tmp}/
}

setupNode(){
    makeDir
    syncDepends
    syncCache
    syncSrc
}
