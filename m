Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329B11D90ED
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgESHXT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 03:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgESHXT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 03:23:19 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C096C05BD09;
        Tue, 19 May 2020 00:23:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49R6mj2b5Wz9sPF;
        Tue, 19 May 2020 17:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589872997;
        bh=fm3/tATrAoXqTVvMa/B2iTLxXsnYu0FCK43ABfBVGtw=;
        h=Date:From:To:Cc:Subject:From;
        b=ZljnTLzvF6ZMfdTUqkBzlUIaUlr6dR/xMzFEkPpomW2Qcdwhbj41e1SP+ewCK631i
         GVqB7J9dGKw/QMwgIuXl9yDNXG6rsj0eHLP+WLejaHc3IxNxjfENg3WzqgflXlCE+V
         AT5ATUzF5euh4NXfg7cbsWha97yQrZXSGvyZvCJyzTl4nfLkPMZXVcKSiTPlB/HdBf
         R6FBe+A8aj2oQUWPks87QtrcrW+ZUtcPF1R168rFZKMv5KfPsHLatBmdjmOODXYdKl
         3kxtI9M6QSjTI1ZTBxbwQT5waTlBF8GfdRg4Vsn8vbrFMU5HRiHXzTVXH23IMfsS8w
         +aJOsPpZu2CwQ==
Date:   Tue, 19 May 2020 17:23:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the rcu tree with the powerpc tree
Message-ID: <20200519172316.3b37cbae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RyBJk_rS_Gx3yS0K5/j43lV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/powerpc/kernel/traps.c

between commit:

  116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting=
")

from the powerpc tree and commit:

  187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")

from the rcu tree.

I fixed it up (I used the powerpc tree version for now) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7DiWQACgkQAVBC80lX
0GwZPAf/cPBhPN6cLwgUjG2OMKLg7D/X4Ay9qr9KUqtvaj0bCQ0Qw/KkU+8/RDGA
X1SaRWnlNGEhz+nKyuNePBGLohcoWnta7yXvjxJSfdAX6/EJYd7Sak5HNwTcZE/e
kyD9Ur+RgvsbqUGmYF1etEcYnZL3/KLuGHPF/SikKdDxVdQCIRmL1SlEMi8gfOjc
PaVl+38fsi8JFlO1pAigmiNo0pCzijp8NTvrYlTLRwBFjk6MXSOoBU5DrYg3pYHF
VCOGgkyTj/NATiy30exWNbk+O+OYTuGcwFCmTi6hArq1fJBoRC1B3B9vSdPJJVkC
I5YibpxQ9No7zGGlc2bfBqyIrAZUSg==
=IY1W
-----END PGP SIGNATURE-----

--Sig_/RyBJk_rS_Gx3yS0K5/j43lV--
