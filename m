Return-Path: <linux-next+bounces-8045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF6CB2E860
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 00:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340AF3B0D7B
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 22:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BE02D9EE2;
	Wed, 20 Aug 2025 22:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rC/q3crL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1BA284894;
	Wed, 20 Aug 2025 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730491; cv=none; b=LmCEoa4wuJTWqThOZHvkWalwDD22o+7a5CexvMu4t0EkfobR3SuSzq3CLw9mW8bU8IuPfJLOC+uZ+mX1lZkbylmwU50KXzTUgECyOdzHGpV9rFDzh9oFHocEPfZ7hKtrCyuvNqsktMQr/Quc3cM5ZEz7WoTazWzF5kJDv4EEAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730491; c=relaxed/simple;
	bh=54NbdyWkuzrpuzcpcoEmg9Jf8ZCywwIjwFcvNZy5SCE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfw/wXv5yiERQSx9rQEvz4+BotodJD8QpxJPVdoPPkSCFO7SbJK7Qj+rAinExvGoVp9JlfyCaZl0ou35TiB2U3gBJ64yAs4oclB7MSaI7dDyp56PeiGXEb5/mWI4T7TbaYrpR/JIZolrTpBveVHZKPFk12uad1PmgBHYpQa9jV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rC/q3crL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755730484;
	bh=dksXYoS42Uwd4uqVpdUrbMSDam3JFMNSjEargo1Od6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rC/q3crLfXM4Rg/exp+qY32a+qyF4yVod4lViF/NlITN4fnSW9M7lQaQ+XcIuCFnc
	 2wHu8OBawk2ljCiTtJpZyVkd+3vjBMkjbaFmFl8L6nqR+UXJdflbVMtmm154k6sQoN
	 1Ex+L022U2WvMOGZVy5Bdb4h5Hd6+HzoVZ1dkFI+wfgwTysQKz9g3C45C5ms2ogda8
	 e36L30cRUX7Qo9VaDFkTThbGDKjjk4kjup5FnOGIKPfAADatmJfcsOSxR+4hyxCEPh
	 gBHDTJHysQYubF05UTxJE5p8EbTtediMSKYDlOXYvnlKF9tt1Bp+R5ifzErhQ2ku3U
	 lzkfm8WGztztw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6hbl45CJz4wbr;
	Thu, 21 Aug 2025 08:54:42 +1000 (AEST)
Date: Thu, 21 Aug 2025 08:54:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250821085441.437cafbf@canb.auug.org.au>
In-Reply-To: <20250820094239.30dea649@canb.auug.org.au>
References: <20250818090559.3643eabd@canb.auug.org.au>
	<20250820094239.30dea649@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_XGv/ViooFqSz+Tvec0=/hd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_XGv/ViooFqSz+Tvec0=/hd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Wed, 20 Aug 2025 09:42:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 18 Aug 2025 09:05:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > fs/iomap/direct-io.c: In function 'iomap_dio_zero':
> > fs/iomap/direct-io.c:281:36: error: implicit declaration of function 'l=
argest_zero_folio'; did you mean 'is_zero_folio'? [-Wimplicit-function-decl=
aration]
> >   281 |         struct folio *zero_folio =3D largest_zero_folio();
> >       |                                    ^~~~~~~~~~~~~~~~~~
> >       |                                    is_zero_folio
> >=20
> > Caused by commit
> >=20
> >   5589673e8d8d ("iomap: use largest_zero_folio() in iomap_dio_zero()")
> >=20
> > I have used the vfs-brauner tree from next-20250815 for today. =20
>=20
> I am still getting this failure.

The above commit is still in your tree which makes it unbuildable since
the interface it uses does not exist in your tree (are you testing it?).

$ git grep -w largest_zero_folio vfs-brauner/vfs.all
vfs-brauner/vfs.all:fs/iomap/direct-io.c:       struct folio *zero_folio =
=3D largest_zero_folio();

$ git grep -w largest_zero_folio mm-unstable/mm-unstable=20
mm-unstable/mm-unstable:block/blk-lib.c:        struct folio *zero_folio =
=3D largest_zero_folio();
mm-unstable/mm-unstable:include/linux/huge_mm.h: * largest_zero_folio - Get=
 the largest zero size folio available
mm-unstable/mm-unstable:include/linux/huge_mm.h:static inline struct folio =
*largest_zero_folio(void)

Please fix this up - maybe just drop/revert that commit until it is
sorted out.
--=20
Cheers,
Stephen Rothwell

--Sig_/_XGv/ViooFqSz+Tvec0=/hd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimUjEACgkQAVBC80lX
0GwOwQf/fS0Ys23NuamjtfD1bM84E0WR5vME/ui/gqncY7Vfj+5Hk078+1sRJna8
Bu4MdhZEbJ500u96j2otbMCOfcdFQBGYZi62+BAtotUkYJZ3ZuIi5kMfKVPRBIOh
lieY0Sixtg0uLiM1o9oOoF/fA2Y13InutAjmOTmpgUnLCs4tbZxX/PEaNauq7kQp
iI3zfgdS8RgQgJpgPONwyvjoNw3gGq54rPQFkGpwsNiDCj6C0ioxmZUDcvTuWAyC
05q/u+cGG1AFcXHoqhTnCzM7O0n//UQXc/nrE71Q5U71aNT0Tcxxb2T02RnQAkTB
fdrbEeGCT5dekGdbTyRYU2qRfD2nRA==
=tDLA
-----END PGP SIGNATURE-----

--Sig_/_XGv/ViooFqSz+Tvec0=/hd--

