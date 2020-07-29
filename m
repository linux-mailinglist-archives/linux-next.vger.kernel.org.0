Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4D23197A
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 08:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgG2GXa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 02:23:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbgG2GXa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 02:23:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGk4v16xYz9sSd;
        Wed, 29 Jul 2020 16:23:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596003808;
        bh=TrD5P2pHqk8dfYWf+Ia91cHygchgpFABDaD7zWgllKk=;
        h=Date:From:To:Cc:Subject:From;
        b=U1uQPoZNv+aXFoEr7NMVN4Gu01sa2O+i4Fud7gHjHU7LcBohBgi/siUQ7IvPTKAwW
         DO/uK29OSMDXZOe8a4FW5eltNvcB+pI9VuxW6GhtMjrpwigcq5zFGYup8rVuLnQnGV
         4gZr3f5WQxNHOtG/iK3ozOGfLJtFOpwsqM030631bdEY/43+AkygdgexE2CNFW2G7s
         Cj0+QcDVFv8FxN5nr93VvWqXMq08vaE0LQ4B2Qk3pspN36jbvjpoyH7H36OmsuBgXb
         Dqmot6CnjeYlN3T5ZX73Oqg5Y1l61tZSX88MuNg+F6ePKxuLAVQBVd7jxCFu/oI3pI
         n1H4UKB5xknVg==
Date:   Wed, 29 Jul 2020 16:23:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200729162325.1a1a1535@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D+wgx+awq7IQ5oi020sIFcW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D+wgx+awq7IQ5oi020sIFcW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/x86/entry/common.c

between commit:

  bdcd178ada90 ("x86/entry: Use generic interrupt entry/exit code")

from the tip tree and commit:

  20f165b7d2c8 ("rcu: Remove unused __rcu_is_watching() function")

from the rcu tree.

I fixed it up (the former removed that comment that the latter updated)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/D+wgx+awq7IQ5oi020sIFcW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8hFd0ACgkQAVBC80lX
0GygAAf/ao1PrW/dkCsvTBa6ipZNhvJPDDR5ymk2JINlefB+LNjCPllpfayXwZPx
WRb8H6Mr2VJctz+D5BfPyOGtQr2wMlsOAcj/xKZvIA91SGTjydkRQFChTXC7p3z1
4LVdilEROE9zDFHsKvdEn0BDHHX/WF3zGVhy8Ws+4YRgIXDO1HsmYnbzySNYJLuM
6XTbYnMdF+qb9UV/gefTsJxszbFzVB+2uqvJ2o2RdEdI5UWTNF2/2IaB+jxJ+U1L
8WJa4jJp/DCfLXNSsI0v3mHN8soi36BTkXVbOo3xkgCUP5Slyad8b71xGbETzikW
0uu6bfOkygoH492DLV5hDCBLfOJvig==
=O1kh
-----END PGP SIGNATURE-----

--Sig_/D+wgx+awq7IQ5oi020sIFcW--
