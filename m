Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F4E32A977
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243703AbhCBSZE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348006AbhCBAWZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Mar 2021 19:22:25 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30FBC061756;
        Mon,  1 Mar 2021 16:21:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DqHqg0Qjgz9sS8;
        Tue,  2 Mar 2021 11:21:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614644495;
        bh=8OV61hNxQX0O7/OTVI4qBszDlVyPCO8tx8jUIJVD+Oc=;
        h=Date:From:To:Cc:Subject:From;
        b=YUOQSf4DpL8Xa9EqsjLIKtTubZVkbyrtZL9vHtuFwqSwKioWmwhkvaKWUNAiW5Nhc
         YZMh8iYq7bmsZ37x/QqLYEHmvo9+m3sJolkfzRuOGfbhwUQ2aDfJsu3b67+JqhwbKY
         3FFDplwmFDdMSS5Oxyxrs6CjkUkwfYGLUM0UQrjgX2u4v0Q4MwjtTo1QQbF2wmwkfR
         85mRkL0FweYaHO/gKQs9AOZY1t34WWHWE0sr30pvOBFvgx5rPm/5984Q4S6XY3cW8z
         291OevBPddj3nEk/f/Fer/SkQhkuw8uK4hG3j/S/3c18ea/Y7u3L/3yZaHpioABJiI
         TEy6U0nPCeOzA==
Date:   Tue, 2 Mar 2021 11:21:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the powerpc-fixes tree
Message-ID: <20210302112131.5bb7b08b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D4mqAlbm0wq8Ywvog1l6MM/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D4mqAlbm0wq8Ywvog1l6MM/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc-fixes tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types for 'i=
bmvnic_remove'
 5399 | static void ibmvnic_remove(struct vio_dev *dev)
      |             ^~~~~~~~~~~~~~
drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration of 'ib=
mvnic_remove' was here
   81 | static int ibmvnic_remove(struct vio_dev *);
      |            ^~~~~~~~~~~~~~

Caused by commit

  1bdd1e6f9320 ("vio: make remove callback return void")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Mar 2021 11:06:37 +1100
Subject: [PATCH] vio: fix for make remove callback return void

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/=
ibmvnic.c
index eb39318766f6..fe3201ba2034 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -78,7 +78,6 @@ MODULE_LICENSE("GPL");
 MODULE_VERSION(IBMVNIC_DRIVER_VERSION);
=20
 static int ibmvnic_version =3D IBMVNIC_INITIAL_VERSION;
-static int ibmvnic_remove(struct vio_dev *);
 static void release_sub_crqs(struct ibmvnic_adapter *, bool);
 static int ibmvnic_reset_crq(struct ibmvnic_adapter *);
 static int ibmvnic_send_crq_init(struct ibmvnic_adapter *);
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/D4mqAlbm0wq8Ywvog1l6MM/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA9hQsACgkQAVBC80lX
0Gw/tgf/X1mjakb6+92nMtN4BKbLQpllmRKdA+xmN2SHAlJhXDviswVeWKBJa2ue
/wrRfq97m9m28/frwbTrbLd0pemJ0CjP0ZtNVMPgDiDMfSZMe6W3zJ6vAnwxGtuW
WcgqphbiQyzt30NHOa0kX0DANyeNS54jiZbupaYEYGZcZBLcEshZniaBzji+6JfX
ev0OdkJiCeyuHk6uyGgbEuGaMMj+CmEjwnTs/9JSKN061I3E4p999PuIzJ/eBxpn
5z2QraLWK8pqB1B9IHuG8tHSA9OvZtLcnu5hmfKWKN/TwsarBr7ghL+cEcb9OP3P
tOFf5HNetbZ1Xek+2xyH7aIlUpf5VA==
=JDVK
-----END PGP SIGNATURE-----

--Sig_/D4mqAlbm0wq8Ywvog1l6MM/--
