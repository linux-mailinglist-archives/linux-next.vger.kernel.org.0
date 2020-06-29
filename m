Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6AE20E27E
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 00:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731086AbgF2VGE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 17:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731080AbgF2TMm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 15:12:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5190C08E9A9;
        Sun, 28 Jun 2020 22:43:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wGcD0QQCz9sQt;
        Mon, 29 Jun 2020 15:43:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593409388;
        bh=0gQlwqc7+1RNpQwLvCTErzn5lDh79VUZyyhucRciNrU=;
        h=Date:From:To:Cc:Subject:From;
        b=bFsvxMeG1BWfYgKBPbuEgrIA6YfnfKaD/ACoD8szYUP0+A1CmwmtCeSUuPkvUxw72
         8rnEOa2Y3PzEidUb6FTp0qTmwopesnY3cNsIVNrsk6CCMTUq72SqBEd07FmQdHnCa0
         361bn09FBtf7nXmlOw9ridBYllRrCdgLf5ua1t0vAd6JVLViSPHU4sfOKQoIdsCs3o
         Lp8qAKoLr+WbIbvHhu9sPrAGE2doU0ZQe61QJ+GRIvA5yLYE/h2DurQF4LbMxxuIcj
         WtN0qAUjec9fPcwOCQPhViozll9Fi+ZngwFJCYl05kCJwYIxZxI1ZQZpJgiL6HtFhH
         K+LuXz/7Ed9vQ==
Date:   Mon, 29 Jun 2020 15:43:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20200629154305.0067d113@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O=BM_rb4ZsTj+JaxRLGGYJ/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O=BM_rb4ZsTj+JaxRLGGYJ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  kernel/debug/kdb/kdb_io.c

between commit:

  9d71b344f86f ("kdb: Re-factor kdb_printf() message write code")

from Linus' tree and commit:

  80b89ab785a4 ("treewide: Remove uninitialized_var() usage")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/debug/kdb/kdb_io.c
index 683a799618ad,af0a26a521eb..000000000000
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@@ -591,7 -553,8 +591,7 @@@ int vkdb_printf(enum kdb_msgsrc src, co
  	int this_cpu, old_cpu;
  	char *cp, *cp2, *cphold =3D NULL, replaced_byte =3D ' ';
  	char *moreprompt =3D "more> ";
- 	unsigned long uninitialized_var(flags);
 -	struct console *c;
+ 	unsigned long flags;
 =20
  	/* Serialize kdb_printf if multiple cpus try to write at once.
  	 * But if any cpu goes recursive in kdb, just print the output,

--Sig_/O=BM_rb4ZsTj+JaxRLGGYJ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl75f2kACgkQAVBC80lX
0Gzxpgf/ZeyGgu656e8xymIJkSQH5NvdjOL5cGTthZNwnQIhAuuVTYosa5pMSR/U
pVjJJuxeBoJZyavka0ac9RCwg/FphoRF1FryhY+Y+UolTxqK+LGqxc9fjGeJCcFj
NGPaiotQJxOsZdhXTz+8Kno/xq0f2fAYM04j192q0daE+3XEDUWx+CgmDGsKqTGV
13Xb3bAtHeAiHDqcs8nHOfhkWJ8E+a0z3ORNDKKOVQx2Ui+rg5nEDngUch3QNg17
jMONoW2KmEAlxwp7m5XJDGtYYt80A0KQ1q/057epW+8CJJDb9K3Uro1NhrSEzPDA
oW3eV2QCFKAnFDagmlr/hRjAazMELQ==
=zXMH
-----END PGP SIGNATURE-----

--Sig_/O=BM_rb4ZsTj+JaxRLGGYJ/--
