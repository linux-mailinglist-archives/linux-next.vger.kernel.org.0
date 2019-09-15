Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49956B3120
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 19:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfIORUU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 13:20:20 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60124 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfIORUT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 13:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Vb3RI5wa2Xs1UyLdtQk1jJC3O0fNkUaE7+ZqTExFNVA=; b=v4Ad0REoWbhWxGmd6MIb7sQAI
        aXPimFPOkqPJbgNgLDYUlm1D7X9QHbKlyZ6In9D+cA+MrbQR+zLoUIwuz47wWig1tFEunATt5In+l
        7VFY70dwAfTJ1GvKB6qVjM6u5Qkeqnx1Y9ksVYEDD8npPjIDyOTHrDlqj/Uat8Bh2MdV0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9YC9-0000jR-8J; Sun, 15 Sep 2019 17:20:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4C673274154D; Sun, 15 Sep 2019 18:20:16 +0100 (BST)
Date:   Sun, 15 Sep 2019 18:20:16 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the mips tree with the arm-soc tree
Message-ID: <20190915172016.GA4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  drivers/video/fbdev/Makefile

between commit:

  c7b46e0c33c5946 ("fbdev: remove w90x900/nuc900 platform drivers")

=66rom the arm-soc tree and commit:

  e305bff3a706f58 ("video/fbdev: Drop JZ4740 driver")

=66rom the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index aab7155884eaa..aa6352798cf4e 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -116,7 +116,6 @@ obj-y                             +=3D omap2/
 obj-$(CONFIG_XEN_FBDEV_FRONTEND)  +=3D xen-fbfront.o
 obj-$(CONFIG_FB_CARMINE)          +=3D carminefb.o
 obj-$(CONFIG_FB_MB862XX)	  +=3D mb862xx/
-obj-$(CONFIG_FB_JZ4740)		  +=3D jz4740_fb.o
 obj-$(CONFIG_FB_PUV3_UNIGFX)      +=3D fb-puv3.o
 obj-$(CONFIG_FB_HYPERV)		  +=3D hyperv_fb.o
 obj-$(CONFIG_FB_OPENCORES)	  +=3D ocfb.o

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+cs8ACgkQJNaLcl1U
h9AXbQf/W3dh85AhYXd/n4J/eiB4pjwYcHbXKT7QQ/pMTW5X4eLo9nQcou5dVbbs
2+PMaQSZqXKpA0FZqO583SZuTq5EQA9FJWImrs+2Z67rFIG1oos9eGnZ+2Aab0BZ
sCkpEoPK8umFqZ8bXKW6GmwJ54e8VP3ejmQAMeUctlSYY4y7c9TiZtVQPSIzhR42
IKRsgT3b57rwiQG06+iDPrUsbt25UM0QQOvCUogLrDFm1S/sIwbYKMH2KU2C7UQt
25iHEJqlgX+FEZCfg7b3LLmPAd/e0qD2apd0RG9IZdm44jKb4oKE+oek096Tqy/A
azF4Zeyx7Q0fnafNbPHjx9j4QKxAwg==
=PUJ/
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
