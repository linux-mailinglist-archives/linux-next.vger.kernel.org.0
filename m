Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CF4397C34
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 00:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhFAWJa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 18:09:30 -0400
Received: from ozlabs.org ([203.11.71.1]:38973 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234897AbhFAWJ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Jun 2021 18:09:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvmVl38Z6z9s5R;
        Wed,  2 Jun 2021 08:07:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622585264;
        bh=EPNCrH1ipIYIjYIZR3e7Sx4DYJbRQHwSTFXT+SSJLLo=;
        h=Date:From:To:Cc:Subject:From;
        b=TffMpoL9xYtQlePycD3FlvZgzpmIzSCRzD/XIrcewTmkt4paGvebz7Cc9xBpQuVCP
         CtT9kxrGA1lCpNIpXErXag+5RoscIzlXv+XwWAiBImeorW+hhBXcOa2zRon3HQovCA
         Y7Qs1D0Od+tvGzvlJGlw7wB9KQUIPYUnjdDfe4Xeto+olvkd2l3tZEwhRzJQjefi1s
         HB5QyzuopP0K5okhVFrqySbK+juDVvWQKvvWqzoR9itIvyso530tdg74mVGppxsSwb
         ifPf+y+fSWdOspN7SIr+IBX8OamH/oIkYqVBvA/L3tO3KhqPZ8ykpO6dSNfCBo/rsw
         Ws7LXKouxGvCQ==
Date:   Wed, 2 Jun 2021 08:07:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Roberto Sassu <roberto.sassu@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the integrity tree
Message-ID: <20210602080742.1832f12c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W.VlX1=apFJVu8WwkLkibUe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W.VlX1=apFJVu8WwkLkibUe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9eea2904292c ("evm: Execute evm_inode_init_security() only when an HMAC k=
ey is loaded")

Fixes tag

  Fixes: 26ddabfe96b ("evm: enable EVM when X509 certificate is loaded")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing for, but can be avoided in the future by
setting core.abbrev to 12 (or more) or (for git v2.11 or later) just
making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/W.VlX1=apFJVu8WwkLkibUe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC2r64ACgkQAVBC80lX
0GxXmwf/dzQKYbYijr16dto1MW7fmyyophM73cHjxZKSY0Lsgo/5SheqFN3pn8Gk
SKwx5XU3B1TnFoc2f/heXh0dfPMWR8kmHeLqlcs7RJyQAzFoCofUt1IRo0y1rX/3
k956Zw6bFo1dbTLuM/KtSG6LyhgIh2bKvYpjQBmG8pkEyUNLHmQ86TNg48zYlF/U
4c3DLFM55A6Z4q2cO6dcvAZocaBVs7EEuG27xVeMBY9FRWe3DWPHoFSiggChwcvm
FtBi8resblvG2diU5iGTGI2M17v79t+UOa5xHvFYmAHCvEgPHD3nFBTR9Rrmgj8a
sS6/1DDRC962HitRVkv5PQsbbvvALg==
=AzQp
-----END PGP SIGNATURE-----

--Sig_/W.VlX1=apFJVu8WwkLkibUe--
