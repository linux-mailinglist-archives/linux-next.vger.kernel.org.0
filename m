Return-Path: <linux-next+bounces-6637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC1AB0F74
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 11:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F211318992A5
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 09:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6244428D831;
	Fri,  9 May 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R8ukwVHS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370628936C;
	Fri,  9 May 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783825; cv=none; b=MWpbPx7Lf7VYoReffQdYU0m+OBrBGGHHrv8e+cELIqzua3L96i/ea9NdyVF4/vTQMZfDvzrCkeSoEZyEHlDe79bL4bnlxRZHGmrwF2+s1cZ3Vx/60pkJo+m6CaM693TF9NxaauaC8Arc86GqgyIxxcxmCGiHy1GPec4+wabu4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783825; c=relaxed/simple;
	bh=csb5imiisZTx/FaJyogaV6yEysUQGVy6AaK2YQJLCV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=htUL6ol5I+IFFPnTsMK3xZbghyRCKnxQDhbzj5PoXHSMe66fJd6Q3mFvFt90fjLNYH7ntXobYDMY4L74wkILWQcmFn7vwkMr+3qiMugvaDrVfdIPbcOm+WMV2L0oFvK2OdNldSCnyEdDXCRt40pW+BY2VC8+Yt0am5yf3/KhlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R8ukwVHS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746783817;
	bh=ewbJUjr6I98gOlOK9SFVkZdUPvpHLEjhFI6DT0SLO9s=;
	h=Date:From:To:Cc:Subject:From;
	b=R8ukwVHShVUvw87ZuaHitarePxTLTm5Aq3WgjpA1SdhvS18QrKuJu6mugNIluuAjp
	 SRx3nW6JYzYOXrP2JEPL5sRB+FjeHGtdoIwq8eJl5hiHE/lgD3CUtzigyeHwYMhPss
	 6dDuNNMOCK4Jf4jZjptnbwvj2OuRYc9N2V4N14ehBl+Za/Qwakn545RxQ+gbQBqWXc
	 HAQBbs9ZntpxndZAzLQyeyuC9B+I5cxvfHC9tgTkO4DcNN8xkb737Z2r6eyL1ohyxh
	 KBpEZXs1WDE+U/3vF6WMjPegOdRcJq5nYPAP2Xp546CBtkP6v3JIctofFnT1GFXAQB
	 6+EFtNQBFrkDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zv3wT0H5Xz4xM1;
	Fri,  9 May 2025 19:43:36 +1000 (AEST)
Date: Fri, 9 May 2025 19:43:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Juan Yescas <jyescas@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250509194336.3c1baa34@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8BxZZS.pEBAaCmsG9VMaKE0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8BxZZS.pEBAaCmsG9VMaKE0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (powerpc64
allnoconfig) produced this warning:

In file included from include/vdso/const.h:5,
                 from include/linux/const.h:4,
                 from include/linux/bits.h:5,
                 from include/linux/ratelimit_types.h:5,
                 from include/linux/printk.h:9,
                 from include/asm-generic/bug.h:22,
                 from arch/powerpc/include/asm/bug.h:116,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/mm.h:6,
                 from mm/sparse.c:5:
mm/sparse.c: In function 'usemap_size':
include/linux/mmzone.h:1815:15: warning: left shift count is negative [-Wsh=
ift-count-negative]
 1815 |         ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBL=
OCK_BITS)
      |               ^~
include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DI=
V_ROUND_UP'
   51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
      |                                        ^
mm/sparse.c:301:16: note: in expansion of macro 'BITS_TO_LONGS'
  301 |         return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsi=
gned long);
      |                ^~~~~~~~~~~~~
mm/sparse.c:301:30: note: in expansion of macro 'SECTION_BLOCKFLAGS_BITS'
  301 |         return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsi=
gned long);
      |                              ^~~~~~~~~~~~~~~~~~~~~~~

Probably introduced by commit

 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")

--=20
Cheers,
Stephen Rothwell

--Sig_/8BxZZS.pEBAaCmsG9VMaKE0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdzkgACgkQAVBC80lX
0GyuLwf8CoiZnd+5sgj35etJke+bHcF8g2nOpwJhiAIJF8vsKcZlt5QhSGF+hE6S
M68eZK3xDJvBAQVotRebgXwb8mZbGhxoBVQ2b1unItF/TVh0/PmzF37j7MxoH+ay
vB/HHr3X6qgVW8khsX4W6PmrPlopIBykIEqc5id4zqCBeH959CtRuVOb/PU1De70
ykHq+Dz1tHF0qiSHgHRNXbBeGqa3nGrgBFDApFpIDzB1DR9n37l4AeIVvDCkb3Ef
NosLjcGhNjC9Ooveyjvqk0CxyXuqBF+Izhzn8OQwcSdnuncl80Fbwi7SOLGbkPWl
xWJ1WNzSkkj5sH0kGCxG8Ky268SrzQ==
=XXdl
-----END PGP SIGNATURE-----

--Sig_/8BxZZS.pEBAaCmsG9VMaKE0--

