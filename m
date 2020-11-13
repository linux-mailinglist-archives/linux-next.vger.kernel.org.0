Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85FC2B1650
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 08:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgKMHWp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 02:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKMHWp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2020 02:22:45 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645F9C0613D1;
        Thu, 12 Nov 2020 23:22:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXVKv0Fp2z9sTR;
        Fri, 13 Nov 2020 18:22:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605252163;
        bh=uOcWXi+dGfEbfMzmrdCvYcBYURx9rTT/OjNqaFr2HuE=;
        h=Date:From:To:Cc:Subject:From;
        b=hbCHyrnS6kKgVcxYKOWxw2Sa6eO7BTVMWzAUe7wb1VdfUWAJTrVBvnrg8qZVrlnM7
         8NCANaODIp6zBgi14G3CXIii52I+XFCE5xAXfc+vNsrbiXakMvGGE2LFO4nyZkB5QG
         rqt3mG9JcWc2NUzr/dNp3QZbbqGSsKrRlcrQmq9Rkx11aTfy6SvgGivtzYTnWW1eA0
         okqYeST2oFAivvtm3lSd+KHq8ADLfrv1kjNOJz+gvKGdKBm051weXfbGZn51FMuCmW
         w1xxVS5HkyI4LJpGkXu+Ehez8nafbBhWeHA+OZ8cfJL+PyLz7KDRDnA6IVC2pG4yxl
         dgsqIwKEfmdUg==
Date:   Fri, 13 Nov 2020 18:22:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Hui Tang <tanghui20@huawei.com>, Meng Yu <yumeng18@huawei.com>,
        Zaibo Xu <xuzaibo@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <20201113182242.26d97b28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3IDlOsqnXyzh2kVN8yJf0pX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3IDlOsqnXyzh2kVN8yJf0pX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  50d7e084c48d ("crypto: hisilicon/hpre - add initial settings adapt to 'Ku=
npeng 930'")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/3IDlOsqnXyzh2kVN8yJf0pX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+uNEIACgkQAVBC80lX
0Gz7WAf8D2U4wb0ZsyE7tgmaBUaDyvHpKeQ87i/yzh3FoiQgEtD1yzt68A5xnYP5
EsZW3O6Y8zZMRdy/yvfDa8fHifBSky5DESLcO9qIxNWQtYaCSMlBA18Jcb5FJtTp
jOw+imYJ1/6THRis9NBmpFF6+kT5ccV3uariIQtYMgDYA0gt7lOzMeYDVNFYrGVZ
5ofk6glnK0UNctXwSUorHfrHXKe8JGr1fxwZ27j4RBQCu1d+0nq35li586SQLYYg
FQkddGfAM7Joqi2mrOuRbXmBFo9/OqroXDHp5QLu0Xr1yHFSZndP92/9OoR0027u
73+sOiaMeG0B5LttgpcaOfZ14AE52A==
=et0x
-----END PGP SIGNATURE-----

--Sig_/3IDlOsqnXyzh2kVN8yJf0pX--
