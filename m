Return-Path: <linux-next+bounces-3690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E697157E
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959691F2328A
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F511B3F1A;
	Mon,  9 Sep 2024 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="h5KasrxW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF214A0A7
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725878351; cv=none; b=fhUsl7h4HqhT4boulCZpLKhOGpdDkBuxrGP/uJ47R398qiRWLU0QfxG2L3FiKBp3c+Bw74GCmiNHcP82sdis/xNRHEwBRJOsRxZumzka3yA1MD0O4kKubkTY+c5NiKvJ4jseZUqdgnK3WqEaA5OQHKHYn5Iw2rurFkWGgyvSg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725878351; c=relaxed/simple;
	bh=arkSguQmxnm3uMrPdJNJ0F4Xje5BXNBRk1syqt3MmnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qjt3x9RLyDnr9RD9vE/msZNEzNGjLpLZGUnzrr0mRAFWLrpf9ucGsakMwtsjIYoZNfi3aLPyF27DwzCZBGoZOkwZ6VpWubgP2evLUe/Lntgwj/3/1EIy/Hn19iN4kSRHp9U0iDtUSPI3LwDKT2SefJt7Y5Y/Swg6v2prGPThitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=h5KasrxW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so3247556e87.3
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 03:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725878347; x=1726483147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmv35aWQosDVDM/42QhNqS1ZOA9+URwIZGHaWvVhFcc=;
        b=h5KasrxWk65R96Y7ffCa62m0/1ODgGTz4z4HBWA38O0UZPdHsVwKSFhCLbUAzV9cWj
         uQ1JtsA18nxuE29ex9Aggw90XTCjeMWNA16X0+TVHjw03beZPSJ3LZIdz0Cgn2S7KsJO
         bbA7XGPjB7wALHEAnrnpcdG/nMgR4xh3cj6Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725878347; x=1726483147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xmv35aWQosDVDM/42QhNqS1ZOA9+URwIZGHaWvVhFcc=;
        b=qhvZRrBJUR5EF184XcNyAgM95CWPZDlXVcWCo7FWSVMC0KyuqtlGHqqaL2rNGqD9Xv
         3nbfBszgwZz1DuRvVH4Z533HtTwIrrOkY6JqYQ77O40cbr6Cdo0YSRoAAip6EkckN0SI
         Rr6cBru3MK0nL5LAzpVXW7MEh/ehQ+Po9xO03mzoyAazm0xz9ro3imAb7YIvYTK1NYSi
         OQ3xUkidzpic+nBMc5XMg9U1BIsKK4jnSgtZxxr83Ux7M4YR037c+QgozwSeL5fliSWh
         2i52Z3FtszSCXKjEmApayyXIGwcCWRYn+qxQtphDrKX68wqIW8iU2DGvRuy9VFuZTNe8
         cwXw==
X-Gm-Message-State: AOJu0Yw1AYRzTKX1O1itlj+T7HemTXnTilTfJ3sGodwIOXVvsHCF2doV
	B7CbS1UVzFdSuf1e7Z8SGt3qWhJFHo5jZzBx56m74KObLLGbLMys6RLR5q+6d+QSlzMv98mr5Gn
	hwFq1+IAdvyICBJyn+4wenGIWaMYo4B7YTO3uSg==
X-Google-Smtp-Source: AGHT+IHTw8G2NMIiZuMgL+7jmnONiKuFIMH83VGpCPYn3iiCUyJC/UPYYxMLbaoSaNlbwBH/jb8g5txR6OYTRRquLdI=
X-Received: by 2002:a05:6512:b03:b0:52e:f907:1023 with SMTP id
 2adb3069b0e04-53658806573mr7231620e87.49.1725878346344; Mon, 09 Sep 2024
 03:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 9 Sep 2024 12:38:55 +0200
Message-ID: <CAJqdLrr0+uLSzwK6A_HCG6G2fYf0k5FArdBLQaj__dFKtPh4SQ@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: linux-next@vger.kernel.org, brauner@kernel.org, mszeredi@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mo., 9. Sept. 2024 um 12:25 Uhr schrieb Chandan Babu R
<chandanbabu@kernel.org>:
>
> Hi,

