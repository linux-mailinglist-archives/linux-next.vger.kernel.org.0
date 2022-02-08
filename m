Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE04AE573
	for <lists+linux-next@lfdr.de>; Wed,  9 Feb 2022 00:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236727AbiBHXcC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Feb 2022 18:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbiBHXcB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Feb 2022 18:32:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D5FC061576;
        Tue,  8 Feb 2022 15:31:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B706B81DB5;
        Tue,  8 Feb 2022 23:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CA6C004E1;
        Tue,  8 Feb 2022 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1644363117;
        bh=wC7u/lmWdYr22U3getUQEZfvJM1KDwNNlC28MGK6DIk=;
        h=Date:To:From:Subject:From;
        b=qGLnx2IGv3VHCwGd7UrxRg0En2hZxqmXS8Le89nRR0vedngQNaA/ddGric5MNww/c
         gH2/tVTK34/2BlLVV2Bcy0fSxP1GTsBP5BfRoGLhbZdQHyA+56ENGQVyAx/HkpVOtN
         CFsN0qCWfCxJh619TQdpCLwk4DWuLyLlddaIm4aA=
Date:   Tue, 08 Feb 2022 15:31:56 -0800
To:     broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mm-commits@vger.kernel.org, akpm@linux-foundation.org
From:   Andrew Morton <akpm@linux-foundation.org>
Subject: mmotm 2022-02-08-15-31 uploaded
Message-Id: <20220208233156.E2CA6C004E1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The mm-of-the-moment snapshot 2022-02-08-15-31 has been uploaded to

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



This mmotm tree contains the following patches against 5.17-rc3:
(patches marked "*" will be included in linux-next)

  origin.patch
* fs-binfmt_elf-fix-pt_load-p_align-values-for-loaders.patch
* fs-proc-task_mmuc-dont-read-mapcount-for-migration-entry.patch
* fs-proc-task_mmuc-dont-read-mapcount-for-migration-entry-v4.patch
* proc-avoid-unused-variable-warning-in-pagemap_pmd_range.patch
* mm-vmscan-remove-deadlock-due-to-throttling-failing-to-make-progress.patch
* mm-memcg-synchronize-objcg-lists-with-a-dedicated-spinlock.patch
* coredump-also-dump-first-pages-of-non-executable-elf-libraries.patch
* fix-regression-due-to-fs-move-binfmt_misc-sysctl-to-its-own-file.patch
* mm-fix-panic-in-__alloc_pages.patch
* selftests-vm-cleanup-hugetlb-file-after-mremap-test.patch
* kasan-test-prevent-cache-merging-in-kmem_cache_double_destroy.patch
* kfence-make-test-case-compatible-with-run-time-set-sample-interval.patch
* proc-kpageflags-prevent-an-integer-overflow-in-stable_page_flags.patch
* proc-kpageflags-do-not-use-uninitialized-struct-pages.patch
* procfs-prevent-unpriveleged-processes-accessing-fdinfo-dir.patch
* ntfs-add-sanity-check-on-allocation-size.patch
* ocfs2-cleanup-some-return-variables.patch
* ocfs2-reflink-deadlock-when-clone-file-to-the-same-directory-simultaneously.patch
* ocfs2-clear-links-count-in-ocfs2_mknod-if-an-error-occurs.patch
* ocfs2-fix-ocfs2-corrupt-when-iputting-an-inode.patch
* remove-inode_congested.patch
* remove-bdi_congested-and-wb_congested-and-related-functions.patch
* remove-bdi_congested-and-wb_congested-and-related-functions-fix.patch
* remove-bdi_congested-and-wb_congested-and-related-functions-fix-2.patch
* f2fs-change-retry-waiting-for-f2fs_write_single_data_page.patch
* f2f2-replace-some-congestion_wait-calls-with-io_schedule_timeout.patch
* cephfs-dont-set-clear-bdi_congestion.patch
* fuse-dont-set-clear-bdi_congested.patch
* nfs-remove-congestion-control.patch
* block-bfq-ioschedc-use-false-rather-than-blk_rw_async.patch
* remove-congestion-tracking-framework.patch
* mount-warn-only-once-about-timestamp-range-expiration.patch
  mm.patch
