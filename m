Return-Path: <linux-next+bounces-8448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD92B95F19
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 15:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83B772E6DA9
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 13:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD3F326D6B;
	Tue, 23 Sep 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7JPCkPb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54A326D4F;
	Tue, 23 Sep 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632837; cv=none; b=Pwnsm+V8m5e5tnVcohe7GekC9bojJWrjsYgFYQZ3pWHOl2L3dSEMZvl0JM6UXLfJ8WsK3UCzeB+ikvOgWxH4YGodsV0MJqFUrmNXu7FNPizTVibYqxd8xqAUZTlkg632g9A6ATQNNAZmLAS+uHmJXhqKrCFPsjaHI65Tonpvn9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632837; c=relaxed/simple;
	bh=PQoE3TRiHN3oelWgg/hV7+6jVJh7jqizuFT7IsX27rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMLVfiTU1DfNDYtDCFo+9U4kmODXangBX1naljhSLTSqFbvJr0KNCFN5xjYFYye8tncZM11IqjpqicHGHTtcm55CF+8YlOpgUg7OQC6DpZ0x0TWprCqCSxmGIAcl5cofbsDjyOHvU64U8Z1WaXgoF1v6QEQHPZ+FHw1KI6B9IVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7JPCkPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8389EC4CEF5;
	Tue, 23 Sep 2025 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758632837;
	bh=PQoE3TRiHN3oelWgg/hV7+6jVJh7jqizuFT7IsX27rQ=;
	h=Date:From:To:Cc:Subject:From;
	b=X7JPCkPbvMuvYEi8d2DY0MFlp2rz4K5IjNJ9rkLaHvAF855wEERBxb9WT4RZWYbD4
	 JoShFvQIeu9grbepXiocreI/4TCbRAxxuGdEj4ZzZnCBm58ZlU15PFfQ3MPXM+7aXB
	 2nNTDOH3nJ6KWsr01Ou2wWHp5ClUXc7iKy9XX7SDxlQIbpcEDWUkuk91EQW/iSzsg2
	 M8nVbIpHYA6gzZQThDoxmTklUh9RzE/BePwcsZOEd5HqZT9pLvG35RXYMV8DjpFkk5
	 peCHmmKTdO4e0V4BnpH6zE4U9Ye2xI0v+4htDZavQCWHGBuKxwthmzhgHrzvipaal5
	 WnY0oCKS+urqw==
Date: Tue, 23 Sep 2025 15:07:13 +0200
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the s390 tree
Message-ID: <aNKbgf7GyU5JP3Zh@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TimwGka/Vk6vDuIJ"
Content-Disposition: inline


--TimwGka/Vk6vDuIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  arch/s390/configs/defconfig
  arch/s390/configs/debug_defconfig

between commit:

  e11727b2b0ca2 ("s390/configs: Enable additional network features")

=66rom the s390 tree and commits:

  d324a2ca3f8ef ("dibs: Register smc as dibs_client")
  cb990a45d7f6e ("dibs: Define dibs loopback")
  69baaac9361ed ("dibs: Define dibs_client_ops and dibs_dev_ops")
  a612dbe8d04d4 ("dibs: Move event handling to dibs layer")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/configs/debug_defconfig
index b692c95f8083a,fdde8ee0d7bdd..0000000000000
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@@ -118,15 -118,12 +118,17 @@@ CONFIG_PACKET=3D
  CONFIG_PACKET_DIAG=3Dm
  CONFIG_UNIX=3Dy
  CONFIG_UNIX_DIAG=3Dm
 +CONFIG_TLS=3Dm
 +CONFIG_TLS_DEVICE=3Dy
 +CONFIG_TLS_TOE=3Dy
  CONFIG_XFRM_USER=3Dm
  CONFIG_NET_KEY=3Dm
 +CONFIG_XDP_SOCKETS=3Dy
 +CONFIG_XDP_SOCKETS_DIAG=3Dm
+ CONFIG_DIBS=3Dy
+ CONFIG_DIBS_LO=3Dy
+ CONFIG_SMC=3Dm
  CONFIG_SMC_DIAG=3Dm
- CONFIG_SMC_LO=3Dy
  CONFIG_INET=3Dy
  CONFIG_IP_MULTICAST=3Dy
  CONFIG_IP_ADVANCED_ROUTER=3Dy
diff --cc arch/s390/configs/defconfig
index 22c801449139c,bf9e7dbd4a895..0000000000000
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@@ -109,15 -109,12 +109,17 @@@ CONFIG_PACKET=3D
  CONFIG_PACKET_DIAG=3Dm
  CONFIG_UNIX=3Dy
  CONFIG_UNIX_DIAG=3Dm
 +CONFIG_TLS=3Dm
 +CONFIG_TLS_DEVICE=3Dy
 +CONFIG_TLS_TOE=3Dy
  CONFIG_XFRM_USER=3Dm
  CONFIG_NET_KEY=3Dm
 +CONFIG_XDP_SOCKETS=3Dy
 +CONFIG_XDP_SOCKETS_DIAG=3Dm
+ CONFIG_DIBS=3Dy
+ CONFIG_DIBS_LO=3Dy
+ CONFIG_SMC=3Dm
  CONFIG_SMC_DIAG=3Dm
- CONFIG_SMC_LO=3Dy
  CONFIG_INET=3Dy
  CONFIG_IP_MULTICAST=3Dy
  CONFIG_IP_ADVANCED_ROUTER=3Dy

--TimwGka/Vk6vDuIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSm4AACgkQJNaLcl1U
h9CXUwf3b6tW49QUgVuPcW1g/dApNp13k5VCOjxQq4MvOhUE8j23lvuxAPvtUw9f
hSiK/anX2vANRvJAMRMYvImghQIMsFacu4mdnN/KxLaOWQuUyvAwQkYVHvwGxg+U
sngJ/Z2e9njTKBfM/nZz3ZTAyYZf6pGXq8PwpfoT8Li+i4Ze2GIPCv+SmqdiJil6
piu560FO6qMtkfhQpXHqbpBMTpmsdxcLNwFYNfVm5yzzrB+M3c6eWkAjeIgMoPBI
OL1ZLUBOcguaWNL+CQfEuWALpnDCyMWAUqNTACMbib97MhJm/y/0FL+2E2AGHFvb
jq93xPOdxMKMJ80q6BD5o5ufJFVi
=QGbX
-----END PGP SIGNATURE-----

--TimwGka/Vk6vDuIJ--

