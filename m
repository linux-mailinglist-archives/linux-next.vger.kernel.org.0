Return-Path: <linux-next+bounces-3686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EF971541
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8B01C20829
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2341B29D9;
	Mon,  9 Sep 2024 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snOJfP0K"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B81AC8BF
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725877500; cv=none; b=Yp85w3a11C05dMfcJDdTwfzill7Mo86r46Pkh2A2XXcfVR5z/B0qFyC4P7AO7Y1M4hhYBRsUQwIIu5jgzswA7uW/QJoyaH0hSPtqSo1mAzRxhUsaflbbhWVh3q8NQzLFRHHYuauiXd/KHNOSni9kbl6FxCUCfFMARDpXqZ7xSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725877500; c=relaxed/simple;
	bh=Vz5kd3EKf+uVi7iaiZfrUWVMISg04utKPmb3o7zwEPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HGnV0z94MQf3S7L4O1h8CbqjW+ZLPYNxo/4xwUPVZGUih1P1QPOAjuK3+5pkuDEWmZNNNm0w96hgUgTeK7tdiliyj5y/qVur6xigZbBQSKI4ff3Q78/Cto0Jquf5NVh0plzDsZihT/gk99xXQAEhTVGM+FFPvIasrt7S4ExcHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snOJfP0K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83A5C4CEC5;
	Mon,  9 Sep 2024 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725877500;
	bh=Vz5kd3EKf+uVi7iaiZfrUWVMISg04utKPmb3o7zwEPg=;
	h=From:To:Cc:Subject:Date:From;
	b=snOJfP0KsIYceRSNwbknm8G5TxRbWmNUhUfWjXALIKyO0ZmakSz20TnebmPncKH+W
	 eSWcXw6HKOS3hkH7zOesVUsV/jGgvY9fUn7uzvv+RO1hSQCqdRB1qS4zaOgj1bVrwE
	 q+WtU92TvDpnW2B4eA8exMS4LKE9IJQCOLHBF2loem+rkjwZyO25hjQhSDFYQFetb+
	 /8ixsNqbyBt7cZdaEv/jKE0C0JXz1ZfkjIgnJxvA1KIGnUffcDL+jFuYyUeqTSBFU5
	 Lq8bRfkJVx8Lf+6rPRk2847DovN7nwBzQqOfCLKGbBrJ8uN//8wJMHchetc64BTmTI
	 r0ovJ0PIMTDrQ==
User-agent: mu4e 1.10.8; emacs 29.2
From: Chandan Babu R <chandanbabu@kernel.org>
To: linux-next@vger.kernel.org
Cc: alexander@mihalicyn.com, brauner@kernel.org, mszeredi@redhat.com
Subject: [BUG REPORT] linux-next/fs-next released on 6th September fails to
 boot
Date: Mon, 09 Sep 2024 13:53:24 +0530
Message-ID: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

linux-next/fs-next released on 6th September is failing to boot on a x86
guest,