* kasan-page_alloc-deduplicate-should_skip_kasan_poison.patch
* kasan-page_alloc-move-tag_clear_highpage-out-of-kernel_init_free_pages.patch
* kasan-page_alloc-merge-kasan_free_pages-into-free_pages_prepare.patch
* kasan-page_alloc-simplify-kasan_poison_pages-call-site.patch
* kasan-page_alloc-init-memory-of-skipped-pages-on-free.patch
* kasan-drop-skip_kasan_poison-variable-in-free_pages_prepare.patch
* mm-clarify-__gfp_zerotags-comment.patch
* kasan-only-apply-__gfp_zerotags-when-memory-is-zeroed.patch
* kasan-page_alloc-refactor-init-checks-in-post_alloc_hook.patch
* kasan-page_alloc-merge-kasan_alloc_pages-into-post_alloc_hook.patch
* kasan-page_alloc-combine-tag_clear_highpage-calls-in-post_alloc_hook.patch
* kasan-page_alloc-move-setpageskipkasanpoison-in-post_alloc_hook.patch
* kasan-page_alloc-move-kernel_init_free_pages-in-post_alloc_hook.patch
* kasan-page_alloc-rework-kasan_unpoison_pages-call-site.patch
* kasan-clean-up-metadata-byte-definitions.patch
* kasan-define-kasan_vmalloc_invalid-for-sw_tags.patch
* kasan-x86-arm64-s390-rename-functions-for-modules-shadow.patch
* kasan-vmalloc-drop-outdated-vm_kasan-comment.patch
* kasan-reorder-vmalloc-hooks.patch
* kasan-add-wrappers-for-vmalloc-hooks.patch
* kasan-vmalloc-reset-tags-in-vmalloc-functions.patch
* kasan-fork-reset-pointer-tags-of-vmapped-stacks.patch
* kasan-arm64-reset-pointer-tags-of-vmapped-stacks.patch
* kasan-vmalloc-add-vmalloc-tagging-for-sw_tags.patch
* kasan-vmalloc-arm64-mark-vmalloc-mappings-as-pgprot_tagged.patch
* kasan-vmalloc-unpoison-vm_alloc-pages-after-mapping.patch
* kasan-mm-only-define-___gfp_skip_kasan_poison-with-hw_tags.patch
* kasan-page_alloc-allow-skipping-unpoisoning-for-hw_tags.patch
* kasan-page_alloc-allow-skipping-memory-init-for-hw_tags.patch
* kasan-vmalloc-add-vmalloc-tagging-for-hw_tags.patch
* kasan-vmalloc-only-tag-normal-vmalloc-allocations.patch
* kasan-arm64-dont-tag-executable-vmalloc-allocations.patch
* kasan-mark-kasan_arg_stacktrace-as-__initdata.patch
* kasan-clean-up-feature-flags-for-hw_tags-mode.patch
* kasan-add-kasanvmalloc-command-line-flag.patch
* kasan-allow-enabling-kasan_vmalloc-and-sw-hw_tags.patch
* arm64-select-kasan_vmalloc-for-sw-hw_tags-modes.patch
* kasan-documentation-updates.patch
* kasan-improve-vmalloc-tests.patch
* kasan-improve-vmalloc-tests-fix.patch
* mm-memremap-avoid-calling-kasan_remove_zero_shadow-for-device-private-memory.patch
* tools-vm-page_owner_sortc-sort-by-stacktrace-before-culling.patch
* tools-vm-page_owner_sortc-sort-by-stacktrace-before-culling-fix.patch
* tools-vm-page_owner_sortc-support-sorting-by-stack-trace.patch
* tools-vm-page_owner_sortc-add-switch-between-culling-by-stacktrace-and-txt.patch
* tools-vm-page_owner_sortc-support-sorting-pid-and-time.patch
* tools-vm-page_owner_sortc-two-trivial-fixes.patch
* tools-vm-page_owner_sortc-delete-invalid-duplicate-code.patch
* documentation-vm-page_ownerrst-update-the-documentation.patch
* documentation-vm-page_ownerrst-update-the-documentation-fix.patch
* docs-vm-fix-unexpected-indentation-warns-in-page_owner.patch
* lib-vsprintf-avoid-redundant-work-with-0-size.patch
* mm-page_owner-use-scnprintf-to-avoid-excessive-buffer-overrun-check.patch
* mm-page_owner-print-memcg-information.patch
* mm-page_owner-record-task-command-name.patch
* mm-unexport-page_init_poison.patch
* mm-move-page-writeback-sysctls-to-is-own-file.patch
* mm-move-page-writeback-sysctls-to-is-own-file-checkpatch-fixes.patch
* mm-move-page-writeback-sysctls-to-is-own-file-fix.patch
* filemap-remove-find_get_pages.patch
* mm-fix-invalid-page-pointer-returned-with-foll_pin-gups.patch
* mm-gup-follow_pfn_pte-eexist-cleanup.patch
* mm-gup-remove-unused-pin_user_pages_locked.patch
* mm-change-lookup_node-to-use-get_user_pages_fast.patch
* mm-gup-remove-unused-get_user_pages_locked.patch
* memcg-replace-in_interrupt-with-in_task.patch
* memcg-add-per-memcg-total-kernel-memory-stat.patch
* memcg-add-per-memcg-total-kernel-memory-stat-v2.patch
* mm-memcg-mem_cgroup_per_node-is-already-set-to-0-on-allocation.patch
* mm-memcg-retrieve-parent-memcg-from-cssparent.patch
* mm-generalize-arch_has_filter_pgprot.patch
* mm-optimize-do_wp_page-for-exclusive-pages-in-the-swapcache.patch
* mm-optimize-do_wp_page-for-fresh-pages-in-local-lru-pagevecs.patch
* mm-slightly-clarify-ksm-logic-in-do_swap_page.patch
* mm-streamline-cow-logic-in-do_swap_page.patch
* mm-huge_memory-streamline-cow-logic-in-do_huge_pmd_wp_page.patch
* mm-khugepaged-remove-reuse_swap_page-usage.patch
* mm-swapfile-remove-stale-reuse_swap_page.patch
* mm-huge_memory-remove-stale-page_trans_huge_mapcount.patch
* mm-huge_memory-remove-stale-locking-logic-from-__split_huge_pmd.patch
* mm-merge-pte_mkhuge-call-into-arch_make_huge_pte.patch
* mm-thp-fix-wrong-cache-flush-in-remove_migration_pmd.patch
* mm-fix-missing-cache-flush-for-all-tail-pages-of-compound-page.patch
* mm-hugetlb-fix-missing-cache-flush-in-copy_huge_page_from_user.patch
* mm-hugetlb-fix-missing-cache-flush-in-hugetlb_mcopy_atomic_pte.patch
* mm-replace-multiple-dcache-flush-with-flush_dcache_folio.patch
* mm-remove-mmu_gathers-storage-from-remaining-architectures.patch
* mm-sparse-make-mminit_validate_memmodel_limits-static.patch
* mm-sparsemem-fix-mem_section-will-never-be-null-gcc-12-warning.patch
* mm-sparsemem-fix-mem_section-will-never-be-null-gcc-12-warning-v2.patch
* mm-vmalloc-remove-unneeded-function-forward-declaration.patch
* mm-vmalloc-move-draining-areas-out-of-caller-context.patch
* mm-vmalloc-add-adjust_search_size-parameter.patch
* mm-vmalloc-eliminate-an-extra-orig_gfp_mask.patch
* mm-vmallocc-fix-unused-function-warning.patch
* vmap-dont-allow-invalid-pages.patch
* mm-page_alloc-avoid-merging-non-fallbackable-pageblocks-with-others.patch
* mm-page_alloc-add-same-penalty-is-enough-to-get-round-robin-order.patch
* mm-page_alloc-add-penalty-to-local_node.patch
* mm-mmzonec-use-try_cmpxchg-in-page_cpupid_xchg_last.patch
* mm-discard-__gfp_atomic.patch
* mm-mmzoneh-remove-unused-macros.patch
* mm-page_alloc-dont-pass-pfn-to-free_unref_page_commit.patch
* mm-hwpoison-remove-obsolete-comment.patch
* mm-hwpoison-fix-error-page-recovered-but-reported-not-recovered.patch
* mm-hugetlb-free-the-2nd-vmemmap-page-associated-with-each-hugetlb-page.patch
* mm-hugetlb-replace-hugetlb_free_vmemmap_enabled-with-a-static_key.patch
* mm-sparsemem-use-page-table-lock-to-protect-kernel-pmd-operations.patch
* selftests-vm-add-a-hugetlb-test-case.patch
* mm-sparsemem-move-vmemmap-related-to-hugetlb-to-config_hugetlb_page_free_vmemmap.patch
* mm-hugetlb-generalize-arch_want_general_hugetlb.patch
* mm-mempolicy-convert-from-atomic_t-to-refcount_t-on-mempolicy-refcnt.patch
* mm-mempolicy-convert-from-atomic_t-to-refcount_t-on-mempolicy-refcnt-fix.patch
* mm-migration-add-trace-events-for-thp-migrations.patch
* mm-migration-add-trace-events-for-base-page-and-hugetlb-migrations.patch
* mmmigrate-fix-establishing-demotion-target.patch
* mm-cma-provide-option-to-opt-out-from-exposing-pages-on-activation-failure.patch
* powerpc-fadump-opt-out-from-freeing-pages-on-cma-activation-failure.patch
* numa-balancing-add-page-promotion-counter.patch
* numa-balancing-optimize-page-placement-for-memory-tiering-system.patch
* numa-balancing-optimize-page-placement-for-memory-tiering-system-fix.patch
* numa-balancing-optimize-page-placement-for-memory-tiering-system-fix-fix.patch
* memory-tiering-skip-to-scan-fast-memory.patch
* mm-vmstat-add-event-for-ksm-swapping-in-copy.patch
* mm-hwpoison-check-the-subpage-not-the-head-page.patch
* mm-balloon_compaction-make-balloon-page-compaction-callbacks-static.patch
* mm-fix-race-between-madv_free-reclaim-and-blkdev-direct-io-read.patch
* mm-memory_hotplug-make-arch_alloc_nodedata-independent-on-config_memory_hotplug.patch
* mm-handle-uninitialized-numa-nodes-gracefully.patch
* mm-handle-uninitialized-numa-nodes-gracefully-fix.patch
* mm-memory_hotplug-drop-arch_free_nodedata.patch
* mm-memory_hotplug-reorganize-new-pgdat-initialization.patch
* mm-make-free_area_init_node-aware-of-memory-less-nodes.patch
* memcg-do-not-tweak-node-in-alloc_mem_cgroup_per_node_info.patch
* drivers-base-memory-add-memory-block-to-memory-group-after-registration-succeeded.patch
* drivers-base-node-consolidate-node-device-subsystem-initialization-in-node_dev_init.patch
* mm-memory_hotplug-remove-obsolete-comment-of-__add_pages.patch
* mm-memory_hotplug-remove-obsolete-comment-of-__add_pages-fix.patch
* mm-memory_hotplug-avoid-calling-zone_intersects-for-zone_normal.patch
* mm-memory_hotplug-clean-up-try_offline_node.patch
* mm-memory_hotplug-fix-misplaced-comment-in-offline_pages.patch
* mm-munlock-delete-page_mlock-and-all-its-works.patch
* mm-munlock-delete-foll_mlock-and-foll_populate.patch
* mm-munlock-delete-munlock_vma_pages_all-allow-oomreap.patch
* mm-munlock-rmap-call-mlock_vma_page-munlock_vma_page.patch
* mm-munlock-replace-clear_page_mlock-by-final-clearance.patch
* mm-munlock-maintain-page-mlock_count-while-unevictable.patch
* mm-munlock-mlock_pte_range-when-mlocking-or-munlocking.patch
* mm-migrate-__unmap_and_move-push-good-newpage-to-lru.patch
* mm-munlock-delete-smp_mb-from-__pagevec_lru_add_fn.patch
* mm-munlock-mlock_page-munlock_page-batch-by-pagevec.patch
* mm-munlock-page-migration-needs-mlock-pagevec-drained.patch
* mm-thp-collapse_file-do-try_to_unmapttu_batch_flush.patch
* mm-thp-shrink_page_list-avoid-splitting-vm_locked-thp.patch
* mm-rmap-convert-from-atomic_t-to-refcount_t-on-anon_vma-refcount.patch
* mm-zswapc-allow-handling-just-same-value-filled-pages.patch
* mm-remove-usercopy_warn.patch
* mm-outline-copy_overflow.patch
* mm-outline-copy_overflow-fix.patch
* highmem-document-kunmap_local.patch
* highmem-document-kunmap_local-v2.patch
* mm-highmem-remove-unnecessary-done-label.patch
* mm-hmmc-remove-unneeded-local-variable-ret.patch
* mm-add-zone-device-coherent-type-memory-support.patch
* mm-add-device-coherent-vma-selection-for-memory-migration.patch
* mm-gup-fail-get_user_pages-for-longterm-dev-coherent-type.patch
* drm-amdkfd-add-spm-support-for-svm.patch
* drm-amdkfd-coherent-type-as-sys-mem-on-migration-to-ram.patch
* lib-test_hmm-add-ioctl-to-get-zone-device-type.patch
* lib-test_hmm-add-module-param-for-zone-device-type.patch
* lib-add-support-for-device-coherent-type-in-test_hmm.patch
* tools-update-hmm-test-to-support-device-coherent-type.patch
* tools-update-test_hmm-script-to-support-sp-config.patch
* migratec-remove-vma-check-in-migrate_vma_setup.patch
* mm-gupc-migrate-device-coherent-pages-when-pinning-instead-of-failing.patch
* tools-add-hmm-gup-test-for-long-term-pinned-device-pages.patch
* mm-damon-dbgfs-init_regions-use-target-index-instead-of-target-id.patch
* docs-admin-guide-mm-damon-usage-update-for-changed-initail_regions-file-input.patch
* mm-damon-core-move-damon_set_targets-into-dbgfs.patch
* mm-damon-remove-the-target-id-concept.patch
* mm-damon-remove-redundant-page-validation.patch
* info-task-hung-in-generic_file_write_iter.patch
* info-task-hung-in-generic_file_write-fix.patch
* kernel-hung_taskc-monitor-killed-tasks.patch
* proc-alloc-path_max-bytes-for-proc-pid-fd-symlinks.patch
* proc-alloc-path_max-bytes-for-proc-pid-fd-symlinks-fix.patch
* proc-vmcore-fix-possible-deadlock-on-concurrent-mmap-and-read.patch
* proc-vmcore-fix-vmcore_alloc_buf-kernel-doc-comment.patch
* proc-sysctl-make-protected_-world-readable.patch
* kconfigdebug-make-debug_info-selectable-from-a-choice.patch
* kconfigdebug-make-debug_info-selectable-from-a-choice-fix.patch
* include-drop-pointless-__compiler_offsetof-indirection.patch
* ilog2-force-inlining-of-__ilog2_u32-and-__ilog2_u64.patch
* bitfield-add-explicit-inclusions-to-the-example.patch
* lz4-fix-lz4_decompress_safe_partial-read-out-of-bound.patch
* checkpatch-prefer-module_licensegpl-over-module_licensegpl-v2.patch
* checkpatch-add-fix-option-for-some-trailing_statements.patch
* scripts-checkpatchpl-remove-_deferred-and-_deferred_once-false-warning.patch
* fs-binfmt_elf-fix-at_phdr-for-unusual-elf-files.patch
* fs-binfmt_elf-fix-at_phdr-for-unusual-elf-files-v5.patch
* fs-binfmt_elf-refactor-load_elf_binary-function.patch
* elf-fix-overflow-in-total-mapping-size-calculation.patch
* kallsyms-print-module-name-in-%ps-s-case-when-kallsyms-is-disabled.patch
* init-mainc-silence-some-wunused-parameter-warnings.patch
* fs-pipe-use-kvcalloc-to-allocate-a-pipe_buffer-array.patch
* fs-pipe-local-vars-has-to-match-types-of-proper-pipe_inode_info-fields.patch
* minix-fix-bug-when-opening-a-file-with-o_direct.patch
* exec-force-single-empty-string-when-argv-is-empty.patch
* exec-force-single-empty-string-when-argv-is-empty-fix.patch
* selftests-exec-test-for-empty-string-on-null-argv.patch
* kexec-make-crashk_res-crashk_low_res-and-crash_notes-symbols-always-visible.patch
* riscv-mm-init-use-is_enabledconfig_kexec_core-instead-of-ifdef.patch
* x86-setup-use-is_enabledconfig_kexec_core-instead-of-ifdef.patch
* arm64-mm-use-is_enabledconfig_kexec_core-instead-of-ifdef.patch
* docs-kdump-update-description-about-sysfs-file-system-support.patch
* docs-kdump-add-scp-example-to-write-out-the-dump-file.patch
* panic-unset-panic_on_warn-inside-panic.patch
* ubsan-no-need-to-unset-panic_on_warn-in-ubsan_epilogue.patch
* kasan-no-need-to-unset-panic_on_warn-in-end_report.patch
* docs-sysctl-kernel-add-missing-bit-to-panic_print.patch
* docs-sysctl-kernel-add-missing-bit-to-panic_print-fix.patch
* panic-add-option-to-dump-all-cpus-backtraces-in-panic_print.patch
* panic-allow-printing-extra-panic-information-on-kdump.patch
* kcov-split-ioctl-handling-into-locked-and-unlocked-parts.patch
* kcov-properly-handle-subsequent-mmap-calls.patch
* selftests-set-the-build-variable-to-absolute-path.patch
* selftests-add-and-export-a-kernel-uapi-headers-path.patch
* selftests-correct-the-headers-install-path.patch
* selftests-futex-add-the-uapi-headers-include-variable.patch
* selftests-kvm-add-the-uapi-headers-include-variable.patch
* selftests-landlock-add-the-uapi-headers-include-variable.patch
* selftests-net-add-the-uapi-headers-include-variable.patch
* selftests-mptcp-add-the-uapi-headers-include-variable.patch
* selftests-vm-add-the-uapi-headers-include-variable.patch
* selftests-vm-remove-dependecy-from-internal-kernel-macros.patch
* selftests-kselftest-framework-provide-finished-helper.patch
* revert-ubsan-kcsan-dont-combine-sanitizer-with-kcov-on-clang.patch
* ipc-mqueue-use-get_tree_nodev-in-mqueue_get_tree.patch
  linux-next.patch
  linux-next-rejects.patch
  make-sure-nobodys-leaking-resources.patch
  releasing-resources-with-children.patch
  mutex-subsystem-synchro-test-module.patch
  mutex-subsystem-synchro-test-module-fix.patch
  kernel-forkc-export-kernel_thread-to-modules.patch
  workaround-for-a-pci-restoring-bug.patch
