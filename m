Return-Path: <linux-next+bounces-4649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC169BFF01
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 08:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3051C213BF
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 07:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D1D194C94;
	Thu,  7 Nov 2024 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g4F6QKs4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB57194C8D;
	Thu,  7 Nov 2024 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964262; cv=none; b=K0RdR2l/4LfaOBrw7G/leIw4kSBY/XCDXtxvdtl+gtRghKknwYSpWWnE0kS50cf3Fh4GQTDufGcCQldCA02wmdwPFSc4l6tvjemRnR3VFpPNL5MCU+ptfNyJH8RUJpMfoyLC4GL8J9AZb1X+081ecEeuD2d4HyX79Mr9IsdLE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964262; c=relaxed/simple;
	bh=yKSWaD2r7ugdR5FspLC7HV/vgzYdq3m9nwQC1wbrOIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AhzqWI3j7ZGpg2CGhJPBJVXtRrbxOmSjATgVCFmKlmqL6EIP80ynPmwVchR5DI7JWT6oT1zj1bypWacecLryCgJE69mPTE+QCeuiVjPml5rS/cwiwlriSY+dby41Xx5rEVT9x24r79FWRgU9steUlIfj4duNaKGwyxPMmqM2Dg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g4F6QKs4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730964251;
	bh=UPI4SoD2Uxo9GAN+LEMJ7aAhd/xFEPLvAYe0FCQS6kE=;
	h=Date:From:To:Cc:Subject:From;
	b=g4F6QKs4tEQB2n9AavFHSYyirjLlpE75uGsMAVaIvNPSRAnxiL/4OjM+psxyuya+v
	 JgYfw0aXjGpqeLFzDAP5u8ec08NoW9uVxERdilPO6zNZOqPz04pwqy2i0bIYz+nDhd
	 Huktxkd62GIDidm+j7c8zMezOfrFgFnZYUmL2Dgx8M850wlMTN/a3uM6MWgFnKOciR
	 c6Wl1064xi4if3b7rYINWo7F5Pmh7IFKuljc1X42xcutwRys9j3McIufOuXkqjejSv
	 Q9kr/LrZH1BInzTVeU9q9oC9sy6PAelvCOi0WvQntathotjfbEKLUqQOVTov3WjbDB
	 ZytrLKbmn0Zhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkYV303vSz4wcl;
	Thu,  7 Nov 2024 18:24:10 +1100 (AEDT)
Date: Thu, 7 Nov 2024 18:24:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20241107182411.57e2b418@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0FYRoJmUHfD108fwEN7pmdT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0FYRoJmUHfD108fwEN7pmdT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from rust/helpers/helpers.c:26:
rust/helpers/spinlock.c: In function 'rust_helper___spin_lock_init':
rust/helpers/spinlock.c:10:30: error: implicit declaration of function 'spi=
nlock_check'; did you mean 'spin_lock_bh'? [-Wimplicit-function-declaration]
   10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WA=
IT_CONFIG);
      |                              ^~~~~~~~~~~~~~
      |                              spin_lock_bh
rust/helpers/spinlock.c:10:30: error: passing argument 1 of '__raw_spin_loc=
k_init' makes pointer from integer without a cast [-Wint-conversion]
   10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WA=
IT_CONFIG);
      |                              ^~~~~~~~~~~~~~~~~~~~
      |                              |
      |                              int
In file included from include/linux/wait.h:9,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/highmem.h:5,
                 from include/linux/bvec.h:10,
                 from include/linux/blk_types.h:10,
                 from include/linux/blkdev.h:9,
                 from include/linux/blk-mq.h:5,
                 from rust/helpers/blk.c:3,
                 from rust/helpers/helpers.c:10:
include/linux/spinlock.h:101:52: note: expected 'raw_spinlock_t *' {aka 'st=
ruct raw_spinlock *'} but argument is of type 'int'
  101 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char=
 *name,
      |                                    ~~~~~~~~~~~~~~~~^~~~

Probably caused by commit

  35772d627b55 ("sched: Enable PREEMPT_DYNAMIC for PREEMPT_RT")

at least reverting commit

  dafc2d42c0a6 ("Merge branch into tip/master: 'sched/core'")

makes the build work again for me - so I have done that for today.

Without the revert CONFIG_PREEMPT_RT=3Dy, after the revert it is not set
and spinlock_check is only defined for !defined(CONFIG_PREEMPT_RT).

--=20
Cheers,
Stephen Rothwell

--Sig_/0FYRoJmUHfD108fwEN7pmdT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsaxsACgkQAVBC80lX
0GzV+ggAgMPdpDsoCcH8oxUwjcWW3sDwKNwgPSPEddj1vVjTjQERuYxyxtCXTX+j
qi28LFQx1OsBKpkUxAuT/9EcVmXKn8NIFzShJeVB6PJFWNRNVA9LBJGY1VVy8FHa
E4mzdTQa/g4B9kvYWyKWc4CHwnaGT/PwsZuhyPaxmfyXK+10ZiPSqBwEdP4z5rTS
wF5YlYNCY1Kr2wXoRq7gqr9CldWPxXUwX8FhSh3sb7nhokai9X6xQ3bk6ZoZ1nc+
D3cL3Nhc32g7yElK8qPR2YBJY1oRGvenAfrdeahQzrqNpKAIrzHnpuvuh8+mboTE
l1N4ysCo/2lN75nIRo59B1AZKupjCw==
=q3BK
-----END PGP SIGNATURE-----

--Sig_/0FYRoJmUHfD108fwEN7pmdT--

