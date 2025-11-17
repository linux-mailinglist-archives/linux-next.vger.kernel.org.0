Return-Path: <linux-next+bounces-9045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FDC63286
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 10:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B54A334BD9F
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E4732692B;
	Mon, 17 Nov 2025 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IHxN8YRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0493B32572A;
	Mon, 17 Nov 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371344; cv=none; b=rD1YUReqMrbRF6y3iOS9/64PD/iMQT6wUdoDC0ITYiXMV/fFsI5RzBqpCiPiyMWs0HTYRuv2fvVYxsg60GGKYZ4iEqhUAvAKaTREUuU0b5WnEHL6kqzqDNBCdauawrCe+DFAZWqOF+ThQZm3eDIRLprsVG/x0+R5flqbBp8XTIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371344; c=relaxed/simple;
	bh=DIi/0XmquKzNKYXRwqwtS7+fB3TdyqKLarsmkNkw4EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I3GQsKW3i7g3Ylt5CDGvD+qo2VLgnDndqacRgA/PLyWGnYfH92reiAY1dOME+5DzmHivxhJJjYbDvIymlOpOQCCUJPpp+svG3QLc0LPVK9HZWIR9CE5YNUJ/PZsdS7EkEoQ96NgNJOd0dGmjYmLaiaTRn5y9Zrqjr8sByIyOaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IHxN8YRD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763371335;
	bh=9x8kYp7Jpw/lx1rAisDUm2/p5CHtb2B/pj8kJnLJIk0=;
	h=Date:From:To:Cc:Subject:From;
	b=IHxN8YRDHajY3U/sTTerfwq0n5xE/burKR3bGqvdtjcIlOoP5EIl4s5ApV8xNRVnF
	 /5HbmnWGr1DMd9ktpr+CywhXjfENB1J++r1Z6OZQvxDvxLjcjNCigvC8XSkvahbgc9
	 0mkxLnkPuyYAoKi3D91HbsPV+zN8ebZ485uWJUYtqRuqe4RxwRs8/i1N71UQpO137S
	 CpOWNjBSTznENi5h3SNzDCpIKjrNVZlSBvk6pGSy4dPjzHzeaKto93YxvQRSmxKIn7
	 /vH44qsl2b+inOzGpmZFg4n805cu8e9VrWESF090P1ZrzC2fXvQugkpE45gm4qvV2M
	 iN+DBp2gNhgpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d92MC1jTSz4w1j;
	Mon, 17 Nov 2025 20:22:15 +1100 (AEDT)
Date: Mon, 17 Nov 2025 20:22:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: boot warning from the final tree
Message-ID: <20251117202214.4f710f02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VuvFhKsCczBNVzGvvUyuc=Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VuvFhKsCczBNVzGvvUyuc=Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next qemu boot (powerpc pseries_le_defconfig) produced
this warning:

  ftrace: allocating 48915 entries in 288 pages
  ftrace: allocated 287 pages with 6 groups
  ------------[ cut here ]------------
  DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
  WARNING: kernel/locking/mutex.c:156 at mutex_lock+0xcc/0x100, CPU#0: swap=
per/0/0
  Modules linked in:
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc6-09359-g921087=
e37218 #1 VOLUNTARY=20
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (architected) 0x4e12=
02 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
  NIP:  c00000000148041c LR: c000000001480418 CTR: 0000000000000000
  REGS: c000000002957a10 TRAP: 0700   Not tainted  (6.18.0-rc6-09359-g92108=
7e37218)
  MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 24022240  XER: 000000=
00
  CFAR: c00000000021123c IRQMASK: 3=20
  GPR00: c000000001480418 c000000002957cb0 c000000001a3a100 000000000000002=
8=20
  GPR04: 00000000ffffe04a c0000000026abe88 0000000000000001 000000000000004=
b=20
  GPR08: c0000000026abd28 0000000000000000 0000000000000000 000000004402224=
0=20
  GPR12: 0000000000000000 c000000002ae9000 0000000000000000 0000000001bff43=
0=20
  GPR16: 000000007e68f070 c00000007f79c480 c000000002969160 c000000002a0f5d=
8=20
  GPR20: c0000000026a1138 c0000000026a1120 0000000000000000 c0000000019541b=
8=20
  GPR24: c00000000218a480 c00000000296e1d0 000000007d612000 c00000000380be1=
0=20
  GPR28: c00000000380be20 c00000000380be00 c000000002640100 c00000000380be2=
0=20
  NIP [c00000000148041c] mutex_lock+0xcc/0x100
  LR [c000000001480418] mutex_lock+0xc8/0x100
  Call Trace:
  [c000000002957cb0] [c000000001480418] mutex_lock+0xc8/0x100 (unreliable)
  [c000000002957d20] [c00000000024a60c] alloc_workqueue_noprof+0x38c/0x8ec
  [c000000002957e00] [c00000000203018c] workqueue_init_early+0x4d8/0x6ec
  [c000000002957f30] [c000000002004448] start_kernel+0x74c/0xa4c
  [c000000002957fe0] [c00000000000e99c] start_here_common+0x1c/0x20
  Code: 4182ffb4 3d2200f3 392971e4 81290000 2c090000 4082ffa0 3c82ffe0 3c62=
ffe0 3884bfe0 3863bf68 4ad90d45 60000000 <0fe00000> 4bffff80 60000000 60000=
000=20
  ---[ end trace 0000000000000000 ]---
  rcu: Hierarchical RCU implementation.

I have no idea what caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/VuvFhKsCczBNVzGvvUyuc=Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmka6UYACgkQAVBC80lX
0GzgbwgAnFk6uj+IW+qJoc+pgO4V5bGupdRFqdzt7QVciUOwny+sIIXwr5IR1quR
dw14hpdfi03oL0jK8VTX1fhGo2Tf64ubdyPWXBcd/2S8FAl/skB/rjOCS9ThLiWn
DqnJuP4Igc6IgSUXdUj2Berx10zNMug7gWXv7xyN/le+94LHaIMVCymcweiMvRlp
SU+mUtWBwETseA1+nPufnh4fk967Tj8xwkJHwcHZ6Swt3JXQaxv47w/ANnU8RtkL
7FqL+6qQmoVXNuTJDccxscRSk0bJ2bIIyuqaNKT67tMHn+E4JKzghnB7PaCTxtXM
o7lThBvmbPUfKB/oNBMohZj9WLanNw==
=zRc/
-----END PGP SIGNATURE-----

--Sig_/VuvFhKsCczBNVzGvvUyuc=Y--

