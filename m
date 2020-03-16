Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3E5186364
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 03:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgCPCrr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 22:47:47 -0400
Received: from ozlabs.org ([203.11.71.1]:50067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729348AbgCPCrr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 22:47:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gghJ2pnvz9sPJ;
        Mon, 16 Mar 2020 13:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584326864;
        bh=DoUkaH/rxc24XM5Szk1/HHvy8luioLiTJomLUmaTHmc=;
        h=Date:From:To:Cc:Subject:From;
        b=iS/ulcNPQrmtX4/kMAw1bnA5T7T8VrmzNa8ILY835t3Qhp5UcsOU7vpSepoivbMlL
         3+CnglD2397/XRNqqvV9995yVPCE66F1QVGjLh/MaK+hNDgcksVHJLNujsC+LEXuwG
         TkMkgnIqhf6nvzUHVKcrg++hv6Ws7gD1nQFoHUWCdU9mw5KyVGd2lMhHsjxLIqJCsu
         D1WLxqYb+xHq3v9He7oOxNoBr64Yo57jIyC9a8egZN1sgDy0Eq4nx0D4t8FGQ34pIK
         +ooNjfblG0bMk3C0uzfSeQxhaAbkyzWtIweiJD6tTTuqMHjay9o+mFPb9rwyM8oSoU
         73lLOB13pmX4Q==
Date:   Mon, 16 Mar 2020 13:47:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: linux-next: manual merge of the usb tree with the tegra tree
Message-ID: <20200316134743.71fbbef8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R3YEV=vD2dUOfJFfa+a5SK_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R3YEV=vD2dUOfJFfa+a5SK_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/host/xhci-tegra.c

between commit:

  5d06652ebfd2 ("usb: xhci-tegra: Add OTG support")

from the tegra tree and commit:

  cbb23d5572f0 ("usb: host: xhci-tegra: Tegra186/Tegra194 LPM")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/host/xhci-tegra.c
index 32f630b0513e,a6e36b3c968f..000000000000
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@@ -206,7 -203,7 +206,8 @@@ struct tegra_xusb_soc=20
 =20
  	bool scale_ss_clock;
  	bool has_ipfs;
 +	bool otg_reset_sspi;
+ 	bool lpm_support;
  };
 =20
  struct tegra_xusb_context {

--Sig_/R3YEV=vD2dUOfJFfa+a5SK_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u6M8ACgkQAVBC80lX
0Gy1MAf/flY6KY232xZi6TOk/EO9EggBU0TVPObY6SxNcY1ZlzrZC1GN4EjpmLrv
Lb9twXGANwz27bPyhx68DEAoEvmxKC5cSlVj8PQh3D0o0Yz1pYyTrwJwOTMWeCSM
AiMJAMg/NDpJ5e6uD5IBwSylfLpdnzUmuDyjMg7SGTuyYGiEZyNvcuZ4tNCBkbSq
9vj3b5eWEu4lGIxEPI9FrrGNAEaEbdjoy6pnfzPlTDSU2pPfZJbk7XSVKEUvzN+x
zUHtILIWB6Bp092hIjrdm+8Ru2ZJ3QKvVtOSpi8Itg7W3ombUOIkWiZ9A4DDOXpB
wgtjZRjtitQsDO3Mq1NHYHs7vABYZw==
=zJZx
-----END PGP SIGNATURE-----

--Sig_/R3YEV=vD2dUOfJFfa+a5SK_--
