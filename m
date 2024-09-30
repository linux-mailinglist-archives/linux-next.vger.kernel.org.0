Return-Path: <linux-next+bounces-4015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D298A569
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 15:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC07D1F25BCD
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21A218E779;
	Mon, 30 Sep 2024 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="geDgJNFo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B500157A5C;
	Mon, 30 Sep 2024 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703400; cv=none; b=r4LEuIDKHNM3FRDeI3GxLJPhsFGUu+gAge14H/o0nr6FT7cemllqa5dyJwOXjFaI+4l2eUS+i2IsAgMkQaJjTmavPmjM/GJM5zx7Oj7P8huI2pkkQ/Ymu/GajOhfG9K3DxjmH6HcMQwG3g1wtyEipkR516k+FBazSSG7dyOuaUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703400; c=relaxed/simple;
	bh=9Jod10R4RtzEoR4Uzv7lhmO0qX6B/HcFytO0MOVHoAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NIvmjBkJoGD6xyzBeuM0aeSoUN+c6KEWmdn7/apPtUAL7XEmSX0rEa9KniOk++LGBPT/Qz45BzNyorC64Ox5slqNoR3eCgZzDPHkZqwq0XqARCfQiRaum9Ph3e91VW74hYFRQKia9wZWkfhc8nRiCUphPRjiN1xB64u7vTCyPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=geDgJNFo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727703396;
	bh=VoQFTK/chG5VYPCklOHOHrA7ZyeKJw67fZSy41PgLso=;
	h=Date:From:To:Cc:Subject:From;
	b=geDgJNFo8hGahupx8+N5tp0A9M9n8sJX8TMU9/qY8bIezzJG5LLFjcvOhKpUzRbm9
	 3lwQqwWIwE+gZlwqKi32BJiYUG6NwAvyG6f3W6weaEq8QaL4Ucey8+bph6ERKfSGHE
	 8K7nbbgxNEFaAg7ELoc872h34Dl6CAgE2Xx7zSQF1qo8aLDpFen2VazKJ52dGyxqD8
	 752TcR7TGruYLqRlBxInb+HgijNN4RzqTDa7uwTLSenXwkE9YGyH06l4fD6VBHA3Fe
	 Yam56FREBzRKNe7NO06s3mp9fYzz6Vixaj1s46oDVlH+mfksrgFbT2uIIrYxCdRE2w
	 xXzBNIc9m1iNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHMYJ07Zxz4wbv;
	Mon, 30 Sep 2024 23:36:35 +1000 (AEST)
Date: Mon, 30 Sep 2024 23:36:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sam Edwards <cfsworks@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Message-ID: <20240930233634.3af1daa9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BPMoywLiDuDvRz9ONJJK6=G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BPMoywLiDuDvRz9ONJJK6=G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  ab3cf1ab3fdb ("arm64: dts: rockchip: Designate Turing RK1's system power =
controller")
  ed1b30c33bb9 ("arm64: dts: rockchip: Fix Turing RK1 PCIe3 hang")

Fixes tag

  Fixes: 2806a69f3f ("arm64: dts: rockchip: Add Turing RK1 SoM support")

has these problem(s):

  - SHA1 should be at least 12 digits long

    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/BPMoywLiDuDvRz9ONJJK6=G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb6qWIACgkQAVBC80lX
0GzGYQgAkm5Rjdw8XHfOyLwkOisAROtrBsl9usjh7Q9TNVqZ7V9tPdE98bY/fMNS
CfW3jCA7+5FdvvlntMRPPHIHah6GlZ1d1kQdMdorZBga2o1hkkY0ZRJRdvK0Hb22
sNfb77CqVqjhCSq9vt0CU5Ts6tw/ccW/IAXHTwsj13aZ9KLZXvs6/jUkdz8QqsHG
3pCZfK10ugyRgyh1wnDevmxOl+sXXmYB4L37GwAJTblp3P0tjYtFbZhenjPMOxqI
gKYTc2x4f/UurjBlPH22WnN/iolnRRiSVeab7xDAWDxDZttjp2vR9Tv9udY0sjRb
NRVYOd3FhB8F0ovVEmzT697XMpj9cg==
=Xoo8
-----END PGP SIGNATURE-----

--Sig_/BPMoywLiDuDvRz9ONJJK6=G--

