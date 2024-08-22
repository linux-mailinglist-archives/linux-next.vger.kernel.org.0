Return-Path: <linux-next+bounces-3391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74895A950
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 03:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1190283229
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 01:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6966479F2;
	Thu, 22 Aug 2024 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hgEFdKyA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCE6FB6;
	Thu, 22 Aug 2024 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724288686; cv=none; b=f2HR/aYY4D1CkhghNizNNjXUNM+yfZqICWM5UTffek5Lj9NpyiHLP7r5qWJq1W3b/MB+7DUV15KFNdT0oSv21dt2VlE2Jka20yJ4Q+CoJqRjanHf0er2jPoftzqtnKYDIHn+Sc2sqbUOEjQtKDPmnWHlM2k7g8okNWnOO8HDtvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724288686; c=relaxed/simple;
	bh=AeKay7+vF2IjbP5yvEpOYTK1WKff6VqqnR4t+ssa4CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u4+Fdl1YEc5br6CHd9yatRa5sZ7RDa6drXN8VG43kDRWnypCtfIxik+DC2Sdyj7AEiSyoACZvGwKWS/rp5+1nkt9WU/7iraFUvBB5BRm6vObqjHx40mwgw7/WE+WfbhPHgv5PRqtJpRbzDwJJHEQisQSFxGChsQioYVMm1M6OPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hgEFdKyA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724288673;
	bh=IiEkrzRFj2+Y25pkO0PTxjkfssFPYLYZdbTA6zjJwfM=;
	h=Date:From:To:Cc:Subject:From;
	b=hgEFdKyAGDmDuH2lAjsNp8Lzj+gp9PwwLNOIzK6+di04IrCuv68Ty94jCeqO/f9bk
	 bzkFJge3nXmmgxaVweVYLGeuJ4G6YhTOTNcMx284+/lwds+MV1K2NWR95bq1XJ5nFd
	 xGIQSxjAv/lw6L1CmbFb8Hr99ZnQdjzNSnkw+A9W8GHdLduzlGjmuMTv4N1+lnNXyd
	 Fd5ZDZVxpiJAwwtqtVQTwUys8eZST1R500tUikHH3yWwWrF7ScCy5fPVB9r5DrBo+w
	 xYYlwC4fyAmPPAoe9VScR+UptPY4AxQXWYxPd3tKKznUnvpE0WAJmxvgK/OQVA/uY3
	 yzNZ3vzwsbOFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wq4jX1k30z4wbp;
	Thu, 22 Aug 2024 11:04:30 +1000 (AEST)
Date: Thu, 22 Aug 2024 11:04:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Ido Schimmel <idosch@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Petr Machata <petrm@nvidia.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the net-next tree with the pm tree
Message-ID: <20240822110430.08a98b0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pqNQbOzY1C__6DwWVedZgZO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pqNQbOzY1C__6DwWVedZgZO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlxsw/core_thermal.c

between commit:

  019c393b17cb ("mlxsw: core_thermal: Use the .should_bind() thermal zone c=
allback")

from the pm tree and commit:

  fb76ea1d4b12 ("mlxsw: core_thermal: Make mlxsw_thermal_module_{init, fini=
} symmetric")

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

diff --cc drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
index 0c50a0cc316d,303d2ce4dc1e..000000000000
--- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@@ -389,12 -450,8 +388,9 @@@ mlxsw_thermal_module_init(struct mlxsw_
  			  struct mlxsw_thermal_area *area, u8 module)
  {
  	struct mlxsw_thermal_module *module_tz;
 +	int i;
 =20
  	module_tz =3D &area->tz_module_arr[module];
- 	/* Skip if parent is already set (case of port split). */
- 	if (module_tz->parent)
- 		return;
  	module_tz->module =3D module;
  	module_tz->slot_index =3D area->slot_index;
  	module_tz->parent =3D thermal;
@@@ -404,8 -461,8 +400,10 @@@
  	       sizeof(thermal->trips));
  	memcpy(module_tz->cooling_states, default_cooling_states,
  	       sizeof(thermal->cooling_states));
 +	for (i =3D 0; i < MLXSW_THERMAL_NUM_TRIPS; i++)
 +		module_tz->trips[i].priv =3D &module_tz->cooling_states[i];
+=20
+ 	return mlxsw_thermal_module_tz_init(module_tz);
  }
 =20
  static void mlxsw_thermal_module_fini(struct mlxsw_thermal_module *module=
_tz)

--Sig_/pqNQbOzY1C__6DwWVedZgZO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbGjp4ACgkQAVBC80lX
0GwHNAf+Iy3T0p/3cMdZTXi6t0jw9b1P4kYg7XtHi46A9ehRr1Vd7L34rNWoLSvk
hbHnBHGzrBM4owRw+/RuRRmIbWNl5uz6wVA04aKHqX1vhjY3x+jMWRRzNXyTn3xi
8E1u4OgsqRX/X89q4QZz41/UZUMtBefRLrSH1jIGVt60u730Ellqiz2AJFJu8Q0U
h4RdYe1EhOb13mupVTs9ZPUX2yaKEwCAnoIVWrJ89vnzMZjASD4s/zj8we45huNz
pZtEcKCwKj8bz2dZAZFwpxaYSBbXsnjo+lpSgkRFF3G4mfvGIIesXUUFWm20jH5e
lNbTmu00dPwMXW7x8KjDDaLHt1B73w==
=iOz1
-----END PGP SIGNATURE-----

--Sig_/pqNQbOzY1C__6DwWVedZgZO--

