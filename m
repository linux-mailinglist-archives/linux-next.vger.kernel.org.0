Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFB230510D
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbhA0Ejx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:39:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:57656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731968AbhAZFT7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 00:19:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFE5A2053B;
        Tue, 26 Jan 2021 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1611638358;
        bh=quCpdRR8MYb2HvlfVn25wDGj2+Eye2bBawt8icVgAzo=;
        h=Date:From:To:Subject:From;
        b=kS7J8PhoxD4bu/Yw+3fMvQyEHAebk9iVvLW2cLnU3T5hYjrPOAvFb5tAqHTk6Geev
         smN+wjnHNkITD+qkyZteQLzhQPMQ/1iCBNcDGLcMFWq+dYLDyUPsqpiLiq53tM7MR+
         GWDhU+eJHy1aNUsWB66lLklOOyB4/azw6LIlb5pc=
Date:   Mon, 25 Jan 2021 21:19:17 -0800
From:   akpm@linux-foundation.org
To:     broonie@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au
Subject:  mmotm 2021-01-25-21-18 uploaded
Message-ID: <20210126051917.rcgrHGfQS%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The mm-of-the-moment snapshot 2021-01-25-21-18 has been uploaded to

   https://www.ozlabs.org/~akpm/mmotm/

mmotm-readme.txt says

README for mm-of-the-moment:

https://www.ozlabs.org/~akpm/mmotm/

This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
more than once a week.

