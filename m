Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0D23E40B2
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 09:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhHIHKv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 03:10:51 -0400
Received: from ozlabs.org ([203.11.71.1]:48499 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232094AbhHIHKv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Aug 2021 03:10:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GjnKb37SYz9sWl;
        Mon,  9 Aug 2021 17:10:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628493028;
        bh=12Ug9aympOqjWoCUZE9P/aDbqJ6Wd/R7MXq209qhHyo=;
        h=Date:From:To:Cc:Subject:From;
        b=BfSfjVTKpEEsSHzI6XakVEIwiiYkK/8ylsgtPsTUSVIhk7GvU0iisnr3OJ6UoQ+QI
         rWGlJO7Ff8gDqke2Ube8Zq3cy/ki8QAZ3qA7uiUU4gU6JUuIXdcdgDV7m/oCCwPWkN
         SuGWdtXbGlDhvjU8SwJashW3x5ew41P/hvvdgsvEOrxqpEDkHP1jpL2stArNRa8ki0
         i6hf69hvV1Zs2VsHT78VIsb3HHxB1g17kWhMR0LtIwo06TG6TptZ+cD4NnV8QevMMb
         cvtGJGXt1W2OQscOkSzO72kfEuEyDuWgAeAZu/yRQmwNnDDrYuURfGjLsCtAZ8PIpC
         RPla37SmhOgnQ==
Date:   Mon, 9 Aug 2021 17:10:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <20210809171023.4d387ed3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FT3AZRVW3dQuq_Qnw.a9/u+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FT3AZRVW3dQuq_Qnw.a9/u+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml

between commit:

  e516ac5d48fe ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC7280=
")

from the usb tree and commit:

  1a00d130596f ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for sc8180=
x")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 20199833f144,1d49cc3d4eae..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@@ -14,7 -14,7 +14,8 @@@ properties
    compatible:
      enum:
        - qcom,sc7180-qmp-usb3-dp-phy
 +      - qcom,sc7280-qmp-usb3-dp-phy
+       - qcom,sc8180x-qmp-usb3-dp-phy
        - qcom,sdm845-qmp-usb3-dp-phy
        - qcom,sm8250-qmp-usb3-dp-phy
    reg:

--Sig_/FT3AZRVW3dQuq_Qnw.a9/u+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQ1N8ACgkQAVBC80lX
0GyxNAf+PFYPm48tqWx0/2cCb2JxyJONnKL41F1sPJAY5YA4zzaRMDUUfX2f1WKO
gZQtjL/KViJy3NEsQa4LmeRuj7z+xKHaXLDW4oyDr2UDk+BHneVkQGVCuhvxzNef
i9saLdGQYrV6PiefeXHynmIaX1iezUpRKjUkEZGjqt0X8o8IbDAyxLrjnVQDIt0t
m6YEuSLg+6hB0HQW7NnRSTIbIO4fhHmp4Ef2ZAktNEEAZ59fF6oRtVIm9BxO8j9h
lqz0vFJXnwunU2wDuopyaD+m/TSUHWvXmuwcfEZX2hE0P08krWMgSkacibqwQGs4
qHQOU8rx4hiWGmW+Db/nEtcafvVo3g==
=+d1V
-----END PGP SIGNATURE-----

--Sig_/FT3AZRVW3dQuq_Qnw.a9/u+--
