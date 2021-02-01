Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C409A30A0A7
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 04:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhBADn4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Jan 2021 22:43:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhBADn4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 31 Jan 2021 22:43:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTYgV0YRCz9sxS;
        Mon,  1 Feb 2021 14:43:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612150993;
        bh=KTqaMDzVhMEl7jSCUPV87n/UtiRDFVgt/JT3j7vOrCY=;
        h=Date:From:To:Cc:Subject:From;
        b=cyEBtM01FQkGAsT+F6J49gi/82x8Oph++A/5TH3ZOrIJC/4YHos14/U5b/D+MyLKE
         knAn2ybx04Cs+eStOIsgli+ILPgOZ5ePoyWKDb3wvQ2hX9x/BL92x7KKiNCOI+r+e8
         FuOrcSpToqUfoyDjqu2si4phvedyq+XgUOqFJ53K1DWgg9vUkB4bdRMxOK/5o5oEqP
         Up/r6k7GTwyLQI8V5AbknCz63oEZ1xjQxbSTmfnQToeS17YoFn27TkCjSbxByb5SB0
         cXigv9vdz+izDwW11Bp+Pd9qGhSbbDfbnYwt4DV5kfiOtpJXL4MAdTfr8svUS5HrDY
         XfA6yC9habCpQ==
Date:   Mon, 1 Feb 2021 14:42:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Paul Kocialkowski <contact@paulk.fr>,
        Samuel Holland <samuel@sholland.org>
Subject: linux-next: manual merge of the irqchip tree with the sunxi tree
Message-ID: <20210201144259.102ae6ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YF/wh=zL265Gz=mmcmH.iKk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YF/wh=zL265Gz=mmcmH.iKk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got a conflict in:

  Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a2=
0-sc-nmi.yaml

between commit:

  752b0aac99c7 ("dt-bindings: irq: sun7i-nmi: Add binding documentation for=
 the V3s NMI")

from the sunxi tree and commit:

  ad6b47cdef76 ("dt-bindings: irq: sun6i-r: Split the binding from sun7i-nm=
i")

from the irqchip tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/interrupt-controller/allwinner,=
sun7i-a20-sc-nmi.yaml
index 4fd1e2780026,f34ecc8c7093..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7=
i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7=
i-a20-sc-nmi.yaml
@@@ -25,17 -25,7 +25,10 @@@ properties
        - const: allwinner,sun6i-a31-sc-nmi
          deprecated: true
        - const: allwinner,sun7i-a20-sc-nmi
-       - items:
-           - const: allwinner,sun8i-a83t-r-intc
-           - const: allwinner,sun6i-a31-r-intc
 +      - items:
 +          - const: allwinner,sun8i-v3s-nmi
 +          - const: allwinner,sun9i-a80-nmi
        - const: allwinner,sun9i-a80-nmi
-       - items:
-           - const: allwinner,sun50i-a64-r-intc
-           - const: allwinner,sun6i-a31-r-intc
        - items:
            - const: allwinner,sun50i-a100-nmi
            - const: allwinner,sun9i-a80-nmi

--Sig_/YF/wh=zL265Gz=mmcmH.iKk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXeMMACgkQAVBC80lX
0GyrsggAonTf1sRAIjnS1f19ragVdJNtLT9m/7JBHrOswNyWaA+3OdlljtSzHyHY
ANyPCZj77w1+6WclEPFNqCHtb4FfNw0zjaErXPy30iE3hcs12uJdhJ1LcsA1xj2P
nvrN0j1BMpi9fRLq/6lGMsZVk86hBGD0CN7RgffnVsmq+hjMEIyH5mxFgAKqaCkj
wgXeHKYWgQUMCy8HQb9RPUnJbniVA+23fVehZpH+7eOzIqGMRv1+0eytA241zAvp
FG6iJPgWBMyQaM5UHJVEz6PDkvCdDmzcgF7Q6HHDwZYqrLDxUmuyKucF6zhVTkWs
Urds/P/aguo6przyk1gq0LR2/uHQiQ==
=uP0U
-----END PGP SIGNATURE-----

--Sig_/YF/wh=zL265Gz=mmcmH.iKk--
