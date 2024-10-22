Return-Path: <linux-next+bounces-4363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 776939A9A10
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 08:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64A61C2324A
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 06:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3881B14659B;
	Tue, 22 Oct 2024 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VT9oxWJN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E89136E21;
	Tue, 22 Oct 2024 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579168; cv=none; b=TPhFvLBh88LZB9ZIkbuxKHnFFeE/Bz/xtihSoTM1gYcbO8Q6Z0i5U0/9BMRhUhxZ5BCfHv7H5HMjGXwBFqgnefreeb4Zp8NT+GCYoYnZ6xC975RvfmYi8C4s1PWEqlpIKUdDc2K9xVHstepCkrn5HPE9ncfVB1TNjlpDsRHyvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579168; c=relaxed/simple;
	bh=OzGeI/Vzn0Ss0fm3/zilnSeCpjiuKWMkLpNqVtZ3CK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N8kd5D4pifHppMXkNRr56N9KwiKLJft3NS79LfS62KMx3BFNtXdq/Wwm9hbuEq/wUFpVt2FNKz/J/NRD4Efi5V3WF18VDzU9fmb5fO5+jZ3ZwqZG2I6P71camHRDuM8xYa5F3JvBK/OFdQZs8vv361fySX8O/4+nGrZRBdmajjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VT9oxWJN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729579161;
	bh=WMu2LkqYeC4La1/gbK1Jl+aB3PwL6OwogsTqJ2/R2a8=;
	h=Date:From:To:Cc:Subject:From;
	b=VT9oxWJNnJxKATusyy2mxf1deIjTVUJ/ikPIjttgVv2BuShYrWHG3FpTyCoMhDD1I
	 vtvzDTUJcJO89d+i6iEbwJwcMZExsH0iy3+Gc8XOUF/fBmFHJjjf72acbSdPMEi1xq
	 XjIXq1wPv6A5DnUr2Mog7xB1nbAooDtftDUBbaTrOAjRMgU/AcCjFvUwH1TyiSuT/S
	 moxdLjNqLYsUGdeHyVoO3V17AkeV4B4uUXfhM1WwVfnfm7b7PXPvij6SRSGk9MWX4d
	 yM76wfBfI9mtTrNdrg3ZATxbQrQESz2dBQlq9Ftpbt2eWMTuB7TTOrc79wqnqPGkoR
	 9VBaJyAyWD3Yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXjFj0qdgz4w2M;
	Tue, 22 Oct 2024 17:39:21 +1100 (AEDT)
Date: Tue, 22 Oct 2024 17:39:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Hua Su <suhua.tanke@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: boot failure after merge of the memblock tree
Message-ID: <20241022173921.6fdbdd38@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6VhCiUMmoi5_YqNkQ.QI=kv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6VhCiUMmoi5_YqNkQ.QI=kv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the memblock tree, today's linux-next build
(powerpc_pseries_le_defconfig) failed my qemu boot test like this:

mem auto-init: stack:all(zero), heap alloc:off, heap free:off
BUG: Unable to handle kernel data access on read at 0x00001878
Faulting instruction address: 0xc0000000004f00e4
Oops: Kernel access of bad area, sig: 7 [#1]
LE PAGE_SIZE=3D4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc4-06078-g367eaba269=
1a #1
Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x80120=
0 0xf000006 of:SLOF,HEAD pSeries
NIP:  c0000000004f00e4 LR: c000000000489df8 CTR: 0000000000000000
REGS: c0000000028cfae0 TRAP: 0300   Not tainted  (6.12.0-rc4-06078-g367eaba=
2691a)
MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 84000240  XER: 00000000
CFAR: c0000000004f2c48 DAR: 0000000000001878 DSISR: 00080000 IRQMASK: 3=20
GPR00: c00000000204994c c0000000028cfd80 c0000000016a4300 c00c000000040000=
=20
GPR04: 0000000000000001 0000000000001000 0000000000000007 c000000002a11178=
=20
GPR08: 0000000000000000 0000000000001800 c00000007fffe720 0000000000002001=
=20
GPR12: 0000000000000000 c000000002a6a000 0000000000000000 00000000018855c0=
=20
GPR16: c000000002940270 c00c000000000000 0000000000040000 0000000000000000=
=20
GPR20: 0000000000000000 ffffffffffffffff 0000000000000001 ffffffffffffffff=
=20
GPR24: 00c0000000000000 0000000000000000 0000000000000000 0000000008000000=
=20
GPR28: 0000000000000000 0000000000002a6b 0000000000000000 0000000000001000=
=20
NIP [c0000000004f00e4] set_pfnblock_flags_mask+0x74/0x140
LR [c000000000489df8] reserve_bootmem_region+0x2a8/0x2c0
Call Trace:
c0000000028cfd80] [c0000000028cfdd0] 0xc0000000028cfdd0 (unreliable)
c0000000028cfe20] [c00000000204994c] memblock_free_all+0x144/0x2d0
c0000000028cfea0] [c000000002016354] mem_init+0x5c/0x70
c0000000028cfec0] [c00000000204547c] mm_core_init+0x158/0x1dc
c0000000028cff30] [c000000002004350] start_kernel+0x608/0x944
c0000000028cffe0] [c00000000000e99c] start_here_common+0x1c/0x20
Code: 4182000c 79082d28 7d4a4214 e9230000 3d020137 38e8ce78 79284620 792957=
a0 79081f24 79295d24 7d07402a 7d284a14 <e9090078> 7c254040 41800094 e929008=
8=20
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Attempted to kill the idle task!

Caused by commit

  ad48825232a9 ("memblock: uniformly initialize all reserved pages to MIGRA=
TE_MOVABLE")

I bisected the failure to this commit and have reverted it for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6VhCiUMmoi5_YqNkQ.QI=kv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcXSJkACgkQAVBC80lX
0Gza1wgAkqhbLbkuniP/wYcgn720s7JUB1oV3h4+K4i/VQ0Y5+sEX5vFdgkzwItu
162R5Xt0sZsOztbLl/H6XbdGc4dqJoh/TaIEfnKSH8quL0KWIHui5F0dgW3MUIu2
6qAX2NInFFXnvOeLsnLAOFyYOjCB9RBghN609W1gnpUetnzWAb40FfYTvuW7ScU1
kTeVpCSV69iX0GHEna9Mbm/4U2il5Q1kjHQDqy0yutw+1v5QZPK1WA+TNlslDfzD
e8SbIfKRMQTkqKx3G4v0t4tuiYKgJF+p3kFTCSmTHv0hVuxHUIe7lAMjvMhk1l0s
dWUcSjL+eMoHumM+eTNAXNO5ihp+bw==
=JefL
-----END PGP SIGNATURE-----

--Sig_/6VhCiUMmoi5_YqNkQ.QI=kv--

