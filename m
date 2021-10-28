Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F8043D898
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 03:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhJ1Bf3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 21:35:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhJ1Bf2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 21:35:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46B6161108;
        Thu, 28 Oct 2021 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1635384782;
        bh=o+HznM0/zPW3Hd2agBmi2FKVt9yxQof+m9UV7J/0EOU=;
        h=Date:From:To:Subject:From;
        b=wTrLzO69BcYP6ai7V5c8ZJoeIJnAb4WlIa3JY2Yuh9RFxODL/pLLayrHoL4IT+WBy
         9X8ghtr9OX0EqNri8TPba7WIuAn/q8CWrNJEhCwoamdNxOmo0ck6BLyjogHi0qEan8
         QI3t5IpTjolnM+slhJhscvrNXZMjALTjLTWaDC40=
Date:   Wed, 27 Oct 2021 18:33:01 -0700
From:   akpm@linux-foundation.org
To:     broonie@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au
Subject:  mmotm 2021-10-27-18-32 uploaded
Message-ID: <20211028013301.pr6m56GoH%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The mm-of-the-moment snapshot 2021-10-27-18-32 has been uploaded to

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



This mmotm tree contains the following patches against 5.15-rc7:
(patches marked "*" will be included in linux-next)

  origin.patch
* fix-application-of-sizeof-to-pointer.patch
* kasan-test-use-underlying-string-helpers.patch
* kasan-test-use-underlying-string-helpers-checkpatch-fixes.patch
* memcg-page_alloc-skip-bulk-allocator-for-__gfp_account.patch
* mm-hwpoison-remove-the-unnecessary-thp-check.patch
* mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault.patch
* mm-prevent-a-race-between-process_mrelease-and-exit_mmap.patch
* ocfs2-race-between-searching-chunks-and-release-journal_head-from-buffer_head.patch
* mm-secretmem-avoid-letting-secretmem_users-drop-to-zero.patch
* mm-bdi-initialize-bdi_min_ratio-when-bdi-unregister.patch
* mm-bdi-initialize-bdi_min_ratio-when-bdi-unregister-fix.patch
* mm-vmalloc-fix-numa-spreading-for-large-hash-tables.patch
* mm-thp-bail-out-early-in-collapse_file-for-writeback-page.patch
* mm-khugepaged-skip-huge-page-collapse-for-special-files.patch
* mm-khugepaged-skip-huge-page-collapse-for-special-files-fix.patch
* proc-kpageflags-prevent-an-integer-overflow-in-stable_page_flags.patch
* proc-kpageflags-do-not-use-uninitialized-struct-pages.patch
* procfs-prevent-unpriveleged-processes-accessing-fdinfo-dir.patch
* scripts-spellingtxt-add-more-spellings-to-spellingtxt.patch
* scripts-spellingtxt-fix-mistake-version-of-synchronization.patch
* scripts-decodecode-fix-faulting-instruction-no-print-when-oppsfile-is-dos-format.patch
* ocfs2-fix-handle-refcount-leak-in-two-exception-handling-paths.patch
* ocfs2-cleanup-journal-init-and-shutdown.patch
* ocfs2-dlm-remove-redundant-assignment-of-variable-ret.patch
* ocfs2-fix-data-corruption-on-truncate.patch
* ocfs2-do-not-zero-pages-beyond-i_size.patch
* ocfs2-reflink-deadlock-when-clone-file-to-the-same-directory-simultaneously.patch
* ocfs2-clear-links-count-in-ocfs2_mknod-if-an-error-occurs.patch
* ocfs2-fix-ocfs2-corrupt-when-iputting-an-inode.patch
* posix-acl-avoid-wempty-body-warning.patch
* d_path-fix-kernel-doc-validator-complaining.patch
  mm.patch
