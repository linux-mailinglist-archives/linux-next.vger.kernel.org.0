Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629D22845D0
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 08:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgJFGLm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 02:11:42 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgJFGLm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 02:11:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C56YN3CPLz9s1t;
        Tue,  6 Oct 2020 17:11:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601964700;
        bh=gqI9AbvxJewhMt/RdLLUY9yfsX8SKHVZlUQ9AI29Yp0=;
        h=Date:From:To:Cc:Subject:From;
        b=s0AFhlDWLEHzXB/1hF9CmuuQZ4962UbrIHn3TmLbiS76zDIP/+pGv1LiHHHF7q1Gx
         dEWeEvnsQ3P8lhnTUTMn7xPD1rTlml0X1Lgl4JdSWCHY10Qs+YX1mWWbv7ONOqNAiK
         cjGy/O/pfshEMm2B+vz7gUFo3dvXv/gfNOxHLf8rVjNe4Q6eSfPrFPQekNKMMjIche
         kXZX0zPuB7mrAH2VdsPDmWtRk+L1f1bDQwpX87e23M9q3d6rTzjAGuXzShycz7sNg3
         QOCLpPB8cdTE62nU7GrtkO2ihDdnUoZ3I/hf6wxB28MN12UOqvfP4TO4B7XuPMTaS7
         aJ7+3BHTU3IKw==
Date:   Tue, 6 Oct 2020 17:11:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the dma-mapping tree
Message-ID: <20201006171135.3cabacbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7WJDCTZ_7XC5/kyfbyjq9YU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7WJDCTZ_7XC5/kyfbyjq9YU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/setup.c

between commit:

  f47e22d65d08 ("dma-mapping: split <linux/dma-mapping.h>")

from the dma-mapping tree and commit:

  a945c8345ec0 ("static_call: Allow early init")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/setup.c
index 787c5ff1e7c0,fa16b906ea3f..000000000000
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@@ -20,7 -19,7 +20,8 @@@
  #include <linux/hugetlb.h>
  #include <linux/tboot.h>
  #include <linux/usb/xhci-dbgp.h>
+ #include <linux/static_call.h>
 +#include <linux/swiotlb.h>
 =20
  #include <uapi/linux/mount.h>
 =20

--Sig_/7WJDCTZ_7XC5/kyfbyjq9YU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98CpcACgkQAVBC80lX
0GzcYwf9GwrKyjw3L8eROjUNQvybWf2vj8Scg2ZNixnIdo0ZqGu43iyZpZSP1Pk8
zHOXabHhyXBaVA83wF/Jau4v5SDxL4hy20YXGELpo3/barDtBqUe4/OQEbN/i0Rd
7tlBfjGh6/cJ9NZoHmwLZo0uB7gzj1V6VVb6xAdGKCgqEaMp/91lCVnIUMkvMxB6
wasPLwpqnhZebf7mftS5F2y6T1yu9tYVK/2yiuuEaxUSxrOm/uVsnbjeIfYtavgf
CKkaUCle2VlerpUxfWJo8b9Mb8puNj6bn/MgshtK+yMV8bEZ3cGZwBxOy9S8bXps
zaeQU2t912zkyYHIKXuH3OPrl2hnIQ==
=SOpB
-----END PGP SIGNATURE-----

--Sig_/7WJDCTZ_7XC5/kyfbyjq9YU--
