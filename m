Return-Path: <linux-next+bounces-2731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3391D57F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 02:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0374A1F210DA
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 00:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC3320ED;
	Mon,  1 Jul 2024 00:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RhweQCwL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A828F1;
	Mon,  1 Jul 2024 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719793801; cv=none; b=UKsRU2ajcW4BdoJm1/UCB/+ip31cq2zesE/Q7jkjpMD2i3e6taddACDZe5wNN2Ehi9EuMySc6ObUNcaUmffE0ZJoUqxksroXCuFyg1Kh0xP4nQN6iHNodxJ+kdM74Rc4FVAwEvuQnISe7rk9U9mp4posUEG7OT1kE2dQrFyGZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719793801; c=relaxed/simple;
	bh=CIAI8pSbYZL8Dpzqwpjl2pS2YGlblthN4CBSt3vdP5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD38bux+0QwnXt678xqSuWLB3HN5mBKBrlPU8gwY/AuGwGqoGf7LeXHxAlXJNH3NpIjc76T3JNm9g4SDhnVRSfWCmyYVZYcPiN5obJKGo2mLyHt3YQ5EscEPZczqxkvrHt9wkvfhU33mie848kL+ewF5j/VecqgkwTOE/lqPeM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RhweQCwL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719793796;
	bh=TyRsTITiVIKpKlb0tbOB4PvodyWSDG7A8WTcsKr6NDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RhweQCwL523E8R9SFGqJBygBklJ5A+eliHjWARbyrLN8YZko4SdQbLlCNDq8d9vzV
	 O2c/qb3cgTx+c3w2nFP9lM0mRGA+m8GmYHtT0JoNCa42OZwHswyG4OVKGgRJQdKZuI
	 B8Qphh0b5Gyl9x3QZrXkR25X62HHbnbUkSxiIWuRr1JZ90c95B6oizz4RdVK5jkWNV
	 xOhx8rVET0Hxs4BZVzPa889Stq2rLEyvgLtICctad11o3MCnwwMjj8zLNmpn5322Dc
	 mTKhJRW0EeCuad94uENe10MGQbj9ZG3PSsjgUlBpSrf75M/JGqvMJsiWKNilkGPho0
	 qeVfqVga6A9tA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC6Pb723pz4wxs;
	Mon,  1 Jul 2024 10:29:55 +1000 (AEST)
Date: Mon, 1 Jul 2024 10:29:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ipsec tree
Message-ID: <20240701102955.3105c389@canb.auug.org.au>
In-Reply-To: <Zn1cMmFP_FwwjYTG@sirena.org.uk>
References: <Zn1cMmFP_FwwjYTG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g.TjA9yAI_kv/V.67ZrE3Jy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g.TjA9yAI_kv/V.67ZrE3Jy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 27 Jun 2024 13:33:54 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> After merging the ipsec tree, today's linux-next build (KCONFIG_NAME)
> failed like this:
>=20
> ERROR: modpost: "xfrm_dev_state_delete" [net/xfrm/xfrm_user.ko] undefined!
>=20
> Caused by commit
>=20
>   07b87f9eea0c306750 ("xfrm: Fix unregister netdevice hang on hardware of=
fload.")
>=20
> I have used the tree from 20240626 instead.

I am still seeing this build failure in the x86_64 allmodconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/g.TjA9yAI_kv/V.67ZrE3Jy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB+IMACgkQAVBC80lX
0Gzflwf9FJACHNUtvrh5r7DS3zRkDJ03qCPk3mte1XV1J6SkAlkK+9Jx8sd02sIq
iLyFkkNtOGLejLBrBXZOZqpumarlsof/tlFCwB62jmm8WWUfxx6IgiM8nRfIc41i
6GbW/zN5C48Suyf28d+0EMptbr7G10L0YWJ0bivUX1c/BFL9QxpQaPFYjXJxqRqY
3bh+lgipBpmfn+PglM4Io2rbg1YiPOrcDYcGDzTDWv0joagAW/E1/bXznZkRPa+6
Fzt3NuP6zvGceNGtqmwS1kwTdi/Ujc51Lsv1NXceEJoqqNV3RvZy4HoWsRZoPufU
MS6Qx2Q9cvwgSOBKMS/F0DMqPXsrOg==
=KX45
-----END PGP SIGNATURE-----

--Sig_/g.TjA9yAI_kv/V.67ZrE3Jy--

