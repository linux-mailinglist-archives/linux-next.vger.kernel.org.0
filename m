Return-Path: <linux-next+bounces-6016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30813A71002
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 06:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0776C188A5DF
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 05:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A59B143895;
	Wed, 26 Mar 2025 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YTnEXcHr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD3DF59;
	Wed, 26 Mar 2025 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742965289; cv=none; b=M9SFq1l9SFjR1T0hdBQEEujcPJWYeMob2tVZvJmFTCBHGqvXGU3NJFUojg58PRE08rd9LrOx5gtO0XmmrRFvR0lkOBwNHsuUy/syuzLKRK1Kk6oJq677C1uB30Zu+DvKxotEeGWW3AGdBFmsf/D1HGHKJV8TQvmVDdMxiU72DcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742965289; c=relaxed/simple;
	bh=QnFWFZlnfU21CTQGC3W3+l4fgFB80jnUSbPZ9zblmcs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kU/ap3YgGOcuB2LeDuMfQGrjOF+ApqE2REEwaZmmoUhWUk/FN1+Zw3TXFowYLsWi1IVSqh90bNjme4dBWCcf+jvSiwbFfML2eNl5zF4UU03PTRl7Rd4Tw6GzdcbhfsbtsT/w+dWnwmSA4SID/eaAzvlPDmYtFIR4Vi83bMScBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YTnEXcHr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742965285;
	bh=tspo2aLn8PwBIq68eFO69iZhXR1dL5un1fBSD28/tXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YTnEXcHrEOSayX9+P9GvRHJPJ/UQTCRDJZbrSIme4qlArpWzTRdEEvp3gvugJSQ49
	 WFdssDCAfyw7fA3iQbenIATj9HqbP3LIQLBARwtAzEvoQ1QwL2H0geumhUKIYBrbRX
	 0HyIm7YgATLlUdnCkqU6W+z6sp776ip6BKGG+NBkbd8WrtFkxmxkzlYQmyiXTTLpuc
	 rnfWunA3q+JKpFcARa7LOGjrH0v8OKdl9C6AINETn6/oBM4ETki+hk/HR/W8Xfr+69
	 1gR3wCYakO4KwdXDTU4z5ebd1W4c7x2YzxfoOeSTuXWcbkuS4ahd1eCFvubr7u8iIM
	 b6VKwoWZEfG1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvl86bLgz4wd0;
	Wed, 26 Mar 2025 16:01:24 +1100 (AEDT)
Date: Wed, 26 Mar 2025 16:01:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250326160124.29bb0250@canb.auug.org.au>
In-Reply-To: <20250228154312.06484c0d@canb.auug.org.au>
References: <20250228154312.06484c0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ekkCJEeper_uGN6t=zKTw2o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ekkCJEeper_uGN6t=zKTw2o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Feb 2025 15:43:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   net/core/dev.c
>=20
> between commit:
>=20
>   388d31417ce0 ("net: gro: expose GRO init/cleanup to use outside of NAPI=
")
>=20
> from the net-next tree and commit:
>=20
>   fe0b776543e9 ("netdev: Switch to use hrtimer_setup()")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc net/core/dev.c
> index d6d68a2d2355,03a7f867c7b3..000000000000
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@@ -7169,10 -7013,11 +7169,9 @@@ void netif_napi_add_weight_locked(struc
>  =20
>   	INIT_LIST_HEAD(&napi->poll_list);
>   	INIT_HLIST_NODE(&napi->napi_hash_node);
> - 	hrtimer_init(&napi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
> - 	napi->timer.function =3D napi_watchdog;
> + 	hrtimer_setup(&napi->timer, napi_watchdog, CLOCK_MONOTONIC, HRTIMER_MO=
DE_REL_PINNED);
>  -	init_gro_hash(napi);
>  +	gro_init(&napi->gro);
>   	napi->skb =3D NULL;
>  -	INIT_LIST_HEAD(&napi->rx_list);
>  -	napi->rx_count =3D 0;
>   	napi->poll =3D poll;
>   	if (weight > NAPI_POLL_WEIGHT)
>   		netdev_err_once(dev, "%s() called with weight %d\n", __func__,

This is now a conflict between Linus' tree and the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ekkCJEeper_uGN6t=zKTw2o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjiiQACgkQAVBC80lX
0GzFlAf8D395G//g1l6DIYDWdtkUEOunn2yuO/QICXSNOsNYFy/kp6F3MC5g/tdn
tXqZH+IQWuZN9btEtbYwl6sU+hSlC2a5XxCPlv0cLjRVQjhvQYcDcoEEPvwmXvRO
zeK9qg62ZiY/HFDiYCehwsHAruXCdU8e9/J2PZgXMSxKrU0ivURsy6P5D+JdttfG
eRv+jd8P6XZcqvGJh92xw86wQdsvtyzK1fZWv25aHC+tNcrB+IskWEM/nwwkOpDL
sdYFnpPVJbRBh+BIi8mSxi39e6VQJvEy5GLWL0FpoMBlVhVK4YXqmfwKBSnBIMfZ
7JzQCGbfqq9kVNoM55o1YZ3ykLWEyA==
=rT5Y
-----END PGP SIGNATURE-----

--Sig_/ekkCJEeper_uGN6t=zKTw2o--

