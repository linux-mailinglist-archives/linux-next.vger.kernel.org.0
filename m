Return-Path: <linux-next+bounces-3772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5384975EBB
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 04:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FD311F23997
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 02:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE7A2EAE5;
	Thu, 12 Sep 2024 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SN/OXxpH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069D24211;
	Thu, 12 Sep 2024 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726106789; cv=none; b=elii5kHUVTSaEuTq1JR9lt674Wua5XGsBKJI3aoTSGDujxvaO+aismQx5He4Hqug9PFXk4SpFVyvys9iQlbyxyPUlTrcYqKGI2peQRE+mWAbC4ScNeib6ZY7BzmwxOB5eDXnLuBYnUSAhw2zLRzRBcvG/iNiSanBCPcG33pCofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726106789; c=relaxed/simple;
	bh=LxfaDtmUeDEJ2tSU+e8KFxk0LzzOIsxgrteLLAHVnT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KxM+JBpRugiWli6wA07WkjRBhelJVOZnOQhACGAtJETWdWf00eqd9uRkhZf7BWQMIVQXr+hB3p2FptZovu3/DvKh8THsgura4JonYNb5mopbrKqSaQJFEixbC1Oqtwu6QkMG4TovySkDsxBoaOUTOi5i+eZcgro4rgPhs6Rx5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SN/OXxpH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726106780;
	bh=7EY64P4Wz6Bj+ihgN1jy4vBFG87DVZX4iYu1S5XrSyA=;
	h=Date:From:To:Cc:Subject:From;
	b=SN/OXxpH0p8EUgjeRIMTdOzBJXevKHsGVYJ4XFxGKg22TGIRWPUhHhfiJN3MJcO5B
	 z9NXr+FvFlruZd2kJj0PlZIGXO5FFG36oMH5urPKrE9dp7fvn4Fm/PHv+MHAz9xGNv
	 TEq/B38eUO8y9I5v19HDV+rYKLiYZy3kq8SOTjYB6j4YLJGHqzfKdIHH7RFwaxSdJP
	 rUq5UhFmA2dkBT9T32Ss8I8K/gyCiYfxCMPQADg9qN0tdwC6R5ptJVkOf0u+jgSnt+
	 XciEOTtpDfQClzjdTGHHayK+12RQE16xBJ5uFNuhBWEpcCNDIIb+GhTvUI73R9bWd9
	 UjUJU90KiXnnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4158336Xz4x21;
	Thu, 12 Sep 2024 12:06:19 +1000 (AEST)
Date: Thu, 12 Sep 2024 12:06:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Leon Romanovsky <leon@kernel.org>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Yevgeny
 Kliteynik <kliteyn@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Subject: linux-next: manual merge of the net-next tree with the mlx5-next
 tree
Message-ID: <20240912120619.38fa7556@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yAsEKALhRxOwIVMB0Th_wGg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yAsEKALhRxOwIVMB0Th_wGg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/linux/mlx5/mlx5_ifc.h

between commit:

  c772a2c69018 ("net/mlx5: Add IFC related stuff for data direct")

from the mlx5-next tree and commit:

  34c626c3004a ("net/mlx5: Added missing mlx5_ifc definition for HW Steerin=
g")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mlx5/mlx5_ifc.h
index 65bbf535b365,b6f8e3834bd3..000000000000
--- a/include/linux/mlx5/mlx5_ifc.h
+++ b/include/linux/mlx5/mlx5_ifc.h
@@@ -313,7 -315,7 +315,8 @@@ enum=20
  	MLX5_CMD_OP_MODIFY_VHCA_STATE             =3D 0xb0e,
  	MLX5_CMD_OP_SYNC_CRYPTO                   =3D 0xb12,
  	MLX5_CMD_OP_ALLOW_OTHER_VHCA_ACCESS       =3D 0xb16,
 +	MLX5_CMD_OPCODE_QUERY_VUID                =3D 0xb22,
+ 	MLX5_CMD_OP_GENERATE_WQE                  =3D 0xb17,
  	MLX5_CMD_OP_MAX
  };
 =20

--Sig_/yAsEKALhRxOwIVMB0Th_wGg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiTJsACgkQAVBC80lX
0GwXngf+I5zGCibJDVdqJObnIZJkTTXe44xICnDpKm2rvF9TASWStLrdzzl173k0
kLaFEWNHDL9EG/u5mDFbGSU9jE1k9GEmhJvy1UvQKfXTC9MyUo5LhvF4XIWh7bjQ
U5YBbNgMrCy3S5mR6Hp4YnWifVTI97AL/XsgwIKysAoCl/GdDuBiBwm+bHBzHUrS
1S2MgV7LlSMcQuZom9KZJO1fBp/CSgYtV3O2TSpQCgM8TTJaobg3aSgonQl+P6ZJ
JTBrdUtOtSTTMYn/B65cLFEbZeItU4TyG21uwLGjm7ExHnAZW8rjzpRIe2ezmJOY
OrRBeVMA2F5kCctkOKERijjmFVIw/Q==
=UNJw
-----END PGP SIGNATURE-----

--Sig_/yAsEKALhRxOwIVMB0Th_wGg--

