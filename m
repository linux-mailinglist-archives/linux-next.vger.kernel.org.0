Return-Path: <linux-next+bounces-3005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01D930DA7
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FDC81F2116F
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 05:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31A713A252;
	Mon, 15 Jul 2024 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n3mKhjJu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A049647;
	Mon, 15 Jul 2024 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721022052; cv=none; b=hbCzZrecBix9IRvIfEzuXTSYvaRAVGOuGtDCDAVhENkwwKgTiw/YqfPOjfCgTIiyGrPikKFCIetJ5ocHwJesCg/rUkBb0H3qcEQ5qDn/j+FK/g5NwhntP+u/1wq0cA1xUuo15dRGZAtxAdt71VrqgpQb+dwWXS4xd+TJtJ1VZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721022052; c=relaxed/simple;
	bh=Z4BY5bdw1yPNxSvUxgu1QhUmZBflIXg9+tUmE+Lreyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eD2+L8g9veERpWCuZd7//txPaN3HYtr5eytCZ73oNpzSAAHGGLTk9n+9Wa6P7X/5fWuCCwo5C6lJksehyN1eXB2tziIDDDL/U0ya/u/jiXOll6LV3Kjuuu/Of4dV194qotAiRag7UIlDxFZ78VTyYNyUkNXlZMsMN8meVFl08lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n3mKhjJu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721022046;
	bh=DMitF8soCoWuK+OB/uxZXPf5xQLPYXiprhb2r5M6oww=;
	h=Date:From:To:Cc:Subject:From;
	b=n3mKhjJufXvXIp0hi4cVGNCBzM9dpmTAdxxPXOZzPc4rchvLQHM3hcRkPRTxGvNx4
	 uGD15dSDB1xLj4veXPlJL2oBbypLr2NBy8ymvTiDdpSWGlT72YF4Z/YkMEtr70ppyg
	 QPFZJCcMoTm2EdPUh4XzdP29xrNpZ8x/vMD55TLezUifwdMszrUta6xsTEQl8AwgLu
	 dCTl5kLBXxnxZsn/dETV4SwYiwZU5020qm8ptDe8MneeLzAJjjw2XcbvE3hSONV1Ee
	 cbjqIgLnYBwuPZinVlmOrq7mp/7OC1mObKKEXQekxtp6RlSy4zo2n5hoXC0lnTZMib
	 lmnIg/ANKSvqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMrdp31gVz4wbh;
	Mon, 15 Jul 2024 15:40:46 +1000 (AEST)
Date: Mon, 15 Jul 2024 15:40:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nithin Dabilpuram
 <ndabilpuram@marvell.com>, Shijith Thotton <sthotton@marvell.com>, Srujana
 Challa <schalla@marvell.com>, Vamsi Attunuru <vattunuru@marvell.com>
Subject: linux-next: manual merge of the vhost tree with the char-misc tree
Message-ID: <20240715154045.0f319b32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cMdl2pQQbD1nLSFBcq8TbCB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cMdl2pQQbD1nLSFBcq8TbCB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  MAINTAINERS

between commit:

  5f67eef6dff3 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative =
driver")

from the char-misc tree and commit:

  8b6c724cdab8 ("virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices")

from the vhost tree.

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
index eb7433a8ce3d,8eefd032c87e..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -13642,11 -13459,11 +13642,16 @@@ S:	Supporte
  F:	Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
  F:	drivers/mmc/host/sdhci-xenon*
 =20
 +MARVELL OCTEON CN10K DPI DRIVER
 +M:	Vamsi Attunuru <vattunuru@marvell.com>
 +S:	Supported
 +F:	drivers/misc/mrvl_cn10k_dpi.c
 +
+ MARVELL OCTEON ENDPOINT VIRTIO DATA PATH ACCELERATOR
+ R:	schalla@marvell.com
+ R:	vattunuru@marvell.com
+ F:	drivers/vdpa/octeon_ep/
+=20
  MATROX FRAMEBUFFER DRIVER
  L:	linux-fbdev@vger.kernel.org
  S:	Orphan

--Sig_/cMdl2pQQbD1nLSFBcq8TbCB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUtl0ACgkQAVBC80lX
0Gz4+gf+LBiS+qLB9DuLKlFbkkkzWjfow5Ya+e6c/2ZSTcdgkC2VQfK5/0nPpFUJ
V346TDg65P6WzU0IOkxjXCPdNdEEmtOc+95v/ZaJcmuXQQVnZlYfx5HZ/uWvHUYX
5xi8ZPYIVzgK1qZ3Af/dlz03RWL3yZyYNjMXRvtN5+ZCKs2m4asyX0r/BlZcUw8S
fKz1nL3xQWHpoIA9KbqG7UT/MifrQ/dVxY/fQnOnT6sgY0gnXLMTJWfqaajKcStf
8HIRQ7CP5zZMAaLdOCUVOpqqQiOIHXZwOL7xE+Urn0h2JsnOidFzgyf69R/nnHjd
N5QQ60/nwduXJylL55GTEVa6wSleGg==
=lMYp
-----END PGP SIGNATURE-----

--Sig_/cMdl2pQQbD1nLSFBcq8TbCB--

