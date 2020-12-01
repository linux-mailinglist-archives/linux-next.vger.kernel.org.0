Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3112C969D
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 05:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgLAEra (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 23:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgLAEra (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 23:47:30 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C217C0613CF;
        Mon, 30 Nov 2020 20:46:49 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClV1d41Nhz9sRK;
        Tue,  1 Dec 2020 15:46:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606798005;
        bh=KI4qSCRVAC3qwDQdN1K1+CQVjVNz60rHbIOFho432Ws=;
        h=Date:From:To:Cc:Subject:From;
        b=RdpB6Z8Si6gVk6gG8038nah9OjFevUU9Xj3DLFtQibGn4H3uAe0LXrDKVtEjBw/Td
         z65VziaQjIeWohr2OH5xmvB5kmnE1XGw19f6U6a0PKjHcoeuSk0guR1HdnMruNsMwz
         3nl/OEQq7T2a1FerJB60ofU13e7oKqcldL6t7Q9OYHMAVj5K72EIBIYoMc3Mge7P6Y
         txsxngvHwBRBNRvicv7pXPEtOFAbfv/+7FRQN2ydKjDyxfQ6Q+naCEm1OWfkIByr1g
         CzfaQ2NCnIjsGTCnO9Sn3lnIOKmZndDo7qs0nhgMYQLZCyvHBpV0vE8tQvA08savbg
         DihPgFrX7uWig==
Date:   Tue, 1 Dec 2020 15:46:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the
 devicetree-fixes tree
Message-ID: <20201201154642.1839e273@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ktv//Iv9sRRlK2R0a9=0h43";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ktv//Iv9sRRlK2R0a9=0h43
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/Makefile

between commit:

  48ae42d22a71 ("dt-bindings: Don't error out on yamllint errors")

from the devicetree-fixes tree and commit:

  3e95dfb315de ("dt-bindings: Don't error out on yamllint and dt-doc-valida=
te errors")

from the devicetree tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Ktv//Iv9sRRlK2R0a9=0h43
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/FyrIACgkQAVBC80lX
0GzuAgf9EakGl1wvucrSPcxpUDNTr65Hu81vv2VGWlnIrGPEbFZbRp4telfUFUww
+xi9p3mcvpMtElBWJTMLZGSEPB6RkjFTfNfeUcrKCUl6JW/esoACxFPanUiJkMBK
zBn0HjWKVz7aEjeyZBTG2wYI2DLgLV5DMpop7SCepAvBTfwCvV6fSxoHPgHuBOI5
0PlRZFRJM2hTf/4YA7pD7y9vS1v2oe8YGiyORuTEHJNHjg1wuzU09j6cs9P0yH9v
D0lBI9+yT9trN7NxG1xfHY4xh9Z4QBeQx6Q/Rcc9JUD7y8Y6+At5Y9lHpiT9CHKO
QJlgBmz/pW37xB3uhg6C7D4npzp7wA==
=9GS8
-----END PGP SIGNATURE-----

--Sig_/Ktv//Iv9sRRlK2R0a9=0h43--