[   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
[   42.660501] fbcon: Taking over console
[   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
[   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
[   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
[   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
[   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
[   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
[   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
[   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
[   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
[   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
[   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
[   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
[   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
[   42.672214] PKRU: 55555554
[   42.672218] Call Trace:
[   42.672223]  <TASK>
[   42.672226]  ? die_addr+0x41/0xa0
[   42.672238]  ? exc_general_protection+0x14c/0x230
[   42.672250]  ? asm_exc_general_protection+0x26/0x30
[   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
[   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
[   42.672300]  ? kasan_unpoison+0x27/0x60
[   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
[   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
[   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672345]  ? kasan_unpoison+0x27/0x60
[   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
[   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
[   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
[   42.672406]  cuse_channel_open+0x540/0x710 [cuse]
[   42.672415]  misc_open+0x2a7/0x3a0
[   42.672424]  chrdev_open+0x1ef/0x5f0
[   42.672432]  ? __pfx_chrdev_open+0x10/0x10
[   42.672439]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672443]  ? security_file_open+0x3bb/0x720
[   42.672451]  do_dentry_open+0x43d/0x1200
[   42.672459]  ? __pfx_chrdev_open+0x10/0x10
[   42.672468]  vfs_open+0x79/0x340
[   42.672475]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672482]  do_open+0x68c/0x11e0
[   42.672489]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672495]  ? __pfx_do_open+0x10/0x10
[   42.672501]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.672506]  ? open_last_lookups+0x2a2/0x1370
[   42.672515]  path_openat+0x24f/0x640
[   42.672522]  ? __pfx_path_openat+0x10/0x10
[   42.723972]  ? stack_depot_save_flags+0x45/0x4b0
[   42.724787]  ? __fput+0x43c/0xa70
[   42.725100]  do_filp_open+0x1b3/0x3e0
[   42.725710]  ? poison_slab_object+0x10d/0x190
[   42.726145]  ? __kasan_slab_free+0x33/0x50
[   42.726570]  ? __pfx_do_filp_open+0x10/0x10
[   42.726981]  ? do_syscall_64+0x64/0x170
[   42.727418]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   42.728018]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.728505]  ? do_raw_spin_lock+0x131/0x270
[   42.728922]  ? __pfx_do_raw_spin_lock+0x10/0x10
[   42.729494]  ? do_raw_spin_unlock+0x14c/0x1f0
[   42.729992]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.730889]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.732178]  ? alloc_fd+0x176/0x5e0
[   42.732585]  do_sys_openat2+0x122/0x160
[   42.732929]  ? __pfx_do_sys_openat2+0x10/0x10
[   42.733448]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.734013]  ? __pfx_map_id_up+0x10/0x10
[   42.734482]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.735529]  ? __memcg_slab_free_hook+0x292/0x500
[   42.736131]  __x64_sys_openat+0x123/0x1e0
[   42.736526]  ? __pfx___x64_sys_openat+0x10/0x10
[   42.737369]  ? __x64_sys_close+0x7c/0xd0
[   42.737717]  ? srso_alias_return_thunk+0x5/0xfbef5
[   42.738192]  ? syscall_trace_enter+0x11e/0x1b0
[   42.738739]  do_syscall_64+0x64/0x170
[   42.739113]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   42.739638] RIP: 0033:0x7f28cd13e87b
[   42.740038] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 54 24 28 64 48 2b 14 25
[   42.741943] RSP: 002b:00007ffc992546c0 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
[   42.742951] RAX: ffffffffffffffda RBX: 00007f28cd44f1ee RCX: 00007f28cd13e87b
[   42.743660] RDX: 0000000000000002 RSI: 00007f28cd44f2fa RDI: 00000000ffffff9c
[   42.744518] RBP: 00007f28cd44f2fa R08: 0000000000000000 R09: 0000000000000001
[   42.745211] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
[   42.745920] R13: 00007f28cd44f2fa R14: 0000000000000000 R15: 0000000000000003
[   42.746708]  </TASK>
[   42.746937] Modules linked in: cuse vfat fat ext4 mbcache jbd2 intel_rapl_msr intel_rapl_common kvm_amd ccp bochs drm_vram_helper kvm drm_ttm_helper ttm pcspkr i2c_piix4 drm_kms_helper i2c_smbus pvpanic_mmio pvpanic joydev sch_fq_codel drm fuse xfs nvme_tcp nvme_fabrics nvme_core sd_mod sg virtio_net net_failover virtio_scsi failover crct10dif_pclmul crc32_pclmul ata_generic pata_acpi ata_piix ghash_clmulni_intel virtio_pci sha512_ssse3 virtio_pci_legacy_dev sha256_ssse3 virtio_pci_modern_dev sha1_ssse3 libata serio_raw dm_multipath btrfs blake2b_generic xor zstd_compress raid6_pq sunrpc dm_mirror dm_region_hash dm_log dm_mod be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls cxgb3i cxgb3 mdio libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi qemu_fw_cfg aesni_intel crypto_simd cryptd
[   42.754333] ---[ end trace 0000000000000000 ]---
[   42.756899] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
[   42.757851] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
[   42.760334] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
[   42.760940] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
[   42.761697] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
[   42.763009] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
[   42.763920] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
[   42.764839] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
[   42.765716] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
[   42.766890] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   42.767828] CR2: 00007f3237366208 CR3: 000000012c79e001 CR4: 0000000000770ef0
[   42.768730] PKRU: 55555554
[   42.769022] Kernel panic - not syncing: Fatal exception
[   42.770758] Kernel Offset: 0x7200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   42.771947] ---[ end Kernel panic - not syncing: Fatal exception ]---

However, the machine boots successfully when the following commit is reverted,

commit 9dc504f244895def513a0f2982c909103d4ab345
Author: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date:   Tue Sep 3 17:16:26 2024 +0200

    virtio_fs: allow idmapped mounts

    Allow idmapped mounts for virtiofs.
    It's absolutely safe as for virtiofs we have the same
    feature negotiation mechanism as for classical fuse
    filesystems. This does not affect any existing
    setups anyhow.

    virtiofsd support:
    https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/245

    Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

-- 
Chandan

