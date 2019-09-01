Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCE3A4C4E
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbfIAVgR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:36:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728739AbfIAVgR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 17:36:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M63L2p1Fz9s4Y;
        Mon,  2 Sep 2019 07:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567373775;
        bh=6KOhpmdCOZa2HDknlm0PX6fOrzK5/YKICId25TtgXag=;
        h=Date:From:To:Cc:Subject:From;
        b=IRJpm9LFbjVXmR9tyUx6E7+Ez4RrDu452tKPqzkSuHDBhRDmas8/pMizTYGdGEcui
         E0N5QTN2Tl0jBOyJS0bI4j9y9iJ05bz6IY2a7u5SLHBtgAvUmC1V3hY/PdT5tzy+AI
         9se4r29/3FqHDS9NTbJFyErGSITJioc0dJCkU4XvSC7xVztyfvwPOP9K18vRFRAcxm
         qN0lCw3bhMcYVAqlFUVfgUgl1AAa83b06bMhAGqYeQVeYzNskWCCLbCVscK2cocz1p
         SDSUC04FI/Z0DyfVWBcTllfFgMrE31muwIAfkqHVbNiruT8colZS4YE75AbShh3n5v
         U6Gn8BfTPp3+w==
Date:   Mon, 2 Sep 2019 07:36:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20190902073613.770d1885@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kkyS_oFa4wtsRBeDkmXrPdY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kkyS_oFa4wtsRBeDkmXrPdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7893b59b1e2d ("iommu/vt-d: Remove global page flush support")

Fixes tag

  Fixes: 1c4f88b7f1f9 ("iommu/vt-d: Shared virtual address in scalable

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  b9475b3471f8 ("iommu/mediatek: Fix VLD_PA_RNG register backup when suspen=
d")

Fixes tag

  Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  76ce65464fcd ("iommu/mediatek: Fix iova_to_phys PA start for 4GB mode")

Fixes tag

  Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/kkyS_oFa4wtsRBeDkmXrPdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sOc0ACgkQAVBC80lX
0GxcvQf5ARds9V9Mpk+t49cwr0VFKFGl5T1leZVv3JcO2BnAQfc90xgNQ/h5rI9z
ChEP1IszOO6wJgJuSpOqPGTTq04ZAFoPfJ6gO3mEdpCubJNMf/MZiyZEX8t4YBuP
1ipNlUcPFXSq9kdFEDxQA4efGHfiMrd5G45I2MiYjue9rW4V4O0blL7fUb24VL/w
ca19rcMmCFegS52uKBSzZl3JB4t5zZR5YlgjlkSFyzwSusbJw9mSXcGZFt+dOb/R
z4xMI0n86ecaXA9kH3QJnb7KTOTzCqIWTsS/1F5zOAn8p6A+WGcZXTTjNnUFy1eA
nnH85q9iBkUhd4wwm1qj0rWGmScvEw==
=wi6B
-----END PGP SIGNATURE-----

--Sig_/kkyS_oFa4wtsRBeDkmXrPdY--
