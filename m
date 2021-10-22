Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E015D43721C
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 08:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhJVGuh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 02:50:37 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51337 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhJVGug (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 02:50:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HbFKs4ytfz4xbV;
        Fri, 22 Oct 2021 17:48:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634885298;
        bh=yInILvNIbBGtMXt1YwCWhHRNw9/X/7Cmd0NpPcBNg4Q=;
        h=Date:From:To:Cc:Subject:From;
        b=S6BOe0axU8o/q2JhaWHX9C5pxatkGqrdTOxLtqYl3xQZPfQdpbZN2vkRnGukTdsLu
         0i3WqLfclOw7zvbVDeRmQCa4Jjh0XVaIVEg1/zSHVo2stBelod87TnJClSQSIgAzfh
         yoIfpTg3/3/5hb6L1ZU8XsqHaZA9yxNPrIsmfw4v9R9mKPJfHly6hKUSm3ZjSlZpJc
         ujJOKM+apEHgolBEBulyre5N72qD5oPBtoXjI2DNLKXbV8uksuFP9//dDXR5afLjCB
         w7iEe+OEvYAgc6oroBKJkpnjFJt+u87EO6riN2KlcAQI6XBWeUOg/1thgPVWmq4fkO
         K9Q5xlpZxjtSA==
Date:   Fri, 22 Oct 2021 17:48:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yury Norov <yury.norov@gmail.com>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bitmap tree with the parisc-hd tree
Message-ID: <20211022174816.68d0e2b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1sJkzDP3Evl19sNzDDwhe8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1sJkzDP3Evl19sNzDDwhe8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  arch/parisc/include/asm/bitops.h

between commit:

  ac0e561e5069 ("parisc: Drop ifdef __KERNEL__ from non-uapi kernel headers=
")

from the parisc-hd tree and commit:

  a7c7d06a49d6 ("include: move find.h from asm_generic to linux")

from the bitmap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/parisc/include/asm/bitops.h
index daa2afd974fb,c7a9997ac9cb..000000000000
--- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@@ -203,7 -205,11 +203,6 @@@ static __inline__ int fls(unsigned int=20
  #include <asm-generic/bitops/hweight.h>
  #include <asm-generic/bitops/lock.h>
  #include <asm-generic/bitops/sched.h>
- #include <asm-generic/bitops/find.h>
 -
 -#endif /* __KERNEL__ */
 -
 -#ifdef __KERNEL__
 -
  #include <asm-generic/bitops/le.h>
  #include <asm-generic/bitops/ext2-atomic-setbit.h>
 =20

--Sig_/1sJkzDP3Evl19sNzDDwhe8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFyXrAACgkQAVBC80lX
0GwuHQf/S6X5AToPvwlSaKFipvj6AAR9XKvWAgy0LQFYteJ7R2REOTQEOtsU7Ddt
K1/wM+VRjs3TK/CCS/XznPcmCFw3UfWS61/rwj7xCsWW4+jI87JNvyKVFlQ4ifxo
5LLU4wFqhDqOrTWOKeSN6pedmdawyl9xYRwr1Lo99lP7fWPmDSGkzGtTXvcY7tRn
b2/+rAIVBhIKejV4vhi2CaPQvSWgfqQopX51naBLXA2TgcvZE94dZoenCXWHM9Aw
KwjOgzFyGDFys71Vj1AjHck/6eMcgzK+bmLJg7TfMu2h7MdzLF3lCk5DHkAmjBX5
5igN7+p9Z4zoh+R2CEH6l6tVsvktRQ==
=5h8l
-----END PGP SIGNATURE-----

--Sig_/1sJkzDP3Evl19sNzDDwhe8d--
