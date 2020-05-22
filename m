Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A996D1DDF9F
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 08:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgEVGDS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 02:03:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgEVGDS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 02:03:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Swry50w4z9sRW;
        Fri, 22 May 2020 16:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590127396;
        bh=5xtALOvjXPu9+VIHx+DjHhfQ7lMYUJslakvA9myhjeE=;
        h=Date:From:To:Cc:Subject:From;
        b=iglyGk6+nnULH/rR4mLcFQxPazAC5WdSixdnMzqsGe89Y0ZA7Jj0rcIf4HZurYoGi
         X9+Qo+G+KF8Meg9LMc8CzHTFhEmx8xTWbZZyBWL9TIBhSk+z1dGbANcOWM72jP+Ja5
         dKo1aOL9SIGg4HU5kvStKezaXbeSsLeYJpbksZ2OkJq5gSVcD8FhxBBuvz8shjSgD+
         pxrwfyKTzwpyClCvt58Uk1EK/G6TsHiyBM//WT7h+0Bocc4MftL6SH+eyoPmYgF1yL
         3ENIKCN4g3Beckqlsn/vMBl8vyHiN/bk/fvqEnvi6uIg0W+v/s0vi1XC86UglSUZfF
         th9yVpCkgnc4g==
Date:   Fri, 22 May 2020 16:03:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: linux-next: manual merge of the devicetree tree with the arm-soc
 tree
Message-ID: <20200522160313.09cb2b7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QbwZfQx2./5yGC/hXftR2Wc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QbwZfQx2./5yGC/hXftR2Wc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/arm/socionext/uniphier.yaml

between commit:

  82ab9b6705bd ("dt-bindings: arm: Add Akebi96 board support")

from the arm-soc tree and commit:

  9f60a65bc5e6 ("dt-bindings: Clean-up schema indentation formatting")

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

diff --cc Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 10a7f0752281,113f93b9ae55..000000000000
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@@ -51,9 -51,8 +51,9 @@@ properties
        - description: LD20 SoC boards
          items:
            - enum:
-             - socionext,uniphier-ld20-akebi96
-             - socionext,uniphier-ld20-global
-             - socionext,uniphier-ld20-ref
++              - socionext,uniphier-ld20-akebi96
+               - socionext,uniphier-ld20-global
+               - socionext,uniphier-ld20-ref
            - const: socionext,uniphier-ld20
        - description: PXs3 SoC boards
          items:

--Sig_/QbwZfQx2./5yGC/hXftR2Wc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HayIACgkQAVBC80lX
0Gw6BwgAhFvWcg5SSYtJw1YMJsT40nojg/Dlx0xpMSOVTN1daICIyOsaWdFUm2hV
A9mVMv+b1kQ4kgwStXr7hA5qyC0MYrWLMDbK8VY47N+/F6BLjEqLnJMAUUQQmraW
l2bllFGdlzv74Yknu1uCUmkDVgBx17WzTPrmMbxvjDwg+MmBGC65L/tWZw4lJHtx
2xMAYHfdgeTZxpRZnUZjG3v9i1GwGbgGCwvsTQh9hVWHBO1qo4fJ5F+Qah0d76Ql
3i7b7IRZAVFUSz5YPzcPUdmJDy8Dyn1mgrOKi0kMuiqUJa2XOvLw/oJP2njoi8V8
kh+cv2C2DdkhA7n8gc+4Hq1Rn1axOw==
=Ow6Q
-----END PGP SIGNATURE-----

--Sig_/QbwZfQx2./5yGC/hXftR2Wc--
