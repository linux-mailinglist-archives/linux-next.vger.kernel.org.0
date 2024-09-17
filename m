Return-Path: <linux-next+bounces-3884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4D97AA49
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 03:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77C8DB2416E
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 01:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAC815E9B;
	Tue, 17 Sep 2024 01:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UcR8OEjq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38AA93D;
	Tue, 17 Sep 2024 01:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726538040; cv=none; b=K3q2tCY7tkX1A2esy5s/wOyHmw9rh4zc5lKdmGtDwo2l8fpjVfkVnX81sTDmGFJATT8NcDjbbPRcOmDUhlsTmvWRoLIqj5OfPAld6rJq7yTrtvEJDYzW/kplaA7Bi3lopQn7ZQd6HK88+5qV7uJt/zOG3HxpXg4kUJvbAkhxV84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726538040; c=relaxed/simple;
	bh=TVC8iIjH/HSN+mLtYjCyftkVQEtHMFReuFWlMPT3hFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtMEDGNITy2CwALourVbQeWwU2XlB8KeI/JqhqP16jV/sOWX585rUYP8pIe20I0JLtKmFnA8r2siLPNgBD3sWKq0d8onD4v8ZrZM98DNPq9aAeeuYbrJvpDnk5fLMLvOWJxaVIw9+zehRPNQOOS6zlSH3M+lX9Y02LX3jlVcA1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UcR8OEjq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726538034;
	bh=3VsrjsLEQYwGSbqRw1f36c24Yuqeom+BZaf0fc/aIWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UcR8OEjqap5dP9bGpBCrIqwISB0koDU5yoy42rsvidJks9baxJ/kKpr4VmXgnjXSp
	 fnDiawijeDNEs10GguJ7QibwXyWwnvXhGyUuBx6b4NJxA9FXUrllJsTe+xUikutVdR
	 YTw2zLe5iLk/tK59hfDYJM0AP8jPY05bD4t6g+hzNUA2gkRRe1DVGc1kPmxATsAzpb
	 NSy14FQSpyQv323uG/P9Rr5GuS4qIx8Gn1EYUIp3yrRAwd9BaIlGo/PuLuY+YG9U2w
	 /b3CubLGz8kVhQAB9sQIw24kej861XSzejI8n0+LopLPmtdXKHf0QS3Df4MLe9j6Kh
	 ZXj/nN2uIEnAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X74ZT5zLsz4xWK;
	Tue, 17 Sep 2024 11:53:53 +1000 (AEST)
Date: Tue, 17 Sep 2024 11:53:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Yevgeny
 Kliteynik <kliteyn@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: linux-next: manual merge of the net-next tree with the
 mlx5-next tree
Message-ID: <20240917115352.12f0de91@canb.auug.org.au>
In-Reply-To: <20240912120619.38fa7556@canb.auug.org.au>
References: <20240912120619.38fa7556@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0IfIBLytk=.b.QYqZFnCuZG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0IfIBLytk=.b.QYqZFnCuZG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Sep 2024 12:06:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   include/linux/mlx5/mlx5_ifc.h
>=20
> between commit:
>=20
>   c772a2c69018 ("net/mlx5: Add IFC related stuff for data direct")
>=20
> from the mlx5-next tree and commit:
>=20
>   34c626c3004a ("net/mlx5: Added missing mlx5_ifc definition for HW Steer=
ing")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc include/linux/mlx5/mlx5_ifc.h
> index 65bbf535b365,b6f8e3834bd3..000000000000
> --- a/include/linux/mlx5/mlx5_ifc.h
> +++ b/include/linux/mlx5/mlx5_ifc.h
> @@@ -313,7 -315,7 +315,8 @@@ enum=20
>   	MLX5_CMD_OP_MODIFY_VHCA_STATE             =3D 0xb0e,
>   	MLX5_CMD_OP_SYNC_CRYPTO                   =3D 0xb12,
>   	MLX5_CMD_OP_ALLOW_OTHER_VHCA_ACCESS       =3D 0xb16,
>  +	MLX5_CMD_OPCODE_QUERY_VUID                =3D 0xb22,
> + 	MLX5_CMD_OP_GENERATE_WQE                  =3D 0xb17,
>   	MLX5_CMD_OP_MAX
>   };
>  =20

This is now a conflict between the rdma tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0IfIBLytk=.b.QYqZFnCuZG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbo4TAACgkQAVBC80lX
0Gw35Qf/eEfu9H09plXHgZx7CuGsPwXU9bkgufvHOaaxep0kLBnBmf/kKuUrJ6dA
8OEyZZ2tK9uOMgqoS9PW6yXDeeXBXalKKcBv+gbmPwlXVag7k79NM4JGjI3PJovs
Tv3q3FFFz6E9vaPig3CYNyDcypSF74DNupfSz7XmwuXHMJ+DQEgLBi1/5Ae7nObA
7e6SFpyLDWpW2EtO7QJ0LptlYrd02bWapAQoWWOgouPjdnDC8l+jFI1W21egRkUT
sTkFTSh7fDQQr+mY3det3Vvem/X2lTvZOy5QtfQJU2wT1iH3gx2cW25a2aWyFnbP
T9HBMDlqHiVXCtS7YsAPKxWiltpmTA==
=Fsek
-----END PGP SIGNATURE-----

--Sig_/0IfIBLytk=.b.QYqZFnCuZG--

