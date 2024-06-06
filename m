Return-Path: <linux-next+bounces-2475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5C8FDCC5
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 04:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7289A1F2396D
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 02:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F9718638;
	Thu,  6 Jun 2024 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m9ckHSCv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE310A11;
	Thu,  6 Jun 2024 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717641041; cv=none; b=ZCEkEXvcssSkg9GhvQvyitUdoaiGW1rszpAxorSq8FwzCRAi+sav8aajh4u4+HIhUfRe3uulEd5bBPaFFbJC1e7Vp4V5+J6B/QkzpGBw9kNRnDC8VsekbUg2jmfhv08/cXVQjFMejq/mImoJggYdleFwDT1UWP7sZoJ0KEbzK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717641041; c=relaxed/simple;
	bh=LxujDUCoAGn/HL0wc/hUDm7fFlS/MuAj1T0yM6SyW2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mlJ8cUp4kmGoqZE7FSv7KiRXidholaRBriNJRXOrhXAdm4Ov3mR6FtAlUPqXqrmDLsXCPCY+dE0sYhBhWs20jxMSX2lSkB0J0Bk2exiDQGrx6ULqHFBukMWVoYnkrw3qPQoTAaegWoILlf1GadBnuiXpFq3RA9g9qxIwaAH8ceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m9ckHSCv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717641035;
	bh=uBzvogFrLUHIEOCidbSDNXXd9YZ5o0WVc5ZoHiJioMI=;
	h=Date:From:To:Cc:Subject:From;
	b=m9ckHSCvgyaYM4qAhz45TPpo1WEKhsV8DylmSwFBK0Vt1b+1DS3aokoLfZVth9MRJ
	 SymznbXV97ZmFvGjLuuxKWLA61A0Rb1UUhidjIXszi9bEzu2EtwWoX1xFhd56TE0a9
	 ZCnB334P+KBEmSe0X371JpKjOQPvZSG8n093un6dAft4x6XuDA0oCqFI4LpZ8JQ6RG
	 wHFpEFI0hBJgk/Stq+wHtuJkh3eeeKI6XPVoqD24Z/V0rFAu9XPRQU/h2Qbdh8+U44
	 yElwBtsXmtR2c9pPioDs4q+ilH6RGIRdtlRhXhvDp676/9H0Y1RJBxGu5qBOjZppVP
	 YqK/tFtjFsdGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvpGM2Y9Cz4wcl;
	Thu,  6 Jun 2024 12:30:35 +1000 (AEST)
Date: Thu, 6 Jun 2024 12:30:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Wei Yang
 <richard.weiyang@gmail.com>
Subject: linux-next: manual merge of the memblock tree with the mm tree
Message-ID: <20240606123034.052151bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cY2i+t1tYMpeDTJzaft4Ge8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cY2i+t1tYMpeDTJzaft4Ge8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  mm/mm_init.c

between commits:

  dcd8c5e5603d ("mm/mm_init.c: use deferred_init_mem_pfn_range_in_zone() to=
 decide loop condition")
  c6586af1f388 ("mm/mm_init.c: not always search next deferred_init_pfn fro=
m very beginning")

from the mm-unstable branch of the mm tree and commit:

  731b11684819 ("mm/mm_init.c: use deferred_init_mem_pfn_range_in_zone() to=
 decide loop condition")

from the memblock tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/cY2i+t1tYMpeDTJzaft4Ge8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZhH0oACgkQAVBC80lX
0GzCYQf/Vz77QCdiaGyyZDdcQsYlPXYDa3E/+UrceRxhiuy6FT7Kq+xqXbd56OBx
pWK0iqbqQi7S3n3Sigyt7Ok0eEqVwDncHVe70+qX65SNX6wqRD0WUHUnx5d5pwRu
SQ+0WeuRAR16pBvlMZUHDl7C71riZwPNKCob3Fm/8GU52mR/m+VvMj9m1hgNtkKu
4dyd4wSx4EPhcWiDz6tRi13Na+CH2tBQ+vWk5aTXjIfXJJkwcbLp7q7nDe8Wdg3P
9xDijejlublDnPN0VeiaZn2fLcRvRm6zaDZMGstSmZw/TjOqP1ZBwlGyH2pCWkPd
CZwA+P0byiF8lDdCK/kMqpBWklv1Vw==
=XZKB
-----END PGP SIGNATURE-----

--Sig_/cY2i+t1tYMpeDTJzaft4Ge8--

