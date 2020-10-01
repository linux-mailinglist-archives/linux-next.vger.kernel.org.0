Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0BE27F969
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 08:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAGWn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 02:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAGWn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 02:22:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84EAC061755;
        Wed, 30 Sep 2020 23:22:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C232Q6LHrz9sTs;
        Thu,  1 Oct 2020 16:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601533359;
        bh=eejPiNzN8nE5VVK7plevu5RwlKG6uWR2hpAxcanduRw=;
        h=Date:From:To:Cc:Subject:From;
        b=Uo1eeyifyAL3FOqkPlQowj4qtluTqpfGA3Q3zzHqa4QzdE0Sj1V8gzIyW8aY+JGif
         5pVlSRhg5b2VwM5zqHHnR1zBnC+kz69e0wmxtjLXEBQy6ednU5Mg1p9l3/LWlYjM98
         SwLDym30diLRlR3yMnNOsGEj6jJ8LvE5GF1rS9DH9FcZzDaWfA9DwQXJW3l/Fk296D
         M1fQuKT3Ro+GMxeA4G00sfk/UhidGe2O1+bTzwvnkrAXG5TJpuJSZ8wJheiDAQUq7v
         Ibn2ILbNAeAs0K5uMgC4lviK3NbgnMQCIN3r84+dz/RKQ9etZS7PgQpmeS3wxfKjYF
         3emVj3LKsFdkQ==
Date:   Thu, 1 Oct 2020 16:22:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>
Subject: linux-next: manual merge of the devicetree tree with the mfd tree
Message-ID: <20201001162237.633d6043@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/511SaqLc6hf=mVo4gKlZyNu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/511SaqLc6hf=mVo4gKlZyNu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/mfd/syscon.yaml

between commit:

  18394297562a ("dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bind=
ings")
  05027df1b94f ("dt-bindings: mfd: syscon: Document Exynos3 and Exynos5433 =
compatibles")

from the mfd tree and commit:

  35b096dd6353 ("dt-bindings: mfd: syscon: add some compatible strings for =
Hisilicon")

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

diff --cc Documentation/devicetree/bindings/mfd/syscon.yaml
index 0f21943dea28,fc2e85004d36..000000000000
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@@ -40,11 -40,10 +40,14 @@@ properties
                - allwinner,sun50i-a64-system-controller
                - microchip,sparx5-cpu-syscon
                - mstar,msc313-pmsleep
 +              - samsung,exynos3-sysreg
 +              - samsung,exynos4-sysreg
 +              - samsung,exynos5-sysreg
 +              - samsung,exynos5433-sysreg
-=20
+               - hisilicon,hi6220-sramctrl
+               - hisilicon,pcie-sas-subctrl
+               - hisilicon,peri-subctrl
+               - hisilicon,dsa-subctrl
            - const: syscon
 =20
        - contains:

--Sig_/511SaqLc6hf=mVo4gKlZyNu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91da0ACgkQAVBC80lX
0GwkeQf+I7JfmjtNPOawsT4PD8GIuMRQkOn7sFRuki2OH8IkFIUgl8PqLYKtl6jC
kLZc1DdX7rxF7csSM/V7gIN2mWbLAxz2vO9CLML23eQeVKhp9eLFVjLN7VSI9H4D
sj9vCKKtHNhjRS1b5tLAhSSmyozUqpjLv4fzPcTFH4+u3cvt7gMLo+9pUdWdnkzQ
G+KaIWWhoYfEdqNysC6yIAQJtRudjgrISlVX9UBwPqFSRm1dKpMHBqiEBssVuqXe
IW4C4MpLdu9C3mPliWM4oP2xztBiR6fgypXyyUz03P9mnQPfu+U3mYAExJuFhmPV
7O6sjgolkaE74hAOemkRrjYlNWXjLA==
=Zw/V
-----END PGP SIGNATURE-----

--Sig_/511SaqLc6hf=mVo4gKlZyNu--
