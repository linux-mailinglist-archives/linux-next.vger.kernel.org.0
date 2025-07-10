Return-Path: <linux-next+bounces-7450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A537DAFF819
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 06:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B574E6579
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 04:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1143597C;
	Thu, 10 Jul 2025 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CKyv74Zq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C87FD;
	Thu, 10 Jul 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752121862; cv=none; b=udOiP6tfUPV/hEqrheCg/qAt3WaWzE0qVj7GQ759cQhxFdTa4XYRya13QJsCxu4btnMdQTolKKHQVmmFvicXRZARSiVL6VeA1wXoNnU0CmgFqU4onBq0XcvfT5EzmDBJbiO4yIocAnp8lQjOEZ6nZDBqeATTc9PrOxsLCOlJIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752121862; c=relaxed/simple;
	bh=RpS5wcsGsPcjRlArI/EX8z6W3/rViz1ICZblUr1ZTrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AyST0I95y1zSiV5jTqPL/bUwSHuubsbZpfA4qHjj0v9iDsnL3Yom4Wbc2iG/wx7ixS4fTFuEfmqQyQ7DbPzZGZVp5hw0gYbnZO/XqSRkVeRjcZ5ng8GYXs8VH4N49NN36gDNu+cPkFtgHjWxsM/mlbCkRmd9Grt5FDmrhxBNxjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CKyv74Zq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752121783;
	bh=dueYn5GliUC2wNDPvWnk5dc1nofresIfr3/f2+TuQH4=;
	h=Date:From:To:Cc:Subject:From;
	b=CKyv74ZqJg3TKJVQwztKwB54IMjHjhY3Pu44SplTE3dh6KxGjB3Tqo5XdR1VYlo8e
	 KQ6xdhSW8iXI1p4IR7/500VU+NKz92ZAvO9LlyAAN6LXNEJ3QJ6I7JXs5CU5zCmYDj
	 sm8/JzuVUtkQpnGc+seI/8RK4/rME0OTgmLht06+5r/n6Iwg1Qx7WHwogDTzYpdeSV
	 y5C6Gq6SommtZNe31y11oaSR/4sZAubBW4IaNa2ScpOTTX7IzDzt8wJz4clF2TQ7ZY
	 Q0tEbVMF32pMe6WuxkHTxx9fdxga42l0szsEQUTgAgwcz2cTE4nGS4Z+eWFWS5tg7f
	 WDzXZTlxc8h2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd21f4cRHz4wbn;
	Thu, 10 Jul 2025 14:29:42 +1000 (AEST)
Date: Thu, 10 Jul 2025 14:30:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the mm-unstable tree
Message-ID: <20250710143052.6d974c76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Ex1Me9qxi.vRii0hZ.v2oJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Ex1Me9qxi.vRii0hZ.v2oJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  mm/vmstat.c

