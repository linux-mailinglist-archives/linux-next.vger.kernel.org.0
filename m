Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044DADF89A
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 01:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbfJUXXi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 19:23:38 -0400
Received: from ozlabs.org ([203.11.71.1]:55791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728056AbfJUXXi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 19:23:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xt482CtNz9sCJ;
        Tue, 22 Oct 2019 10:23:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571700216;
        bh=C4oVc6nhfpP0gwAm5RIDZx4PF8lbcnlT8tj6E14ZVjo=;
        h=Date:From:To:Cc:Subject:From;
        b=MvJcZoV/Kiyf4klBRQI/hUs2tjL4C7Qnl3Xz1brRkGo89HJG9FidZWuZo+QFCKJc1
         73CJj4Ebxi1qApPf8kYZHT2ej1m059NbwgC/W0D3+JX2B99BE80lss8M4F4IVa4j3H
         C40qpiFEx/MsVVnKEeeJhwFFVYHQOxFbEttBMvsXa3Q5DX0v3FKIaS0NPuBPxhSuts
         NghrQwuGC5CzghUmHWPlO8FeiJpFiH4Vvyskdte6GQkBfxqw6l4Ml3ZSiKPvNgYLgj
         ZBuaYdWjeseU+zhWd5aRa0NQck9JItnGVguredKXmb2ifSqI47lj12rLdcntYmfubq
         Vgi8PIDziYLgQ==
Date:   Tue, 22 Oct 2019 10:23:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: linux-next: build warning after merge of the thermal tree
Message-ID: <20191022102334.67e5d3d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/osA9fqqRj87OqHUrcHUS7eq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/osA9fqqRj87OqHUrcHUS7eq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/thermal/qcom/tsens-common.c:13:
drivers/thermal/qcom/tsens-common.c: In function 'tsens_set_interrupt':
include/linux/regmap.h:87:2: warning: 'index' may be used uninitialized in =
this function [-Wmaybe-uninitialized]
   87 |  regmap_field_update_bits_base(field, ~0, val, NULL, false, false)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thermal/qcom/tsens-common.c:183:6: note: 'index' was declared here
  183 |  u32 index;
      |      ^~~~~
In file included from drivers/thermal/qcom/tsens-common.c:13:
include/linux/regmap.h:87:2: warning: 'index_clear' may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
   87 |  regmap_field_update_bits_base(field, ~0, val, NULL, false, false)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/thermal/qcom/tsens-common.c:199:18: note: 'index_clear' was declare=
d here
  199 |  u32 index_mask, index_clear;
      |                  ^~~~~~~~~~~
drivers/thermal/qcom/tsens-common.c:199:6: warning: 'index_mask' may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
  199 |  u32 index_mask, index_clear;
      |      ^~~~~~~~~~

Introduced by commit

  fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")

--=20
Cheers,
Stephen Rothwell

--Sig_/osA9fqqRj87OqHUrcHUS7eq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2uPfYACgkQAVBC80lX
0GyF1Qf/SkjXmUvy+OXBrKs60P2ju//4Fwdpg23Olc/EZO5r49RAlBlpxg6dxjKM
zlbAhs8FhVnCnBsC6In80gzOhyVnyd7uj+obmTXucci/GqhgDVZkcbHHS85TZqsD
Ufc71YOL5kv3na9XG8U4tZ7ObPdjXPdSUA7w9AvdeedBSkM568jA+IEUQLjCvTpJ
7OF4cBsXrKqUd+fuAbtkxq064PhOFR5Fb9kDVW6/H3Vdw3+L0UaHV2ojZjala1Rb
Xk+IUbPKMkyeh4VNGKKxGUmVqpnyx3b5J+k+QpiAavzN3ZDqcpjLk2DShNHKG7+S
MkYffBYY+RAPCi5Oq3UOAN6RFb8X7A==
=CLEE
-----END PGP SIGNATURE-----

--Sig_/osA9fqqRj87OqHUrcHUS7eq--
