Return-Path: <linux-next+bounces-3574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A523996AE25
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 03:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E651F2557B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 01:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676DBFBF0;
	Wed,  4 Sep 2024 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U/KM9q14"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81E41EC01C;
	Wed,  4 Sep 2024 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415114; cv=none; b=O5wX/RmVNsNGz/bl4XwRxLcXcjl5PeJMF437sJuEj1+7L53jkj4M1qmdUjnYt5ka/lJekgpiak0V3TRMAGhVYWu4t+AmnvcAagKEz87lJInZiJ/8QDNxyOc5PfEJEGNsx+sHfqNUeEsnqxAdyKIuUcSazzf0JRZAVoKSUDamPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415114; c=relaxed/simple;
	bh=yLdAmYZlfpNDVb6YCzzEs9vdP++iVQkXU4U+Lw3fgY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kRyu7JN+acH/G2WbARsxM4H3aZiRBziPzQCmlu4LcisEgu8efzYMgNuonFepjmisd4wXpD65vXZRK+JLq2Y//DWuTQqC2+4aIb1u33FIrki85Uismgs/6OJtteY611RsTKwu/ZAEwnKk0uEf6Z18GS60ERll/aHLoph7vumWV2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U/KM9q14; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725415107;
	bh=ZuO15yUl5vff6kR/j4REFogDmZtE93e0EvXLU+0784o=;
	h=Date:From:To:Cc:Subject:From;
	b=U/KM9q14TZZg+f/FfgqjYcMCVgmV+w89jSNTSoW6ZwFNxaVjGpODyHdtOESCbKB4V
	 tTrTJMOuY6M7pHd4aVcFLoBCB9te3cj+ArS1ZhVYb+DZJT3wOEAokA8RbGef1K+/9F
	 xKPdm+lOOPN+7QstLqMYPi7YlyANfW+Ca1nnarHd6zJOD4zvT1ROlSuj1oye1fNvqN
	 /Uks4w2EgJ5pPP0JH/lGkUFhghWTxFb/4tipnDoQ/fB5xWaEWYfDdMTk556nWveE50
	 w/DgQN2z0udeBdbvSdN9KNZgxIK23AzXeNUabraWF9oETfviYb5/7K6aiIX7kDj6rv
	 g266TXCmtAWPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz5Hk3SlCz4x3J;
	Wed,  4 Sep 2024 11:58:25 +1000 (AEST)
Date: Wed, 4 Sep 2024 11:58:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240904115823.74333648@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o7J/3Fb37l56IPcSzOkFZ+c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o7J/3Fb37l56IPcSzOkFZ+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/phy_device.c

between commit:

  2560db6ede1a ("net: phy: Fix missing of_node_put() for leds")

from the net tree and commit:

  1dce520abd46 ("net: phy: Use for_each_available_child_of_node_scoped()")

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

diff --cc drivers/net/phy/phy_device.c
index 6bb2793de0a9,7c4a09455493..000000000000
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@@ -3343,11 -3420,9 +3420,10 @@@ static int of_phy_leds(struct phy_devic
  	if (!leds)
  		return 0;
 =20
- 	for_each_available_child_of_node(leds, led) {
+ 	for_each_available_child_of_node_scoped(leds, led) {
  		err =3D of_phy_led(phydev, led);
  		if (err) {
- 			of_node_put(led);
 +			of_node_put(leds);
  			phy_leds_unregister(phydev);
  			return err;
  		}

--Sig_/o7J/3Fb37l56IPcSzOkFZ+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXvr8ACgkQAVBC80lX
0Gwm5Af/XNOEiP1Os0qRwYAI43xf5miFz5QytFw6ba0uFCuBhxonlX5aVodBe0um
e2Wnr8LRNR3HKJA/SChA6n8G4oqIh2K7HuCkzn2rqXk5cfrctiK+LZAns+EZ79E1
ABpQ2wJrNBwdgdZUc1nC8LIec6+RUe7vXxcnXz4HwOrHglccfFFdKj52UfqKV3a9
6WJjLqEWAltCJqlqVlo92BFb5MIio3qTtrugNUFQSvQW3vB9Hm5otvoJGF9fFmGM
CHs+J9GIK3w0wL3qTr6k6Ct5XXVSfNEkG+SrbySmFbof11KcKiyTIXCdWEfTDZkz
eLDxbUolfacMU2UI6eaOfTiCNF9n6w==
=J6x2
-----END PGP SIGNATURE-----

--Sig_/o7J/3Fb37l56IPcSzOkFZ+c--

