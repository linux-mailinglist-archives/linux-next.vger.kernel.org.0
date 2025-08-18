Return-Path: <linux-next+bounces-7964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4CBB295E1
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D77E19628D2
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 00:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB046204F8C;
	Mon, 18 Aug 2025 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lP7VPkca"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E519007D;
	Mon, 18 Aug 2025 00:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755477684; cv=none; b=Q0jFuJpXzbncfbncKYI0qJ3R78w1IleLqqRs1qQAT4G2coXDyEzVzyZHDwQ47+pjRzXKptOcgtblZ2DcGRkC9JlHy0BtLrKtZ2SQlIdYNRC9ijLWwe+BI8bZceb3OLiCwCGDdqQsqRYj1rfoELOS88rMzlYLN8pFl7Qgo/1Pj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755477684; c=relaxed/simple;
	bh=c8+vX9iptbgSJl7LtoJBbh9yXc7ukDN487S4T12tm2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L0p574Y1CQaLGgG6LZ+B/nFxou20kPkai3HdfMhWVa19z7zG3XoyAfCMzmds2MIh5RruI8PGR+dTFOsO4XcScvo4cCCRNkXxNRm4IwLUEeI5HRIj2/CzgyqHYppylBT2JWh5vlonTKAEiFzySui1YeiNpR8UEK26AKN9YtvkgMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lP7VPkca; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755477679;
	bh=IA0+eMTpU8+MmsbQPkf+dVYaIYFwn7RtdftIMQD/0Zk=;
	h=Date:From:To:Cc:Subject:From;
	b=lP7VPkcamm68bG/GLPKkzee1IBPj9yfg+th+5A2T9uUgGpIwqTvSF1y7YH8ZzqYpn
	 J4eC/KJR2NTGra1BRpHAREzp15Bl4tUFlEvELhcUCImPUeYJr13Jl6LeZ05gsM6tma
	 gN5ahP7DTBfXAXGhflGGQzT2XxzDsfPIR5mpbnPRDxlV82Cf4kxE8T6WyxZ7yjF33g
	 XvnPAp5/Cywc3qe3GgT76A7+86jp1Mhie1HUAbEZutcOCxwGdofPFPLxHCmmAfo24P
	 Ka2UV+zH0hNl3RBMIXml5bPv/GfH1IcCU4f0bdT+UUGr35zELD9u//3+CesZXg1WtP
	 i/cZJ1LV2EfkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4v663lJLz4wbn;
	Mon, 18 Aug 2025 10:41:18 +1000 (AEST)
Date: Mon, 18 Aug 2025 10:41:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Leon Romanovsky <leon@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Daniel Jurgens
 <danielj@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Networking <netdev@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mlx5-next tree with the net-next
 tree
Message-ID: <20250818104117.33a7c49b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZSM+/ks.IKA3la=fJlge/7T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZSM+/ks.IKA3la=fJlge/7T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/eswitch.h

between commit:

  520369ef43a8 ("net/mlx5: Support disabling host PFs")

from the net-next tree and commit:

  1baf30426553 ("net/mlx5: E-Switch, Set/Query hca cap via vhca id")

from the mlx5-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
index 6c72080ac2a1,f47389629c62..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
@@@ -968,11 -975,12 +977,18 @@@ static inline bool mlx5_eswitch_block_i
 =20
  static inline void mlx5_eswitch_unblock_ipsec(struct mlx5_core_dev *dev) =
{}
 =20
 +static inline bool
 +mlx5_esw_host_functions_enabled(const struct mlx5_core_dev *dev)
 +{
 +	return true;
 +}
++
+ static inline bool
+ mlx5_esw_vport_vhca_id(struct mlx5_eswitch *esw, u16 vportn, u16 *vhca_id)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
  #endif /* CONFIG_MLX5_ESWITCH */
 =20
  #endif /* __MLX5_ESWITCH_H__ */

--Sig_/ZSM+/ks.IKA3la=fJlge/7T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiidq0ACgkQAVBC80lX
0GwHEwf7BgGKRg6zBzLWrP4sXqXZOR7BHUe3rHI4Dp09C3r6THxEJ0/sFOrXaasN
Ek3e7uEcQ1OnMzGm/KQF9Zuvyhdmv7e1o8bnQW59J/GK/YJjN81dhinlITKXjX8o
jKU0uD5QhAHbnv1FbO6X4o2Cr5z7yA3iH/hHtpYLEgXAwHIr6eUp0yauXGeTs2so
wceZSlSnF3VqNee0DzMpbpaMJE1MnsQnAEZjmTg4T39AOPNZ080H/eelld0Qnezp
x9ykrD54FL1nqD4A/B6vboRbJOEYItSYQkq+Wifniux2XhKmYyeKL+teC/vnzdse
eVLbCjeP0csNvRE/blTEAi1idNPeMA==
=00cH
-----END PGP SIGNATURE-----

--Sig_/ZSM+/ks.IKA3la=fJlge/7T--

