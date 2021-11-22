Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3CB4596B7
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbhKVVch (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:32:37 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:45235 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbhKVVcf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:32:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HygQG2pDTz4xbP;
        Tue, 23 Nov 2021 08:29:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637616567;
        bh=hu0Sw/jYRaMa+tgU8AS/132NP8Nkh29iz8FRJrI49NQ=;
        h=Date:From:To:Cc:Subject:From;
        b=r7EqXYA8HJ1Q+OXE9D6NkjFVcUbpUa2sV12lw46NcuWnFx5ld4inERIMfHj4rJ67e
         mxGD3tpRhK/QFS419ATazhbu4bBXBl8SPsS0zOz111bMtgR3KyY/jCwXEXNJrTl74Z
         fE4FzkHywGGzNabI9xrqduzMbSH8kFeLc8AqFs+uEUuYwCtecc8Pkicr8m332V0Bxi
         0fHd3tFj97q41HNTe6o+tuv85BOwlNPTBkAKZ/bWeYR3JUNVFlWJrRTGF1TTG02B/I
         HLj7EV101a6vmV1R0t1yOshHhGN344XHrWYwo5gkmhuwCxjwx41yeXZeSB5erNRulr
         lfkh8rAOJ8iZg==
Date:   Tue, 23 Nov 2021 08:29:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Chengfeng Ye <cyeaa@connect.ust.hk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the crypto tree
Message-ID: <20211123082925.068ff4e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U63Q9Z4wXSvlERTKiQ7cjP_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U63Q9Z4wXSvlERTKiQ7cjP_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e9c195aaeed1 ("crypto: qce - fix uaf on qce_skcipher_register_one")

Fixes tag

  Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  b4cb4d316319 ("crypto: qce - fix uaf on qce_ahash_register_one")

Fixes tag

  Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  4a9dbd021970 ("crypto: qce - fix uaf on qce_aead_register_one")

Fixes tag

  Fixes: 9363efb4 ("crypto: qce - Add support for AEAD algorithms")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/U63Q9Z4wXSvlERTKiQ7cjP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcC7UACgkQAVBC80lX
0GzqwAf/axqCN0EQ6jFdiIX92qlymYCqKN6Qi3OKSbAiAwI4WS4mFEOPV7t59UyK
V5yW0KyZOkVGQ56O78iO943+jx3O7Z+VW2hDk3XA3rwLulVuflx9sy88RbXWpfZC
8Btz/f/m5Lw4on1Imu7X86ABe8s5Rw6Q1ZUjmtiSR/PxWs+ARafH798wPzbJpxCz
MyjVmwBHDjLIWIUT3K1O59tw1o5PhsX5ux8u6pV0qYemQ3C3ubTiH1rdu1FxM18Q
in46MlfFR/9axWo3XI6szIp2RTFBf+QetsQ0kg8zcLWZPulhJQUt838tIU+mZngy
iveXZ/2kkm7uiZ0QAx7SX5jUXypmNQ==
=6iYY
-----END PGP SIGNATURE-----

--Sig_/U63Q9Z4wXSvlERTKiQ7cjP_--
