Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6501364D6
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 02:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730616AbgAJBeS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 20:34:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:39224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730579AbgAJBeS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jan 2020 20:34:18 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E3E9206ED;
        Fri, 10 Jan 2020 01:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578620056;
        bh=NTyPyLJyooH1sEVo1CzHFs8IcgvCnYnQcuZ30/nwD24=;
        h=Date:From:To:Subject:From;
        b=Muz22P264kl3qC+1A5enz15SKQYVRLX07pgy4eX9Pq4hozVm15o0nq0YQ0Xzhom0y
         FQhRbHMGK6C9fZJPFMY7Jp8PCDSSElcTjK3F2rap4TK4O/0QfZzAxXdpWfkM0WFHRT
         FiwFGlJ0jHWUX2TZo1B8mLlbQWhsCQ9Y3z/hdTfA=
Date:   Thu, 09 Jan 2020 17:34:13 -0800
From:   akpm@linux-foundation.org
To:     broonie@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au
Subject:  mmotm 2020-01-09-17-33 uploaded
Message-ID: <20200110013413.NNeLcxiMi%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The mm-of-the-moment snapshot 2020-01-09-17-33 has been uploaded to

   http://www.ozlabs.org/~akpm/mmotm/

mmotm-readme.txt says

README for mm-of-the-moment:

http://www.ozlabs.org/~akpm/mmotm/

This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
more than once a week.

