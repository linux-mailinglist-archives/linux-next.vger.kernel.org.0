Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647291FA36F
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 00:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgFOWX0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 18:23:26 -0400
Received: from ozlabs.org ([203.11.71.1]:50137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgFOWXY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jun 2020 18:23:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49m5Sm5fqRz9sR4;
        Tue, 16 Jun 2020 08:23:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592259801;
        bh=EFHHX4gSso4C1okvQV3vD2uZZPY/0g4jxOaIc3AwBvE=;
        h=Date:From:To:Cc:Subject:From;
        b=p5g9OZ21x9+fIxEbcPa05l7FFWpVyBObXE8mvj1w8zCgWv8uhAFizCxUqPx5QKv1Y
         zbmSSmEs4wjkiCfLNxkwaSLgYMITRjlDIJ/XIpKjKsHFaadmmzGLzJIdLm2jmjFV0u
         UP2OT8tnAp+rptrdAniYb4L/AxSoSKI3oSNsswcqdUTP/Oj8GVezpPAb8Q+JKy4oOZ
         e8GD8r2dbitO4/7TTs+D9G7XEDjVQn0ng/iLwbgbjcn4VC3VDme7yHOBv2VgtHbWvN
         H7IaLG/lKswyhEJGvyA2ttIb3lyavlcpiwWejXH2RcGoteN25YdnL5rBj8YkFcAWnh
         RBZfeQ78rguXg==
Date:   Tue, 16 Jun 2020 08:23:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the nand tree
Message-ID: <20200616082312.76d03fe8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w6n4N.YcXZH5sXQXjs=GiyG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w6n4N.YcXZH5sXQXjs=GiyG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  350e8dab0868 ("mtd: rawnand: qcom: avoid write to unavailable register")

Fixes tag

  Fixes: d49076a1347ea ("mtd: nand: qcom: Support for IPQ8074 QPIC NAND con=
troller")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: dce84760b09f ("mtd: nand: qcom: Support for IPQ8074 QPIC NAND contro=
ller")

--=20
Cheers,
Stephen Rothwell

--Sig_/w6n4N.YcXZH5sXQXjs=GiyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7n9NAACgkQAVBC80lX
0GyU0Af9H/r/NzyiEkJgL9IVNS+qrM60yo5BIeqGCXtJyD4Re+ujxmq4qYOiV2Jl
7mHxZ/aS2dH55DoHsMsuoJ+B/r8buO+c1TepYqrgZeEBu/ewz+SNngn3iP05A5eh
AF8ujNNhMQLYcb8jG1zbxEEcype/kgNp8PS9siRcecPuHxrioZr0wHsA3N1114Kl
G7MZDNRpYw2FDyvu4r5VrAmrAIjbeHrWAz8DiNXZkRoyJu3ecP15qXafY75+ALVF
eUzg1nrucTUK2HTlfEuvdW2yAI0bTE5h5YGtmWNNhYicU2oPBQeZ95xTrAgubcP5
KlUzQchf/TP8kyiFzY3nBd50f9QB+w==
=veyG
-----END PGP SIGNATURE-----

--Sig_/w6n4N.YcXZH5sXQXjs=GiyG--
