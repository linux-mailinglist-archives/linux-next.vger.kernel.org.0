Return-Path: <linux-next+bounces-6289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 764A9A91564
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 09:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843C3162B4B
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 07:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB431E1DEB;
	Thu, 17 Apr 2025 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LvlqwmYB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F11A2642;
	Thu, 17 Apr 2025 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875454; cv=none; b=XwwBaJOfaFN1rTB/BDNTPQBslPzu/Kcrm3qvtTtEStxV2BOTvYdOKNzgenBQPejIVF35BNfoUGHcP9Hl00U4OVc71u26nh4lv1HLUz8tWkUAeqqAkhM5BvBG14w/pCe/G7r848Je7si83oOuXFNdo/Hbw3uJmvk0loFBvMJ3QCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875454; c=relaxed/simple;
	bh=sR7SJNSsdPnxxO3WL3trpDnVNY/6u8qWjb1ZU8hLBCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VS80jqNP7s4nRfT4+f9NNPUq8MROsPykywpjBWq6LE1zhJfmnlt6j7o781EzQLNsLZwWiKirM/QhRwsMCpQA5LbumIiL63wzeJE7kf3sv+eU75X+zVAYHJjLmmPzp86HJz2CsW6F1bZX3mgqrdGrQ6axeNPqN5mM1gYarate9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LvlqwmYB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744875446;
	bh=UFDGrC4YyZOPqFlXAXUZrarTCktCbqUPuoOmgqFuDlI=;
	h=Date:From:To:Cc:Subject:From;
	b=LvlqwmYBgDEY+Ro/n6cJ/xmEU1AR2dEdyf966JAI9sn9do8qkECR4KqZKXK+7ph21
	 9VXwRD/SKWbIId7a0bWdGMue4zfaeZYRFfmx/BhLmcabaOCPabALr3YsnUR7BO/25q
	 oVasqJZRpiMaqOUFNBIMbRZ6FzibC4jVWKrRHC83zumfRq8BG85qT4tJKkzEeQuMrq
	 Pdo7DaOODDWUx51QWgMUQ+1I5OGm5W7mVXACccsXhv3Syo55ZmUSI2rj5PgPJHJ567
	 e5O5dDu2iGa6BNoDqhRifvW3tUGfMD4h4w54lQPij0ycBuwcnTxENW2YC8yySlHdBG
	 Fo3klGz8qM28Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdV922J2tz4xMy;
	Thu, 17 Apr 2025 17:37:26 +1000 (AEST)
Date: Thu, 17 Apr 2025 17:37:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: runtime failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <20250417173725.2b53ce51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mWzEIpCEAo_iTXH/49O=rrw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mWzEIpCEAo_iTXH/49O=rrw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

My qemu (without kvm) test run of the powerpc pseries_le_defconfig kernel
produced lots of messages like this:

