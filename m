Return-Path: <linux-next+bounces-6532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D3AAB9A0
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D303AFEE4
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 06:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A946C1D88AC;
	Tue,  6 May 2025 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o+QumNOW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50B1E1DEF;
	Tue,  6 May 2025 01:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494769; cv=none; b=AYgJ2+Z2aJ5zgr0ewqwYxmcEcaCZd0fqZ/Kl0UwgReluYEfcHfYpZkU51/52ncMMpsBE/rnJw7AGN+FtRwB8mwTcv3w6069mNQjev96DoWHAM3VblTDd7AOE5ko8DQ1dUjzvDmd5qTVAwkYOKccnxSocP6lGlJNpdzTwJLYqbEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494769; c=relaxed/simple;
	bh=yqO5N+PlLNkY4mIRLHix0b1VTSn6zED+m8H+R9a0gwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kqlt1aw/jmsLZlvGsb31Zlxbm43VKNXtdYlBix9SgV6+IfhwKnKFTgLozrTRfyIpB9ZE81XaW7gbn5O6Jy//O5L/MSz50j1bkFV2g6XAeS032B/AX1Y78xgYgasK7Gy1BlqWO9TB69SXYugYXLTmZheyBwIeF+iopNlqIBq7PwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o+QumNOW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746494757;
	bh=E003ozl3HMPtf+EUX7TMGXJJ5Zb3SEgE/KzqNV3jMQc=;
	h=Date:From:To:Cc:Subject:From;
	b=o+QumNOWtM9/LCYRjhU2K93IbhgVvRS3GjrQlFcRyy9+yivRzWaYSQQ15UJPNOHYi
	 mDCe3vq941I7NIJXpFJiSE+1BI0NtcV0+1gRWagDYKzkrjdi68vw7tWDIZK8eGqjdM
	 /waSscg7o+bEzU6oGVloUAB/Or0U38opiprusNICh1EF/bxzd527bwjMN6PzLSbfA3
	 0zjFAfBKxVqmECijmUktRAotJMCF0iBqQnzUZhnCky+y1cY/umJ5jvwIJw9JVsFx45
	 99Av54jn1Ht5ivBlv+Y6vxvFZnMWfueQa9utR0+BzCCzPaNQGbwUXApLIm3VTT6cC1
	 eQCa1qH25fJCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs11c2bf0z4wyh;
	Tue,  6 May 2025 11:25:55 +1000 (AEST)
Date: Tue, 6 May 2025 11:25:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the reset tree
Message-ID: <20250506112554.3832cd40@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LpSby9OtKnEIEs_fDNqXHfs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LpSby9OtKnEIEs_fDNqXHfs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  MAINTAINERS

between commit:

  57dfdfbe1a03 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port =
Reset driver")

from the reset tree and commit:

  326976b05543 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH g=
lue layer driver")

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

diff --cc MAINTAINERS
index c056bd633983,5c31814c9687..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -20827,14 -20699,14 +20829,22 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
  F:	drivers/usb/gadget/udc/renesas_usbf.c
 =20
+ RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
+ M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ L:	netdev@vger.kernel.org
+ L:	linux-renesas-soc@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+=20
 +RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
 +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 +L:	linux-renesas-soc@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.ya=
ml
 +F:	drivers/reset/reset-rzv2h-usb2phy.c
 +
  RENESAS RZ/V2M I2C DRIVER
  M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  L:	linux-i2c@vger.kernel.org

--Sig_/LpSby9OtKnEIEs_fDNqXHfs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZZSIACgkQAVBC80lX
0GyiQAgAiBOVH2URILyoPYMPJPn0jjgUcL9pFe1T4dFQ7MuefzektIWuYkyIO6pM
VTwEjnEJ+XVluyVPPQ+fmAHU+ZD12LzGPUmk4ylfc5/mgZZeQk83d5AnE+PK6K2V
wBt0wpB/hjIHaQ5kwQvyqplZdyS1Rmd1nWPAKJB3aY4zGAbYyZf7fDAIPR9Nmte/
prBRr9OEDSdz/0gkywwhveRcLS9IJWMgM3A5YD3xzh2HzVCuLkHBYLYXBlUXtSNu
ae/Mv7pATGFoAgTyCrKRLeuOdaFOTZXPvMhiwluVMJH4+brJlnOm/8WFomFD66g8
hs+p3KpEBtf0KnwuI2Tk40i//+1iEQ==
=c2h4
-----END PGP SIGNATURE-----

--Sig_/LpSby9OtKnEIEs_fDNqXHfs--

