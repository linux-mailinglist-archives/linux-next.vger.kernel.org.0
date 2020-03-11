Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD429180DD6
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 03:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbgCKCHD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 22:07:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56817 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgCKCHC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 22:07:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cb1G6ZwWz9sPF;
        Wed, 11 Mar 2020 13:06:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583892421;
        bh=stRdRWNv5YaKlTh7eqaHiBGxhax7fUt8NJXuvnDHIOQ=;
        h=Date:From:To:Cc:Subject:From;
        b=fQ9TlMHsoe5lUVDvD1G/QXfsFUh70LJqWZ8YNr2JVAXuKUu/uc3jgK8tducIcMBpW
         bZkKU6pizbJePcLwz9f7iGnTrPwEiqOJ8HAhfTbRHaSpR33J4jnUQ44RNObTWNiEzm
         icSOl5z3CCALRPnXEu4AG7WoTS0nS1a00jmvhW5n3lt8FpwDYF78JMAprs/6ZEaAg3
         RtRq8rKtTeTpvIqiNloI0jD9lEtae/QudEr5N+DCQ32qSWD/mcHYzNXaqe1lx1OfAU
         aRvKa2PnFMAejDZwBi4hv925Nakcdc1J06lPkHH82NwPGwKFCQ+ydYg34A+V3RKsYm
         MMmvtedAVTzIw==
Date:   Wed, 11 Mar 2020 13:06:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20200311130638.37e937fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ACw=fCJaCMbYXfuOHfXyrxZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ACw=fCJaCMbYXfuOHfXyrxZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mtd/nand/raw/nand_macronix.c:301:13: warning: 'macronix_nand_deep_p=
ower_down_support' defined but not used [-Wunused-function]
  301 | static void macronix_nand_deep_power_down_support(struct nand_chip =
*chip)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  18870c34d1a8 ("mtd: rawnand: macronix: Add support for deep power down mo=
de")

--=20
Cheers,
Stephen Rothwell

--Sig_/ACw=fCJaCMbYXfuOHfXyrxZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oR64ACgkQAVBC80lX
0GwLqwf+JvEHos2BTJHk7Wtq5siUFKJo7PfxJlby5eoyeUAopdbXZvzPUcDHUvAl
X+xCmQ6eA/rzXWaeX2qib5k77Lz6PNeqo3KnCh2vU/Yq6P48PazR4DT+iFAvdkZs
eMSo64RRwpwyHBaVF1aERhF5FApuacIHS9RtTnSYkz36XAtvyIxsSMJ3Gjt12/c1
aCInB8KI8guX2h9wrsIMevIiDKKsBgNrjGKwwIvbSblOaE+2fv0JTMOj4yxYvbq+
dWJmkCahYrp647uBT26Xdrt1hptS6v2QctZk+hCsnCSlsaKuWd80/hS+bY0c9dNe
XtbMY5A/Ipzn8w6yNz/K06V229BCCA==
=RIhJ
-----END PGP SIGNATURE-----

--Sig_/ACw=fCJaCMbYXfuOHfXyrxZ--