You will need quilt to apply these patches to the latest Linus release (5.x
or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
https://ozlabs.org/~akpm/mmotm/series

The file broken-out.tar.gz contains two datestamp files: .DATE and
.DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
followed by the base kernel version against which this patch series is to
be applied.

This tree is partially included in linux-next.  To see which patches are
included in linux-next, consult the `series' file.  Only the patches
within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
linux-next.


A full copy of the full kernel tree with the linux-next and mmotm patches
already applied is available through git within an hour of the mmotm
release.  Individual mmotm releases are tagged.  The master branch always
points to the latest release, so it's constantly rebasing.

	https://github.com/hnaz/linux-mm

The directory https://www.ozlabs.org/~akpm/mmots/ (mm-of-the-second)
contains daily snapshots of the -mm tree.  It is updated more frequently
than mmotm, and is untested.

A git copy of this tree is also available at

	https://github.com/hnaz/linux-mm



This mmotm tree contains the following patches against 5.11-rc5:
(patches marked "*" will be included in linux-next)

  origin.patch
* mm-hugetlbfs-fix-cannot-migrate-the-fallocated-hugetlb-page.patch
* mm-hugetlb-fix-a-race-between-freeing-and-dissolving-the-page.patch
* mm-hugetlb-fix-a-race-between-isolating-and-freeing-page.patch
* mm-hugetlb-remove-vm_bug_on_page-from-page_huge_active.patch
* mm-migrate-do-not-migrate-hugetlb-page-whose-refcount-is-one.patch
* mm-compaction-move-high_pfn-to-the-for-loop-scope.patch
* mm-vmalloc-separate-put-pages-and-flush-vm-flags.patch
* mm-filemap-adding-missing-mem_cgroup_uncharge-to-__add_to_page_cache_locked.patch
* init-gcov-allow-config_constructors-on-uml-to-fix-module-gcov.patch
* mm-thp-fix-madv_remove-deadlock-on-shmem-thp.patch
* memblock-do-not-start-bottom-up-allocations-with-kernel_end.patch
* proc-kpageflags-prevent-an-integer-overflow-in-stable_page_flags.patch
* proc-kpageflags-do-not-use-uninitialized-struct-pages.patch
* revert-mm-memcontrol-avoid-workload-stalls-when-lowering-memoryhigh.patch
* hexagon-remove-config_experimental-from-defconfigs.patch
* scripts-spellingtxt-increase-error-prone-spell-checking.patch
* ntfs-layouth-delete-duplicated-words.patch
* ocfs2-remove-redundant-conditional-before-iput.patch
* ocfs2-cleanup-some-definitions-which-is-not-used-anymore.patch
* ocfs2-clear-links-count-in-ocfs2_mknod-if-an-error-occurs.patch
* ocfs2-fix-ocfs2-corrupt-when-iputting-an-inode.patch
* ramfs-support-o_tmpfile.patch
* fs-delete-repeated-words-in-comments.patch
* kernel-watchdog-flush-all-printk-nmi-buffers-when-hardlockup-detected.patch
  mm.patch
* mm-tracing-record-slab-name-for-kmem_cache_free.patch
* mm-slub-disable-user-tracing-for-kmemleak-caches-by-default.patch
* mm-slub-stop-freeing-kmem_cache_node-structures-on-node-offline.patch
* mm-slab-slub-stop-taking-memory-hotplug-lock.patch
* mm-slab-slub-stop-taking-cpu-hotplug-lock.patch
* mm-slub-splice-cpu-and-page-freelists-in-deactivate_slab.patch
* mm-debug-improve-memcg-debugging.patch
* mm-debug_vm_pgtable-basic-add-validation-for-dirtiness-after-write-protect.patch
* mm-debug_vm_pgtable-basic-iterate-over-entire-protection_map.patch
* mm-page_owner-use-helper-function-zone_end_pfn-to-get-end_pfn.patch
* mm-msync-exit-early-when-the-flags-is-an-ms_async-and-start-vm_start.patch
* mm-filemap-remove-unused-parameter-and-change-to-void-type-for-replace_page_cache_page.patch
* mm-filemap-dont-revert-iter-on-eiocbqueued.patch
* mm-filemap-rename-generic_file_buffered_read-subfunctions.patch
* mm-filemap-remove-dynamically-allocated-array-from-filemap_read.patch
* mm-filemap-convert-filemap_get_pages-to-take-a-pagevec.patch
* mm-filemap-use-head-pages-in-generic_file_buffered_read.patch
* mm-filemap-pass-a-sleep-state-to-put_and_wait_on_page_locked.patch
* mm-filemap-support-readpage-splitting-a-page.patch
* mm-filemap-inline-__wait_on_page_locked_async-into-caller.patch
* mm-filemap-dont-call-readpage-if-iocb_waitq-is-set.patch
* mm-filemap-change-filemap_read_page-calling-conventions.patch
* mm-filemap-change-filemap_create_page-calling-conventions.patch
* mm-filemap-convert-filemap_update_page-to-return-an-errno.patch
* mm-filemap-move-the-iocb-checks-into-filemap_update_page.patch
* mm-filemap-add-filemap_range_uptodate.patch
* mm-filemap-split-filemap_readahead-out-of-filemap_get_pages.patch
* mm-filemap-restructure-filemap_get_pages.patch
* mm-filemap-dont-relock-the-page-after-calling-readpage.patch
* mm-filemap-rename-generic_file_buffered_read-to-filemap_read.patch
* mm-filemap-simplify-generic_file_read_iter.patch
* mm-swap_slotsc-remove-redundant-null-check.patch
* mm-swapfilec-fix-debugging-information-problem.patch
* mm-swap-dont-setpageworkingset-unconditionally-during-swapin.patch
* mm-memcg-slab-pre-allocate-obj_cgroups-for-slab-caches-with-slab_account.patch
* mm-memcg-slab-pre-allocate-obj_cgroups-for-slab-caches-with-slab_account-fix.patch
* mm-memcontrol-optimize-per-lruvec-stats-counter-memory-usage.patch
* mm-memcontrol-optimize-per-lruvec-stats-counter-memory-usage-checkpatch-fixes.patch
* mm-memcontrol-fix-nr_anon_thps-accounting-in-charge-moving.patch
* mm-memcontrol-convert-nr_anon_thps-account-to-pages.patch
* mm-memcontrol-convert-nr_file_thps-account-to-pages.patch
* mm-memcontrol-convert-nr_shmem_thps-account-to-pages.patch
* mm-memcontrol-convert-nr_shmem_pmdmapped-account-to-pages.patch
* mm-memcontrol-convert-nr_file_pmdmapped-account-to-pages.patch
* mm-memcontrol-make-the-slab-calculation-consistent.patch
* mm-memcg-revise-the-using-condition-of-lock_page_lruvec-function-series.patch
* mm-memcg-remove-rcu-locking-for-lock_page_lruvec-function-series.patch
* mm-memcg-add-swapcache-stat-for-memcg-v2.patch
* mm-memcg-add-swapcache-stat-for-memcg-v2-fix.patch
* mm-kmem-make-__memcg_kmem_uncharge-static.patch
* mm-page_counter-relayout-structure-to-reduce-false-sharing.patch
* mm-memcontrol-remove-redundant-null-check.patch
* mm-mmap-remove-unnecessary-local-variable.patch
* mm-fix-potential-pte_unmap_unlock-pte-error.patch
* mm-mmap-fix-the-adjusted-length-error.patch
* mm-optimizing-error-condition-detection-in-do_mprotect_pkey.patch
* mm-rmap-explicitly-reset-vma-anon_vma-in-unlink_anon_vmas.patch
* mm-mremap-unlink-anon_vmas-when-mremap-with-mremap_dontunmap-success.patch
* mm-page_reporting-use-list_entry_is_head-in-page_reporting_cycle.patch
* vmalloc-remove-redundant-null-check.patch
* kasan-prefix-global-functions-with-kasan_.patch
* kasan-clarify-hw_tags-impact-on-tbi.patch
* kasan-clean-up-comments-in-tests.patch
* kasan-add-macros-to-simplify-checking-test-constraints.patch
* kasan-add-match-all-tag-tests.patch
* kasan-add-match-all-tag-tests-fix.patch
* kasan-arm64-allow-using-kunit-tests-with-hw_tags-mode.patch
* kasan-rename-config_test_kasan_module.patch
* kasan-add-compiler-barriers-to-kunit_expect_kasan_fail.patch
* kasan-adapt-kmalloc_uaf2-test-to-hw_tags-mode.patch
* kasan-fix-memory-corruption-in-kasan_bitops_tags-test.patch
* kasan-move-_ret_ip_-to-inline-wrappers.patch
* kasan-fix-bug-detection-via-ksize-for-hw_tags-mode.patch
* kasan-add-proper-page-allocator-tests.patch
* kasan-add-a-test-for-kmem_cache_alloc-free_bulk.patch
* kasan-dont-run-tests-when-kasan-is-not-enabled.patch
* kasan-remove-redundant-config-option.patch
* kasan-remove-redundant-config-option-v3.patch
* mm-fix-prototype-warning-from-kernel-test-robot.patch
* mm-rename-memmap_init-and-memmap_init_zone.patch
* mm-simplify-parater-of-function-memmap_init_zone.patch
* mm-simplify-parameter-of-setup_usemap.patch
* mm-remove-unneeded-local-variable-in-free_area_init_core.patch
* mm-huge_memoryc-update-tlb-entry-if-pmd-is-changed.patch
* mips-do-not-call-flush_tlb_all-when-setting-pmd-entry.patch
* mm-hugetlb-fix-potential-double-free-in-hugetlb_register_node-error-path.patch
* mm-hugetlbc-fix-unnecessary-address-expansion-of-pmd-sharing.patch
* mm-hugetlb-avoid-unnecessary-hugetlb_acct_memory-call.patch
* mm-hugetlb-use-helper-huge_page_order-and-pages_per_huge_page.patch
* mm-hugetlb-grab-head-page-refcount-once-per-group-of-subpages.patch
* mm-hugetlb-refactor-subpage-recording.patch
* mm-vmscan-__isolate_lru_page_prepare-clean-up.patch
* mm-workingsetc-avoid-unnecessary-max_nodes-estimation-in-count_shadow_nodes.patch
* mm-use-add_page_to_lru_list.patch
* mm-shuffle-lru-list-addition-and-deletion-functions.patch
* mm-dont-pass-enum-lru_list-to-lru-list-addition-functions.patch
* mm-dont-pass-enum-lru_list-to-trace_mm_lru_insertion.patch
* mm-dont-pass-enum-lru_list-to-del_page_from_lru_list.patch
* mm-add-__clear_page_lru_flags-to-replace-page_off_lru.patch
* mm-vm_bug_on-lru-page-flags.patch
* mm-fold-page_lru_base_type-into-its-sole-caller.patch
* mm-fold-__update_lru_size-into-its-sole-caller.patch
* mm-make-lruvec_lru_size-static.patch
* hugetlb-use-pageprivate-for-hugetlb-specific-page-flags.patch
* hugetlb-convert-page_huge_active-hpagemigratable-flag.patch
* hugetlb-only-set-hpagemigratable-for-migratable-hstates.patch
* hugetlb-convert-pagehugetemporary-to-hpagetemporary-flag.patch
* hugetlb-convert-pagehugefreed-to-hpagefreed-flag.patch
* z3fold-remove-unused-attribute-for-release_z3fold_page.patch
* z3fold-simplify-the-zhdr-initialization-code-in-init_z3fold_page.patch
* mm-compaction-remove-rcu_read_lock-during-page-compaction.patch
* mm-compaction-remove-duplicated-vm_bug_on_page-pagelocked.patch
* mm-compaction-correct-deferral-logic-for-proactive-compaction.patch
* mm-compactoin-fix-edge-case-of-fast_find_migrateblock.patch
* numa-balancing-migrate-on-fault-among-multiple-bound-nodes.patch
* mm-oom-fix-a-comment-in-dump_task.patch
* mm-hugetlb-change-hugetlb_reserve_pages-to-type-bool.patch
* hugetlbfs-remove-special-hugetlbfs_set_page_dirty.patch
* hugetlbfs-remove-useless-bug_oninode-in-hugetlbfs_setattr.patch
* hugetlbfs-use-helper-macro-default_hstate-in-init_hugetlbfs_fs.patch
* hugetlbfs-correct-obsolete-function-name-in-hugetlbfs_read_iter.patch
* hugetlbfs-remove-meaningless-variable-avoid_reserve.patch
* hugetlbfs-make-hugepage-size-conversion-more-readable.patch
* mm-migrate-remove-unneeded-semicolons.patch
* mm-make-pagecache-tagged-lookups-return-only-head-pages.patch
* mm-shmem-use-pagevec_lookup-in-shmem_unlock_mapping.patch
* mm-swap-optimise-get_shadow_from_swap_cache.patch
* mm-add-fgp_entry.patch
* mm-filemap-rename-find_get_entry-to-mapping_get_entry.patch
* mm-filemap-add-helper-for-finding-pages.patch
* mm-filemap-add-helper-for-finding-pages-fix.patch
* mm-filemap-add-mapping_seek_hole_data.patch
* mm-filemap-add-mapping_seek_hole_data-fix.patch
* iomap-use-mapping_seek_hole_data.patch
* mm-add-and-use-find_lock_entries.patch
* mm-add-and-use-find_lock_entries-fix.patch
* mm-add-an-end-parameter-to-find_get_entries.patch
* mm-add-an-end-parameter-to-pagevec_lookup_entries.patch
* mm-remove-nr_entries-parameter-from-pagevec_lookup_entries.patch
* mm-pass-pvec-directly-to-find_get_entries.patch
* mm-remove-pagevec_lookup_entries.patch
* mmthpshmem-limit-shmem-thp-alloc-gfp_mask.patch
* mmthpshm-limit-gfp-mask-to-no-more-than-specified.patch
* mmthpshmem-make-khugepaged-obey-tmpfs-mount-flags.patch
* mm-cma-allocate-cma-areas-bottom-up.patch
* mm-cma-allocate-cma-areas-bottom-up-fix.patch
* mm-cma-allocate-cma-areas-bottom-up-fix-2.patch
* mm-cma-allocate-cma-areas-bottom-up-fix-3.patch
* mm-cma-allocate-cma-areas-bottom-up-fix-3-fix.patch
* mm-vmstat-fix-proc-sys-vm-stat_refresh-generating-false-warnings.patch
* mm-vmstat-fix-proc-sys-vm-stat_refresh-generating-false-warnings-fix.patch
* mm-vmstat-fix-proc-sys-vm-stat_refresh-generating-false-warnings-fix-2.patch
* mm-vmstatc-erase-latency-in-vmstat_shepherd.patch
* mm-move-pfn_to_online_page-out-of-line.patch
* mm-teach-pfn_to_online_page-to-consider-subsection-validity.patch
* mm-teach-pfn_to_online_page-about-zone_device-section-collisions.patch
* mm-teach-pfn_to_online_page-about-zone_device-section-collisions-fix.patch
* mm-fix-memory_failure-handling-of-dax-namespace-metadata.patch
* mm-memory_hotplug-rename-all-existing-memhp-into-mhp.patch
* mm-rmap-correct-some-obsolete-comments-of-anon_vma.patch
* mm-zswap-clean-up-confusing-comment.patch
* mm-zswap-add-the-flag-can_sleep_mapped.patch
* mm-zswap-add-the-flag-can_sleep_mapped-fix.patch
* mm-zswap-add-the-flag-can_sleep_mapped-fix-2.patch
* mm-zswap-fix-variable-entry-is-uninitialized-when-used.patch
* mm-set-the-sleep_mapped-to-true-for-zbud-and-z3fold.patch
* mm-zsmallocc-convert-to-use-kmem_cache_zalloc-in-cache_alloc_zspage.patch
* mm-remove-arch_remap-and-mm-arch-hooksh.patch
* mm-page-flagsh-typo-fix-it-if.patch
* mm-dmapool-use-might_alloc.patch
* bdi-use-might_alloc.patch
* bdi-use-might_alloc-fix.patch
* mm-early_ioremapc-use-__func__-instead-of-function-name.patch
* mm-add-kernel-electric-fence-infrastructure.patch
* mm-add-kernel-electric-fence-infrastructure-fix.patch
* mm-add-kernel-electric-fence-infrastructure-fix-2.patch
* mm-add-kernel-electric-fence-infrastructure-fix-3.patch
* mm-add-kernel-electric-fence-infrastructure-fix-4.patch
* mm-add-kernel-electric-fence-infrastructure-fix-5.patch
* x86-kfence-enable-kfence-for-x86.patch
* x86-kfence-enable-kfence-for-x86-fix.patch
* arm64-kfence-enable-kfence-for-arm64.patch
* arm64-kfence-enable-kfence-for-arm64-fix.patch
* kfence-use-pt_regs-to-generate-stack-trace-on-faults.patch
* mm-kfence-insert-kfence-hooks-for-slab.patch
* mm-kfence-insert-kfence-hooks-for-slub.patch
* kfence-kasan-make-kfence-compatible-with-kasan.patch
* kfence-kasan-make-kfence-compatible-with-kasan-fix.patch
* kfence-documentation-add-kfence-documentation.patch
* kfence-documentation-add-kfence-documentation-fix.patch
* kfence-add-test-suite.patch
* kfence-add-test-suite-fix.patch
* kfence-add-test-suite-fix-2.patch
* maintainers-add-entry-for-kfence.patch
* tracing-add-error_report_end-trace-point.patch
* kfence-use-error_report_end-tracepoint.patch
* kasan-use-error_report_end-tracepoint.patch
* info-task-hung-in-generic_file_write_iter.patch
* info-task-hung-in-generic_file_write-fix.patch
* kernel-hung_taskc-monitor-killed-tasks.patch
* alpha-remove-config_experimental-from-defconfigs.patch
* proc-wchan-use-printk-format-instead-of-lookup_symbol_name.patch
* sysctlc-fix-underflow-value-setting-risk-in-vm_table.patch
* proc-sysctl-make-protected_-world-readable.patch
* lib-genalloc-change-return-type-to-unsigned-long-for-bitmap_set_ll.patch
* lib-optimize-cpumask_local_spread.patch
* lib-optimize-cpumask_local_spread-v8.patch
* stringh-move-fortified-functions-definitions-in-a-dedicated-header.patch
* lib-hexdump-introduce-dump_prefix_unhashed-for-unhashed-addresses.patch
* mm-page_poison-use-unhashed-address-in-hexdump-for-check_poison_mem.patch
* bitops-spelling-s-synomyn-synonym.patch
* checkpatch-improve-blank-line-after-declaration-test.patch
* checkpatch-ignore-warning-designated-initializers-using-nr_cpus.patch
* checkpatch-trivial-style-fixes.patch
* checkpatch-prefer-ftrace-over-function-entry-exit-printks.patch
* checkpatch-improve-typecast_int_constant-test-message.patch
* checkpatch-add-warning-for-avoiding-l-prefix-symbols-in-assembly-files.patch
* checkpatch-add-kmalloc_array_node-to-unnecessary-oom-message-check.patch
* init-versionc-remove-version_linux_version_code-symbol.patch
* aio-simplify-read_events.patch
* scripts-gdb-fix-list_for_each.patch
* initramfs-panic-with-memory-information.patch
* initramfs-panic-with-memory-information-fix.patch
  linux-next.patch
  linux-next-git-rejects.patch
* mm-add-definition-of-pmd_page_order.patch
* mmap-make-mlock_future_check-global.patch
* riscv-kconfig-make-direct-map-manipulation-options-depend-on-mmu.patch
* set_memory-allow-set_direct_map__noflush-for-multiple-pages.patch
* set_memory-allow-querying-whether-set_direct_map_-is-actually-enabled.patch
* set_memory-allow-querying-whether-set_direct_map_-is-actually-enabled-fix.patch
* mm-introduce-memfd_secret-system-call-to-create-secret-memory-areas.patch
* secretmem-use-pmd-size-pages-to-amortize-direct-map-fragmentation.patch
* secretmem-add-memcg-accounting.patch
* pm-hibernate-disable-when-there-are-active-secretmem-users.patch
* arch-mm-wire-up-memfd_secret-system-call-where-relevant.patch
* secretmem-test-add-basic-selftest-for-memfd_secret2.patch
  make-sure-nobodys-leaking-resources.patch
  releasing-resources-with-children.patch
  mutex-subsystem-synchro-test-module.patch
  kernel-forkc-export-kernel_thread-to-modules.patch
  workaround-for-a-pci-restoring-bug.patch
