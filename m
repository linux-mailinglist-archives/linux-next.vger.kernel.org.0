Return-Path: <linux-next+bounces-3784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43B9764AB
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 10:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C678F284CDD
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA957188927;
	Thu, 12 Sep 2024 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gZlTX5ES"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8118C915;
	Thu, 12 Sep 2024 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130054; cv=none; b=tWrj37HyvXFlTvvdU/osmi1p1WbcHRAXaVMRx5HqH80n5Vl49xihGO5jaWoG8dcp/eIRNOjuq043qpyO+pPog+dgiNdkLtViUe37s0tEbNEYI54FUEQqJrLO+mJy/I2QQzoENCi2JndWOZTD6zI66XNtkJhd76/v/1hyVulMmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130054; c=relaxed/simple;
	bh=9rXAA799yCanRbu0UREXQCJUKJXkD1bCpnXsyIiz++E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgHYTOurQomDQ5aCBn2cDKVdTFPxa34L4tjW8wvWuluHnzhyoqp5f0aIZU4ZvvmETwjnW6J1bktM6cVG3d+FsqoDLL5dBDVH74IRoANjGszsICk/yerv5zNh+hc/zddTBHsuaPhD4afp1A/QpcGAj4jk87BVDJBWHthwFgA4kmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gZlTX5ES; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726130049;
	bh=mklHVYVYQFJw00ezWq1reA/aF87VYQ5Lzmvs58dlKWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gZlTX5ESbtBCa4TuHw/pkhNMaUU4g199fCsUjOzPuXDJWTNDju0J9WQ0sa/OeTY80
	 jvCMu/PmoiuoUnLj/q6a2gnKAsJY8nMVx2YWOAx5j0OXSRIcHbbjPdLahWMBgobOLX
	 faUhYPyQZz/L+c3+F7LodVoDQQcT9m6LoUwwnyrftS6IngF0qxhf3+lL9har/7Rgin
	 +tqeIYM7vIzhyLwBw1deo+C6FcL0kh5UrY2y5eSckKBDKjizjotsKaw1djceKT/IyP
	 VJMKKXBtGlaJkITUAwAWTZA+NUp8cEFQr7hX2BIYL/1BjfrS+cSh9bCPHZx9/2m8uL
	 28i1lel1OeUdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X49hc6JvFz4w2N;
	Thu, 12 Sep 2024 18:34:08 +1000 (AEST)
Date: Thu, 12 Sep 2024 18:34:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson  <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Hari Nagalla <hnagalla@ti.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
Message-ID: <20240912183408.36acc6dd@canb.auug.org.au>
In-Reply-To: <12e1eda76baaa67109da3798b1b184b4a94531e6.camel@collabora.com>
References: <20240822142603.3608a26d@canb.auug.org.au>
	<20240828150900.7ffd7588@canb.auug.org.au>
	<20240906183621.6c630b7f@canb.auug.org.au>
	<12e1eda76baaa67109da3798b1b184b4a94531e6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eUF6HoSJ0S8MTz5_ZLTJyqm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eUF6HoSJ0S8MTz5_ZLTJyqm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 06 Sep 2024 09:58:23 +0100 Martyn Welch <martyn.welch@collabora.com=
> wrote:
>
> On Fri, 2024-09-06 at 18:36 +1000, Stephen Rothwell wrote:
> >=20
> > On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >=20
> > > On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote: =20
> > > >=20
> > > > After merging the rpmsg tree, today's linux-next build (x86_64
> > > > allmodconfig) produced this warning:
> > > >=20
> > > > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> > > > =C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> > > > =C2=A0 Selected by [m]:
> > > > =C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K=
3 || COMPILE_TEST [=3Dy])
> > > >=20
> > > > Probably introduced by commit
> > > >=20
> > > > =C2=A0 ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver fo=
r M4F subsystem")=C2=A0  =20
> > >=20
> > > I am still seeing this warning. =20
> >=20
> > I am still getting this warning.
>=20
> I believe this is the required fix, but I believe it's waiting for
> review/merging:
>=20
> https://lore.kernel.org/all/010201919d8b298f-dd1585dd-7c4d-4865-9483-ff6c=
d7399a90-000000@eu-west-1.amazonses.com/

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/eUF6HoSJ0S8MTz5_ZLTJyqm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbip4AACgkQAVBC80lX
0Gw4nQf8DsqK7bQKQegomP3Ks4ybm/5zKzeClV0njNJOgAMH6jj7PgS7vG6K/Wnk
gaM/gNEPZZZPhMaeqIWIQWGbz6/wyZRn/RgedScV0iFdh8j57BX2nyM/ID2HF8Hz
JCRNyQZMrSqZQ+a0iffyfy/dI5ZCMNJI72ptwvu0ZMJDKYIPcWyLwIjWx8mRBCC+
Hgrpvu/r/ZL0VzlJWoBWsKo48cc8CfjptU4r99qSw45wwhSYDpaQsOhmIEErcgWq
mT7+FuAYmwniDYg+F+j0Z7slKJXXtuR9DOsZbcFedFfH8j1Z75a7+p5ypmfS3rS3
IjuS4PvnKvI3fdIV9qzr87KKfwW1bg==
=CE93
-----END PGP SIGNATURE-----

--Sig_/eUF6HoSJ0S8MTz5_ZLTJyqm--

