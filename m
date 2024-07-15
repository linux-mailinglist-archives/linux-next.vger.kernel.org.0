Return-Path: <linux-next+bounces-3004-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337D930D68
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 484EF1C20DDB
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 05:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371E5136E17;
	Mon, 15 Jul 2024 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V1GdjuzB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30A219E0;
	Mon, 15 Jul 2024 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721020351; cv=none; b=pB21t6Yj8W09kbdJTEgDYQuPgI9DKlPYOlPnZJhfQoYVVS7dRpEOQ6t/0+h8CgqQMkyf+fJF6s6+g5nBZyPvILgenkwHZ1oMm5AJaLR58WXF6ZOtzhhI5vbMTf02XhlbAXiGjVnd17WgSAld0JMt/aHbPSOcJ4igfubFmoRoC8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721020351; c=relaxed/simple;
	bh=s4smvUtfjge8MiG+WBcMp7zbES6h+Q60YGHe3IhFZyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iip9ISiDRzarmU1Bnorb3sfs/RQJ+P1oMssNJjevV0u2yES2jbmcRrUPmgCFhQZ0mvHPzh6baqU2BBacKtKZnLQLaVyzPBPUWELpBuG58yWDcN0iV8vIHvhxtbBjMOkLNqiF8L/JwE1Qp1kY/VNUgLXS/N8/ZkcRlx+7Og5y8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V1GdjuzB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721020344;
	bh=+dnRGsvrizd4gNnE0mwBEQyLtJcJvW4ANThyhxWhe3Y=;
	h=Date:From:To:Cc:Subject:From;
	b=V1GdjuzBshnDbVFb2jeFM8v7C5+eVjAAfiy7zOzOiZ4ar4jqn5woI9m2Yzr8pumzH
	 /m/EtIF1i8Dvupg7OrxBVvoUHy321sRC1qHd8Fds52EeJfmeKP3LHAYm/heGSlBvJq
	 PFnBqO3KGe07v+Yok7BVKNXpHN3Qf/uO6L60y5YnwRiFub9upqtBKoBf/u3JFaYRhK
	 BWNR84dvV1yCgJldokmeTOqCPHUTn4k9fTWeDSpfZVOeKMjQc/zmAZvgVBwMmIJ9mz
	 PADIhc83Eer+6mkQrm7H8cRw5i80F4Tf16tOnYkphr1W3VvOdm4O7kWn5S+kpkoyNu
	 St1ImlWijFCbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMr14098Lz4x04;
	Mon, 15 Jul 2024 15:12:23 +1000 (AEST)
Date: Mon, 15 Jul 2024 15:12:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, David Miller <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: linux-next: manual merge of the phy-next tree with the net-next
 tree
Message-ID: <20240715151222.5131118f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EpXU1WFtm6i3v9buMom2pnc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EpXU1WFtm6i3v9buMom2pnc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  MAINTAINERS

between commit:

  23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")

from the net-next tree and commit:

  d7d2818b9383 ("phy: airoha: Add PCIe PHY driver for EN7581 SoC.")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index d739d07fb234,269c2144bedb..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -693,15 -682,14 +693,23 @@@ S:	Supporte
  F:	fs/aio.c
  F:	include/linux/*aio*.h
 =20
 +AIROHA ETHERNET DRIVER
 +M:	Lorenzo Bianconi <lorenzo@kernel.org>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 +L:	netdev@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 +F:	drivers/net/ethernet/mediatek/airoha_eth.c
 +
+ AIROHA PCIE PHY DRIVER
+ M:	Lorenzo Bianconi <lorenzo@kernel.org>
+ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
+ F:	drivers/phy/phy-airoha-pcie-regs.h
+ F:	drivers/phy/phy-airoha-pcie.c
+=20
  AIROHA SPI SNFI DRIVER
  M:	Lorenzo Bianconi <lorenzo@kernel.org>
  M:	Ray Liu <ray.liu@airoha.com>

--Sig_/EpXU1WFtm6i3v9buMom2pnc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUr7YACgkQAVBC80lX
0GyOiAgAlx0bJv0NrcG57WqQx55lbwgRIy9J1QY2SbLVkdPtaL2Vm5+dudF0d0xG
gsRt7emKr/awlcCYHO65dffD9TKJbgo8x/Xh0eA2ef0eW9K291k2LTq3I1fahUvS
47tt1Qpb3gIkR6tJyTlpVDwsEMRG6Qcww/nuioXTV7R9aElY1nBNQCNNumXmpswW
IJQ4yvU58eqyINgxoGOvK07H4CKQO9zTAz7p1m09yeK+TR+ovMAg5BRKH6BMDjFO
+IAClnS9iLsAmQR9ktwmAvFVKULNDeUQtDIdtgO/UutGizIyKA7to6Vs/h5Zmf9+
QdOyW6clEyUnyBPV8d0s5aQ1ooWFXw==
=KOWB
-----END PGP SIGNATURE-----

--Sig_/EpXU1WFtm6i3v9buMom2pnc--

