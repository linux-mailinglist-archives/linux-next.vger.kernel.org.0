Return-Path: <linux-next+bounces-2445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB98D7953
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 02:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F54C1F21C69
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 00:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E352C7E1;
	Mon,  3 Jun 2024 00:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UwgUsMTf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3910FA;
	Mon,  3 Jun 2024 00:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717374256; cv=none; b=r/8G/crp1rMFv2gNp2w+OzZzr4gUliECwgV//3nf8V3AKcx9DDd2gNUgCarGfvNt/8Mk6PFXxvGW29jfySL2JavXPv3XRF0Fb/qwIWL9T6MZ71alwlKBZPycRwBdZKbngJupbtclDqXTFh+zgYPA96l/+o2YGFyt2j//uF+M/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717374256; c=relaxed/simple;
	bh=LSAp8Cr/LG5FuU8CWIKK9zBzOR5kb6IKr1WgPLU5Ok0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lyQ4VzYwst3gbZWMXVHRUKXI4s31FkeGgrUUNph8TWs2BTiGYL6NJhJBtf4RjGoISKJslH8UfJqwerX1F9pmoIWX7uUoI7hmZG3sobvr2OCz1fNOUAgIqiQXbx2jvyjkSsQS64/njatNex/813mEz4aOhLfm06u4ihglphBXgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UwgUsMTf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717374251;
	bh=vWKe8VRthQhxeyeMjSp0QzUbN7rpJesSgX3VsIJGR7A=;
	h=Date:From:To:Cc:Subject:From;
	b=UwgUsMTfh9S6jNq3/eVozEDYxA7mevdpmUO2cO84QSv9qfE/DCVzmV0m69TrZTFR7
	 cBPPM8klon9yZhvLXeeKQqRM4j+8Em1MV67P1CNTdOuXyLpFT3XNixyccFsFZkHpqE
	 1KF9xNjaXk76Sd6HuDALhu+tu6vyouNmNXR1GE1saDwggpkARxlJfFwjRT10LXIomO
	 zUAXn/EX69whjW2NrbHuaIea8PndYPbYBohgi6bCAk7HZNdrgin4mJ2940dsrxVYdn
	 DjTeHNzZ3kQxJng0aAFdr+yGzv3ENg0bSvLYg4iTEpHtvFOIcGv/hYs2y90L59aBvy
	 6Q1WV3sJ0x8JA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vsvbt5HJtz4wcl;
	Mon,  3 Jun 2024 10:24:10 +1000 (AEST)
Date: Mon, 3 Jun 2024 10:24:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Message-ID: <20240603102335.79926f54@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2S78U.EVaT4vkiTNtNC8Uqb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2S78U.EVaT4vkiTNtNC8Uqb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pci.c

between commit:

  e6d1cd96b33c ("PCI: Revert the cfg_access_lock lockdep mechanism")

from the pci-current tree and commit:

  0d1a1c6745a8 ("PCI: Warn on missing cfg_access_lock during secondary bus =
reset")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/pci.c
index 35fb1f17a589,d2c388761ba9..000000000000
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@@ -4883,6 -4883,10 +4883,9 @@@ void __weak pcibios_reset_secondary_bus
   */
  int pci_bridge_secondary_bus_reset(struct pci_dev *dev)
  {
 -	lock_map_assert_held(&dev->cfg_access_lock);
+ 	if (!dev->block_cfg_access)
+ 		pci_warn_once(dev, "unlocked secondary bus reset via: %pS\n",
+ 			      __builtin_return_address(0));
  	pcibios_reset_secondary_bus(dev);
 =20
  	return pci_bridge_wait_for_secondary_bus(dev, "bus reset");

--Sig_/2S78U.EVaT4vkiTNtNC8Uqb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZdDSoACgkQAVBC80lX
0Gz7rQgAlA4LEVI6h7Nqu9He2WnsU7DgaAv0kE/JB1sXYYqGLPh3ThWDrT2PHX+Q
BfH7M5BIk1M/qjcS5HZA4KsUcCFgsU8Q+SALcfjW6hz5eEK+Tu/DDtr2ZBINFGKm
4GazoFwpaFWYI0G5QsPiQyPFxUKbSo+qzC095FWAa1rGhdPp0wZ9+HNx7yeD7hI0
QosYXAPhlRP3NtUYHxfY3dcXN46aOnT1ED8391TvbsUIHPpsdEnhEOqPJvpl2JnL
J95iiXW7puxKiuQp4xWVmf+EaxJ85Wr6e4/IsJWyhEBxDUZODnituaOr4upigi24
3TEBFFBU6khgB9jkRn+FLSqO7Nqi8A==
=+YZ8
-----END PGP SIGNATURE-----

--Sig_/2S78U.EVaT4vkiTNtNC8Uqb--