between commit:

  954386324a11 ("mm/vmstat: utilize designated initializers for the vmstat_=
text array")

from the mm-unstable tree and commit:

  8662a3e5e9c4 ("Revert "sched/numa: add statistics of numa balance task"")

from the tip tree.

I fixed it up (see below - search for NUMA_BALANCING) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

I assume that this will go away when the Revert above goes into Linus'
tree (or returns to the mm-hotfixes tre).
--=20
Cheers,
Stephen Rothwell

diff --cc mm/vmstat.c
index e0fcd9057f34,a78d70ddeacd..000000000000
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@@ -1196,195 -1192,178 +1196,193 @@@ int fragmentation_index(struct zone *=
zo
 =20
  const char * const vmstat_text[] =3D {
  	/* enum zone_stat_item counters */
 -	"nr_free_pages",
 -	"nr_free_pages_blocks",
 -	"nr_zone_inactive_anon",
 -	"nr_zone_active_anon",
 -	"nr_zone_inactive_file",
 -	"nr_zone_active_file",
 -	"nr_zone_unevictable",
 -	"nr_zone_write_pending",
 -	"nr_mlock",
 +#define I(x) (x)
 +	[I(NR_FREE_PAGES)]			=3D "nr_free_pages",
 +	[I(NR_FREE_PAGES_BLOCKS)]		=3D "nr_free_pages_blocks",
 +	[I(NR_ZONE_INACTIVE_ANON)]		=3D "nr_zone_inactive_anon",
 +	[I(NR_ZONE_ACTIVE_ANON)]		=3D "nr_zone_active_anon",
 +	[I(NR_ZONE_INACTIVE_FILE)]		=3D "nr_zone_inactive_file",
 +	[I(NR_ZONE_ACTIVE_FILE)]		=3D "nr_zone_active_file",
 +	[I(NR_ZONE_UNEVICTABLE)]		=3D "nr_zone_unevictable",
 +	[I(NR_ZONE_WRITE_PENDING)]		=3D "nr_zone_write_pending",
 +	[I(NR_MLOCK)]				=3D "nr_mlock",
  #if IS_ENABLED(CONFIG_ZSMALLOC)
 -	"nr_zspages",
 +	[I(NR_ZSPAGES)]				=3D "nr_zspages",
  #endif
 -	"nr_free_cma",
 +	[I(NR_FREE_CMA_PAGES)]			=3D "nr_free_cma",
  #ifdef CONFIG_UNACCEPTED_MEMORY
 -	"nr_unaccepted",
 +	[I(NR_UNACCEPTED)]			=3D "nr_unaccepted",
  #endif
 +#undef I
 =20
  	/* enum numa_stat_item counters */
 +#define I(x) (NR_VM_ZONE_STAT_ITEMS + x)
  #ifdef CONFIG_NUMA
 -	"numa_hit",
 -	"numa_miss",
 -	"numa_foreign",
 -	"numa_interleave",
 -	"numa_local",
 -	"numa_other",
 +	[I(NUMA_HIT)]				=3D "numa_hit",
 +	[I(NUMA_MISS)]				=3D "numa_miss",
 +	[I(NUMA_FOREIGN)]			=3D "numa_foreign",
 +	[I(NUMA_INTERLEAVE_HIT)]		=3D "numa_interleave",
 +	[I(NUMA_LOCAL)]				=3D "numa_local",
 +	[I(NUMA_OTHER)]				=3D "numa_other",
  #endif
 +#undef I
 =20
  	/* enum node_stat_item counters */
 -	"nr_inactive_anon",
 -	"nr_active_anon",
 -	"nr_inactive_file",
 -	"nr_active_file",
 -	"nr_unevictable",
 -	"nr_slab_reclaimable",
 -	"nr_slab_unreclaimable",
 -	"nr_isolated_anon",
 -	"nr_isolated_file",
 -	"workingset_nodes",
 -	"workingset_refault_anon",
 -	"workingset_refault_file",
 -	"workingset_activate_anon",
 -	"workingset_activate_file",
 -	"workingset_restore_anon",
 -	"workingset_restore_file",
 -	"workingset_nodereclaim",
 -	"nr_anon_pages",
 -	"nr_mapped",
 -	"nr_file_pages",
 -	"nr_dirty",
 -	"nr_writeback",
 -	"nr_writeback_temp",
 -	"nr_shmem",
 -	"nr_shmem_hugepages",
 -	"nr_shmem_pmdmapped",
 -	"nr_file_hugepages",
 -	"nr_file_pmdmapped",
 -	"nr_anon_transparent_hugepages",
 -	"nr_vmscan_write",
 -	"nr_vmscan_immediate_reclaim",
 -	"nr_dirtied",
 -	"nr_written",
 -	"nr_throttled_written",
 -	"nr_kernel_misc_reclaimable",
 -	"nr_foll_pin_acquired",
 -	"nr_foll_pin_released",
 -	"nr_kernel_stack",
 +#define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + x)
 +	[I(NR_INACTIVE_ANON)]			=3D "nr_inactive_anon",
 +	[I(NR_ACTIVE_ANON)]			=3D "nr_active_anon",
 +	[I(NR_INACTIVE_FILE)]			=3D "nr_inactive_file",
 +	[I(NR_ACTIVE_FILE)]			=3D "nr_active_file",
 +	[I(NR_UNEVICTABLE)]			=3D "nr_unevictable",
 +	[I(NR_SLAB_RECLAIMABLE_B)]		=3D "nr_slab_reclaimable",
 +	[I(NR_SLAB_UNRECLAIMABLE_B)]		=3D "nr_slab_unreclaimable",
 +	[I(NR_ISOLATED_ANON)]			=3D "nr_isolated_anon",
 +	[I(NR_ISOLATED_FILE)]			=3D "nr_isolated_file",
 +	[I(WORKINGSET_NODES)]			=3D "workingset_nodes",
 +	[I(WORKINGSET_REFAULT_ANON)]		=3D "workingset_refault_anon",
 +	[I(WORKINGSET_REFAULT_FILE)]		=3D "workingset_refault_file",
 +	[I(WORKINGSET_ACTIVATE_ANON)]		=3D "workingset_activate_anon",
 +	[I(WORKINGSET_ACTIVATE_FILE)]		=3D "workingset_activate_file",
 +	[I(WORKINGSET_RESTORE_ANON)]		=3D "workingset_restore_anon",
 +	[I(WORKINGSET_RESTORE_FILE)]		=3D "workingset_restore_file",
 +	[I(WORKINGSET_NODERECLAIM)]		=3D "workingset_nodereclaim",
 +	[I(NR_ANON_MAPPED)]			=3D "nr_anon_pages",
 +	[I(NR_FILE_MAPPED)]			=3D "nr_mapped",
 +	[I(NR_FILE_PAGES)]			=3D "nr_file_pages",
 +	[I(NR_FILE_DIRTY)]			=3D "nr_dirty",
 +	[I(NR_WRITEBACK)]			=3D "nr_writeback",
 +	[I(NR_SHMEM)]				=3D "nr_shmem",
 +	[I(NR_SHMEM_THPS)]			=3D "nr_shmem_hugepages",
 +	[I(NR_SHMEM_PMDMAPPED)]			=3D "nr_shmem_pmdmapped",
 +	[I(NR_FILE_THPS)]			=3D "nr_file_hugepages",
 +	[I(NR_FILE_PMDMAPPED)]			=3D "nr_file_pmdmapped",
 +	[I(NR_ANON_THPS)]			=3D "nr_anon_transparent_hugepages",
 +	[I(NR_VMSCAN_WRITE)]			=3D "nr_vmscan_write",
 +	[I(NR_VMSCAN_IMMEDIATE)]		=3D "nr_vmscan_immediate_reclaim",
 +	[I(NR_DIRTIED)]				=3D "nr_dirtied",
 +	[I(NR_WRITTEN)]				=3D "nr_written",
 +	[I(NR_THROTTLED_WRITTEN)]		=3D "nr_throttled_written",
 +	[I(NR_KERNEL_MISC_RECLAIMABLE)]		=3D "nr_kernel_misc_reclaimable",
 +	[I(NR_FOLL_PIN_ACQUIRED)]		=3D "nr_foll_pin_acquired",
 +	[I(NR_FOLL_PIN_RELEASED)]		=3D "nr_foll_pin_released",
 +	[I(NR_KERNEL_STACK_KB)]			=3D "nr_kernel_stack",
  #if IS_ENABLED(CONFIG_SHADOW_CALL_STACK)
 -	"nr_shadow_call_stack",
 +	[I(NR_KERNEL_SCS_KB)]			=3D "nr_shadow_call_stack",
  #endif
 -	"nr_page_table_pages",
 -	"nr_sec_page_table_pages",
 +	[I(NR_PAGETABLE)]			=3D "nr_page_table_pages",
 +	[I(NR_SECONDARY_PAGETABLE)]		=3D "nr_sec_page_table_pages",
  #ifdef CONFIG_IOMMU_SUPPORT
 -	"nr_iommu_pages",
 +	[I(NR_IOMMU_PAGES)]			=3D "nr_iommu_pages",
  #endif
  #ifdef CONFIG_SWAP
 -	"nr_swapcached",
 +	[I(NR_SWAPCACHE)]			=3D "nr_swapcached",
  #endif
  #ifdef CONFIG_NUMA_BALANCING
 -	"pgpromote_success",
 -	"pgpromote_candidate",
 +	[I(PGPROMOTE_SUCCESS)]			=3D "pgpromote_success",
 +	[I(PGPROMOTE_CANDIDATE)]		=3D "pgpromote_candidate",
  #endif
 -	"pgdemote_kswapd",
 -	"pgdemote_direct",
 -	"pgdemote_khugepaged",
 -	"pgdemote_proactive",
 +	[I(PGDEMOTE_KSWAPD)]			=3D "pgdemote_kswapd",
 +	[I(PGDEMOTE_DIRECT)]			=3D "pgdemote_direct",
 +	[I(PGDEMOTE_KHUGEPAGED)]		=3D "pgdemote_khugepaged",
 +	[I(PGDEMOTE_PROACTIVE)]			=3D "pgdemote_proactive",
  #ifdef CONFIG_HUGETLB_PAGE
 -	"nr_hugetlb",
 +	[I(NR_HUGETLB)]				=3D "nr_hugetlb",
  #endif
 -	"nr_balloon_pages",
 +	[I(NR_BALLOON_PAGES)]			=3D "nr_balloon_pages",
 +#undef I
 +
  	/* system-wide enum vm_stat_item counters */
 -	"nr_dirty_threshold",
 -	"nr_dirty_background_threshold",
 -	"nr_memmap_pages",
 -	"nr_memmap_boot_pages",
 +#define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
 +	     NR_VM_NODE_STAT_ITEMS + x)
 +	[I(NR_DIRTY_THRESHOLD)]			=3D "nr_dirty_threshold",
 +	[I(NR_DIRTY_BG_THRESHOLD)]		=3D "nr_dirty_background_threshold",
 +	[I(NR_MEMMAP_PAGES)]			=3D "nr_memmap_pages",
 +	[I(NR_MEMMAP_BOOT_PAGES)]		=3D "nr_memmap_boot_pages",
 +#undef I
 =20
 -#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
 +#if defined(CONFIG_VM_EVENT_COUNTERS)
  	/* enum vm_event_item counters */
 -	"pgpgin",
 -	"pgpgout",
 -	"pswpin",
 -	"pswpout",
 +#define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
 +	     NR_VM_NODE_STAT_ITEMS + NR_VM_STAT_ITEMS + x)
 =20
 -	TEXTS_FOR_ZONES("pgalloc")
 -	TEXTS_FOR_ZONES("allocstall")
 -	TEXTS_FOR_ZONES("pgskip")
 +	[I(PGPGIN)]				=3D "pgpgin",
 +	[I(PGPGOUT)]				=3D "pgpgout",
 +	[I(PSWPIN)]				=3D "pswpin",
 +	[I(PSWPOUT)]				=3D "pswpout",
 =20
 -	"pgfree",
 -	"pgactivate",
 -	"pgdeactivate",
 -	"pglazyfree",
 +#define OFF (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
 +	     NR_VM_NODE_STAT_ITEMS + NR_VM_STAT_ITEMS)
 +	TEXTS_FOR_ZONES(OFF+PGALLOC, "pgalloc")
 +	TEXTS_FOR_ZONES(OFF+ALLOCSTALL, "allocstall")
 +	TEXTS_FOR_ZONES(OFF+PGSCAN_SKIP, "pgskip")
 +#undef OFF
 =20
 -	"pgfault",
 -	"pgmajfault",
 -	"pglazyfreed",
 +	[I(PGFREE)]				=3D "pgfree",
 +	[I(PGACTIVATE)]				=3D "pgactivate",
 +	[I(PGDEACTIVATE)]			=3D "pgdeactivate",
 +	[I(PGLAZYFREE)]				=3D "pglazyfree",
 =20
 -	"pgrefill",
 -	"pgreuse",
 -	"pgsteal_kswapd",
 -	"pgsteal_direct",
 -	"pgsteal_khugepaged",
 -	"pgsteal_proactive",
 -	"pgscan_kswapd",
 -	"pgscan_direct",
 -	"pgscan_khugepaged",
 -	"pgscan_proactive",
 -	"pgscan_direct_throttle",
 -	"pgscan_anon",
 -	"pgscan_file",
 -	"pgsteal_anon",
 -	"pgsteal_file",
 +	[I(PGFAULT)]				=3D "pgfault",
 +	[I(PGMAJFAULT)]				=3D "pgmajfault",
 +	[I(PGLAZYFREED)]			=3D "pglazyfreed",
 +
 +	[I(PGREFILL)]				=3D "pgrefill",
 +	[I(PGREUSE)]				=3D "pgreuse",
 +	[I(PGSTEAL_KSWAPD)]			=3D "pgsteal_kswapd",
 +	[I(PGSTEAL_DIRECT)]			=3D "pgsteal_direct",
 +	[I(PGSTEAL_KHUGEPAGED)]			=3D "pgsteal_khugepaged",
 +	[I(PGSTEAL_PROACTIVE)]			=3D "pgsteal_proactive",
 +	[I(PGSCAN_KSWAPD)]			=3D "pgscan_kswapd",
 +	[I(PGSCAN_DIRECT)]			=3D "pgscan_direct",
 +	[I(PGSCAN_KHUGEPAGED)]			=3D "pgscan_khugepaged",
 +	[I(PGSCAN_PROACTIVE)]			=3D "pgscan_proactive",
 +	[I(PGSCAN_DIRECT_THROTTLE)]		=3D "pgscan_direct_throttle",
 +	[I(PGSCAN_ANON)]			=3D "pgscan_anon",
 +	[I(PGSCAN_FILE)]			=3D "pgscan_file",
 +	[I(PGSTEAL_ANON)]			=3D "pgsteal_anon",
 +	[I(PGSTEAL_FILE)]			=3D "pgsteal_file",
 =20
  #ifdef CONFIG_NUMA
 -	"zone_reclaim_success",
 -	"zone_reclaim_failed",
 +	[I(PGSCAN_ZONE_RECLAIM_SUCCESS)]	=3D "zone_reclaim_success",
 +	[I(PGSCAN_ZONE_RECLAIM_FAILED)]		=3D "zone_reclaim_failed",
  #endif
 -	"pginodesteal",
 -	"slabs_scanned",
 -	"kswapd_inodesteal",
 -	"kswapd_low_wmark_hit_quickly",
 -	"kswapd_high_wmark_hit_quickly",
 -	"pageoutrun",
 +	[I(PGINODESTEAL)]			=3D "pginodesteal",
 +	[I(SLABS_SCANNED)]			=3D "slabs_scanned",
 +	[I(KSWAPD_INODESTEAL)]			=3D "kswapd_inodesteal",
 +	[I(KSWAPD_LOW_WMARK_HIT_QUICKLY)]	=3D "kswapd_low_wmark_hit_quickly",
 +	[I(KSWAPD_HIGH_WMARK_HIT_QUICKLY)]	=3D "kswapd_high_wmark_hit_quickly",
 +	[I(PAGEOUTRUN)]				=3D "pageoutrun",
 =20
 -	"pgrotated",
 +	[I(PGROTATED)]				=3D "pgrotated",
 =20
 -	"drop_pagecache",
 -	"drop_slab",
 -	"oom_kill",
 +	[I(DROP_PAGECACHE)]			=3D "drop_pagecache",
 +	[I(DROP_SLAB)]				=3D "drop_slab",
 +	[I(OOM_KILL)]				=3D "oom_kill",
 =20
  #ifdef CONFIG_NUMA_BALANCING
 -	"numa_pte_updates",
 -	"numa_huge_pte_updates",
 -	"numa_hint_faults",
 -	"numa_hint_faults_local",
 -	"numa_pages_migrated",
 +	[I(NUMA_PTE_UPDATES)]			=3D "numa_pte_updates",
 +	[I(NUMA_HUGE_PTE_UPDATES)]		=3D "numa_huge_pte_updates",
 +	[I(NUMA_HINT_FAULTS)]			=3D "numa_hint_faults",
 +	[I(NUMA_HINT_FAULTS_LOCAL)]		=3D "numa_hint_faults_local",
 +	[I(NUMA_PAGE_MIGRATE)]			=3D "numa_pages_migrated",
