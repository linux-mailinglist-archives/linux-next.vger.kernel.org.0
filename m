Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA97A12AE
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 09:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfH2HfT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 03:35:19 -0400
Received: from ozlabs.org ([203.11.71.1]:43447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfH2HfT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 03:35:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JvXN2pz0z9s5b;
        Thu, 29 Aug 2019 17:35:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567064117;
        bh=KdsotWkFg4n2gS9G9PGlPGtclq9pcMPxLN0SZXkQiSs=;
        h=Date:From:To:Cc:Subject:From;
        b=AuX5TguMTk4iBS2O9LqjdviE5vqZHtKIGbC92fKkEVL7ceCkWAhQBZzxLXp+o1rVi
         iM+v9zJE6uAzSu2x6NV6Vq1d3HrilbWtLpbqLvWC3fVK+FeeStcZ/5u4h6zbjmHJLl
         CX6gytefIF6qmUTIuS8GIld68WgG0Oq5W1A/uXi0JNMHrP2M5lsrsaaPGtTyV6KgDf
         Tz48veyPA+ehpBaUstk/CM7YvY4o75GLwvHumr6HOIwFbT26kr+9rL50jj7PC+Z+8o
         GbmLdfgfGrABfqhqxixb2OP9R7zzMfpBUJL/h2vQlJzS0Ka7DeyUyW2qWwoWcqlf3g
         eZKHCjTJgfFbA==
Date:   Thu, 29 Aug 2019 17:35:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20190829173515.764a12c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9HgvQ_dAjZrM0qt/DJ+5yAz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9HgvQ_dAjZrM0qt/DJ+5yAz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "platform_get_irq_optional" [drivers/hwmon/pwm-fan.ko] undefined!

Caused by commit

  6e7e5c7fbc1c ("hwmon: pwm-fan: Use platform_get_irq_optional()")

[ or maybe commit

  8973ea47901c ("driver core: platform: Introduce platform_get_irq_optional=
()")
]

I have added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2019 17:26:34 +1000
Subject: [PATCH] driver core: platform: export platform_get_irq_optional

Fixes: 6e7e5c7fbc1c ("hwmon: pwm-fan: Use platform_get_irq_optional()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/base/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 0dda6ade50fd..11c6e56ccc22 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -213,6 +213,7 @@ int platform_get_irq_optional(struct platform_device *d=
ev, unsigned int num)
 {
 	return __platform_get_irq(dev, num);
 }
+EXPORT_SYMBOL_GPL(platform_get_irq_optional);
=20
 /**
  * platform_irq_count - Count the number of IRQs a platform device uses
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/9HgvQ_dAjZrM0qt/DJ+5yAz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ngDMACgkQAVBC80lX
0Gzkggf+IWGemgymyci+mGq4DEJ115o20nTX3YuDwVWmYfeebJOcTOpsDXm7C/gz
putAL+2NDNI7TVkMnHi5vjZVI1i0epFAfbcpdSZ7NzZJ2wzO520GHXPPesWA+qmc
m0XYIs9cC3K8EPZvoUSEL3sYZuklwSPLionZfHd3cktJHRle+1QHVAFDIboAyyAB
F2qUgDzO6pdkpvcgitTna+RrxAF0WBjzg3xnrPkcx7Gwb3qqR/J+FxU8LRNYyZEm
zJLif50O1UYqTnnNJLkbL9MkCdzgWftEBmsgsKsU4fuwQhY/qoNLLUGTzIE7taaO
sfYAyTWsp1krgcGVbw0+5fo0lIcldA==
=Msa2
-----END PGP SIGNATURE-----

--Sig_/9HgvQ_dAjZrM0qt/DJ+5yAz--
