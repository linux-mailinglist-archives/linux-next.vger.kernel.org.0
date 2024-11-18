Return-Path: <linux-next+bounces-4798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0C9D07FB
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 03:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66215B21B8E
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 02:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB187282FD;
	Mon, 18 Nov 2024 02:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r9DxHmAm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B66EAE7;
	Mon, 18 Nov 2024 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731898519; cv=none; b=puHD3hEHd7jtb+z4gIhQsqz0LSp5uPUT8fx0XYyuDzkJOt1axrm917hWPdCiYstOudCr8/XJwgpKBn88EnFG80h/MEP8mYkqHyv9lNZgA5Au1Fx7hL3Ox4vc/+1C9ii2ZWNmDp+t0EtuIJlBn+FYAznx04eKm5IoWWlgFmuKSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731898519; c=relaxed/simple;
	bh=wRPgT1yObEHD6svJnaOip0QGxnZUBOU5xL/pq0EZDYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dCZvbOFul9wPQ0Pzk4oEyZWa+FB3815t23N6HlZiYidZRX+z2xURBY2zyLJgtbnA3X4e0tOeScPKVc/WQY3mHhlV8Yu8TEEmj9edAzSqcGoV58ulWKq9pFD1KGVf+cpIVJogPkoGIyOKugqA0n1sixumwY2Wrys9jbaYF1Bl6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r9DxHmAm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731898511;
	bh=lA9p/6FlZ0uog6Hp8Mfew1zkqnhfYb5W0Rbs/v3d/MA=;
	h=Date:From:To:Cc:Subject:From;
	b=r9DxHmAm7s/FlNVmJ5oX4b8Tn63VDPyWgkdf0QAEkHnSdVb5b6/TR/1+dot+5M09q
	 Xt1mP1rwfXsSok2qEpqWgvkHwdRa4sjquKPu1iOGpLvFOJ2qm2/RCB5k9QIgJ3TIg+
	 7RvuzOY/adSf1h10szEZT3HF2Y6MKK75/PBB8ordVt5shMFUlpJwwgmfaBRSDsN2Uu
	 mbPaYYhyqc3ustpb6OzQZNnOG/N22vYZQcGpeJcgvPxE2jMgDRnHJ9mW4N3Y3N1EtY
	 faXu6EgvV/tIMQDxF5c65yckXBMZE6Kp0CAQtTgMhTc5rRWJxFRA3OyLkZrtFMFFXv
	 Vi7594J7p25Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsC0b0bgLz4xfL;
	Mon, 18 Nov 2024 13:55:10 +1100 (AEDT)
Date: Mon, 18 Nov 2024 13:55:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20241118135512.1039208b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_/vmX0Hz1vripoj/QLgQntj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_/vmX0Hz1vripoj/QLgQntj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/linux/phy.h

between commit:

  41ffcd95015f ("net: phy: fix phylib's dual eee_enabled")

from the net tree and commit:

  721aa69e708b ("net: phy: convert eee_broken_modes to a linkmode bitmap")

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

diff --cc include/linux/phy.h
index 44890cdf40a2,b8346db42727..000000000000
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@@ -720,6 -721,11 +720,10 @@@ struct phy_device=20
  	/* used for eee validation and configuration*/
  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_eee);
  	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising_eee);
+ 	/* Energy efficient ethernet modes which should be prohibited */
+ 	__ETHTOOL_DECLARE_LINK_MODE_MASK(eee_broken_modes);
 -	bool eee_enabled;
+ 	bool enable_tx_lpi;
+ 	struct eee_config eee_cfg;
 =20
  	/* Host supported PHY interface types. Should be ignored if empty. */
  	DECLARE_PHY_INTERFACE_MASK(host_interfaces);

--Sig_/_/vmX0Hz1vripoj/QLgQntj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc6rJAACgkQAVBC80lX
0GyAOAf+JsvkHQtN6HM1uzq93ryqcOg8/QM2rbDuGAxiMphDc4vg+jUtiEuuOtHP
Y1VwGaFYffonnh+nj72fZTx+hxWLk/SsQ4++ovlPKRRA7egDnMZ+lvFTiw5CjisH
PqrDPPKYBixXnpP7lJZdMW9OzPUn3ziOOmlMbc1/OQVahLOYq5Nv6dCw6OCexgWT
JCLRq1J0SwM6chF574CXu5iENguUEUGkTk+bZsRjX6bjhSodCEhMIwD6NZjAkOND
dYQ1TyewL/Q7pWdcGrRwthWLZj7cA2HpM4zZ9kioZBqxh3pcIQoYdQT586T6hJ22
/vEWrBHL+ofwDsE/sY6nbHYQCkFW4w==
=VEEF
-----END PGP SIGNATURE-----

--Sig_/_/vmX0Hz1vripoj/QLgQntj--