- 	[I(NUMA_TASK_MIGRATE)]			=3D "numa_task_migrated",
- 	[I(NUMA_TASK_SWAP)]			=3D "numa_task_swapped",
  #endif
  #ifdef CONFIG_MIGRATION
 -	"pgmigrate_success",
 -	"pgmigrate_fail",
 -	"thp_migration_success",
 -	"thp_migration_fail",
 -	"thp_migration_split",
 +	[I(PGMIGRATE_SUCCESS)]			=3D "pgmigrate_success",
 +	[I(PGMIGRATE_FAIL)]			=3D "pgmigrate_fail",
 +	[I(THP_MIGRATION_SUCCESS)]		=3D "thp_migration_success",
 +	[I(THP_MIGRATION_FAIL)]			=3D "thp_migration_fail",
 +	[I(THP_MIGRATION_SPLIT)]		=3D "thp_migration_split",
  #endif
  #ifdef CONFIG_COMPACTION
 -	"compact_migrate_scanned",
 -	"compact_free_scanned",
 -	"compact_isolated",
 -	"compact_stall",
 -	"compact_fail",
 -	"compact_success",
 -	"compact_daemon_wake",
 -	"compact_daemon_migrate_scanned",
 -	"compact_daemon_free_scanned",
 +	[I(COMPACTMIGRATE_SCANNED)]		=3D "compact_migrate_scanned",
 +	[I(COMPACTFREE_SCANNED)]		=3D "compact_free_scanned",
 +	[I(COMPACTISOLATED)]			=3D "compact_isolated",
 +	[I(COMPACTSTALL)]			=3D "compact_stall",
 +	[I(COMPACTFAIL)]			=3D "compact_fail",
 +	[I(COMPACTSUCCESS)]			=3D "compact_success",
 +	[I(KCOMPACTD_WAKE)]			=3D "compact_daemon_wake",
 +	[I(KCOMPACTD_MIGRATE_SCANNED)]		=3D "compact_daemon_migrate_scanned",
 +	[I(KCOMPACTD_FREE_SCANNED)]		=3D "compact_daemon_free_scanned",
  #endif
 =20
  #ifdef CONFIG_HUGETLB_PAGE

--Sig_/7Ex1Me9qxi.vRii0hZ.v2oJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvQfwACgkQAVBC80lX
0GyjGwgAlhLRHDKlwePGMJ+5kdblvzzfpOkH60MgUU0etKPeGoHS2DKAvMBgdZ6Q
nFrAaUlJWYkzfRRFnGRsIY6rsJ8QyGLbF84N0XGGFLgdJSaMb8jGEOomxGpre/lB
788o6gmlOJ3a0g7l66T16iZCFDBvvXxJ/T1MPfrQx/EeXBIh2xh/u5KcOf+PZT4o
2ZQqzRAiG+gOuubed370JrvJkgVVd0PLtiTXP2NurH+p/IgVlXxAcV/MffmT0DYn
E3ta+z1wEIYD8vUyg1fS+OzKxtFArVKaRUCwEDQhR8XNukUDxmCwc6WZz6RB4VRT
mIhpTkg1/920yhc416ttBI+vnO4BaA==
=6l8z
-----END PGP SIGNATURE-----

--Sig_/7Ex1Me9qxi.vRii0hZ.v2oJ--

