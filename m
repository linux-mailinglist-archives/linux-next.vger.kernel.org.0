Return-Path: <linux-next+bounces-3156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F7940798
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 07:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D35283E8E
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 05:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444D118FC7E;
	Tue, 30 Jul 2024 05:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UmmJ1GHJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D91169AE4;
	Tue, 30 Jul 2024 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722316976; cv=none; b=RXq2WXS+PmQgZTdT8VR3qjVZi1n4mmPkqTt8wO91KQOcxMrI7wring3KTYpNQxkpTzPWxeQP7dO1xPQbtDc2glvgcB2AMyx5wN4ZPccLhdEzxHksBi/WsWaPnFo6YfmHUCx7V6Tf0CYYQX2rzjc+sZdIvPM3Vn1rmZxfoHBMz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722316976; c=relaxed/simple;
	bh=lCpDDbMQgo55gP5PyfmsisBQVm3aBwseLxx2lo82xPI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZZB5+Cu/NvnvvbBa8V3qYmX1+scjy98lkpKAAKEZnU+ZpXZ641tUOGiyTlVvK2ms65UtnTfH4ti6ZcUJ2E6/2DVifZ03lilZATwIGCgCZe8RiDTOCY4xtaESNrypj7Po75fPiM8zRLr2IpD18fxQJfdx3eWxwqxS+UjotSKwQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UmmJ1GHJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722316968;
	bh=51WdvQXHJ7ZpG5VOsFqYISEQ19UkyfE/uJAsolV8rCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UmmJ1GHJBDvzvpmEcxXTiFwXPk6T3J3UbSbliNmVP21mu0tHC0ivIwxLrNzy/hOR+
	 vPTQhDy0wt7xcEgzE8Qq2GxxwmSOFZY99JBqpcKOXo5eCoI/JtS6OHBsdrQoCiRlXj
	 L2CSAqDJ5UId1/eBHHbdrQPHwq358CpiOWJTP6yXz8EDV/Nass9FueTFeFeDqY1f5m
	 3VsrLviJ7Gr4GNdPSbB3hwMDfhw3R+RbgFV14k3RERJ7pOlgrq3TadmGvx+spyACbB
	 AXrnJCzyoc8gEoyT4W4FtB5f+V+LCc7izODHHtPFkou/486IkktH2i+rG6zHU9/b6l
	 H9BnyQU3cMurQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY3X771Xfz4x3d;
	Tue, 30 Jul 2024 15:22:47 +1000 (AEST)
Date: Tue, 30 Jul 2024 15:22:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the origin tree
Message-ID: <20240730152246.525b346a@canb.auug.org.au>
In-Reply-To: <20240730082204.57c64765@canb.auug.org.au>
References: <20240730082204.57c64765@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+AzyUsaV3CR8P0zpe+Fwi/B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+AzyUsaV3CR8P0zpe+Fwi/B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 30 Jul 2024 08:22:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the origin tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
>=20
> In file included from include/asm-generic/percpu.h:7,
>                  from arch/powerpc/include/asm/percpu.h:28,
>                  from include/linux/irqflags.h:19,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:7,
>                  from include/linux/mm.h:7,
>                  from include/linux/memblock.h:12,
>                  from kernel/profile.c:20:
> kernel/profile.c:52:28: warning: 'cpu_profile_flip' defined but not used =
[-Wunused-variable]
>    52 | static DEFINE_PER_CPU(int, cpu_profile_flip);
>       |                            ^~~~~~~~~~~~~~~~
> include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_=
PER_CPU_SECTION'
>   104 |         __PCPU_ATTRS(sec) __typeof__(type) name
>       |                                            ^~~~
> kernel/profile.c:52:8: note: in expansion of macro 'DEFINE_PER_CPU'
>    52 | static DEFINE_PER_CPU(int, cpu_profile_flip);
>       |        ^~~~~~~~~~~~~~
> kernel/profile.c:51:48: warning: 'cpu_profile_hits' defined but not used =
[-Wunused-variable]
>    51 | static DEFINE_PER_CPU(struct profile_hit *[2], cpu_profile_hits);
>       |                                                ^~~~~~~~~~~~~~~~
> include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_=
PER_CPU_SECTION'
>   104 |         __PCPU_ATTRS(sec) __typeof__(type) name
>       |                                            ^~~~
> kernel/profile.c:51:8: note: in expansion of macro 'DEFINE_PER_CPU'
>    51 | static DEFINE_PER_CPU(struct profile_hit *[2], cpu_profile_hits);
>       |        ^~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   2accfdb7eff6 ("profiling: attempt to remove per-cpu profile flip buffer=
")

I also did not understand why my arm and x86_64 builds did not get
these warnings, but my i386 defconig build (that I only do at the end
of my merging) actually failed, so I remerged your tree with the fix in
it.

--=20
Cheers,
Stephen Rothwell

--Sig_/+AzyUsaV3CR8P0zpe+Fwi/B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaoeKYACgkQAVBC80lX
0GyISAf/caY8cQlR4+93T7UqB0S29+Roo7blG4uAjQfJX0aaulRmvqhuRo4OpPst
6u/VD32SeEk/CtWov8Ygoe+TksEN78deEUqDU8xRzer771k0yQQJumpx5E9cdfpY
wS5KabSeii3AlJniIVSuE48lMjQixakNor+NB+e+IPoP83hY8tvftdDzPt1AZLjX
f4YckyPFsigq+RLgWw20ZY0VaAi9zbYuWP44MOvVQqjefKG9/IUeqYX4mNAnvbVm
tssnvpuUJt5ZNZnSaOhEp+1TRAd1uZsCAChDA5O4V7s5BwYBnj+gUxyp738Dcdda
MfGTxfF/65R9sGmffThWplJXPpPo9Q==
=GdBh
-----END PGP SIGNATURE-----

--Sig_/+AzyUsaV3CR8P0zpe+Fwi/B--

