Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54E2847D8
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgJFHuR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 03:50:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgJFHuR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 03:50:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C58kr2FYRz9sS8;
        Tue,  6 Oct 2020 18:49:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601970609;
        bh=2gRc8fBkASCC2XcjUD1NGCbUBTQyv+Tsx1cSI0IS7Eo=;
        h=Date:From:To:Cc:Subject:From;
        b=XL803jy6cfC5rrA+VmwTT+lg/5kFo6Nppcb5nT2oF5CF95SSlcQKftopzJiV30SYA
         8eqLMGj6c6+AxxiAebdzTAhxjv9B4wx+ZaA+usW4D1oxZop9GDbwXg1XwtxHNPPizr
         0t4MskcM9AkB48Z955oAHOu4o5NWczLDUyd70PFsJyAAUu33ni8WAz0vfh9EKbeFuV
         feMue641eUpm3OJFqK/y2NfIEkLXvK/wDMz7X3ZnGFDE0tI5Oh/zMaukaskDv/DwNw
         TtndaofGPidmuSLmOrQXHkuaTAL9YgWW2K8CfzREIYuzzCK8fXvgzNS7ZLYySYODWs
         CJdcar+rAC2Yw==
Date:   Tue, 6 Oct 2020 18:49:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the devicetree
 tree
Message-ID: <20201006184944.22985fd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7nc_tXCtsATMOWlKv.nwete";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7nc_tXCtsATMOWlKv.nwete
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml

between commit:

  41fb845621ea ("dt-bindings: Another round of adding missing 'additionalPr=
operties'")

from the devicetree tree and commit:

  3b17dd220432 ("dt-bindings: iio: adc: exynos-adc: require second interrup=
t with touch screen")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 16d76482b4ff,37d6591ff78c..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@@ -107,8 -109,15 +109,17 @@@ allOf
            items:
              - const: adc
 =20
+   - if:
+       required:
+         - has-touchscreen
+     then:
+       properties:
+         interrupts:
+           minItems: 2
+           maxItems: 2
+=20
 +additionalProperties: false
 +
  examples:
    - |
      adc: adc@12d10000 {

--Sig_/7nc_tXCtsATMOWlKv.nwete
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98IZgACgkQAVBC80lX
0GwbrwgAo+qLBw8LhbVfuWgDkGHG+11cI0SHhbsRs1XTjh0k9lRUR7NXuSGM6UNN
4nEJvXrV+KOnaS1uN9XvLseSMqo7Y0/sWoCU3av5Cb+LoPyRgoaN+dLKuv3XQWAh
d5A0cPY5tsZCdYHZ0YXXoCi3KWCx5EF/xnhrei0ffRAl2INp8SaYINdxYPMxFkgA
l/YFhaO6OjI6bWI/eEksao10dh88Vgq39E99x795P8vkEiyTOVR0z5k/d96nS0Fo
EN946mjlprQeWxvJUJYpkM0qvXZ9phdVEfnKDeYHrhRbhJQTHStvlYd3Sz15sYnz
B5I1N6f4EHRbBVM2J/Z2Q8+k6MwGfA==
=2wRg
-----END PGP SIGNATURE-----

--Sig_/7nc_tXCtsATMOWlKv.nwete--
