Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A952945C6
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 02:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410781AbgJUAA6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Oct 2020 20:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410778AbgJUAA6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Oct 2020 20:00:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1225CC0613CE;
        Tue, 20 Oct 2020 17:00:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CG9cf4SdNz9sSG;
        Wed, 21 Oct 2020 11:00:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603238452;
        bh=0DXK4NIMtfSfXVyJsOvho9PCtSfMjF5Wwslj97gXnwM=;
        h=Date:From:To:Cc:Subject:From;
        b=NfD5Puig5wOEsyd45kbJmaRIJyr5NVLCi7Wo1x794wVQZiqaSUmXToxdeGYXtanHR
         MRIAp3bIoV85/3/Ou9k3Dg77/sV1l41y3N9mFExcS3Zbo8tubB9LkQBofhLmN6k3sd
         d+83Iv0bkppaXQ/L4u3l6vgfVVJMktd8Eo7kq2MQ31lo6y5yMf8h5L3F/6MqdArfzX
         yNR8nCB+dnDKv9Y3x5g9YMm5A+4ZYe9v3Z+apt5+utoXB8JYwX0DrxDNFNwdIhqiGs
         CdeMU1A/EZUYFVUsv/+hAggwOp5hbXclJxhi3rH/4vCCu/LP41ccufg9PnjLy95DHt
         xrlW+5ZQfdfng==
Date:   Wed, 21 Oct 2020 11:00:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     "Andrew F. Davis" <afd@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: linux-next: manual merge of the pm tree with the arm-soc tree
Message-ID: <20201021110049.61cc4f61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4fvmsBMoFqyWKMalBHR6dtr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4fvmsBMoFqyWKMalBHR6dtr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/soc/ti/Makefile

between commit:

  dc1129564a01 ("soc: ti: pruss: Add a platform driver for PRUSS in TI SoCs=
")

from the arm-soc tree and commit:

  bca815d62054 ("PM: AVS: smartreflex Move driver to soc specific drivers")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/soc/ti/Makefile
index 18129aa557df,5463431ec96c..000000000000
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@@ -12,4 -12,4 +12,5 @@@ obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+=3D ti_
  obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+=3D ti_sci_inta_msi.o
  obj-$(CONFIG_TI_K3_RINGACC)		+=3D k3-ringacc.o
  obj-$(CONFIG_TI_K3_SOCINFO)		+=3D k3-socinfo.o
 +obj-$(CONFIG_TI_PRUSS)			+=3D pruss.o
+ obj-$(CONFIG_POWER_AVS_OMAP)		+=3D smartreflex.o

--Sig_/4fvmsBMoFqyWKMalBHR6dtr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PejEACgkQAVBC80lX
0Gy+Nwf/YJruL9M6D5Gf7WFHb2v3NHsMN1zx0c0bq1YNGyvXkRUvZ/0FiAkxDFEW
l6Ha7Slcv7vVyCMi/hSoNP9gu8BMpoJLbGZMlBSD2+Cx2lmvkTVc1sew9eyDN2t+
LZLMiyOIH1S6nMdEtVIPGBrDTeBKYTN97jbFB8O3Ik5ykfLoSKKAFmJ/sLb1O2v3
VayeXgSa9S46gEozjazmwKLAajz4q5r6FSQufLpAhgNRXDlb1/C6D4F6olwpsVsU
G0odS1bNCmagSYQRTq36AL/e3/D7J5Q1cqqLpuKpaLecmSOszNi5JLeJqy9bRTRO
Zp6MhGTzRq4VQAcvwDIRxiotJ94KXw==
=T9hv
-----END PGP SIGNATURE-----

--Sig_/4fvmsBMoFqyWKMalBHR6dtr--
