Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4C2B11B6
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 17:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732943AbfILPCY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 11:02:24 -0400
Received: from ozlabs.org ([203.11.71.1]:36551 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732799AbfILPCY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 11:02:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Thnl468Bz9s00;
        Fri, 13 Sep 2019 01:02:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568300541;
        bh=/arlBTrZbdzBVv5dDbs+QHk9ObiYhI8AbX3DE2M2I6I=;
        h=Date:From:To:Cc:Subject:From;
        b=C9bupnEUI4mmKgYtTpMH+/R75FUZecsju4ZQGW4GBWoPeIh3XsjgU3OJ3pZVwg87b
         LcBM0X+yxOtP4lmwjEXhsW7kfuMtliJZSC0i6GNcLsU38mvul7XY+uC+a/nqqAlEtZ
         iCQ2+fk3lMLnseO980TyFspDiPD+faJUC5lKs92UcxV6gwO4AOGV2l31cF1vYW9mz4
         N948OZG/NQLEEdhkrCzsN25ZFh5ouDcv9CY33nnEiY8L1GUnvcXzpQaDFjWqAmTRhx
         bebjPB8LZCwN4Z7zJOARWQwhTNJKk/a8FsgBWByhjQrZgkLtsxKKra8JWIbkjo0rii
         i1htc3OCNhIRw==
Date:   Fri, 13 Sep 2019 01:02:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-bys missing for commits in the pinctrl tree
Message-ID: <20190913010220.087c906d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gG7ZpRDily7d32EAqtRRbs2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gG7ZpRDily7d32EAqtRRbs2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5a85bd8e3af3 ("pinctrl: meson-gxbb: Fix wrong pinning definition for uart=
_c")
  235e8677e92b ("pinctrl: mediatek: Add support for pin configuration dump =
via debugfs.")
  dbe733ac908e ("pinctrl: mediatek: Backward compatible to previous Mediate=
k's bias-pull usage")
  7ed13ac1a968 ("pinctrl: mediatek: Refine mtk_pinconf_get() and mtk_pincon=
f_set()")
  56d1a061f882 ("pinctrl: mediatek: Supporting driving setting without mapp=
ing current to register value")
  319b83e60069 ("pinctrl: mediatek: Check gpio pin number and use binary se=
arch in mtk_hw_pin_field_lookup()")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/gG7ZpRDily7d32EAqtRRbs2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl16XfwACgkQAVBC80lX
0Gw2BAf+M6gzirzfkAUtXYH31g+722B41r2JCTvsHtFEPfspmFy4FYRBYjPC1rK/
PII+st3/9pNaQU3WR5OP28cFiGnyssqeeHGw4kF3ooQFdMOJ7dUNG2f6+UHgdx0x
/Nl+Ltny/1EuKRMrQ3WV9zFmZUSn78edoxs2YftZ6psHnT8iCxPMJI0boKF5usJW
dUa1qek/wje+sEbp7tELrascNpU7dVjxshBc2wdeyOyRXwLPGGrUz9OCEdkqmuye
JGC158rPYA2uzOaISlfVQ/QDx6Itqw2XhQUdhnFX0vuiGJJ2wgv/3yEmbvBOlJXw
HPeefvsNKQQ+8zFwdWPgelLfz2GiyA==
=BHI5
-----END PGP SIGNATURE-----

--Sig_/gG7ZpRDily7d32EAqtRRbs2--