[    0.277765][    T1] smp: Bringing up secondary CPUs ...
[    0.279408][    T1] smp: Brought up 1 node, 1 CPU
[    0.279967][    T1] numa: Node 0 CPUs: 0
[    0.316269][    C0] watchdog: CPU 0 self-detected hard LOCKUP @ __del_pa=
ge_from_free_list+0x40/0x220
[    0.317763][    C0] watchdog: CPU 0 TB:8969124768, last heartbeat TB:896=
3932512 (10ms ago)
[    0.317922][    C0] Modules linked in:
[    0.318417][    C0] CPU: 0 UID: 0 PID: 20 Comm: pgdatinit0 Not tainted 6=
.15.0-rc2-04777-g729ac2241d5a #1 VOLUNTARY=20
[    0.318698][    C0] Hardware name: IBM pSeries (emulated by qemu) POWER1=
0 (architected) 0x801200 0xf000006 of:SLOF,HEAD pSeries
[    0.318893][    C0] NIP:  c0000000005c2000 LR: c0000000005c2e18 CTR: 000=
0000000000000
[    0.318930][    C0] REGS: c00000007ffd7d60 TRAP: 0900   Not tainted  (6.=
15.0-rc2-04777-g729ac2241d5a)
[    0.319002][    C0] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 44842202  XER: 00000000
[    0.319300][    C0] CFAR: 0000000000000000 IRQMASK: 1=20
[    0.319300][    C0] GPR00: c0000000005c2e18 c000000003ba7b40 c0000000018=
0d100 c00c000000bcd000=20
[    0.319300][    C0] GPR04: c00000007ffb8380 0000000000000007 00000000000=
00001 ffffffffffffffff=20
[    0.319300][    C0] GPR08: 0000000000000000 c00000000297d100 c00000007ff=
b8630 0000000084000202=20
[    0.319300][    C0] GPR12: 0000000030000000 c000000002aa8000 c0000000002=
4e4e8 c000000003a4c9c0=20
[    0.319300][    C0] GPR16: 0000000000000000 0000000000000000 00000000200=
00000 0000000000000001=20
[    0.319300][    C0] GPR20: 0000000000000001 0000000000000002 00000000000=
00000 0000000000000000=20
[    0.319300][    C0] GPR24: c00000000290e548 c000000002980278 00000000000=
00001 c00c000000bcd000=20
[    0.319300][    C0] GPR28: c00000007ffb8380 0000000000000001 00000000000=
00004 0000000000000004=20
[    0.319764][    C0] NIP [c0000000005c2000] __del_page_from_free_list+0x4=
0/0x220
[    0.319800][    C0] LR [c0000000005c2e18] __free_one_page+0x3a8/0x8e0
[    0.320080][    C0] Call Trace:
[    0.320208][    C0] [c000000003ba7b40] [c0000000005c2e18] __free_one_pag=
e+0x3a8/0x8e0 (unreliable)
[    0.320439][    C0] [c000000003ba7c20] [c0000000005c3584] free_one_page+=
0x94/0x240
[    0.320491][    C0] [c000000003ba7cb0] [c000000002043660] deferred_init_=
maxorder+0x224/0x2b8
[    0.320550][    C0] [c000000003ba7d50] [c000000002043954] deferred_init_=
memmap_chunk+0x7c/0xbc
[    0.320574][    C0] [c000000003ba7da0] [c000000002040ea0] padata_do_mult=
ithreaded+0xfc/0x410
[    0.320603][    C0] [c000000003ba7e90] [c000000002042f6c] deferred_init_=
memmap+0x1d0/0x274
[    0.320785][    C0] [c000000003ba7f90] [c00000000024e634] kthread+0x154/=
0x170
[    0.320819][    C0] [c000000003ba7fe0] [c00000000000ded8] start_kernel_t=
hread+0x14/0x18
[    0.321020][    C0] Code: fb41ffd0 7c0802a6 3b400001 fb61ffd8 fb81ffe0 7=
c9c2378 3b293178 fba1ffe8 fbc1fff0 7cbe2b78 38a00007 7cdd3378 <fbe1fff8> f8=
010010 7c7f1b78 f821ff61=20
[    0.321916][    C0] watchdog: CPU 0 became unstuck TB:8972181963
[    0.323609][    C0] CPU: 0 UID: 0 PID: 20 Comm: pgdatinit0 Not tainted 6=
.15.0-rc2-04777-g729ac2241d5a #1 VOLUNTARY=20
[    0.323887][    C0] Hardware name: IBM pSeries (emulated by qemu) POWER1=
0 (architected) 0x801200 0xf000006 of:SLOF,HEAD pSeries
[    0.324140][    C0] NIP:  c0000000000376bc LR: c0000000000379d4 CTR: 000=
0000000000000
[    0.324295][    C0] REGS: c000000003ba7a48 TRAP: 0900   Not tainted  (6.=
15.0-rc2-04777-g729ac2241d5a)
[    0.324435][    C0] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24000200  XER: 00000000
[    0.324824][    C0] CFAR: 0000000000000000 IRQMASK: 0=20
[    0.324824][    C0] GPR00: 0000000000000000 c000000003ba7a20 c0000000018=
0d100 c000000003ba7a18=20
[    0.324824][    C0] GPR04: 0000000000000000 0000000000000000 c000000003b=
a7bc8 0000000000000054=20
[    0.324824][    C0] GPR08: c00000000217f1a0 0000000000000049 c000000003b=
73400 0000000084000202=20
[    0.324824][    C0] GPR12: 0000000030000000 c000000002aa8000 c0000000002=
4e4e8 c000000003a4c9c0=20
[    0.324824][    C0] GPR16: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    0.324824][    C0] GPR20: 0000000000000000 0000000000000fff 00000000000=
2ffff 0000000000000fff=20
[    0.324824][    C0] GPR24: c00000007ffb89d0 000000000002f35f c00c000000b=
cd7c0 0000000000000000=20
[    0.324824][    C0] GPR28: 0000000000000002 0000000000000000 fcfffffffff=
fffff 0000000000000003=20
[    0.325758][    C0] NIP [c0000000000376bc] __replay_soft_interrupts+0x4c=
/0x170
[    0.326366][    C0] LR [c0000000000379d4] arch_local_irq_restore+0x154/0=
x1a0
[    0.326634][    C0] Call Trace:
[    0.326796][    C0] [c000000003ba7a20] [c000000000037720] __replay_soft_=
interrupts+0xb0/0x170 (unreliable)
[    0.327080][    C0] [c000000003ba7bd0] [c0000000000379d4] arch_local_irq=
_restore+0x154/0x1a0
[    0.327190][    C0] [c000000003ba7c00] [c0000000013b029c] _raw_spin_unlo=
ck_irqrestore+0x4c/0xa0
[    0.327281][    C0] [c000000003ba7c20] [c0000000005c3590] free_one_page+=
0xa0/0x240
[    0.327363][    C0] [c000000003ba7cb0] [c000000002043660] deferred_init_=
maxorder+0x224/0x2b8
[    0.327478][    C0] [c000000003ba7d50] [c000000002043954] deferred_init_=
memmap_chunk+0x7c/0xbc
[    0.327561][    C0] [c000000003ba7da0] [c000000002040ea0] padata_do_mult=
ithreaded+0xfc/0x410
[    0.327648][    C0] [c000000003ba7e90] [c000000002042f6c] deferred_init_=
memmap+0x1d0/0x274
[    0.328045][    C0] [c000000003ba7f90] [c00000000024e634] kthread+0x154/=
0x170
[    0.328135][    C0] [c000000003ba7fe0] [c00000000000ded8] start_kernel_t=
hread+0x14/0x18
[    0.328399][    C0] Code: f821fe51 38610028 e92d0478 f92101a8 39200000 4=
8141329 60000000 892d0153 38610028 61290040 992d0153 480fcfd1 <60000000> 39=
200000 e9410130 f9210160=20

