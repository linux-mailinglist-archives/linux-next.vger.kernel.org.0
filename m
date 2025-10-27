Return-Path: <linux-next+bounces-8723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89366C11BA2
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 23:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 501E51A286D8
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 22:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3C132C951;
	Mon, 27 Oct 2025 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cQ6voZcy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2ED239E7E;
	Mon, 27 Oct 2025 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604467; cv=none; b=IQXrLwZ2mBwmI30dmUSR6Ym1E0F+jP8GNDCN1OS0To8dQEhZuv499LJmuFzUyRquO+ST1KXqveP+FZ2tgik265Xd6vTlx/622LSE3xCdYGtCKxG6X5PNWKuyY69Pny5s1zhV6ovSB5/VBxisIsDNqLR9eR9+WNF+CRXMdUPv4Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604467; c=relaxed/simple;
	bh=qU2VxRpbuNiTyHE0Yc8cSi6C0ZRyvAMmh9JzIi0UzHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=keb9MITpiwM+ZKuzIQOQgSCIMgZl42SKCbkrhZ8Y6KLRdF0NNnjCzGp4Rc9Fz7Fw1Dt6CeSEIufK3G9TtKPon7UyXBwmbQg7hY2evELx5dIijbRm0FXwWAQ66e+WlbcxfD8Z+nMNcyjutj+tC8ZnvizaCl8pPpJ1VYqFLkjegjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cQ6voZcy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761604454;
	bh=MOJvda80GwZKDsl4dcpCDAKcPw5mUM2zrPfFiHahJfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cQ6voZcy8cFhrsYBqh+IDupU3wIltkSO8UaRFAZ0efRxbMn5mxm+iKOInwsdjN1n5
	 NN0zqmECOHSyayC4P4SVJJxobijY+SElIkH/IlUJ5YaXbW5X+dlIoa6+kXfCaw1Y4m
	 gs7JKN8bJq82T8PqnqjNVXXZJsNi7OjLLP5OcabLwFY9pupXeeyow7gz1BHuxsFxzx
	 uzQ97dLyWdy3YFJyQgvst4d0ou0AWpwQMnUrHb5qzSEx4FZID7AJqHoxi4fpGyymko
	 nCeIzk/TnGwtNdw/5fgtQ5XUW6po24N3M/WJQGyBKmTHchXgnJKEVipHQSAuWdsBXm
	 ln/zObVq7U9+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwSwj0YzZz4w1h;
	Tue, 28 Oct 2025 09:34:13 +1100 (AEDT)
Date: Tue, 28 Oct 2025 09:34:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Shuming Fan <shumingf@realtek.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20251028093411.605431d0@canb.auug.org.au>
In-Reply-To: <20251024120920.23f707f5@canb.auug.org.au>
References: <20251024101931.49f46027@canb.auug.org.au>
	<86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
	<20251024120920.23f707f5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YWTe7oIVrMAEcYYA6F4uqR=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YWTe7oIVrMAEcYYA6F4uqR=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 Oct 2025 12:09:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 24 Oct 2025 00:49:11 +0100 Mark Brown <broonie@kernel.org> wrote:
> >
> > On Fri, Oct 24, 2025 at 10:19:31AM +1100, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > After merging the sound-asoc-fixes tree, today's linux-next build
> > > (x86_64 allmodconfig) failed like this:
> > >=20
> > > sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw_c=
odec_info' has no member named 'name_prefix'
> > >   316 |                 .name_prefix =3D "rt1320",
> > >       |                  ^~~~~~~~~~~
> > > sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization of =
'int' from 'char *' makes integer from pointer without a cast [-Wint-conver=
sion]
> > >   316 |                 .name_prefix =3D "rt1320",
> > >       |                                ^~~~~~~~   =20
> >=20
> > And I do x86 allmodconfig builds which should stop something that breaks
> > getting published... =20
>=20
> Yeah, so there must be an interaction with something merged before your
> tree ... but I couldn't find anything obvious, sorry.

I am still getting this failure.  I cannot find anything that would
have interacted with this addition of name_prefix.  I can only
speculate that maybe this file was not built in the past for an x86_64
allmodconfig (i.e. some KCONFIG change) or an update to an include file
has messed being committed.

--=20
Cheers,
Stephen Rothwell

--Sig_/YWTe7oIVrMAEcYYA6F4uqR=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj/82MACgkQAVBC80lX
0GzeNAf/Soo1yTx9xBQBE7bMbVDQPiaUoSq1Ou9liCak/a+ul8gk07kezfSERbPx
C3k7+f0jN0qch76T7SS2SJQgXg38qwNYuzceKqJNVNW/1Pk2nFAl6Lt+DLKkTZQU
qmiwsZIUyaDEmPLpWkVHxqnH8947NqK+Bx95RQW/6epV3fNbyObPf+rwC5E4T2oH
Dvrpctwky4yKAWp/CYtRGy7q1iHp68LQAbenvM3tv35lXMNuOAcvnFcVgYbo/bGm
sAJ90/jJCY5qiiSQHyFVXh8XQMGHx1mxWUH6JyQqKt6fdDj6dhlRFXGO2Xu0SxBd
RbdpCnx/QzFxyqP3z+eQNnKkhewpNA==
=IY6g
-----END PGP SIGNATURE-----

--Sig_/YWTe7oIVrMAEcYYA6F4uqR=--

