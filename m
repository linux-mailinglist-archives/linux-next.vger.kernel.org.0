Return-Path: <linux-next+bounces-2810-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EFF924C13
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D191F2381E
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 23:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915CA14F9FA;
	Tue,  2 Jul 2024 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OrsEWSFV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB101DA30B;
	Tue,  2 Jul 2024 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719962568; cv=none; b=ZWm6+dloKB9F4lPXa69JS6FyLADdUXUIuXXKjbiv1rBnff6Aw2z2Nu0NNiX20dvRDwv5jmRIdtX5bZQWFxkLUDezuIdkiGY0ooGhdAXqEFTBidfS2L550q3vpxyhHtGy/elCHLYyhyuC8X3khQ7sB4aNkXcucCHCXnKgYCJSDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719962568; c=relaxed/simple;
	bh=REbe6WGQ6Ib0OcOX5pORxT0QBGzBhRKYGxco9d+az/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+H+en/mbLLiLjEC4aLhm7uUwEppjIFPZqhQwdU8zkW9YijOSgz9KL5uE1QHhUhypZG6G3nRAuabDzwSgltugTs6FWJTu9jMlXvKR9nHx1y1QLehKZYsrpSyl06nBWBCDLL3N8Phcg2TvRQs6IPobIRHB8txW5KFsQ19YadbnkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OrsEWSFV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719962555;
	bh=j1lYas/9hzOOuzljKOtg9P7FT/xPULbebgfHS6aaLBA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OrsEWSFVWkhfcXuDw3kF3+vyYjOFHMca9USYrkC86DFW/a1wYQnW+9SnONYxhUSxp
	 P+KyeV3UaKXGVSY10pXpJeniBfr8MRIzv8Wb//+C5zexhUOIX/sWCdIl4npiP/hShv
	 ul4xs+YrzcuHMHkX9KYneq5Ll3FalYSgzzECyB4LrUDC9Y+aDaK4umEAlxMII54gt8
	 IxOeNBgg+bB8N9VvIUZ+X6UclbbJ3uBDWMnZiFHSpnsLe7xXX8EjJX0Jif/lh2Xy+A
	 BKMRP8V0u57/sM6DVNmR6Ox+2SO1YVQQXd4Jip1maGATja4Kqi3qEKXbqIJExHVEUO
	 F6qFD3zc+mmoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDJpy3m7Mz4wc1;
	Wed,  3 Jul 2024 09:22:34 +1000 (AEST)
Date: Wed, 3 Jul 2024 09:22:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20240703092233.44f51416@canb.auug.org.au>
In-Reply-To: <20240703084440.3af9f526@canb.auug.org.au>
References: <20240701101641.4fea0ac2@canb.auug.org.au>
	<20240701110159.216a8d1f@canb.auug.org.au>
	<37b70d3f-c46c-4df4-b52a-3c6ba5feb692@os.amperecomputing.com>
	<20240703084440.3af9f526@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AoCmTEf.GTVRbHxwH4s6.Ki";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AoCmTEf.GTVRbHxwH4s6.Ki
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 3 Jul 2024 08:44:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 1 Jul 2024 11:15:17 -0700 Yang Shi <yang@os.amperecomputing.com> =
wrote:
> >
> > On 6/30/24 6:01 PM, Stephen Rothwell wrote: =20
> > >
> > > On Mon, 1 Jul 2024 10:16:41 +1000 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:   =20
> > >> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> > >> ppc64_defconfig) failed like this:
> > >>
> > >> mm/gup.c: In function 'gup_hugepte':
> > >> mm/gup.c:474:25: error: implicit declaration of function 'try_grab_f=
olio_fast'; did you mean 'try_grab_folio'? [-Werror=3Dimplicit-function-dec=
laration]
> > >>    474 |                 folio =3D try_grab_folio_fast(page, refs, f=
lags);
> > >>        |                         ^~~~~~~~~~~~~~~~~~~
> > >>        |                         try_grab_folio
> > >> mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' =
makes pointer from integer without a cast [-Wint-conversion]
> > >>    474 |                 folio =3D try_grab_folio_fast(page, refs, f=
lags);
> > >>        |                       ^
> > >> mm/gup.c: At top level:
> > >> mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'=
; have 'struct folio *(struct page *, int,  unsigned int)'
> > >>   2747 | static struct folio *try_grab_folio_fast(struct page *page,=
 int refs,
> > >>        |                      ^~~~~~~~~~~~~~~~~~~
> > >> mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_fo=
lio_fast' with type 'int()'
> > >>    474 |                 folio =3D try_grab_folio_fast(page, refs, f=
lags);
> > >>        |                         ^~~~~~~~~~~~~~~~~~~
> > >> cc1: some warnings being treated as errors
> > >>
> > >> Caused by commit
> > >>
> > >>    5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")
> > >>
> > >> I have reverted that commit for today.   =20
> > > And I also had to revert commit
> > >
> > >    52cca85b0ebf ("mm-gup-introduce-memfd_pin_folios-for-pinning-memfd=
-folios-fix")
> > >
> > > from the mm-unstable branch of the mm tree.   =20
> >=20
> > The patch attached in this mail should fix the compile error.
> >=20
> > https://lore.kernel.org/linux-mm/CAHbLzkowMSso-4Nufc9hcMehQsK9PNz3OSu-+=
eniU-2Mm-xjhA@mail.gmail.com/ =20
>=20
> It looks like that patch has been applied to the mm tree instead of the
> mm-hotfixes tree - as a fix for commit
>=20
>   50ceb37037f3 ("mm: gup: stop abusing try_grab_folio")

So for today, I have applied the following patch to the mm-hotfixes
tree merge and stopped reverting
mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios-fix.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jul 2024 08:52:20 +1000
Subject: [PATCH] fixup for "mm: gup: stop abusing try_grab_folio"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/gup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 12c7b41712f7..5f58c95b3ab9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -437,6 +437,9 @@ static unsigned long hugepte_addr_end(unsigned long add=
r, unsigned long end,
 	return (__boundary - 1 < end - 1) ? __boundary : end;
 }
=20
+static struct folio *try_grab_folio_fast(struct page *page, int refs,
+					 unsigned int flags);
+
 /*
  * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed.
  *
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/AoCmTEf.GTVRbHxwH4s6.Ki
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEi7kACgkQAVBC80lX
0GxzwQgApIcRpx/dRkzrNBQUATis0acRzM32NogLihXcAC5j09S2ZJ6trZiRp/r6
LsLuMUhPtvX+2+pZWINpqGTn/LU/l48kVSOL/guichHAainSGqUHBnfZ9V+93icd
y3oQvBL2cC5DIq3WH5MowrAhhc/kAbZq2EqofZgPWFMG+HpBME98PTXaSS1mukjz
s6z5a6svp/OZ2nGJleQos5mjxr5EzAd1fIG4wV/c4ED4hgpskLxKn90TAK8WJAqq
I22ImsnfuY70W953DTVbEZpnHP/5sQEApDC+4itXHW2yjjISLaj+owFtouiQDBR2
g2/xwEZk2ccSPgZGgi4mbGajRVQ8Kg==
=BW72
-----END PGP SIGNATURE-----

--Sig_/AoCmTEf.GTVRbHxwH4s6.Ki--

