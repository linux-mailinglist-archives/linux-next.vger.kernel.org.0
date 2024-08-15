Return-Path: <linux-next+bounces-3326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C847952764
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 03:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222841F226A2
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 01:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4FE15CB;
	Thu, 15 Aug 2024 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oO4tOq2p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0BA35;
	Thu, 15 Aug 2024 01:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723684183; cv=none; b=aZ7HyGRErGMCQekBDdpdvRP+OLbx8/60dlXjZNsfKZbZ0LLvzeglylMO10y6v0wyPbjgZguQPWBETI4AmpR4QOtp7/xWtTJ7SKex/2kanZ2W576rP/0BgDkABpQo+XoV1+waR3WhHumtJYO4R2s5h2ZhA34tBkRPXCFLWCkPqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723684183; c=relaxed/simple;
	bh=vg2Wjc5euDomGCMAqhjZEOHP9uOGK6l6Wt4V4e/gn5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sc2auVL/B2A/5SMyyKL+UDWYKGLqcoFlR5ZTvcxK7+SxAN3QbGMtpVB6D+RRS9+yaq2tN9uU+ovlc7CqqiYaTr4NeRqqw00xeudmmgyw+7i7xTyalPHqVkrHKDoop+duqfJtB6ggOJOPSeJ9HGfmz1/aO7SjCwqsAxbTjWn5PBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oO4tOq2p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723684175;
	bh=DTv7Q17SAzkWVrxCxVb76izIXRqxVHyiQ48h97d/Z1Q=;
	h=Date:From:To:Cc:Subject:From;
	b=oO4tOq2pl729y4kfvmycq6SgDU+EXhg109kKYU/bmc2MJdAf6zwOM8yyMHViIQqRm
	 Wwe1H05WkDzG5avyCnagLOqmkt8TZ6FctmHdqZ9OQAuGoHhg22vBBWoGHpIIJdgNRz
	 2ZQyDVNYyVYqm4XEQ6x3T0LgAvzJpYNCyeTvxA0Q/E+yQrvQGTCPi6bmtIgkzIhU7r
	 4P/HdQDfRHE6JLpHln1Csy92BfPJdNuePyD6PmwYX9Dc7v4XVE9g4+DY2jtLS1xxNX
	 D4IXxH5aSYphiICGQxRxejKQoXgxdNItXieWgReclXCgHYjNvSj0tPskjAD2jE0JGX
	 RqW43/897elZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wkn8b2Zgjz4wnx;
	Thu, 15 Aug 2024 11:09:34 +1000 (AEST)
Date: Thu, 15 Aug 2024 11:09:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240815110934.56ae623a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MweJaH.HPj2uWi_kKG.3Ooz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MweJaH.HPj2uWi_kKG.3Ooz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml

between commit:

  c25504a0ba36 ("dt-bindings: net: fsl,qoriq-mc-dpmac: add missed property =
phys")

from the net tree and commit:

  be034ee6c33d ("dt-bindings: net: fsl,qoriq-mc-dpmac: using unevaluatedPro=
perties")

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

diff --cc Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
index 42f9843d1868,f19c4fa66f18..000000000000
--- a/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml
@@@ -36,12 -30,6 +30,10 @@@ properties
        A reference to a node representing a PCS PHY device found on
        the internal MDIO bus.
 =20
-   managed: true
-=20
 +  phys:
 +    description: A reference to the SerDes lane(s)
 +    maxItems: 1
 +
  required:
    - reg
 =20

--Sig_/MweJaH.HPj2uWi_kKG.3Ooz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9VU4ACgkQAVBC80lX
0Gx21QgAjVl0IcFIAhRPs72zwIHlbEa0WOhhMj1W0m93m5A4f8P2I9RI8xuHO45a
VyeZKxb/bCOTMvs0vbaWkYART2EFqgWqqQEn/cb3FaFktBif70Ym9Ek+Q6rRQLBK
E29Ii42U8vUy3FPDw0DQWJY67pq6vUISMAP2k+B4S7B1n+KDA9I3eFGnSW5tM2pT
GHH7r2SlblrzzkeypnmyxnUiGwq7ZVV9GaSSMeM0Oh98bCDYOxEHw9MeNMSg50wD
MLcBRtq2dWobjUVMyogNHoVR+1cheE8TtstIj5NebqF7k/V3QxfL8djL8f665JVA
urwsuTV1fNTvUJkmp/cGzbQKCe3ROw==
=mDtM
-----END PGP SIGNATURE-----

--Sig_/MweJaH.HPj2uWi_kKG.3Ooz--

