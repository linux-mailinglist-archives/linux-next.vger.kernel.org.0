Return-Path: <linux-next+bounces-3152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322F940101
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 00:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07EC281D67
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 22:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0260B18E746;
	Mon, 29 Jul 2024 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RsBJFmaV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8519653;
	Mon, 29 Jul 2024 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722291736; cv=none; b=WUmxUkbt0DHn+EVMxPJhY08h92dGWNuqj6pkuMdvCqu2fU+5diNK4BV39dI4EHLdFNk6VtBQmO/+hyyK73qDwhPlvrvJwYwGf/F3xVuXSCciS68LuM+Xl1nhYFSR9P7kONYk8u9eLzJCdzEvoT6rCuMJbDbLBl16fYOHRx7P/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722291736; c=relaxed/simple;
	bh=aiX56Qd14p0wSU/aXe+donzenqYCI2p7SOijR9T3pJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i1kMpHInWfETUbZK+IVy3naE+xEbTQZlruRg5dIvZ6f0Bg4cNh4s9wqNfPEIbMyNbeQ7ZFV8w5zMKoqPkTPgGn/cgrCRNzrbbNxj8zkFs9F/sil9uQIza5N1YIzC+sYn2VMHsHr0Ex1GhylCVfeZ62eumyGCFVQBFROgc7Z78OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RsBJFmaV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722291725;
	bh=c5pNo7Tv4tQrL+8VFSsPzZszF/c5Y9wLE104h3RXJ+4=;
	h=Date:From:To:Cc:Subject:From;
	b=RsBJFmaV+S4lq30enTfslGWwJIC/l00HMFC7oaqEwkXEICz5v9wqauiPW+NEzQL2v
	 HEgS9RzDKQzGfHfVApQOxliu+MdKKNTcsp2iEuGpGhvXYXsFLP2ukmFiHQFqwduw2z
	 mAv6K5WotYUJ+i1z0KasgWany0fo+Bg5Myys9wJLaRwjrKRWKvWP86dL2pOmIHDEV7
	 8ICWwL+u4qX1r/LLo81lRRoevm8yn2FBy1GbLdJCR/8m2HH+wfLAySZub7XoLtN77+
	 Nqf+hv1kA/vu1sXw4Fd+EqrNRlR6Mr4bYI33nntL/OigZH78LrV5A3LxzXiaN0Gkva
	 V2FWu8w7To3Zg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXtBj4KF5z4x3d;
	Tue, 30 Jul 2024 08:22:05 +1000 (AEST)
Date: Tue, 30 Jul 2024 08:22:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the origin tree
Message-ID: <20240730082204.57c64765@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xvJf4oPdAS=I4cQrYfXKqtp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xvJf4oPdAS=I4cQrYfXKqtp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

In file included from include/asm-generic/percpu.h:7,
                 from arch/powerpc/include/asm/percpu.h:28,
                 from include/linux/irqflags.h:19,
                 from include/linux/spinlock.h:59,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/mm.h:7,
                 from include/linux/memblock.h:12,
                 from kernel/profile.c:20:
kernel/profile.c:52:28: warning: 'cpu_profile_flip' defined but not used [-=
Wunused-variable]
   52 | static DEFINE_PER_CPU(int, cpu_profile_flip);
      |                            ^~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PE=
R_CPU_SECTION'
  104 |         __PCPU_ATTRS(sec) __typeof__(type) name
      |                                            ^~~~
kernel/profile.c:52:8: note: in expansion of macro 'DEFINE_PER_CPU'
   52 | static DEFINE_PER_CPU(int, cpu_profile_flip);
      |        ^~~~~~~~~~~~~~
kernel/profile.c:51:48: warning: 'cpu_profile_hits' defined but not used [-=
Wunused-variable]
   51 | static DEFINE_PER_CPU(struct profile_hit *[2], cpu_profile_hits);
      |                                                ^~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PE=
R_CPU_SECTION'
  104 |         __PCPU_ATTRS(sec) __typeof__(type) name
      |                                            ^~~~
kernel/profile.c:51:8: note: in expansion of macro 'DEFINE_PER_CPU'
   51 | static DEFINE_PER_CPU(struct profile_hit *[2], cpu_profile_hits);
      |        ^~~~~~~~~~~~~~

Introduced by commit

  2accfdb7eff6 ("profiling: attempt to remove per-cpu profile flip buffer")

--=20
Cheers,
Stephen Rothwell

--Sig_/xvJf4oPdAS=I4cQrYfXKqtp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaoFgwACgkQAVBC80lX
0GxNtAgAiyd1GMK/d21X4e4mpWK29UNpR6ylHvMbKZhil13O4yeWNurVfO7Or40n
UQyXh04RDzS3EZjXTYqOyGkKZ/07HLgIXFZBQLl6300d0qIyYbsiMycdF0qXeUx9
rS1IblRCobLLrXSdpNCZoobNpvTSK1KskDjo5i/nuUjHj7jOZOVhzuhbpWY+1nty
/hknoiE4NS4nAM/PowZVpjUwMcKW5qOT410b4/qfDLnrkEZquqEr785WjzSQCIwY
rBpMOlCYm45J/jjwaaJg/31tm+xjcH6ZlQxeannFJe36SFPuMuC/fsUhCrhc6QTX
UxVWR7/xTdYT8phYlB0w9zpRpN8EBw==
=cji7
-----END PGP SIGNATURE-----

--Sig_/xvJf4oPdAS=I4cQrYfXKqtp--

