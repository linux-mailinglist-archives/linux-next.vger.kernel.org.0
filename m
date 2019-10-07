Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18915CEF9D
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 01:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729518AbfJGXau (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 19:30:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54035 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729285AbfJGXau (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 19:30:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nGtt3d32z9sPV;
        Tue,  8 Oct 2019 10:30:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570491047;
        bh=FqTVaMNpyDmrDdMdI+Cv2npWAUeElfvrLKibIVX2eRk=;
        h=Date:From:To:Cc:Subject:From;
        b=F6RCjFFUQnXIXS0mo1v9QyVwKYhPK9xTtviKtKXg+IJj1QqCHGYVSTDvuPbC3ISLx
         5LusfVEGxeIws5YsBfIwUbyLZxbOhCbxeNUV6mG88DbRq5Q55ucc1/AFcqC94oUt9r
         sNxkle53D4q6pCJNPpEFzkYtDezb2CQXzh4WkncEvleIllVQwY2BioJBPV5IlcIL+R
         CQx+0N/ImdzoazF8nUjrRwpsJ/bQd9y6nLadYwNBPf6j49NFa9B+CYYXi1rC3834ZW
         sBGfT//TyDwGtcXgEZO2OHxwdBe05z07p6cxPpuGqO6GzSYs/ZcuMyUF7yhuvVtzVQ
         QJmqSvEufvoRw==
Date:   Tue, 8 Oct 2019 10:30:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191008103045.2d4711e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0D2d4UAAjmMRaNL4JgY7dQR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0D2d4UAAjmMRaNL4JgY7dQR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  10d8f308ba3e ("cec: add cec_adapter to cec_notifier_cec_adap_unregister()=
")

interacting with commit

  7e86efa2ff03 ("media: cec-gpio: add notifier support")

form the v4l-dvb tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Oct 2019 10:26:05 +1100
Subject: [PATCH] cec: fix up for "cec: add cec_adapter to
 cec_notifier_cec_adap_unregister()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/platform/cec-gpio/cec-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/pla=
tform/cec-gpio/cec-gpio.c
index 7be91e712c4a..42d2c2cd9a78 100644
--- a/drivers/media/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/platform/cec-gpio/cec-gpio.c
@@ -259,7 +259,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	return 0;
=20
 unreg_notifier:
-	cec_notifier_cec_adap_unregister(cec->notifier);
+	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 del_adap:
 	cec_delete_adapter(cec->adap);
 	return ret;
@@ -269,7 +269,7 @@ static int cec_gpio_remove(struct platform_device *pdev)
 {
 	struct cec_gpio *cec =3D platform_get_drvdata(pdev);
=20
-	cec_notifier_cec_adap_unregister(cec->notifier);
+	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
 	return 0;
 }
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/0D2d4UAAjmMRaNL4JgY7dQR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2byqUACgkQAVBC80lX
0GypWwf/aWdoFi2MyJ5QKk3TnpqQcsnMcocA7U079No8epLXeXB+/ATUQPYDRB+W
sIoM4fXcaZpx0Wtp7so8DsXgu9XpMDDpMHTTC2EnVeXnNDAOX4jFORuvfYuL9fEb
G04YbvyWzBSma1fz2h/LOzu2VWTGRfATJ2KRQ+KgqwjtZM4vrPKw/EkV62hxEalh
/JXc4sQ+C2/hbDq5GPFejcmlqc4VOOQFLWnS6lqcd2a+42jBOcoGE7t1gL62lv01
97U9EpbvGCTF418zBreHc0BlMMtiBwRfoGZA7JkdXLReZjP6Rm7LrOLuDaC2WRAA
1fw+7HZucGNuhoyAzv3TdXw6e9UjAw==
=y+O9
-----END PGP SIGNATURE-----

--Sig_/0D2d4UAAjmMRaNL4JgY7dQR--
