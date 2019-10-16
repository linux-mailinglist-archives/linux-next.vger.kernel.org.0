Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F59D8570
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 03:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbfJPBZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 21:25:45 -0400
Received: from ozlabs.org ([203.11.71.1]:42763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbfJPBZp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 21:25:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46tF3p3CZ5z9sPT;
        Wed, 16 Oct 2019 12:25:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571189142;
        bh=bTjtrEB3J5lTmvGUqm0ylcaGquTm3ZT+SXImEaf9J38=;
        h=Date:From:To:Cc:Subject:From;
        b=CmQSAX8aLqs6Qvp8TT/JwVzKE8EIz1fNVLG0mwijGw8rgxbpXdXq/xnBPmGJ29lqX
         /+QLs8Yzb3ghZnGEFEoLyg85gDVeMzH8VObrYLEG4d9H2pE2L2TCZHFr3eqlXESeL7
         AdsCwGTNiSoUyTvYR+HuyeqdDuADj7NDBXhDqmrcpXLktfPNgBNKw9LPMBpqfy3g7+
         5GdkTKolSqF31q9ifH2q4aZJFSdSjw5x/NMIyY4iSLKsyJBXdic8hC4ye29Kp526tE
         vOX9qIiWsloaxQWccjvLwDyhgKNkVbaaHTnuUU4vaBLdqCpJnBEWDXn6sJk94vvqCv
         JAAMPDoOTAGIg==
Date:   Wed, 16 Oct 2019 12:25:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Message-ID: <20191016122541.5ae0c637@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mvn0upQUZuO8=vlaMu96w=v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mvn0upQUZuO8=vlaMu96w=v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/usb/generic-ehci.yaml

between commit:

  3aa3c66aedef ("dt-bindings: usb: Bring back phy-names")

from Linus' tree and commit:

  02ceb12c20f5 ("dt-bindings: usb: generic-ehci: Add "companion" entry")

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

diff --cc Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 1ca64c85191a,ce8854bc8c84..000000000000
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@@ -63,11 -63,12 +63,16 @@@ properties
      description:
        Set this flag to force EHCI reset after resume.
 =20
+   companion:
+     $ref: /schemas/types.yaml#/definitions/phandle
+     description:
+      Phandle of a companion.
+=20
 -  phys: true
 +  phys:
 +    description: PHY specifier for the USB PHY
 +
 +  phy-names:
 +    const: usb
 =20
  required:
    - compatible

--Sig_/Mvn0upQUZuO8=vlaMu96w=v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2mcZUACgkQAVBC80lX
0Gz7Gwf9EVUFgqE50YyTpreAlZthY8VifrcIq+p1YUciSOIcZIg+kSyTpIpzYI/v
BIKQd407pWw3SgRdRGMV6enN2HFXz2D0NHyC0kqlaerb45x1zyVmeDklO7KgcIku
R8RC3qUAlivj9GD5q7MBeKgu33jbCGWr06gr03FVVAxdABoPoFWMGeCXWLcaEVX8
Hm856dhrIspEI4QudC0a2WZcWyks69Wm5Df/pztjLk7h0+zINhZxZGH23vhbW89d
JpDlrKcjEJKPwmJpIYst+q+eAm55+NVWE4pHSNGF2h5jPc2NMQBtt86tly+SAHOu
tR8xdeXOLBedTHZr0kiGxD+5IkZEew==
=/1Sh
-----END PGP SIGNATURE-----

--Sig_/Mvn0upQUZuO8=vlaMu96w=v--
