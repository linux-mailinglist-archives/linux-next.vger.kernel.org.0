Return-Path: <linux-next+bounces-8743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E416DC147A7
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 12:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2AE51984FE9
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 11:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1099F30F806;
	Tue, 28 Oct 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUQsdYLu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA22A2E06ED;
	Tue, 28 Oct 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761652437; cv=none; b=VZZbnwVeJqY2xTVG7s54UcVp01XCUVr3vCWzqjE/+fqxQH2dooavGu4avxoCUiwNEP5SYufByzTmpGTUYIm57YhfxCRNLB5s5yV8awax/peShTzmq+Pv3BwjlaqM0xgF7r2hDdsTRuJBLXJHuNif9CRhdfbBk2RbayAMd575ct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761652437; c=relaxed/simple;
	bh=fXciL9iAbpGR6MKXzs+4d4rQPN9O/stPm84VqkWZjWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tu1ITbOtEQpxiSzusbsidsrlY1Y5z3dAObbzpmge+66dsFLpNuFEMCjd9cuqiabgaZva58deUGFltBmtq109awsz2aTZey5lAySwCDHi7dBPz2j6C0u7jIw3hMZRLhoq1xvCXjVv2t8HONQb48aIxHSA1txhSpMdUfHlWG2I42s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUQsdYLu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445CEC4CEFD;
	Tue, 28 Oct 2025 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761652436;
	bh=fXciL9iAbpGR6MKXzs+4d4rQPN9O/stPm84VqkWZjWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUQsdYLu8bddtS4iP4So2jDOaFInw/RYrDHPCTH8Vc1yJ2G0dvymnL5B7oGZ2IABI
	 m7qu88vSwm5ZqD8UvvMlE32R1R5/QGDD/d89AlC5/0ZR028Z5JrkEXJtm1M75jrHrO
	 ODgM3EV+5CMxdrCsTgfqiNVxNwXhsS6yHJvD9m/eagc5maSE6yY4UuzxMsnsl54SXo
	 ed9gwWsp7Kn0SXPVU9UwaCCYqxK3t8Ix8WB2XFP1TWGtP3XEQy71Crri4AmcswzSME
	 DuzecLPQAeOycoX6a9PMVxUjNizC71BbBN0fKJ9FG4EcZuoyFCNysPSZztaV94/z9c
	 X4EoNn3NYqS3w==
Date: Tue, 28 Oct 2025 11:53:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Shuming Fan <shumingf@realtek.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <731ec83a-1dd8-467e-88db-84d6ce313c72@sirena.org.uk>
References: <20251024101931.49f46027@canb.auug.org.au>
 <86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
 <20251024120920.23f707f5@canb.auug.org.au>
 <20251028093411.605431d0@canb.auug.org.au>
 <20251028093725.6e065eeb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NEjjOtWgl11Wa+dr"
Content-Disposition: inline
In-Reply-To: <20251028093725.6e065eeb@canb.auug.org.au>
X-Cookie: I smell a wumpus.


--NEjjOtWgl11Wa+dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 09:37:25AM +1100, Stephen Rothwell wrote:
> On Tue, 28 Oct 2025 09:34:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:

> > I am still getting this failure.  I cannot find anything that would
> > have interacted with this addition of name_prefix.  I can only
> > speculate that maybe this file was not built in the past for an x86_64
> > allmodconfig (i.e. some KCONFIG change) or an update to an include file
> > has messed being committed.

> Found it!  There is commit

>   ea9771390378 ("ASoC: soc_sdw_utils: add name_prefix to asoc_sdw_codec_i=
nfo struct")

> in the sound-asoc tree (which is not merged into linux-next until much
> later).

Yes, I know that.  What was bothering me was why it wasn't showing up in
my build tests which normally include allmodconfig.  I just realised
that I'm still suppressing those tests because mainline failed to build
an allmodconfig due to:

/build/stage/linux/drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D =
width o
f type [-Werror,-Wshift-count-overflow]
 1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit DMA addr =
capabil
ity */
      |                     ^~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/dma-mapping.h:93:54: note: expanded from m=
acro=20
'DMA_BIT_MASK'
   93 | #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
      |                                                      ^ ~~~

and never gets far enough into the build to show anything else.  I think
that subsequently got fixed in mainline but I didn't merge up yet.

--NEjjOtWgl11Wa+dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkArssACgkQJNaLcl1U
h9CwYQf/V6lwE6f0Bli99xLkXXhDyHrPpLlxq+YyD+Z6TzSWnWw/9iYn95yeyu73
wk/ClmGOUMepgS8E14c/c73m+Oil5FBAFZy2J6TOEkQs1yme4OPsL4A2G/kbQ7Yk
g2U8EgChfjk0nt3bRPpPgNDOpvev7aX0/RJQ00gGGFALb30zmI1rPOKuJ0ydlkIC
PgorJN1wej4UwpvNoqtXxuXHQb1QxPgGagSNAH/MRkxwqFS5Wx3y4qhxRCUX90XX
JUi+pZrZiKF9/kV1Ec78MPFoK5WoLUTNr7DpO+V0KD8bNOv//3FQfvVHj7J5vufZ
7lCDCgIxHN+5QR4W/kAY1oKUBKXN5g==
=FJU1
-----END PGP SIGNATURE-----

--NEjjOtWgl11Wa+dr--

