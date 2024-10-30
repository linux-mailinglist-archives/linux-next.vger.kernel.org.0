Return-Path: <linux-next+bounces-4535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B69B5CF1
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 08:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557B2283E4A
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 07:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2341C4608;
	Wed, 30 Oct 2024 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="crtbyHfN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42521348;
	Wed, 30 Oct 2024 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273452; cv=none; b=HS5pnPGC4TciaItqgIFAaXUe2pxyDk4WrpUA1CZpam9m6CYRtba03ne6boLJdzxDIwUZwBTNGDfkK+hwcY4oz9hNXNLaXZS+SKCgjs5gQnGeOMaJwognZPGMC8AnAL6cxY0RJE95a7g3LalsSe9KOdhOZhvgRfTHnxvKEO93ZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273452; c=relaxed/simple;
	bh=YtZl0beGIglzcPZW3trzc2HK/CfGnezp/1ror33Ds2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KeCJBEJFhzNcvHZ00pt5sdI3cHyoqSOUAAbAEA0okbE+MReLKORZP1r29oWuq7HSSRsuWVXrYKmqEOOFPzZi1fb6LJp9+ztMQrJR0AW0Ce764v08WK5AlgnDDY7Q+kg1mS8XUx6sffUgx/vCAiRNDCIoSjjcD2hap5vStn6L7KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=crtbyHfN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730273443;
	bh=cOueB5rR6fgZJh/e1wlGkXJkIR2AUPUME4RMGqGPBnE=;
	h=Date:From:To:Cc:Subject:From;
	b=crtbyHfNPO+Cpv7T+Io9QFTka8lR2n+GyZLVOjrQNNv7Wn3ahEUO280EMpi4MJpIW
	 /x8XgV3EkRtIAYk6gZUL07VoosJvn9PpkhNKu+xvyleEqrgiBsG/jkNcKAOxoEIiGP
	 hh3izu3SNgFGUedQCRwC3MpNLhCuw54OcWjNU9mI7gjxIfdWzZK+N/DUGCjOd1LSSh
	 J5YbUb00qe3vcw5FyjndPrpCvL2hXTLCfbuLbFxHIz/kXKhXgxl54Q9cM4dp9bgu2K
	 c2+FU82cpiWsPNOCQ89EFtO/dwZs5cBeZNL2wu+PGkTbeJXk9GcpR5g/q8I4+UV08h
	 jMGo+j7uKGJgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xdf1H5c5Hz4x33;
	Wed, 30 Oct 2024 18:30:43 +1100 (AEDT)