Hi Chandan,

>
> linux-next/fs-next released on 6th September is failing to boot on a x86
> guest,
>
> [   42.659136] Oops: general protection fault, probably for non-canonical=
 address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> [   42.660501] fbcon: Taking over console
> [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x00000=
0000000005f]
> [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-=
rc6+ #1
> [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.6.6 08/22/2023
> [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 4=
8 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <=
80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc=
20dec9a
> [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 000000000=
0000058
> [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed102=
2110172
> [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 000000000=
0000001
> [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff88816=
9973840
> [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlG=
S:0000000000000000
> [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770=
ef0
> [   42.672214] PKRU: 55555554
> [   42.672218] Call Trace:
> [   42.672223]  <TASK>
> [   42.672226]  ? die_addr+0x41/0xa0
> [   42.672238]  ? exc_general_protection+0x14c/0x230
> [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> [   42.672300]  ? kasan_unpoison+0x27/0x60
> [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672345]  ? kasan_unpoison+0x27/0x60
> [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
> [   42.672406]  cuse_channel_open+0x540/0x710 [cuse]
> [   42.672415]  misc_open+0x2a7/0x3a0
> [   42.672424]  chrdev_open+0x1ef/0x5f0
> [   42.672432]  ? __pfx_chrdev_open+0x10/0x10
> [   42.672439]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672443]  ? security_file_open+0x3bb/0x720
> [   42.672451]  do_dentry_open+0x43d/0x1200
> [   42.672459]  ? __pfx_chrdev_open+0x10/0x10
> [   42.672468]  vfs_open+0x79/0x340
> [   42.672475]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672482]  do_open+0x68c/0x11e0
> [   42.672489]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672495]  ? __pfx_do_open+0x10/0x10
> [   42.672501]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.672506]  ? open_last_lookups+0x2a2/0x1370
> [   42.672515]  path_openat+0x24f/0x640
> [   42.672522]  ? __pfx_path_openat+0x10/0x10
> [   42.723972]  ? stack_depot_save_flags+0x45/0x4b0
> [   42.724787]  ? __fput+0x43c/0xa70
> [   42.725100]  do_filp_open+0x1b3/0x3e0
> [   42.725710]  ? poison_slab_object+0x10d/0x190
> [   42.726145]  ? __kasan_slab_free+0x33/0x50
> [   42.726570]  ? __pfx_do_filp_open+0x10/0x10
> [   42.726981]  ? do_syscall_64+0x64/0x170
> [   42.727418]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   42.728018]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.728505]  ? do_raw_spin_lock+0x131/0x270
> [   42.728922]  ? __pfx_do_raw_spin_lock+0x10/0x10
> [   42.729494]  ? do_raw_spin_unlock+0x14c/0x1f0
> [   42.729992]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.730889]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.732178]  ? alloc_fd+0x176/0x5e0
> [   42.732585]  do_sys_openat2+0x122/0x160
> [   42.732929]  ? __pfx_do_sys_openat2+0x10/0x10
> [   42.733448]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.734013]  ? __pfx_map_id_up+0x10/0x10
> [   42.734482]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.735529]  ? __memcg_slab_free_hook+0x292/0x500
> [   42.736131]  __x64_sys_openat+0x123/0x1e0
> [   42.736526]  ? __pfx___x64_sys_openat+0x10/0x10
> [   42.737369]  ? __x64_sys_close+0x7c/0xd0
> [   42.737717]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   42.738192]  ? syscall_trace_enter+0x11e/0x1b0
> [   42.738739]  do_syscall_64+0x64/0x170
> [   42.739113]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   42.739638] RIP: 0033:0x7f28cd13e87b
> [   42.740038] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 0=
0 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <=
48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 54 24 28 64 48 2b 14 25
> [   42.741943] RSP: 002b:00007ffc992546c0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000101
> [   42.742951] RAX: ffffffffffffffda RBX: 00007f28cd44f1ee RCX: 00007f28c=
d13e87b
> [   42.743660] RDX: 0000000000000002 RSI: 00007f28cd44f2fa RDI: 00000000f=
fffff9c
> [   42.744518] RBP: 00007f28cd44f2fa R08: 0000000000000000 R09: 000000000=
0000001
> [   42.745211] R10: 0000000000000000 R11: 0000000000000246 R12: 000000000=
0000002
> [   42.745920] R13: 00007f28cd44f2fa R14: 0000000000000000 R15: 000000000=
0000003
> [   42.746708]  </TASK>
> [   42.746937] Modules linked in: cuse vfat fat ext4 mbcache jbd2 intel_r=
apl_msr intel_rapl_common kvm_amd ccp bochs drm_vram_helper kvm drm_ttm_hel=
per ttm pcspkr i2c_piix4 drm_kms_helper i2c_smbus pvpanic_mmio pvpanic joyd=
ev sch_fq_codel drm fuse xfs nvme_tcp nvme_fabrics nvme_core sd_mod sg virt=
io_net net_failover virtio_scsi failover crct10dif_pclmul crc32_pclmul ata_=
generic pata_acpi ata_piix ghash_clmulni_intel virtio_pci sha512_ssse3 virt=
io_pci_legacy_dev sha256_ssse3 virtio_pci_modern_dev sha1_ssse3 libata seri=
o_raw dm_multipath btrfs blake2b_generic xor zstd_compress raid6_pq sunrpc =
dm_mirror dm_region_hash dm_log dm_mod be2iscsi bnx2i cnic uio cxgb4i cxgb4=
 tls cxgb3i cxgb3 mdio libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp =
