Return-Path: <linux-next+bounces-8698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568AC03E19
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 01:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313303B576A
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 23:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2D22727F3;
	Thu, 23 Oct 2025 23:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwuz6ea3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E833B19F;
	Thu, 23 Oct 2025 23:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761263356; cv=none; b=REUCOTEBpYfJOd+BOu1mkIpJ0dElSN3rpIkpFyo+tQE49bNWxMMLAp1Qs2mJNitzkG2pt/jGFyI6LZpLTcfW6bhjbOJRv0oEAu62wGnDlo5zxdhPUgRuoRlma6IejyBDgDRfZuYexGH3P7FGY/xqORvWUgt+0zuVYKupw/g/JXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761263356; c=relaxed/simple;
	bh=OgUs8+SZL9e0RkdhmEIGg0+WlPaKEnZD3S+5P/6E54o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8OPfih2NO8je6drans4R4blsqO4dopjIvpGVqZb8V0PoH0hgJKtnJqhFXADxlLKR4IUG0C+HcSOp4s/3Q+grAkcV19e3ZFpiovqTqT/wcWLa5WX/LeltFX7nwy2/acTk5rn/R+hJj+twWOoW0bbxTCuqgb9BjVuu9OhM0YxCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwuz6ea3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A08C4CEE7;
	Thu, 23 Oct 2025 23:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761263355;
	bh=OgUs8+SZL9e0RkdhmEIGg0+WlPaKEnZD3S+5P/6E54o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwuz6ea3xZNk32GCU1TiKaOiJOk3daD9BobjH9e+NU4YBIaNbsuDaN4IJmtYHF1dc
	 YvfwKyUbMx/RFKpoLjDqXxyMf/MnlaQfFd2vYV87nFEzTCJ9mgnWkhEsNiyJO6wIan
	 ftV3a+a/YtVWxDvsLi3KCQd73LHAgl4wi4JGpi2G2LPVuDN6ccoGlUVQuIOXRFaR6h
	 T/FSIzU28lgHTeIz46CQJyjjPYvyWTNCvLptpvQpe70bPlLWish2U2GOhSAk4B0KEo
	 VDqp9IRqJaXqsKkq0A2BafmMwJhggbuL6qF6V6MeRYW57TyKm4iIhZ7TLYt4imKB62
	 qWEvfxdCDFsYw==
Date: Fri, 24 Oct 2025 00:49:11 +0100
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
Message-ID: <86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
References: <20251024101931.49f46027@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z0vbGTRn6nOXX5RP"
Content-Disposition: inline
In-Reply-To: <20251024101931.49f46027@canb.auug.org.au>
X-Cookie: I've got a bad feeling about this.


--z0vbGTRn6nOXX5RP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:19:31AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sound-asoc-fixes tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>=20
> sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw_codec=
_info' has no member named 'name_prefix'
>   316 |                 .name_prefix =3D "rt1320",
>       |                  ^~~~~~~~~~~
> sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization of 'int=
' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   316 |                 .name_prefix =3D "rt1320",
>       |                                ^~~~~~~~

And I do x86 allmodconfig builds which should stop something that breaks
getting published...

--z0vbGTRn6nOXX5RP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj6vvYACgkQJNaLcl1U
h9DoPQf+J4uAmcxOitdMZ73ee3uAWkDR8s8dOgooOfOKT9fNnuzf8K63Z9r84dny
wIolarq6O4Wux+THWNmHM2Kcxj5Gn11jikH6JhY5SWvRkUG25mdVencPwgIsVyR5
gGY1lt46ZznMCBf0B315UnjU/o0yISlN2fN9uHeAc1f0fuaypYyU31SpZ1MtWQRm
f5PXOhQnn+nbEJQQx1Qo5jO4DTJ3C3OKO2llluFLaUazCRgA4KareZ+ZkMqpAiyM
Gr6Hh7QVXD1XPd0tMvBUJq0h3naljootsctO7NCRNBmS6seAWoKfP4ZXM0++MeJD
4jXJNAv4Ol5g91zgCYHSGoYi4qkbvg==
=eMwf
-----END PGP SIGNATURE-----

--z0vbGTRn6nOXX5RP--

