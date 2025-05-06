Return-Path: <linux-next+bounces-6542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D74AABB1A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE4E77A94B2
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F19F223DD4;
	Tue,  6 May 2025 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PrO87tr2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26F4B1E49;
	Tue,  6 May 2025 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516399; cv=none; b=sketqRT8PF7i2mviUdYXEH+4eDnJXaC+ruCbiinv0C+V2R3U0aZeQ62z1cTejzX2nhH5lQFi9PZLAuLcEuWAABKpja+p9OQ6MLR3bfEQ0srIm9Ab4dIICtEYo0xLfGqVAAcic7uck0Q69eAg4ql+ZeEmegwUOTLGM+FtWwOAfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516399; c=relaxed/simple;
	bh=P+ODETYfSJY5RU6yx56Vzmrv/7GEf7V/UkIZ7TGEHFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s26xsyjkft1kmPlomjEK8Ev1b23q83rjQcraDLAwVH0bwoYovABTXl2PVxVcH1e4lANNUQt4tpb7ytYPSLQhnEIJe+f1+kwZpRqmk8Kis1CjojFNU18p8hqE9JzX868bnol2XfdWsxSayBikIrrJjxztDvMKuAyXURc1Tjudvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PrO87tr2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746516392;
	bh=WcD/OoHUf9FLM3eE3m8oKDk3lhO2pUPO6pXyGxxxAw4=;
	h=Date:From:To:Cc:Subject:From;
	b=PrO87tr2lE/oDbbw6Cjr7jeUz7SXodKnAzOJDh8LVkRZUZUNHqaFpkHd4MmeDVjnW
	 xfNFsjWEAAAp4YG3nZTwIqQYYYkhiLUu+U9IhTaH00paK3FkgB8h+jbbpHM/+LKQIN
	 aRPfbkzmzyO+toZogzcYiJk+BT6tzg8wVM6V07y0oYgR7+X9kcQIUfVz4jSXEZMA4C
	 c72qViX4EI08ezqVaSpe02FURdtrG+S2OW4j/DkfUxjBcdAacmk5OnpdN+XvIA8SeY
	 VaX4tS8i0vuHUL4bm6gbroifd8umFYFcRUT1T7GbK0j1jdrptUgRT5pl2DVWOF/e+2
	 inuC6x0d3atpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs91h4fs1z4wnp;
	Tue,  6 May 2025 17:26:31 +1000 (AEST)
Date: Tue, 6 May 2025 17:26:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>
Cc: Roman Kisel <romank@linux.microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hyperv tree
Message-ID: <20250506172630.4385352a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BIvIskUXxV5zphOHTy92Hcp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BIvIskUXxV5zphOHTy92Hcp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hyperv tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/kernel/apic/apic_numachip.c:228:43: error: initialization of 'int =
(*)(u32,  long unsigned int,  unsigned int)' {aka 'int (*)(unsigned int,  l=
ong unsigned int,  unsigned int)'} from incompatible pointer type 'int (*)(=
u32,  long unsigned int)' {aka 'int (*)(unsigned int,  long unsigned int)'}=
 [-Wincompatible-pointer-types]
  228 |         .wakeup_secondary_cpu           =3D numachip_wakeup_seconda=
ry,
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/kernel/apic/apic_numachip.c:228:43: note: (near initialization for=
 'apic_numachip1.wakeup_secondary_cpu')
arch/x86/kernel/apic/apic_numachip.c:262:43: error: initialization of 'int =
(*)(u32,  long unsigned int,  unsigned int)' {aka 'int (*)(unsigned int,  l=
ong unsigned int,  unsigned int)'} from incompatible pointer type 'int (*)(=
u32,  long unsigned int)' {aka 'int (*)(unsigned int,  long unsigned int)'}=
 [-Wincompatible-pointer-types]
  262 |         .wakeup_secondary_cpu           =3D numachip_wakeup_seconda=
ry,
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/kernel/apic/apic_numachip.c:262:43: note: (near initialization for=
 'apic_numachip2.wakeup_secondary_cpu')

Caused by commit

  2d2d4d8bb009 ("arch/x86: Provide the CPU number in the wakeup AP callback=
")

I have used the hyperv tree from next-20250505 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BIvIskUXxV5zphOHTy92Hcp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZuaYACgkQAVBC80lX
0GzNSAf/VBy47Wmx+OYgYr1cbxgANwO+xs66XN4zbx+uluy+Pxa2JEKAr5J3XsaN
RRbBUhKRx1TOvL9lfGmHWwZsPKBZs+9TXdr6iXO3FokotDOc80mmVp8VS4ksxpse
HkplPih7waBuf1FF71V7/hdINwZTCWYFof7KyJzvc+saTk5rPmJkUqqc69ewfrqk
dPvKqmaQGIKl2XgmdvAuyieAnaSU0XAiPpK1WvlS2XK1hvDvfaV7R5YLy/7wGka6
AovI43XMV3jeZtBKhfZz9qZqny6ZYR1A+/CXk00/ZijbhcQCyqVCoYlvSq2Gn11O
+GmoDOP09daA6/1gvBv76woY/c7sjg==
=Pwxt
-----END PGP SIGNATURE-----

--Sig_/BIvIskUXxV5zphOHTy92Hcp--