You will need quilt to apply these patches to the latest Linus release (5.x
or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
http://ozlabs.org/~akpm/mmotm/series

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

The directory http://www.ozlabs.org/~akpm/mmots/ (mm-of-the-second)
contains daily snapshots of the -mm tree.  It is updated more frequently
than mmotm, and is untested.

A git copy of this tree is also available at

	https://github.com/hnaz/linux-mm



This mmotm tree contains the following patches against 5.5-rc5:
(patches marked "*" will be included in linux-next)

  origin.patch
* proc-kpageflags-prevent-an-integer-overflow-in-stable_page_flags.patch
* proc-kpageflags-do-not-use-uninitialized-struct-pages.patch
* mm-thp-tweak-reclaim-compaction-effort-of-local-only-and-all-node-allocations.patch
* x86-mm-split-vmalloc_sync_all.patch
* revert-ipcsem-remove-uneeded-sem_undo_list-lock-usage-in-exit_sem.patch
* mm-fix-uninitialized-memmaps-on-a-partially-populated-last-section.patch
* fs-proc-pagec-allow-inspection-of-last-section-and-fix-end-detection.patch
* mm-initialize-memmap-of-unavailable-memory-directly.patch
* mm-memory_hotplug-dont-free-usage-map-when-removing-a-re-added-early-section.patch
* thp-fix-conflict-of-above-47bit-hint-address-and-pmd-alignment.patch
* thp-shmem-fix-conflict-of-above-47bit-hint-address-and-pmd-alignment.patch
* thp-shmem-fix-conflict-of-above-47bit-hint-address-and-pmd-alignment-fix.patch
* mm-memcg-slab-fix-percpu-slab-vmstats-flushing.patch
* mm-debug_pagealloc-dont-rely-on-static-keys-too-early.patch
* mm-debug_pagealloc-dont-rely-on-static-keys-too-early-fix.patch
* mm-page-writebackc-avoid-potential-division-by-zero-in-wb_min_max_ratio.patch
* mm-page-writebackc-use-div64_ul-for-u64-by-unsigned-long-divide.patch
* mm-page-writebackc-improve-arithmetic-divisions.patch
* mm-memcg-slab-call-flush_memcg_workqueue-only-if-memcg-workqueue-is-valid.patch
* mm-khugepaged-add-trace-status-description-for-scan_page_has_private.patch
* mm-thp-grab-the-lock-before-manipulation-defer-list.patch
* lib-test_bitmap-correct-test-data-offsets-for-32-bit.patch
* watchdog-fix-uaf-in-reboot-notifier-handling-in-watchdog-core-code.patch
* memcg-fix-a-crash-in-wb_workfn-when-a-device-disappears.patch
* scripts-spellingtxt-add-more-spellings-to-spellingtxt.patch
* scripts-spellingtxt-add-issus-typo.patch
* fs-ocfs-remove-unnecessary-assertion-in-dlm_migrate_lockres.patch
* ocfs2-remove-unneeded-semicolon.patch
* ocfs2-make-local-header-paths-relative-to-c-files.patch
* ocfs2-dlm-remove-redundant-assignment-to-ret.patch
* ocfs2-dlm-move-bits_to_bytes-to-bitopsh-for-wider-use.patch
* ramfs-support-o_tmpfile.patch
* watchdog-fix-possible-soft-lockup-warning-at-bootup.patch
* watchdog-fix-possible-soft-lockup-warning-at-bootup-v2.patch
  mm.patch
* mm-avoid-slub-allocation-while-holding-list_lock.patch
* kmemleak-turn-kmemleak_lock-and-object-lock-to-raw_spinlock_t.patch
* mm-clean-up-filemap_write_and_wait.patch
* mm-fix-gup_pud_range.patch
* mm-cleanup-some-useless-code.patch
* mm-vmscan-expose-cgroup_ino-for-memcg-reclaim-tracepoints.patch
* mm-pgmap-use-correct-alignment-when-looking-at-first-pfn-from-a-region.patch
* mm-mmap-fix-the-adjusted-length-error.patch
* drivers-base-memoryc-cache-blocks-in-radix-tree-to-accelerate-lookup.patch
* drivers-base-memoryc-cache-blocks-in-radix-tree-to-accelerate-lookup-fix.patch
* mm-memmap_init-update-variable-name-in-memmap_init_zone.patch
* mm-memory_hotplug-poison-memmap-in-remove_pfn_range_from_zone.patch
* mm-memory_hotplug-we-always-have-a-zone-in-find_smallestbiggest_section_pfn.patch
* mm-memory_hotplug-dont-check-for-all-holes-in-shrink_zone_span.patch
* mm-memory_hotplug-drop-local-variables-in-shrink_zone_span.patch
* mm-memory_hotplug-cleanup-__remove_pages.patch
* mm-tracing-print-symbol-name-for-kmem_alloc_node-call_site-events.patch
* mm-early_remap-use-%pa-to-print-resource_size_t-variables.patch
* mm-page_alloc-skip-non-present-sections-on-zone-initialization.patch
* mm-vmscanc-remove-unused-return-value-of-shrink_node.patch
* mm-memblock-define-memblock_physmem_add.patch
* memblock-use-__func__-in-remaining-memblock_dbg-call-sites.patch
* mm-oom-avoid-printk-iteration-under-rcu.patch
* mm-oom-avoid-printk-iteration-under-rcu-fix.patch
* mm-hugetlb-controller-for-cgroups-v2.patch
* mm-migrate-remove-useless-mask-of-start-address.patch
* mm-migrate-clean-up-some-minor-coding-style.patch
* mm-migrate-add-stable-check-in-migrate_vma_insert_page.patch
* mm-get-rid-of-odd-jump-labels-in-find_mergeable_anon_vma.patch
* zswap-add-allocation-hysteresis-if-pool-limit-is-hit.patch
* mm-clean-up-obsolete-check-on-space-in-page-flags.patch
* mm-remove-dead-code-totalram_pages_set.patch
* mm-drop-elements-hw-and-phys_callback-from-struct-memory_block.patch
* mm-fix-comments-related-to-node-reclaim.patch
* zram-try-to-avoid-worst-case-scenario-on-same-element-pages.patch
* zram-fix-error-return-codes-not-being-returned-in-writeback_store.patch
* info-task-hung-in-generic_file_write_iter.patch
* info-task-hung-in-generic_file_write-fix.patch
* kernel-hung_taskc-monitor-killed-tasks.patch
* add-helpers-for-kelvin-to-from-celsius-conversion.patch
* acpi-thermal-switch-to-use-linux-unitsh-helpers.patch
* platform-x86-asus-wmi-switch-to-use-linux-unitsh-helpers.patch
* platform-x86-intel_menlow-switch-to-use-linux-unitsh-helpers.patch
* thermal-int340x-switch-to-use-linux-unitsh-helpers.patch
* thermal-intel_pch-switch-to-use-linux-unitsh-helpers.patch
* nvme-hwmon-switch-to-use-linux-unitsh-helpers.patch
* thermal-remove-kelvin-to-from-celsius-conversion-helpers-from-linux-thermalh.patch
* iwlegacy-use-linux-unitsh-helpers.patch
* iwlwifi-use-linux-unitsh-helpers.patch
* thermal-armada-remove-unused-to_mcelsius-macro.patch
* iio-adc-qcom-vadc-common-use-linux-unitsh-helpers.patch
* lib-zlib-add-s390-hardware-support-for-kernel-zlib_deflate.patch
* s390-boot-rename-heap_size-due-to-name-collision.patch
* lib-zlib-add-s390-hardware-support-for-kernel-zlib_inflate.patch
* s390-boot-add-dfltcc=-kernel-command-line-parameter.patch
* lib-zlib-add-zlib_deflate_dfltcc_enabled-function.patch
* btrfs-use-larger-zlib-buffer-for-s390-hardware-compression.patch
* lib-scatterlist-adjust-indentation-in-__sg_alloc_table.patch
* uapi-rename-ext2_swab-to-swab-and-share-globally-in-swabh.patch
* lib-find_bitc-join-_find_next_bit_le.patch
* lib-find_bitc-uninline-helper-_find_next_bit.patch
* string-add-stracpy-and-stracpy_pad-mechanisms.patch
* documentation-checkpatch-prefer-stracpy-strscpy-over-strcpy-strlcpy-strncpy.patch
* elf-smaller-code-generation-around-auxv-vector-fill.patch
* elf-fix-start_code-calculation.patch
* elf-dont-copy-elf-header-around.patch
* elf-better-codegen-around-current-mm.patch
* elf-make-bad_addr-unlikely.patch
* elf-coredump-allocate-core-elf-header-on-stack.patch
* elf-coredump-delete-duplicated-overflow-check.patch
* elf-coredump-allow-process-with-empty-address-space-to-coredump.patch
* init-mainc-log-arguments-and-environment-passed-to-init.patch
* init-mainc-remove-unnecessary-repair_env_string-in-do_initcall_level.patch
* init-mainc-fix-quoted-value-handling-in-unknown_bootoption.patch
* init-fix-misleading-this-architecture-does-not-have-kernel-memory-protection-message.patch
* reiserfs-prevent-null-pointer-dereference-in-reiserfs_insert_item.patch
* execve-warn-if-process-starts-with-executable-stack.patch
* io-mapping-use-phys_pfn-macro-in-io_mapping_map_atomic_wc.patch
* aio-simplify-read_events.patch
* smp_mb__beforeafter_atomic-update-documentation.patch
* ipc-mqueuec-remove-duplicated-code.patch
* ipc-mqueuec-update-document-memory-barriers.patch
* ipc-msgc-update-and-document-memory-barriers.patch
* ipc-semc-document-and-update-memory-barriers.patch
* ipc-consolidate-all-xxxctl_down-functions.patch
* ipc-consolidate-all-xxxctl_down-functions-fix.patch
  linux-next.patch
  linux-next-rejects.patch
  linux-next-fix.patch
  linux-next-fix-2.patch
* drivers-block-null_blk_mainc-fix-layout.patch
* drivers-block-null_blk_mainc-fix-uninitialized-var-warnings.patch
* pinctrl-fix-pxa2xxc-build-warnings.patch
* mm-remove-__krealloc.patch
* mm-add-generic-pd_leaf-macros.patch
* arc-mm-add-pd_leaf-definitions.patch
* arm-mm-add-pd_leaf-definitions.patch
* arm64-mm-add-pd_leaf-definitions.patch
* mips-mm-add-pd_leaf-definitions.patch
* powerpc-mm-add-pd_leaf-definitions.patch
* riscv-mm-add-pd_leaf-definitions.patch
* s390-mm-add-pd_leaf-definitions.patch
* sparc-mm-add-pd_leaf-definitions.patch
* x86-mm-add-pd_leaf-definitions.patch
* mm-pagewalk-add-p4d_entry-and-pgd_entry.patch
* mm-pagewalk-add-p4d_entry-and-pgd_entry-fix.patch
* mm-pagewalk-allow-walking-without-vma.patch
* mm-pagewalk-dont-lock-ptes-for-walk_page_range_novma.patch
* mm-pagewalk-fix-termination-condition-in-walk_pte_range.patch
* mm-pagewalk-add-depth-parameter-to-pte_hole.patch
* x86-mm-point-to-struct-seq_file-from-struct-pg_state.patch
* x86-mmefi-convert-ptdump_walk_pgd_level-to-take-a-mm_struct.patch
* x86-mm-convert-ptdump_walk_pgd_level_debugfs-to-take-an-mm_struct.patch
* mm-add-generic-ptdump.patch
* x86-mm-convert-dump_pagetables-to-use-walk_page_range.patch
* arm64-mm-convert-mm-dumpc-to-use-walk_page_range.patch
* arm64-mm-display-non-present-entries-in-ptdump.patch
* mm-ptdump-reduce-level-numbers-by-1-in-note_page.patch
* x86-mm-avoid-allocating-struct-mm_struct-on-the-stack.patch
* proc-decouple-proc-from-vfs-with-struct-proc_ops.patch
* proc-convert-everything-to-struct-proc_ops.patch
* proc-convert-everything-to-struct-proc_ops-fix.patch
* lib-string-add-strnchrnul.patch
* bitops-more-bits_to_-macros.patch
* lib-add-test-for-bitmap_parse.patch
* lib-add-test-for-bitmap_parse-fix.patch
* lib-add-test-for-bitmap_parse-fix-2.patch
* lib-make-bitmap_parse_user-a-wrapper-on-bitmap_parse.patch
* lib-rework-bitmap_parse.patch
* lib-new-testcases-for-bitmap_parse_user.patch
* cpumask-dont-calculate-length-of-the-input-string.patch
* treewide-remove-redundent-is_err-before-error-code-check.patch
* arm-dma-api-fix-max_pfn-off-by-one-error-in-__dma_supported.patch
* drivers-tty-serial-sh-scic-suppress-warning.patch
* fix-read-buffer-overflow-in-delta-ipc.patch
  make-sure-nobodys-leaking-resources.patch
  releasing-resources-with-children.patch
  mutex-subsystem-synchro-test-module.patch
  kernel-forkc-export-kernel_thread-to-modules.patch
  workaround-for-a-pci-restoring-bug.patch