libiscsi_tcp libiscsi scsi_transport_iscsi qemu_fw_cfg aesni_intel crypto_s=
imd cryptd
> [   42.754333] ---[ end trace 0000000000000000 ]---
> [   42.756899] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> [   42.757851] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 4=
8 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <=
80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> [   42.760334] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> [   42.760940] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc=
20dec9a
> [   42.761697] RDX: 000000000000000b RSI: 0000000000000008 RDI: 000000000=
0000058
> [   42.763009] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed102=
2110172
> [   42.763920] R10: ffff888110880b97 R11: ffffc900009a737a R12: 000000000=
0000001
> [   42.764839] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff88816=
9973840
> [   42.765716] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlG=
S:0000000000000000
> [   42.766890] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   42.767828] CR2: 00007f3237366208 CR3: 000000012c79e001 CR4: 000000000=
0770ef0
> [   42.768730] PKRU: 55555554
> [   42.769022] Kernel panic - not syncing: Fatal exception
> [   42.770758] Kernel Offset: 0x7200000 from 0xffffffff81000000 (relocati=
on range: 0xffffffff80000000-0xffffffffbfffffff)
> [   42.771947] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> However, the machine boots successfully when the following commit is reve=
rted,

Thanks for your report. I'll check what's going on.

Can you provide a bit more info about your setup? Which distro you use
inside a VM, etc.

And it is weird that reverting ("virtio_fs: allow idmapped mounts")
helps you as this commit only enables idmapped
mounts support for virtiofs if *daemon* supports it. But I'm pretty
sure that you daemon does not support it
as this change was not yet merged to upstream virtiofsd
(https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/245).

Kind regards,
Alex

>
> commit 9dc504f244895def513a0f2982c909103d4ab345
> Author: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Date:   Tue Sep 3 17:16:26 2024 +0200
>
>     virtio_fs: allow idmapped mounts
>
>     Allow idmapped mounts for virtiofs.
>     It's absolutely safe as for virtiofs we have the same
>     feature negotiation mechanism as for classical fuse
>     filesystems. This does not affect any existing
>     setups anyhow.
>
>     virtiofsd support:
>     https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/245
>
>     Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical=
.com>
>     Reviewed-by: Christian Brauner <brauner@kernel.org>
>     Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
>
> --
> Chandan