Date: Wed, 30 Oct 2024 18:30:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: boot failure after merge of the vfs-brauner tree
Message-ID: <20241030183044.673e14b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c+VjkI1f/HBkG6X5vuFJ3LZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c+VjkI1f/HBkG6X5vuFJ3LZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
pseries_le_defconfig) qemu boot test failed like this:

 Initialise system trusted keyrings
 Key type blacklist registered
 BUG: Kernel NULL pointer dereference on write at 0x00000018
 Faulting instruction address: 0xc0000000009867d0
 Oops: Kernel access of bad area, sig: 7 [#1]
 LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
 Modules linked in:
 CPU: 0 UID: 0 PID: 27 Comm: kworker/u4:1 Not tainted 6.12.0-rc5-08184-gd1b=
0879097de #1
 Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x8012=
00 0xf000006 of:SLOF,HEAD pSeries
 Workqueue: async async_run_entry_fn
 NIP:  c0000000009867d0 LR: c0000000009867cc CTR: c000000000986780
 REGS: c000000004a17510 TRAP: 0300   Not tainted  (6.12.0-rc5-08184-gd1b087=
9097de)
 MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84088884  XER: 0000=
0000
 CFAR: c000000000985c94 DAR: 0000000000000018 DSISR: 02080000 IRQMASK: 0=20
 GPR00: c0000000009867cc c000000004a177b0 c0000000016ae600 c000000004353748=
=20
 GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
 GPR08: 000000007d629000 0000000000000003 0000000000000000 0000000000004000=
=20
 GPR12: c000000000986780 c000000002a7b000 c00000000018d168 c0000000041f3d80=
=20
 GPR16: 0000000000000000 0000000000000000 c000000003855800 c00000000427b300=
=20
 GPR20: fffffffffffffef7 c000000004ba2c20 0000000000000001 0000000000000000=
=20
 GPR24: 0000000000000041 0001024100010041 c000000002779f18 c00000000435ef40=
=20
 GPR28: 0000000000000000 c000000004ba6650 0000000000000010 c00000000435ef00=
=20
 NIP [c0000000009867d0] selinux_file_open+0x50/0x140
 LR [c0000000009867cc] selinux_file_open+0x4c/0x140
 Call Trace:
 [c000000004a177b0] [c0000000009867cc] selinux_file_open+0x4c/0x140 (unreli=
able)
 [c000000004a17810] [c00000000096ab04] security_file_open+0xa4/0x1b0
 [c000000004a17840] [c00000000059ff94] do_dentry_open+0x174/0x5d0
 [c000000004a17890] [c0000000005a28c4] vfs_open+0x44/0x140
 [c000000004a178c0] [c0000000005c5af8] path_openat+0xb08/0x1490
 [c000000004a179a0] [c0000000005c6548] do_filp_open+0xc8/0x1a0
 [c000000004a17ad0] [c0000000005a0880] filp_open+0x130/0x1f0
 [c000000004a17b30] [c000000002007c2c] do_name+0x110/0x360
 [c000000004a17bc0] [c000000002006d1c] write_buffer+0x60/0x8c
 [c000000004a17bf0] [c000000002006db0] flush_buffer+0x68/0xf4
 [c000000004a17c40] [c00000000207f860] gunzip+0x344/0x454
 [c000000004a17cc0] [c000000002007924] unpack_to_rootfs+0x204/0x380
 [c000000004a17d60] [c000000002008124] do_populate_rootfs+0xbc/0x2b8
 [c000000004a17df0] [c0000000001973e8] async_run_entry_fn+0x58/0x170
 [c000000004a17e40] [c0000000001806f4] process_one_work+0x1d4/0x4d0
 [c000000004a17ef0] [c00000000018199c] worker_thread+0x3ec/0x5b0
 [c000000004a17f90] [c00000000018d298] kthread+0x138/0x140
 [c000000004a17fe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
 Code: 7c7f1b78 f8010010 f821ffa1 e929b53e ebc30080 e8630028 e94d0478 f9410=
048 39400000 7fde4a14 4bfff431 8123001c <913e0008> 4bff3245 60000000 907e00=
0c=20
 ---[ end trace 0000000000000000 ]---
 pstore: backend (nvram) writing error (-1)

Caused by commit

  0eccf222d798 ("fs: port files to file_ref")

I bisected it to this commit, the commit before boots OK.

I have reverted that commit for today.

The qemu command line is:

qemu-system-ppc64 -M pseries,cap-hpt-max-page-size=3D4k,accel=3Dkvm  -m 2G =
-vga none -nographic -enable-kvm -kernel $vmlinux -initrd $initrd

but=20

qemu-system-ppc64 -M pseries -m 2G -vga none -nographic -kernel $vmlinux -i=
nitrd $initrd

fails as well.
--=20
Cheers,
Stephen Rothwell

--Sig_/c+VjkI1f/HBkG6X5vuFJ3LZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmch4KQACgkQAVBC80lX
0GxSBQf/b7j8Q5EaGEM4KdVFkjAL4kV82VwfPaPzb7MpOmvZJwSOdWz+2RgaJrax
vC+QNc7bm2Je6W7qM6kmaeqMOjqGz8HxP5jpR4fvah7UPmmWAEGInPhD6sO67byR
owcNcUqNbYDWrdeqN/8eC30ovDxpuj3A83fsuh7PyHz8Mzqak6ZcjUizE9lc92WY
8Ctt8XJc1J24Rvlf8HLVe5RQR4+6uMyrvwcPcncTwIm+aXkTgx3tftm7OdmvvQZ8
WXkYnXBtPBJCzgHjxWmJEp6dqvLcvkMpAPzNRG6/Z5XuRUnD61ug9SFXm1Xc8Wox
3mXI7nGH7zRKogtt2Lg2C+kAF9iVqQ==
=2z5S
-----END PGP SIGNATURE-----

--Sig_/c+VjkI1f/HBkG6X5vuFJ3LZ--

