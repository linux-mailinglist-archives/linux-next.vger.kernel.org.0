Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B012320DC3
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 21:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhBUU5Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 15:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhBUU5J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Feb 2021 15:57:09 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FD3C061574;
        Sun, 21 Feb 2021 12:56:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkHfZ1p6Wz9sRN;
        Mon, 22 Feb 2021 07:56:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613940984;
        bh=AGhqqkKGVT9zLlM0vMv4krjRShEVU6ptqeB+ncq720o=;
        h=Date:From:To:Cc:Subject:From;
        b=DSY5JnLnObT88i27GEOwaj8PW7DSfKsBtNr7wjfsslE0zHC9XITLJFeouf0t/CUMj
         QhlwLPy9JTzezQ/SrZXvpM8CLFzGtrvXZBZQo3+Txvr+TYelFy3pMPEYA9C/+Ie9Cv
         GrmmrhYxQUxjXjBQbJhlM/ARVWGonlqbecYmcjbUcAafpmBuG+wv5v/2EY28TEvAcS
         3xrmGf5aFRHPfARlzHL0z9R2PKM+1xJpF7QB/QGp40R/CPWvh10LaTMXPsJtCnu4Cg
         ubse7vXiG/5cdFZTtc3+8aRZX2kvaZWdPn5K3LEG5npbs4xdRBR1HbZVRpw/h7FukM
         j3ZOJ/VCfj/bg==
Date:   Mon, 22 Feb 2021 07:56:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the sparc tree with Linus' tree
Message-ID: <20210222075620.419a6965@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uCUahW6fSs9fSMr.4RU5iVL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uCUahW6fSs9fSMr.4RU5iVL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sparc tree got a conflict in:

  arch/sparc/Kconfig

between commit:

  41026c343540 ("Kconfig: regularize selection of CONFIG_BINFMT_ELF")

from Linus' tree and commit:

  80bddf5c93a9 ("sparc64: only select COMPAT_BINFMT_ELF if BINFMT_ELF is se=
t")

from the sparc tree.

I fixed it up (I used the former) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uCUahW6fSs9fSMr.4RU5iVL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAyyPQACgkQAVBC80lX
0GzxdAf/RiD8GRt7zyLOQ1p7M9TxVfeNTCu5Xk8lBgqQRLiuVL6x9m8rT219h6oM
HxKH+JsYlhZx4um/yuywKLWZyWJ1hrW3K9g4WqSadGTEqlIpswvpBy8PwEHxHmTk
h08SgvqN4Z5KWwa/Zx05W1V+393IipX3Eri2A3rma1DDe2apSOhla4SXtCriGdeY
Sb0AfXD9R2sL2fNe/Tw3Rr4/jtpm3V7ZWMH7nokgS76A1dKJS+N9UIGkaz/QlxYc
i8V1J5ZgDMWg461lsBU2FUO8wrpXMbQtJEoTx6q1q/rRH8/fTNFzbGktaF0M+ZdP
RaQ2Btcf2eeaNHOl/LtpspTfPG8iAQ==
=/fqB
-----END PGP SIGNATURE-----

--Sig_/uCUahW6fSs9fSMr.4RU5iVL--
