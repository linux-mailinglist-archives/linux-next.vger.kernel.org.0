Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00482AE674
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 03:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbgKKCeY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 21:34:24 -0500
Received: from ozlabs.org ([203.11.71.1]:43763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732382AbgKKCeY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Nov 2020 21:34:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CW8255XWcz9sRR;
        Wed, 11 Nov 2020 13:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605062062;
        bh=pXxvg5RAQPnzCEQXyQrQxOx8JduUtPGpAI7kHVsHkzE=;
        h=Date:From:To:Cc:Subject:From;
        b=rDedlndgUSGEPta4kWpmNLKvnpZNr/V4LMze5IUFRqxxLaD2itdXiUxRCVOwbq+Uk
         Yb5Q3IT/48rjhRaadb3H7+oJcXwUQCx3cf7jrnFiMHWb0M92RHVLjwyYgmstah5qiH
         KF0fJ3uejZjPjHzwXjuWKSQKeuUZ40Updmjzhlpm3mjAd8vUmiT3JsWLh+DUEnO1yZ
         qEHOf5gPWBGp2/AHG5b0arr7LwDeGxaXikMaVAg6nt1VlivFVIWQDZZY1bFW5HUZO0
         7NcCWBfiPgmTSPU5mLETCMMoiRKkoR4ivibTBxTgIsiRw9PJzDpNSn/8sqPktaYCsw
         sR6+sefbu529w==
Date:   Wed, 11 Nov 2020 13:34:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     "Shane.Chien" <shane.chien@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20201111133420.2efb4143@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AqU54fqd.5wgPYcOuV75wXA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AqU54fqd.5wgPYcOuV75wXA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/mt6359.c: In function 'mt6359_platform_driver_remove':
sound/soc/codecs/mt6359.c:2823:6: warning: unused variable 'ret' [-Wunused-=
variable]
 2823 |  int ret;
      |      ^~~
sound/soc/codecs/mt6359.c:2822:22: warning: unused variable 'priv' [-Wunuse=
d-variable]
 2822 |  struct mt6359_priv *priv =3D dev_get_drvdata(&pdev->dev);
      |                      ^~~~

Introduced by commit

  64a70744b778 ("ASoC: Fix vaud18 power leakage of mt6359")

--=20
Cheers,
Stephen Rothwell

--Sig_/AqU54fqd.5wgPYcOuV75wXA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rTawACgkQAVBC80lX
0GwmPAf/Yv1zbdKoY8P6dkTvA+AXdKYli4FOe1wD42e/AH9hQRfKLryoBCpC1nvm
f11SnWwIPrffFcqfMwg/QHKNwD9NyK/NC3qaOSXYfE/L7ZS5C4t7vYqy1u75Zomw
uBx8WUMCxbYNs0XihE1uQIKSO3CYeOuBaL+Zeezug5CmDl1/Uzl5cyD3rkIRp8EQ
ncfOhoHdvUaWxA4RAj/Np1277qz7nh0XA4pJYOOq/44NJbjh/OQe9IVfR2HQYgN8
70dJfM0cMyizh6jeOcFDNrbxbRIyZ2K6amIsAljSH6epQLTNkHb7fSsoOMLAnAMM
zTDi/lZYjoz+lBUV/pe/APyRC1tF5Q==
=vo5X
-----END PGP SIGNATURE-----

--Sig_/AqU54fqd.5wgPYcOuV75wXA--
