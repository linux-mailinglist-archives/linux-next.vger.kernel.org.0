Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF02AEDBA
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbfIJOvY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:51:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726535AbfIJOvY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:51:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SSdw1nBFz9s4Y;
        Wed, 11 Sep 2019 00:51:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568127081;
        bh=xTGng1PFAw78WfL/fbqCAECPSaVA5i4x9d/+ZBoGsSU=;
        h=Date:From:To:Cc:Subject:From;
        b=E7ZcTs+M6FsovY4pIjQGIN90fyQFtRrLsft/EcxDgKLua2H+zPKsLJLvSmN3dQA5V
         VnIPD/n/DcgEq/yffUG9SMhlINd3uKqu/o8/pF/bJKZIM/U8rpptuwU6gC8IBP0D6H
         r86RvaHaV2In716tyx6AgCFe+rtZNqxeoPwsU+JUwSPf0IQe374DE682OXXT9kc3ja
         0IRkctlZinzXpaqT6XWJ+ThU9v7/+9GNe4JT6OrvWLiebhRUzXhcOF+g7/EfgJfJHm
         4G5EpA0jelHnka9nNukwZUTNEwSH5iVpPd74CYcnyvX1daZzZXVG3P78TEePHStokY
         NqTykjC9JYAEA==
Date:   Wed, 11 Sep 2019 00:51:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: linux-next: Fixes tags need some work in the crypto tree
Message-ID: <20190911005105.748a9c9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mg/xGGmHn51/jLzy/PaNEfF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mg/xGGmHn51/jLzy/PaNEfF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f2ef960231d7 ("crypto: caam - dispose of IRQ mapping only after IRQ is fr=
eed")

Fixes tag

  Fixes: f314f12db65c ("crypto: caam - convert caam_jr_init() to use devres=
")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: a6c4194ead00 ("crypto: caam - convert caam_jr_init() to use devres")

In commit

  796114f5c522 ("crypto: caam - make sure clocks are enabled first")

Fixes tag

  Fixes: 41fc54afae70 ("crypto: caam - simplfy clock initialization")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 51e002e949d4 ("crypto: caam - simplfy clock initialization")

--=20
Cheers,
Stephen Rothwell

--Sig_/mg/xGGmHn51/jLzy/PaNEfF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13uFkACgkQAVBC80lX
0Gxl1gf/eyJ+2T3PuEA0TkBug0dlrEhXaXly7GL4XRfavmaq4OuRUjniYKYBgGhS
54zFsqGPJSvj547XyVWAbSvkPoR5X+u084dwP2M/33vgEphfFgh5xHe76CzGeEer
WvAxntziRv9WypHcb+ClzhRSado9trr9WvRrb2l14PH2YQFZyULA08Zvn+Lcox3W
66OaHPT3AiNw+AmPn07u4yYApk0XsUQEG2C665w3m2giJ9MGvDln7NpJCk1lDkRl
LzImsBMvJEhVFXP6ZnIf6nzij6lGZpltzUYNN+ijVFyMKC4tZ3tIxAZWGK0YAV0C
1I476SrKUsmCQ3JKDP/En0e1yXJ6Gw==
=CXNa
-----END PGP SIGNATURE-----

--Sig_/mg/xGGmHn51/jLzy/PaNEfF--
