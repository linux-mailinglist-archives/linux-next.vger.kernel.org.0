Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7854F1E5533
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 06:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgE1EwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 00:52:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgE1EwK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 00:52:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xb064lxzz9sRY;
        Thu, 28 May 2020 14:52:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590641527;
        bh=MOKrI0eH2wquaeQBo9AZxDnJbZoxtvEZchvzsv03+Lk=;
        h=Date:From:To:Cc:Subject:From;
        b=YNuhk96jg8g3800RLaskIJZ/yDHyOOY+eAnw1wWZNbf/kJzTIk/g3K30iuhE5Eci7
         CRq2t7MtivGKbVQ/2aJa6qfVHcBUq/+AMWm0VwSPeFEXTCE6kyRRioAyba9XhmfCD3
         O21bZT2dJ11NmTTxBdKwGNu4CgnTUOLLRo5+U1exY7L+u1QSoG8CyEar0sY00XOz/D
         ugH8Cr/FSYsZkoUM+Evu8YfUXGqpv8vTto0aygcZGhcVRoz9kkGcHuNI3MnPneGw9K
         Wm1yL/7mb8rYT5fUYZMA25Bf4jsQUCxIMYISlXyo+46lErNqKTSpxi3CNRkfDogSLt
         KwDW+vDnXq78A==
Date:   Thu, 28 May 2020 14:52:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the nand tree
Message-ID: <20200528145205.13cb8288@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u_oA2VoiDbC/7q12OugGVCX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u_oA2VoiDbC/7q12OugGVCX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/mtd/nand-controller.yaml

between commit:

  1777341d9335 ("dt-bindings: mtd: Deprecate OOB_FIRST mode")

from the nand tree and commit:

  3d21a4609335 ("dt-bindings: Remove cases of 'allOf' containing a '$ref'")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d529f8587ba6,cde7c4d79efe..000000000000
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@@ -55,21 -52,21 +52,21 @@@ patternProperties
            embedded in the NAND controller) or software correction
            (Linux will handle the calculations). soft_bch is deprecated
            and should be replaced by soft and nand-ecc-algo.
+         $ref: /schemas/types.yaml#/definitions/string
 -        enum: [none, soft, hw, hw_syndrome, hw_oob_first, on-die]
++        enum: [none, soft, hw, hw_syndrome, on-die]
 =20
        nand-ecc-algo:
-         allOf:
-           - $ref: /schemas/types.yaml#/definitions/string
-           - enum: [ hamming, bch, rs ]
          description:
            Desired ECC algorithm.
+         $ref: /schemas/types.yaml#/definitions/string
+         enum: [hamming, bch, rs]
 =20
        nand-bus-width:
-         allOf:
-           - $ref: /schemas/types.yaml#/definitions/uint32
-           - enum: [ 8, 16 ]
-           - default: 8
          description:
            Bus width to the NAND chip
+         $ref: /schemas/types.yaml#/definitions/uint32
+         enum: [8, 16]
+         default: 8
 =20
        nand-on-flash-bbt:
          $ref: /schemas/types.yaml#/definitions/flag

--Sig_/u_oA2VoiDbC/7q12OugGVCX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PQ3UACgkQAVBC80lX
0GymmAf/av49Sq1pBSGjHLBY02GEg0Bcp8paeqPHIZYChIyjC1HlrrpJhmNgGNYx
lrXSFFbL00EG2frd4S8bQxUN5rL1E8i28c82L3ICIRChaMg/VmQxiWuZxi6yC4bk
BAw9xmhUfIP/IEUFDkVby/ASmVoEIhjqOHW+plcOuQacvFRQbennW1OSaQ30QXSU
dRpXlpyHBVr52uITrwMd/SmQd4zBuFTd8LL6xmJalG1zeGMxFxsC/YI8xQwgArD9
AirWPzzFRNNMCeIqIeIthJ0wDMDPwTN19fdKQZcHw1DH7taieVKC8/PDkRJxZ1kP
NGBkNlDBZ5pIdkOB7Ki6zZSgxxaGLg==
=nTRe
-----END PGP SIGNATURE-----

--Sig_/u_oA2VoiDbC/7q12OugGVCX--
