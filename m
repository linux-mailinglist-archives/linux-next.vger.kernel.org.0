Return-Path: <linux-next+bounces-8724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BDC11DE5
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 23:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEC594FEEF5
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 22:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3FE311956;
	Mon, 27 Oct 2025 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fYfXyma1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF42E54BC;
	Mon, 27 Oct 2025 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604650; cv=none; b=OXbB43DBY5hyHeu7HdwAauVsmc534e0EfFbFhcoKNJ/QD+mx097NK9dEo7/UjNwgc//PXcFVNuHLNhGTzBfoBQmQd3+tCKffO5MN7tRQ+EDA9sw27+4bFBRwLqOKXQYIIFCdQgznWSU86YaAzaBSV6bN8MThfMrkyyTL/pPcD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604650; c=relaxed/simple;
	bh=xJdIJtHVgTDD8xX1fvfp6fU7ekmVnJFips7tQxnZ2MI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iklZ61WoWJQXvGWvMRWTitkM0N3A7CcXAXvhVLlzFExuWr4pVypBW/q/M4XUEmNO2x5TowEZ73T7Cb4Oa9ZuzHXVJji+cc3iEIZ9BIUoY9HSJaZTeZi6KoQZ4iGXt/ZMUlorkI49CGmIACgNjbqQ/sqHdIiCVnR5YC9etSl8+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fYfXyma1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761604646;
	bh=cii4i8r2vQKsR7o13O/x8mNzBPniaros0tAWLMrIwDo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fYfXyma1DVfBcRtmnbutMFRGLdoTTsgjsb9TKxJLtD3olgLxwjRId4NRl+ejkZRii
	 zb4RNPuLhk5pqg709U91S1HSYe3X8nceYazEEQxyqSSWiuc9nxC3PHOFM6iCJk9C+2
	 pSVRtQBgjk909vMdxp9awEVLgc5U2xyAXvWjmGmisPKDJ81O3YmE94ndf/x+hfTgu2
	 y8TCvIzh3XyiwfEyzQyhwWuIhmrcT48ojkLGVSqxvn+egIsg/bDcEubN449XGmvWQR
	 tZQb2Ns5O9cNtnIdXaAsRBnPlzxZqGJ9uX66bW9CT5TeBpHSDiOQNPtce7RiCSaDdd
	 5m138PTje/VPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwT0P6f1Vz4w2S;
	Tue, 28 Oct 2025 09:37:25 +1100 (AEDT)
Date: Tue, 28 Oct 2025 09:37:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Shuming Fan <shumingf@realtek.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20251028093725.6e065eeb@canb.auug.org.au>
In-Reply-To: <20251028093411.605431d0@canb.auug.org.au>
References: <20251024101931.49f46027@canb.auug.org.au>
	<86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
	<20251024120920.23f707f5@canb.auug.org.au>
	<20251028093411.605431d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6dD1.6SG_+gUPgiBUzR3Y_e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6dD1.6SG_+gUPgiBUzR3Y_e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Oct 2025 09:34:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 24 Oct 2025 12:09:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Fri, 24 Oct 2025 00:49:11 +0100 Mark Brown <broonie@kernel.org> wrot=
e: =20
> > >
> > > On Fri, Oct 24, 2025 at 10:19:31AM +1100, Stephen Rothwell wrote:   =
=20
> > > > Hi all,
> > > >=20
> > > > After merging the sound-asoc-fixes tree, today's linux-next build
> > > > (x86_64 allmodconfig) failed like this:
> > > >=20
> > > > sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw=
_codec_info' has no member named 'name_prefix'
> > > >   316 |                 .name_prefix =3D "rt1320",
> > > >       |                  ^~~~~~~~~~~
> > > > sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization o=
f 'int' from 'char *' makes integer from pointer without a cast [-Wint-conv=
ersion]
> > > >   316 |                 .name_prefix =3D "rt1320",
> > > >       |                                ^~~~~~~~     =20
> > >=20
> > > And I do x86 allmodconfig builds which should stop something that bre=
aks
> > > getting published...   =20
> >=20
> > Yeah, so there must be an interaction with something merged before your
> > tree ... but I couldn't find anything obvious, sorry. =20
>=20
> I am still getting this failure.  I cannot find anything that would
> have interacted with this addition of name_prefix.  I can only
> speculate that maybe this file was not built in the past for an x86_64
> allmodconfig (i.e. some KCONFIG change) or an update to an include file
> has messed being committed.

Found it!  There is commit

  ea9771390378 ("ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_inf=
o struct")

in the sound-asoc tree (which is not merged into linux-next until much
later).

--=20
Cheers,
Stephen Rothwell

--Sig_/6dD1.6SG_+gUPgiBUzR3Y_e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj/9CUACgkQAVBC80lX
0Gx0xwf+JWsVdArpfFDdfsc2lkD1TlteOAjkU6I5N/lQBA1QCGhQJ3ofxcZdDxWg
uUBC9Eo+JldfizvFVBDNBAYGM6zXWZY1zYSIAWv+en81QwmRiQ9iFprUXpocnMDW
3t+oSRrB5JHyRHE05mb7DFgJPxBDJ2gexX5fy4OL1KnsgLwW3t8oWSQXUp0uj4di
aq0ow2lqra90C/lupVn00KwHbcNk5glNtGjeW9CgyQxuVmdaK6oFoMZGR8VYyEHi
k3h6zyHSX0HpZNnD7jHV7uX78GTGXOJORJ4RQ9C7pgtzKBXj8BRPXk15AufLhSll
4Rdd9V6hAfnVU+zn3juuv7V4xzuiBQ==
=9dKG
-----END PGP SIGNATURE-----

--Sig_/6dD1.6SG_+gUPgiBUzR3Y_e--