The command line used was:

qemu-system-ppc64 -M pseries -m 2G -vga none -nographic -kernel next/powerp=
c_pseries_le_defconfig/vmlinux -initrd ./ppc64le-rootfs.cpio.gz

The qemu test using kvm worked fine.  This test uses:

qemu-system-ppc64 -M pseries,cap-hpt-max-page-size=3D4k,accel=3Dkvm -m 2G -=
vga none -nographic -enable-kvm -kernel next/powerpc_pseries_le_defconfig/v=
mlinux -initrd ./ppc64le-rootfs.cpio.gz

I reverted commit

  9dfefafd6c9a ("watchdog: fix watchdog may detect false positive of softlo=
ckup")

and the test ran fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/mWzEIpCEAo_iTXH/49O=rrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAr7UACgkQAVBC80lX
0Gwd5Af+MntSyJxcl1vykIRAs2RZ5p3KeiaMve3SK8RsYqYLidCxwoYrJNHMrX5c
SCl055BK9hX+YrWM3vPqWV2U7APbEYTzXfUSokk5dWo38Eqg/N+KIiZV7m8xZRmC
YjOagAoumVyI6BjIWCtKT4AtKj+sbryHcl3NL/GrOoXZL4Iu9aPB93rHGGyT+HHt
wXK2Tlvn1HSzNfR5lT6AQlVB2QPVKlK0Pc60kFRu+1C5qK/+esbsssRcblShYacf
tyBeL6UK0Rege2xgLgfKaYOm8x0LnqsmNCtfGQTsCHSuncLh4EbegeIcq1D0pttt
oRkSsjt1D78N79WAwkaC+FC74so+8g==
=Zyqp
-----END PGP SIGNATURE-----

--Sig_/mWzEIpCEAo_iTXH/49O=rrw--

