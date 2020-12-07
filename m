Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A522D0A54
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 06:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgLGFqy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 00:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGFqy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 00:46:54 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52651C0613D0;
        Sun,  6 Dec 2020 21:46:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqC3H1BMlz9sVs;
        Mon,  7 Dec 2020 16:46:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607319970;
        bh=519Ly6A9Z/AvreNuiirxEc3soT8xQhiBp9B5HnJBowE=;
        h=Date:From:To:Cc:Subject:From;
        b=Pb3JZnBSa6hxjYp/o/5HQroNB2+E9hfh3ctguCShmN+GD5CQsKVbLCrSh9TaxPLyX
         5e5BPmoDj/uVrJNmfpPwDCzLfaPAc28TvFwQ/+LiFIIllQFlkLOrTzejr6iewg7hVY
         ZEacbC1LfmTjPHe1kI9BvNgR9ROBRqXZOUJtrW7mEvcDc8FURtd+JZQjHEprd+AHi7
         tmoqyVqe71r8YabEFUfRmLzcjGGfmVJQwOEIdyf72MgSXy04QQR6F+o7qsJRce4NkV
         jZzeU32MtlZRvzA3a1wSbY7q4o1thmI/dPW2id4CN3Rp68rI45WKVcaMFnTcuMvq3E
         2c6sZMs9agaoA==
Date:   Mon, 7 Dec 2020 16:46:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20201207164601.2b9cefc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FUzLITJD9q8+0Hx8aQ_KpSv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FUzLITJD9q8+0Hx8aQ_KpSv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iio/trigger/iio-trig-sysfs.c: In function 'iio_sysfs_trigger_probe':
drivers/iio/trigger/iio-trig-sysfs.c:164:21: error: 'struct irq_work' has n=
o member named 'flags'
  164 |  atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
      |                     ^

Caused by commit

  0449fc4eead7 ("iio: sysfs-trigger: Mark irq_work to expire in hardirq con=
text")

interacting with commit

  7a9f50a05843 ("irq_work: Cleanup")

from the tip tree.

I applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 7 Dec 2020 16:42:18 +1100
Subject: [PATCH] fixup for "irq_work: Cleanup"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/trigger/iio-trig-sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/trigger/iio-trig-sysfs.c b/drivers/iio/trigger/iio=
-trig-sysfs.c
index 10a3fd29362b..0f6b512a5c37 100644
--- a/drivers/iio/trigger/iio-trig-sysfs.c
+++ b/drivers/iio/trigger/iio-trig-sysfs.c
@@ -160,8 +160,7 @@ static int iio_sysfs_trigger_probe(int id)
 	t->trig->dev.parent =3D &iio_sysfs_trig_dev;
 	iio_trigger_set_drvdata(t->trig, t);
=20
-	init_irq_work(&t->work, iio_sysfs_trigger_work);
-	atomic_set(&t->work.flags, IRQ_WORK_HARD_IRQ);
+	t->work =3D IRQ_WORK_INIT_HARD(iio_sysfs_trigger_work);
=20
 	ret =3D iio_trigger_register(t->trig);
 	if (ret)
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/FUzLITJD9q8+0Hx8aQ_KpSv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NwZkACgkQAVBC80lX
0GxHJgf/QgkxOiK0a1XWs+pKROz0gBEiPHZXwjr5d7iTgqXGuylruUILtBlxIJug
MpAHzy+L38aTn2bsTxLZkgIqvKVkNSibnmKhsc1HbqneyEOPYHT4tlFwCDY94GgH
uiDPOr4uB45SxZN4gXweqC2LZMmZ5MaYDSrdzfK/jY6tn+TIxysSSIjyrM9ABQvM
fGejGc2NgHS0dacRDiP/QMWsrPe4a1W53RVEzHgasqZlKMuN38kRPn1PIZOm1SXj
1fcX4EWSv+0ObfS6OP6qNPtWcmSek0g/GIegGXiGUL5os9/djQsZ/qIXD3/M9rLq
K8CCFuA1LsHttQ/j6zaxQ6getieTig==
=8FUW
-----END PGP SIGNATURE-----

--Sig_/FUzLITJD9q8+0Hx8aQ_KpSv--