* mm-move-kvmalloc-related-functions-to-slabh.patch
* mm-move-kvmalloc-related-functions-to-slabh-fix.patch
* mm-remove-useless-lines-in-enable_cpucache.patch
* slub-add-back-check-for-free-nonslab-objects.patch
* mm-slub-change-percpu-partial-accounting-from-objects-to-pages.patch
* mm-slub-increase-default-cpu-partial-list-sizes.patch
* mm-slub-use-prefetchw-instead-of-prefetch.patch
* mm-dont-include-linux-daxh-in-linux-mempolicyh.patch
* lib-stackdepot-include-gfph.patch
* lib-stackdepot-remove-unused-function-argument.patch
* lib-stackdepot-introduce-__stack_depot_save.patch
* kasan-common-provide-can_alloc-in-kasan_save_stack.patch
* kasan-generic-introduce-kasan_record_aux_stack_noalloc.patch
* workqueue-kasan-avoid-alloc_pages-when-recording-stack.patch
* kasan-fix-tag-for-large-allocations-when-using-config_slab.patch
* kasan-test-add-memcpy-test-that-avoids-out-of-bounds-write.patch
* mm-smaps-fix-shmem-pte-hole-swap-calculation.patch
* mm-smaps-use-vma-vm_pgoff-directly-when-counting-partial-swap.patch
* mm-smaps-simplify-shmem-handling-of-pte-holes.patch
* mm-debug_vm_pgtable-dont-use-__p000-directly.patch
* kasan-test-bypass-__alloc_size-checks.patch
* rapidio-avoid-bogus-__alloc_size-warning.patch
* compiler-attributes-add-__alloc_size-for-better-bounds-checking.patch
* slab-clean-up-function-prototypes.patch
* slab-add-__alloc_size-attributes-for-better-bounds-checking.patch
* mm-kvmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
* mm-vmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
* mm-page_alloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
* percpu-add-__alloc_size-attributes-for-better-bounds-checking.patch
* kasan-test-consolidate-workarounds-for-unwanted-__alloc_size-protection.patch
* mm-fix-a-comment.patch
* mm-page_ownerc-modify-the-type-of-argument-order-in-some-functions.patch
* mm-page_ownerc-modify-the-type-of-argument-order-in-some-functions-fix.patch
* mm-stop-filemap_read-from-grabbing-a-superfluous-page.patch
* mm-export-bdi_unregister.patch
* mtd-call-bdi_unregister-explicitly.patch
* fs-explicitly-unregister-per-superblock-bdis.patch
* mm-dont-automatically-unregister-bdis.patch
* mm-simplify-bdi-refcounting.patch
* mm-simplify-bdi-refcounting-fix.patch
* mm-simplify-bdi-refcounting-fix-fix.patch
* mm-dont-read-i_size-of-inode-unless-we-need-it.patch
* mm-remove-bogus-vm_bug_on.patch
* mm-move-more-expensive-part-of-xa-setup-out-of-mapping-check.patch
* vfs-keep-inodes-with-page-cache-off-the-inode-shrinker-lru.patch
* mm-gup-further-simplify-__gup_device_huge.patch
* mm-swapfile-remove-needless-request_queue-null-pointer-check.patch
* mm-swapfile-fix-an-integer-overflow-in-swap_show.patch
* mm-optimise-put_pages_list.patch
* mm-memcg-drop-swp_entry_t-in-mc_handle_file_pte.patch
* memcg-flush-stats-only-if-updated.patch
* memcg-unify-memcg-stat-flushing.patch
* mm-memcg-remove-obsolete-memcg_free_kmem.patch
* mm-list_lruc-prefer-struct_size-over-open-coded-arithmetic.patch
* memcg-kmem-further-deprecate-kmemlimit_in_bytes.patch
* memcg-kmem-further-deprecate-kmemlimit_in_bytes-checkpatch-fixes.patch
* memcg-kmem-further-deprecate-kmemlimit_in_bytes-fix.patch
* mm-list_lru-remove-holding-lru-lock.patch
* mm-list_lru-fix-the-return-value-of-list_lru_count_one.patch
* mm-memcontrol-remove-kmemcg_id-reparenting.patch
* mm-memcontrol-remove-the-kmem-states.patch
* mm-list_lru-only-add-memcg-aware-lrus-to-the-global-lru-list.patch
* mm-oom-pagefault_out_of_memory-dont-force-global-oom-for-dying-tasks.patch
* mm-oom-do-not-trigger-out_of_memory-from-the-pf.patch
* memcg-prohibit-unconditional-exceeding-the-limit-of-dying-tasks.patch
* mm-mmapc-fix-a-data-race-of-mm-total_vm.patch
* mm-use-__pfn_to_section-instead-of-open-coding-it.patch
* mm-memory-avoid-unnecessary-kernel-user-pointer-conversion.patch
* mm-use-correct-vma-flags-when-freeing-page-tables.patch
* mm-shmem-unconditionally-set-pte-dirty-in-mfill_atomic_install_pte.patch
* mm-clear-vmf-pte-after-pte_unmap_same-returns.patch
* mm-drop-first_index-last_index-in-zap_details.patch
* mm-add-zap_skip_check_mapping-helper.patch
* mm-introduce-pmd_install-helper.patch
* mm-remove-redundant-smp_wmb.patch
* documentation-update-pagemap-with-shmem-exceptions.patch
* lazy-tlb-introduce-lazy-mm-refcount-helper-functions.patch
* lazy-tlb-allow-lazy-tlb-mm-refcounting-to-be-configurable.patch
* lazy-tlb-shoot-lazies-a-non-refcounting-lazy-tlb-option.patch
* powerpc-64s-enable-mmu_lazy_tlb_shootdown.patch
* memory-remove-unused-config_mem_block_size.patch
* mm-mprotectc-avoid-repeated-assignment-in-do_mprotect_pkey.patch
* mm-mremap-dont-account-pages-in-vma_to_resize.patch
* io-mapping-remove-fallback-for-writecombine.patch
* mm-mmap_lock-remove-redundant-newline-in-tp_printk.patch
* mm-mmap_lock-use-declare_event_class-and-define_event_fn.patch
* mm-vmalloc-repair-warn_allocs-in-__vmalloc_area_node.patch
* mm-vmalloc-dont-allow-vm_no_guard-on-vmap.patch
* mm-vmalloc-make-show_numa_info-aware-of-hugepage-mappings.patch
* mm-vmalloc-make-sure-to-dump-unpurged-areas-in-proc-vmallocinfo.patch
* mm-vmalloc-do-not-adjust-the-search-size-for-alignment-overhead.patch
* mm-vmalloc-check-various-alignments-when-debugging.patch
* vmalloc-back-off-when-the-current-task-is-oom-killed.patch
* vmalloc-choose-a-better-start-address-in-vm_area_register_early.patch
* arm64-support-page-mapping-percpu-first-chunk-allocator.patch
* kasan-arm64-fix-pcpu_page_first_chunk-crash-with-kasan_vmalloc.patch
* kasan-arm64-fix-pcpu_page_first_chunk-crash-with-kasan_vmalloc-fix.patch
* mm-vmalloc-be-more-explicit-about-supported-gfp-flags.patch
* mm-vmalloc-introduce-alloc_pages_bulk_array_mempolicy-to-accelerate-memory-allocation.patch
* mm-vmalloc-introduce-alloc_pages_bulk_array_mempolicy-to-accelerate-memory-allocation-checkpatch-fixes.patch
* mm-vmalloc-introduce-alloc_pages_bulk_array_mempolicy-to-accelerate-memory-allocation-fix.patch
* mm-vmalloc-introduce-alloc_pages_bulk_array_mempolicy-to-accelerate-memory-allocation-fix-2.patch
* mm-large-system-hash-avoid-possible-null-deref-in-alloc_large_system_hash.patch
* mm-page_allocc-remove-meaningless-vm_bug_on-in-pindex_to_order.patch
* mm-page_allocc-simplify-the-code-by-using-macro-k.patch
* mm-page_allocc-fix-obsolete-comment-in-free_pcppages_bulk.patch
* mm-page_allocc-use-helper-function-zone_spans_pfn.patch
* mm-page_allocc-avoid-allocating-highmem-pages-via-alloc_pages_exact.patch
* mm-page_alloc-print-node-fallback-order.patch
* mm-page_alloc-use-accumulated-load-when-building-node-fallback-list.patch
* mm-move-node_reclaim_distance-to-fix-numa-without-smp.patch
* mm-move-fold_vm_numa_events-to-fix-numa-without-smp.patch
* mm-do-not-acquire-zone-lock-in-is_free_buddy_page.patch
* mm-page_alloc-detect-allocation-forbidden-by-cpuset-and-bail-out-early.patch
* mm-show-watermark_boost-of-zone-in-zoneinfo.patch
* mm-create-a-new-system-state-and-fix-core_kernel_text.patch
* mm-make-generic-arch_is_kernel_initmem_freed-do-what-it-says.patch
* powerpc-use-generic-version-of-arch_is_kernel_initmem_freed.patch
* s390-use-generic-version-of-arch_is_kernel_initmem_freed.patch
* mm-page_alloc-use-migrate_disable-in-drain_local_pages_wq.patch
* mm-page_alloc-use-clamp-to-simplify-code.patch
* mm-fix-data-race-in-pagepoisoned.patch
* mm-memory_failure-constify-static-mm_walk_ops.patch
* mm-filemap-coding-style-cleanup-for-filemap_map_pmd.patch
* mm-hwpoison-refactor-refcount-check-handling.patch
* mm-shmem-dont-truncate-page-if-memory-failure-happens.patch
* mm-shmem-dont-truncate-page-if-memory-failure-happens-fix-2.patch
* mm-hwpoison-handle-non-anonymous-thp-correctly.patch
* mm-hugetlb-drop-__unmap_hugepage_range-definition-from-hugetlbh.patch
* hugetlb-add-demote-hugetlb-page-sysfs-interfaces.patch
* hugetlb-add-demote-hugetlb-page-sysfs-interfaces-fix.patch
* mm-cma-add-cma_pages_valid-to-determine-if-pages-are-in-cma.patch
* hugetlb-be-sure-to-free-demoted-cma-pages-to-cma.patch
* hugetlb-add-demote-bool-to-gigantic-page-routines.patch
* hugetlb-add-hugetlb-demote-page-support.patch
* hugetlb-add-hugetlb-demote-page-support-v4.patch
* mmhugetlb-remove-mlock-ulimit-for-shm_hugetlb.patch
* mm-khugepaged-recalculate-min_free_kbytes-after-stopping-khugepaged.patch
* mm-hugepages-add-mremap-support-for-hugepage-backed-vma.patch
* mm-hugepages-add-hugetlb-vma-mremap-test.patch
* mm-hugepages-add-hugetlb-vma-mremap-test-v8.patch
* mm-hugepages-add-hugetlb-vma-mremap-test-v8-fix.patch
* hugetlb-support-node-specified-when-using-cma-for-gigantic-hugepages.patch
* mm-remove-duplicate-include-in-hugepage-mremapc.patch
* hugetlb_cgroup-remove-unused-hugetlb_cgroup_from_counter-macro.patch
* hugetlb-replace-the-obsolete-hugetlb_instantiation_mutex-in-the-comments.patch
* hugetlb-remove-redundant-validation-in-has_same_uncharge_info.patch
* hugetlb-remove-redundant-vm_bug_on-in-add_reservation_in_range.patch
* hugetlb-remove-unnecessary-set_page_count-in-prep_compound_gigantic_page.patch
* userfaultfd-selftests-dont-rely-on-gnu-extensions-for-random-numbers.patch
* userfaultfd-selftests-fix-feature-support-detection.patch
* userfaultfd-selftests-fix-calculation-of-expected-ioctls.patch
* mm-page_isolation-fix-potential-missing-call-to-unset_migratetype_isolate.patch
* mm-page_isolation-guard-against-possible-putback-unisolated-page.patch
* mm-vmscanc-fix-wunused-but-set-variable-warning.patch
* mm-vmscan-throttle-reclaim-until-some-writeback-completes-if-congested.patch
* mm-vmscan-throttle-reclaim-and-compaction-when-too-may-pages-are-isolated.patch
* mm-vmscan-throttle-reclaim-when-no-progress-is-being-made.patch
* mm-writeback-throttle-based-on-page-writeback-instead-of-congestion.patch
* mm-page_alloc-remove-the-throttling-logic-from-the-page-allocator.patch
* mm-vmscan-centralise-timeout-values-for-reclaim_throttle.patch
* mm-vmscan-increase-the-timeout-if-page-reclaim-is-not-making-progress.patch
* mm-vmscan-delay-waking-of-tasks-throttled-on-noprogress.patch
* mm-vmpressure-fix-data-race-with-memcg-socket_pressure.patch
* tools-vm-page_owner_sortc-count-and-sort-by-mem.patch
* tools-vm-page-typesc-make-walk_file-aware-of-address-range-option.patch
* tools-vm-page-typesc-move-show_file-to-summary-output.patch
* tools-vm-page-typesc-print-file-offset-in-hexadecimal.patch
* mm-mempolicy-convert-from-atomic_t-to-refcount_t-on-mempolicy-refcnt.patch
* mm-mempolicy-convert-from-atomic_t-to-refcount_t-on-mempolicy-refcnt-fix.patch
* arch_numa-simplify-numa_distance-allocation.patch
* xen-x86-free_p2m_page-use-memblock_free_ptr-to-free-a-virtual-pointer.patch
* memblock-drop-memblock_free_early_nid-and-memblock_free_early.patch
* memblock-stop-aliasing-__memblock_free_late-with-memblock_free_late.patch
* memblock-rename-memblock_free-to-memblock_phys_free.patch
* memblock-use-memblock_free-for-freeing-virtual-pointers.patch
* memblock-use-memblock_free-for-freeing-virtual-pointers-fix.patch
* mm-mark-the-oom-reaper-thread-as-freezable.patch
* oom_kill-oom_score_adj-broken-for-processes-with-small-memory-usage.patch
* hugetlbfs-extend-the-definition-of-hugepages-parameter-to-support-node-allocation.patch
* mm-migrate-de-duplicate-migrate_reason-strings.patch
* mm-migrate-make-demotion-knob-depend-on-migration.patch
* selftests-vm-transhuge-stress-fix-ram-size-thinko.patch
* mm-thp-lock-filemap-when-truncating-page-cache.patch
* mm-thp-fix-incorrect-unmap-behavior-for-private-pages.patch
* mm-readaheadc-fix-incorrect-comments-for-get_init_ra_size.patch
* mm-nommu-kill-arch_get_unmapped_area.patch
* selftest-vm-fix-ksm-selftest-to-run-with-different-numa-topologies.patch
* selftests-vm-add-ksm-huge-pages-merging-time-test.patch
* mm-vmstat-annotate-data-race-for-zone-free_areanr_free.patch
* mm-vmstat-annotate-data-race-for-zone-free_areanr_free-fix.patch
* mm-vmstatc-make-extfrag_index-show-more-pretty.patch
* selftests-vm-make-madv_populate_readwrite-use-in-tree-headers.patch
* mm-memory_hotplug-add-static-qualifier-for-online_policy_to_str.patch
* memory-hotplugrst-fix-two-instances-of-movablecore-that-should-be-movable_node.patch
* memory-hotplugrst-fix-wrong-sys-module-memory_hotplug-parameters-path.patch
* memory-hotplugrst-document-the-auto-movable-online-policy.patch
* memory-hotplugrst-document-the-auto-movable-online-policy-v2.patch
* mm-memory_hotplug-remove-config_x86_64_acpi_numa-dependency-from-config_memory_hotplug.patch
* mm-memory_hotplug-remove-config_memory_hotplug_sparse.patch
* mm-memory_hotplug-restrict-config_memory_hotplug-to-64-bit.patch
* mm-memory_hotplug-remove-highmem-leftovers.patch
* mm-memory_hotplug-remove-stale-function-declarations.patch
* x86-remove-memory-hotplug-support-on-x86_32.patch
* mm-memory_hotplug-handle-memblock_add_node-failures-in-add_memory_resource.patch
* memblock-improve-memblock_hotplug-documentation.patch
* memblock-allow-to-specify-flags-with-memblock_add_node.patch
* memblock-add-memblock_driver_managed-to-mimic-ioresource_sysram_driver_managed.patch
* mm-memory_hotplug-indicate-memblock_driver_managed-with-ioresource_sysram_driver_managed.patch
* mm-memory_hotplug-make-hwpoisoned-dirty-swapcache-pages-unmovable.patch
* mm-rmapc-avoid-double-faults-migrating-device-private-pages.patch
* mm-rmap-convert-from-atomic_t-to-refcount_t-on-anon_vma-refcount.patch
* mm-disable-zsmalloc-on-preempt_rt.patch
* mm-zsmallocc-close-race-window-between-zs_pool_dec_isolated-and-zs_unregister_migration.patch
* mm-zsmallocc-combine-two-atomic-ops-in-zs_pool_dec_isolated.patch
* mm-highmem-remove-deprecated-kmap_atomic.patch
* zram_drv-allow-reclaim-on-bio_alloc.patch
* zram-off-by-one-in-read_block_state.patch
* zram-introduce-an-aged-idle-interface.patch
* zram-introduce-an-aged-idle-interface-v5.patch
* zram-introduce-an-aged-idle-interface-v6.patch
* mm-remove-hardened_usercopy_fallback.patch
* include-linux-mmh-move-nr_free_buffer_pages-from-swaph-to-mmh.patch
* stacktrace-move-filter_irq_stacks-to-kernel-stacktracec.patch
* kfence-count-unexpectedly-skipped-allocations.patch
* kfence-move-saving-stack-trace-of-allocations-into-__kfence_alloc.patch
* kfence-limit-currently-covered-allocations-when-pool-nearly-full.patch
* kfence-limit-currently-covered-allocations-when-pool-nearly-full-fix.patch
* kfence-limit-currently-covered-allocations-when-pool-nearly-full-fix-fix.patch
* kfence-add-note-to-documentation-about-skipping-covered-allocations.patch
* kfence-test-use-kunit_skip-to-skip-tests.patch
* kfence-shorten-critical-sections-of-alloc-free.patch
* kfence-always-use-static-branches-to-guard-kfence_alloc.patch
* kfence-default-to-dynamic-branch-instead-of-static-keys-mode.patch
* mm-damon-grammar-s-works-work.patch
* documentation-vm-move-user-guides-to-admin-guide-mm.patch
* maintainers-update-seongjaes-email-address.patch
* docs-vm-damon-remove-broken-reference.patch
* include-linux-damonh-fix-kernel-doc-comments-for-damon_callback.patch
* mm-damon-core-print-kdamond-start-log-in-debug-mode-only.patch
* mm-damon-remove-unnecessary-do_exit-from-kdamond.patch
* mm-damon-neednt-hold-kdamond_lock-to-print-pid-of-kdamond.patch
* mm-damon-core-nullify-pointer-ctx-kdamond-with-a-null.patch
* mm-damon-core-account-age-of-target-regions.patch
* mm-damon-core-implement-damon-based-operation-schemes-damos.patch
* mm-damon-vaddr-support-damon-based-operation-schemes.patch
* mm-damon-dbgfs-support-damon-based-operation-schemes.patch
* mm-damon-schemes-implement-statistics-feature.patch
* selftests-damon-add-schemes-debugfs-tests.patch
* docs-admin-guide-mm-damon-document-damon-based-operation-schemes.patch
* mm-damon-dbgfs-allow-users-to-set-initial-monitoring-target-regions.patch
* mm-damon-dbgfs-test-add-a-unit-test-case-for-init_regions.patch
* docs-admin-guide-mm-damon-document-init_regions-feature.patch
* mm-damon-vaddr-separate-commonly-usable-functions.patch
* mm-damon-vaddr-separate-commonly-usable-functions-fix.patch
* mm-damon-implement-primitives-for-physical-address-space-monitoring.patch
* mm-damon-dbgfs-support-physical-memory-monitoring.patch
* docs-damon-document-physical-memory-monitoring-support.patch
* mm-damon-vaddr-constify-static-mm_walk_ops.patch
* mm-damon-dbgfs-remove-unnecessary-variables.patch
* mm-damon-paddr-support-the-pageout-scheme.patch
* mm-damon-paddr-support-the-pageout-scheme-fix.patch
* mm-damon-schemes-implement-size-quota-for-schemes-application-speed-control.patch
* mm-damon-schemes-skip-already-charged-targets-and-regions.patch
* mm-damon-schemes-implement-time-quota.patch
* mm-damon-dbgfs-support-quotas-of-schemes.patch
* mm-damon-selftests-support-schemes-quotas.patch
* mm-damon-schemes-prioritize-regions-within-the-quotas.patch
* mm-damon-vaddrpaddr-support-pageout-prioritization.patch
* mm-damon-dbgfs-support-prioritization-weights.patch
* tools-selftests-damon-update-for-regions-prioritization-of-schemes.patch
* mm-damon-schemes-activate-schemes-based-on-a-watermarks-mechanism.patch
* mm-damon-dbgfs-support-watermarks.patch
* selftests-damon-support-watermarks.patch
* mm-damon-introduce-damon-based-reclamation-damon_reclaim.patch
* mm-damon-introduce-damon-based-reclamation-damon_reclaim-fix.patch
* documentation-admin-guide-mm-damon-add-a-document-for-damon_reclaim.patch
* mm-damon-remove-unnecessary-variable-initialization.patch
* mm-damon-dbgfs-add-adaptive_targets-list-check-before-enable-monitor_on.patch
* docs-admin-guide-mm-damon-start-fix-wrong-example-commands.patch
* docs-admin-guide-mm-damon-start-fix-a-wrong-link.patch
* docs-admin-guide-mm-damon-start-simplify-the-content.patch
* docs-admin-guide-mm-pagemap-wordsmith-page-flags-descriptions.patch
* mm-damon-simplify-stop-mechanism.patch
* info-task-hung-in-generic_file_write_iter.patch
* info-task-hung-in-generic_file_write-fix.patch
* kernel-hung_taskc-monitor-killed-tasks.patch
* procfs-do-not-list-tid-0-in-proc-pid-task.patch
* procfs-do-not-list-tid-0-in-proc-pid-task-fix.patch
* proc-test-that-proc-task-doesnt-contain-0.patch
* x86-xen-update-xen_oldmem_pfn_is_ram-documentation.patch
* x86-xen-simplify-xen_oldmem_pfn_is_ram.patch
* x86-xen-print-a-warning-when-hvmop_get_mem_type-fails.patch
* proc-vmcore-let-pfn_is_ram-return-a-bool.patch
* proc-vmcore-convert-oldmem_pfn_is_ram-callback-to-more-generic-vmcore-callbacks.patch
* virtio-mem-factor-out-hotplug-specifics-from-virtio_mem_init-into-virtio_mem_init_hotplug.patch
* virtio-mem-factor-out-hotplug-specifics-from-virtio_mem_probe-into-virtio_mem_init_hotplug.patch
* virtio-mem-factor-out-hotplug-specifics-from-virtio_mem_remove-into-virtio_mem_deinit_hotplug.patch
* virtio-mem-kdump-mode-to-sanitize-proc-vmcore-access.patch
* proc-allow-pid_revalidate-during-lookup_rcu.patch
* proc-sysctl-make-protected_-world-readable.patch
* kernelh-drop-unneeded-linux-kernelh-inclusion-from-other-headers.patch
* kernelh-drop-unneeded-linux-kernelh-inclusion-from-other-headers-fix.patch
* kernelh-split-out-container_of-and-typeof_member-macros.patch
* kunit-replace-kernelh-with-the-necessary-inclusions.patch
* list-replace-kernelh-with-the-necessary-inclusions.patch
* llist-replace-kernelh-with-the-necessary-inclusions.patch
* plist-replace-kernelh-with-the-necessary-inclusions.patch
* media-entity-replace-kernelh-with-the-necessary-inclusions.patch
* delay-replace-kernelh-with-the-necessary-inclusions.patch
* delay-replace-kernelh-with-the-necessary-inclusions-fix.patch
* sbitmap-replace-kernelh-with-the-necessary-inclusions.patch
* radix-tree-replace-kernelh-with-the-necessary-inclusions.patch
* generic-radix-tree-replace-kernelh-with-the-necessary-inclusions.patch
* generic-radix-tree-replace-kernelh-with-the-necessary-inclusions-fix.patch
* linux-container_ofh-switch-to-static_assert.patch
* maintainers-add-exec-binfmt-section-with-myself-and-eric.patch
* maintainers-rectify-entry-for-arm-toshiba-visconti-architecture.patch
* maintainers-rectify-entry-for-hikey960-onboard-usb-gpio-hub-driver.patch
* maintainers-rectify-entry-for-intel-keem-bay-drm-driver.patch
* maintainers-rectify-entry-for-allwinner-hardware-spinlock-support.patch
* lib-stackdepot-check-stackdepot-handle-before-accessing-slabs.patch
* lib-stackdepot-add-helper-to-print-stack-entries.patch
* lib-stackdepot-add-helper-to-print-stack-entries-into-buffer.patch
* lib-stackdepot-add-helper-to-print-stack-entries-into-buffer-v2.patch
* lib-stackdepot-add-helper-to-print-stack-entries-into-buffer-v3.patch
* lib-string_helpers-add-linux-stringh-for-strlen.patch
* lib-uninline-simple_strntoull-as-well.patch
* mm-scatterlist-replace-the-preemptible-warning-in-sg_miter_stop.patch
* const_structscheckpatch-add-a-few-sound-ops-structs.patch
* checkpatch-improve-export_symbol-test-for-export_symbol_ns-uses.patch
* checkpatch-get-default-codespell-dictionary-path-from-package-location.patch
* binfmt_elf-reintroduce-using-map_fixed_noreplace.patch
* elf-fix-overflow-in-total-mapping-size-calculation.patch
* elf-simplify-stack_alloc-macro.patch
* kallsyms-remove-arch-specific-text-and-data-check.patch
* kallsyms-fix-address-checks-for-kernel-related-range.patch
* sections-move-and-rename-core_kernel_data-to-is_kernel_core_data.patch
* sections-move-is_kernel_inittext-into-sectionsh.patch
* x86-mm-rename-__is_kernel_text-to-is_x86_32_kernel_text.patch
* sections-provide-internal-__is_kernel-and-__is_kernel_text-helper.patch
* mm-kasan-use-is_kernel-helper.patch
* extable-use-is_kernel_text-helper.patch
* powerpc-mm-use-core_kernel_text-helper.patch
* microblaze-use-is_kernel_text-helper.patch
* alpha-use-is_kernel_text-helper.patch
* ramfs-fix-mount-source-show-for-ramfs.patch
* init-make-unknown-command-line-param-message-clearer.patch
* init-mainc-silence-some-wunused-parameter-warnings.patch
* coda-avoid-null-pointer-dereference-from-a-bad-inode.patch
* coda-check-for-async-upcall-request-using-local-state.patch
* coda-remove-err-which-no-one-care.patch
* coda-avoid-flagging-null-inodes.patch
* coda-avoid-hidden-code-duplication-in-rename.patch
* coda-avoid-doing-bad-things-on-inode-type-changes-during-revalidation.patch
* coda-convert-from-atomic_t-to-refcount_t-on-coda_vm_ops-refcnt.patch
* coda-use-vmemdup_user-to-replace-the-open-code.patch
* coda-bump-module-version-to-72.patch
* nilfs2-replace-snprintf-in-show-functions-with-sysfs_emit.patch
* nilfs2-remove-filenames-from-file-comments.patch
* hfs-hfsplus-use-warn_on-for-sanity-check.patch
* hfsplus-fix-out-of-bounds-warnings-in-__hfsplus_setxattr.patch
* signal-remove-duplicate-include-in-signalh.patch
* seq_file-move-seq_escape-to-a-header.patch
* unshare-use-swap-to-make-code-cleaner.patch
* sysv-use-build_bug_on-instead-of-runtime-check.patch
* documentation-kcov-include-typesh-in-the-example.patch
* documentation-kcov-define-ip-in-the-example.patch
* kcov-allocate-per-cpu-memory-on-the-relevant-node.patch
* kcov-avoid-enabledisable-interrupts-if-in_task.patch
* kcov-replace-local_irq_save-with-a-local_lock_t.patch
* kernel-resource-clean-up-and-optimize-iomem_is_exclusive.patch
* kernel-resource-disallow-access-to-exclusive-system-ram-regions.patch
* virtio-mem-disallow-mapping-virtio-mem-memory-via-dev-mem.patch
* selftests-kselftest-runner-run_one-allow-running-non-executable-files.patch
* ipc-check-checkpoint_restore_ns_capable-to-modify-c-r-proc-files.patch
* ipc-check-checkpoint_restore_ns_capable-to-modify-c-r-proc-files-fix.patch
* ipc-ipc_sysctlc-remove-fallback-for-config_proc_sysctl.patch
* ipc-warn-if-trying-to-remove-ipc-object-which-is-absent.patch
* shm-extend-forced-shm-destroy-to-support-objects-from-several-ipc-nses.patch
  revert-acct_reclaim_writeback-for-next.patch
  linux-next.patch
  linux-next-rejects.patch
  linux-next-rejects-fix.patch
  make-btrfs-as-broken-due-to-an-inconsistent-api-change.patch
  restore-acct_reclaim_writeback-for-folio.patch
* mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault-vs-folios.patch
* lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc.patch
* lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc-fix.patch
* lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc-fix-2.patch
* lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc-fixup3.patch
* mm-allow-only-slub-on-preempt_rt.patch
* mm-migrate-simplify-the-file-backed-pages-validation-when-migrating-its-mapping.patch
* mm-migratec-remove-migrate_pfn_locked.patch
* mm-unexport-folio_memcg_unlock.patch
* mm-unexport-unlock_page_memcg.patch
* kasan-add-kasan-mode-messages-when-kasan-init.patch
  make-sure-nobodys-leaking-resources.patch
  releasing-resources-with-children.patch
  mutex-subsystem-synchro-test-module.patch
  kernel-forkc-export-kernel_thread-to-modules.patch
  workaround-for-a-pci-restoring-bug.patch
