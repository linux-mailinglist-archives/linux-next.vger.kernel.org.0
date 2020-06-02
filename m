Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF601EB572
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 07:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgFBFs3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 01:48:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43765 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgFBFs3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 01:48:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bh0p1FwRz9sSc;
        Tue,  2 Jun 2020 15:48:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591076907;
        bh=MoozshKoSgiWDK1bkENFGy/6XcIC1kBg4kKlpbMgHJw=;
        h=Date:From:To:Cc:Subject:From;
        b=bHCL4Y1feX4y8yZdYIpPCmJekn1k+0f4IvOcPB3dEFA832NlQgx0nzD0VjxJwYJNx
         YGu2YrjJxq1KRroKh8pClsgsl05HR12Y3guvRFMGBo7LkoberWGE/Qxmr2ZLxtvBHT
         HLgSViBHJ8tmrcrovlzucMVSWWpgAUUqORr4yzCIW0nWoBfUgONXBLN3jY8xBO/YIJ
         y9+PphmI4VXxMkW6TLDHoBEHxodqPXRLIiKwdBe/MdS+FIfAmzi9Of74RM3TaHhnDz
         0S52d7zGyJQObQberQzbDSBZtY16WSERw9OiNIsdH3gRpKVymiVq73zhiEZYaGT1kL
         bcAeQnbZpzwYw==
Date:   Tue, 2 Jun 2020 15:48:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: linux-next: manual merge of the tty tree with the devicetree tree
Message-ID: <20200602154824.263bf711@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4g4t36k61npKPKomu/bA8MD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4g4t36k61npKPKomu/bA8MD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  Documentation/devicetree/bindings/serial/rs485.yaml

between commit:

  9f60a65bc5e6 ("dt-bindings: Clean-up schema indentation formatting")

from the devicetree tree and commit:

  01c38ecff8b1 ("dt-bindings: serial: Add binding for rs485 bus termination=
 GPIO")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/serial/rs485.yaml
index 8141e4aad530,a9ad17864889..000000000000
--- a/Documentation/devicetree/bindings/serial/rs485.yaml
+++ b/Documentation/devicetree/bindings/serial/rs485.yaml
@@@ -39,6 -41,9 +39,10 @@@ properties
      $ref: /schemas/types.yaml#/definitions/flag
 =20
    rs485-rx-during-tx:
 -   description: enables the receiving of data even while sending data.
 -   $ref: /schemas/types.yaml#/definitions/flag
 +    description: enables the receiving of data even while sending data.
 +    $ref: /schemas/types.yaml#/definitions/flag
+=20
+   rs485-term-gpios:
+     description: GPIO pin to enable RS485 bus termination.
+     maxItems: 1
 +...

--Sig_/4g4t36k61npKPKomu/bA8MD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7V6CkACgkQAVBC80lX
0GyxaAf/dNscE5sw8bLnEODNavRf9f2XuVrNtjN6kXgpJFSpfTIWZDbsW4jpBcTl
b50/JZbdigmjNm3tpQE7uyv5wk5ECaHQDE0RBngeIVJmIowdxffndSJabk9m9kjD
85HLvCAsSz9vQn1p1lsPucKSuFjlDAqM03G7TYXZbR1qu10j0O8YHf2zFMJev/Ro
uydh8t6TVxGkEcvmGsMzhJ8cPrxAO/vArzhNVguJebB7YZYkePPNzBoZ3ilMO9Wl
01eRr1C6OeH/kECsCwiBr90/6eWvIrLhbeZbhjEZHodFxJThtfU2KbSHT8dJdCHl
+XgIBcT3ah4Ov0hdeqEB1MeIQnvgag==
=Erm4
-----END PGP SIGNATURE-----

--Sig_/4g4t36k61npKPKomu/bA8MD--
