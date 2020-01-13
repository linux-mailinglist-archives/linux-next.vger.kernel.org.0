Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B03138AE9
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 06:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgAMF1w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 00:27:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33827 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbgAMF1w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 00:27:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47x2D52ZXtz9sP6;
        Mon, 13 Jan 2020 16:27:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578893269;
        bh=BcsvV+To6A2l8R3ypdXJiHRPHxco4Uq/c4u4oupv0w4=;
        h=Date:From:To:Cc:Subject:From;
        b=msfHF9VfONPB7LoSNPlxY72ic3SvibrdxXAU2i057hI5PzGq/1vWZVyQyWgG4BiAp
         +MAC+qt8NYk2LLTCtzJqKp63pXwC/tqEPU+BJ3UkvfYoajfpxBLYRD6ao/j6YrGPnZ
         nLWD3fmdAQwTWXJVCOqSAM+ZgabRjOD6Hmn2N4mL4Ba9awWlkssx3TkEbrzfPzM4nu
         wuqgNRX2z+rrysmb6Vnmk29pl/6XOSTmi6i2fdfvXchByE2nspbevrXq6B3BFyZAso
         OYruK204y/mfy5tkLKupzDKIvvDZfkKJxUMs5vGTaD6mlYKSVS0z2hfLrgXWynSpZj
         1VCzw+BTchryg==
Date:   Mon, 13 Jan 2020 16:27:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: linux-next: manual merge of the generic-ioremap tree with the tegra
 tree
Message-ID: <20200113162748.698470fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OsDyprzxFqvee1l2Kzr2lqy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OsDyprzxFqvee1l2Kzr2lqy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  drivers/soc/tegra/fuse/tegra-apbmisc.c

between commit:

  02676345e9b3 ("soc/tegra: fuse: Unmap registers once they are not needed =
anymore")

from the tegra tree and commit:

  4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/soc/tegra/fuse/tegra-apbmisc.c
index 4a737f15e401,a2fd6ccd48f9..000000000000
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@@ -157,21 -159,13 +157,21 @@@ void __init tegra_init_apbmisc(void
  		}
  	}
 =20
- 	apbmisc_base =3D ioremap_nocache(apbmisc.start, resource_size(&apbmisc));
+ 	apbmisc_base =3D ioremap(apbmisc.start, resource_size(&apbmisc));
 -	if (!apbmisc_base)
 +	if (!apbmisc_base) {
  		pr_err("failed to map APBMISC registers\n");
 +	} else {
 +		chipid =3D readl_relaxed(apbmisc_base + 4);
 +		iounmap(apbmisc_base);
 +	}
 =20
- 	strapping_base =3D ioremap_nocache(straps.start, resource_size(&straps));
+ 	strapping_base =3D ioremap(straps.start, resource_size(&straps));
 -	if (!strapping_base)
 +	if (!strapping_base) {
  		pr_err("failed to map strapping options registers\n");
 +	} else {
 +		strapping =3D readl_relaxed(strapping_base);
 +		iounmap(strapping_base);
 +	}
 =20
  	long_ram_code =3D of_property_read_bool(np, "nvidia,long-ram-code");
  }

--Sig_/OsDyprzxFqvee1l2Kzr2lqy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4b/9QACgkQAVBC80lX
0GyeNQf/eBgKU+nbf5MlMdn5g3yhzZ0HY8k2G0RfKreeJQw01IamcJrevPcHrk1a
omYW7ULCFk/Fll02EsECfMts8B7Stc3nxpnT2x0Qpbmd97iq+zjROYiDyZBTbIHT
h7M/RIooNM5dWhAjYXDYohbCNLQsP3H58vXXP4Vv2VO1aR5lZat/FUxCKQSQKR1G
vNs9AQxyHvCf0o0oLfM2xU1yO0NHpM2VvZNHfCiRaEjWdh2y3JSSTCR2oSNl09Co
mKPkFMIyNHtMjJHFypU3q+IBajTavI+W1e1NIIgM2BnSGLqR5FD15DtRwh4Z1kQf
cVBF6SaOhqnMkeG8ESS8ZZ18UvyNnw==
=Xl4I
-----END PGP SIGNATURE-----

--Sig_/OsDyprzxFqvee1l2Kzr2lqy--
