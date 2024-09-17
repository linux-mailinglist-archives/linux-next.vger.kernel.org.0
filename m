Return-Path: <linux-next+bounces-3901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776297B661
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 01:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC03D282EBE
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 23:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAC015820F;
	Tue, 17 Sep 2024 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g0XT6X6J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DEE14A60D;
	Tue, 17 Sep 2024 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726617477; cv=none; b=h0Tg//W8L4i7n/sGPZcpOPKOnERpFEoh6v4icDJrthWhX3lb+HcwtV2e6a0QjHE1gVjChiBSZbGaZ/wA/0FcAbcSuaXpqfpDOXKD762F9IDvNVcgouXfkogapyJ5Y5HuYeYt6vmif9PG51w+uuYxt3qIPQIeJk2CFalt4rm6rVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726617477; c=relaxed/simple;
	bh=gLclSiSy7wD7k/E3NJyzO4HeyVMQUw3RTSaTF9+PGHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRzK4RtBvZANgsVGKqj/Z9dCZHEJCi3JFSnmO62NVyFtAE4is+gtFZn1BYb65kRhNAGNU6ur5543i4fpab9rT7++lZj+5s7yWfms4n4BeGvFd7cX89VfbIBQQuOIp2w2Q42RHj8i6g7HEW1hWvZZUW4tuIV341xOZ5w8/RPYQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g0XT6X6J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726617471;
	bh=t1noOrDvrTz359kxFhjY3nJXTUUHuskoM8PWULvvuZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g0XT6X6JK66KjfatWW7onuqqIvkm3oEwC47tNb1oP2hwSFO2fHvUz7CCQwq5CTwbi
	 cjfym4uSRPRde5wid0GRe6bsjSabnKXRcig7VoECfEcAuhFX2mYUMoVTEZ8D67+q5y
	 0SVRGl7NNkw5PtO76fnLwo0dPsTlhsocHsWoGSX0c+8nmhKgJ0pZ2ZRcBS3CSTu3fC
	 6o2ryG6v27A2O0+/ktNjirGUjPxXRe5qVo8nMebUgw1s+MTZ+qCDvfjcJXAOI0ek6P
	 hkT5Dz36NgFZMk+ZkSC/3B7guMNtlkazO6Ciu0BcQqf6OoF4iK6IvCMmAXj42kM6zF
	 JPSq5cXCKbJsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7dy45kvFz4wy9;
	Wed, 18 Sep 2024 09:57:48 +1000 (AEST)
Date: Wed, 18 Sep 2024 09:57:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Takashi Iwai <tiwai@suse.de>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc
 tree
Message-ID: <20240918095747.508337e4@canb.auug.org.au>
In-Reply-To: <20240916145800.743302ec@canb.auug.org.au>
References: <20240916145800.743302ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FkEfwHpp0+phsd4eE3MHwPs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FkEfwHpp0+phsd4eE3MHwPs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Sep 2024 14:58:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sound tree got a conflict in:
>=20
>   sound/soc/cirrus/edb93xx.c
>=20
> between commit:
>=20
>   7a9a9110d765 ("ASoC: cirrus: edb93xx: Delete driver")
>=20
> from the arm-soc tree and commit:
>=20
>   130af75b5c05 ("ASoC: Switch back to struct platform_driver::remove()")
>=20
> from the sound tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FkEfwHpp0+phsd4eE3MHwPs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqF3sACgkQAVBC80lX
0GyM6Qf+K+yimpVHXRqeY5c2ufM1cDuZ4Ia7tdNp+mMdo2x17DQYzccnPDwVyuZs
3SYjfp02/HnuMTEfE4GFY+f8+/lfu81ZeU/JxVRMBpfCiCJF1eXtcnLpnzDcVOca
BOBm3vtUg2iv2esZ2AdLcux0L1bnB7uWycD8DUrIhPix+DagJQwc4MFK0JASh0Nc
9nQq3boXETCLrgA7IqcCpsipMOdEzth7YZDeDcZaFIqkO8SV6vZnO/FUm6CLlnYK
P1mqH4obkT/553xHTSHfnfe8uYK4zZMy802d79p2gqZpKxUZ3/NBZOk68ghjHzaR
EMsrnfzv4GWOl0wE7bquqaOZMElO1A==
=5Mf9
-----END PGP SIGNATURE-----

--Sig_/FkEfwHpp0+phsd4eE3MHwPs--

