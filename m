Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E352101A53
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 08:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfKSHax (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 02:30:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbfKSHax (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 02:30:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47HHYP4yH4z9sSX;
        Tue, 19 Nov 2019 18:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574148650;
        bh=cMeG2erxW2OyCytKUZEBc389t2yX1MozJUgRCPFOBVs=;
        h=Date:From:To:Cc:Subject:From;
        b=JwEJzrv2ObuzNn8f75Rt9mwxB2HWKvmhYq8hFxI7z0wV1nIPHY1vmT9SKwzRWaSXb
         vNpL2E9lA2DBSIR9ZcZMzRE6Ddn2QmCfIRrtzd1mwoslO7xdKLosOEGcmql292ybd2
         NKxV+XHjcggbmb0H1Wa4KolzowOMoEN2fMbEAlZSQoXya910cIUkXLtJZsLcYjMzTf
         0apxDpPfsZTOfwoAlJVMsptSKQ5IMXMGA5Y3yYZ7TtLDaIB5ysREp/b0rw41kdPn/R
         pfyzLfiFUdHfuee0cpfWALl5QoDUizx7tE4tnoZCLyrTwROhcvAh1hP0d1CK9CtzPy
         7KQFz3huXKqQA==
Date:   Tue, 19 Nov 2019 18:30:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Elver <elver@google.com>,
        Changbin Du <changbin.du@gmail.com>
Subject: linux-next: manual merge of the akpm tree with the rcu tree
Message-ID: <20191119183042.5839ef00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_hR6Fp7Gfqy9qwEi=8GpZ+4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_hR6Fp7Gfqy9qwEi=8GpZ+4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  lib/Kconfig.debug

between commit:

  dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")

from the rcu tree and commit:

  fa95a0eadaa7 ("kernel-hacking: group sysrq/kgdb/ubsan into 'Generic Kerne=
l Debugging Instruments'")

from the akpm tree.

I fixed it up (I added kcsan into the above) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/_hR6Fp7Gfqy9qwEi=8GpZ+4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3TmiIACgkQAVBC80lX
0GzPDQgAj7kCqnHJhjTLuBPq21A9KCUChICb9fOfHSHd6eVeDiCrh+n4EscHpr4R
Ygg6Nqb6ii8Qnd20QHyIGIcl2tfxrAj5vAQtZSxtzemtQTP9Uj2CQQXk6eEOkOIk
faF3qCFwClrraLKsoncDL7JBMZxHPR9tRbi82deMmKHjGUq1GX2qY0d3FoVnxP6n
ZbPy1Z6qx4SnzBncKwhxfXBuh7N/LIDrteUlAjnOSlxfHKsdtzU0pQolmgURIFDU
rTc5nHnL7jfimhkDMeoVbiV4t548PhkJtT2BMeP7P3xlN3q0kloSDOYaPVJfkmdH
ediptw8lx/N7ESV+W9gaD9aQlOcVgA==
=ImMS
-----END PGP SIGNATURE-----

--Sig_/_hR6Fp7Gfqy9qwEi=8GpZ+4--
