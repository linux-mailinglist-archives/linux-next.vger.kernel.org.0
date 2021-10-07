Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7FE426002
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 00:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbhJGWkc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 18:40:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46697 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbhJGWkc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 18:40:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQR7H4nRYz4xbZ;
        Fri,  8 Oct 2021 09:38:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633646316;
        bh=yvENhLiqEHNwH3ApC53V5SlVhpwf0fTDEA/oT7fR3oE=;
        h=Date:From:To:Cc:Subject:From;
        b=jefiop779j8CFVyn54YWyuWpoHCkjD3qM3HciwjSvpZ8GAN4BXeRtBHGKzN7ijYvv
         sKFOiHGvTLaqEqf4GOWjhAlEoc9KwGGV9DoVtjMb3eWbhDJyWt4UIYspOiNwCsb/Oj
         3RdpmRv794J4GkJoGYgDjlg5E2GrPkIfYSVc5ydboE3g6heQz0j5NgUYramKAu1Cjz
         qUCBhXtXNum/HG1hQtUqB+1+6gocSR0BdUw5ay17/vN/uK8RtaYVyNplc3a9AFU1J6
         5ZG2sGKiHm4BQ0w+Sa2LDp/CCEZxxHrWMaYkuMZ5OjTdI3cGi+pxbUXKmnCoEOg+20
         aDNgqawjZa4YQ==
Date:   Fri, 8 Oct 2021 09:38:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the asm-generic tree with Linus' tree
Message-ID: <20211008093834.6ce64bb7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pCtpWR7OPBE6EpRbhDCnTZ0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pCtpWR7OPBE6EpRbhDCnTZ0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the asm-generic tree got a conflict in:

  drivers/firmware/Kconfig

between commit:

  4382c73a12b4 ("firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM")

from Linus' tree and commit:

  7efbbe6e1414 ("qcom_scm: hide Kconfig symbol")

from the asm-generic tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/pCtpWR7OPBE6EpRbhDCnTZ0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfduoACgkQAVBC80lX
0GzASwf/dEfdcjR9xNE66Lwe9lqAn3qgZamIuq28vcUAFfGr9e65ZBL5pMEFKTTs
fDkEu6OL4jn/PCCsXoL1aNarOAtmSnwsCOp0DUDurlXUjHPWYQXcvX0v3x3uGAoQ
eB0gqb5urODsFUWCuaEAWfr39AuR9xH0elipZPIox8CRWxTf0Gq5kCMKvqA07KuF
9+Rs+VcCNvEwUV+ea9ixoqHm4WvW/iO5QZlT2x4thMytOQ2TXLTVBD7CM2ry1yP3
n9wKJQOlpz9zdUfAfHGOODPOgQoF9SyqwS5zqpVZdvQMEEk78bakaRXEuFaIs6NT
8QQffDw2/CFTVXDQ2qk7Z53FieSlww==
=DlyJ
-----END PGP SIGNATURE-----

--Sig_/pCtpWR7OPBE6EpRbhDCnTZ0--
