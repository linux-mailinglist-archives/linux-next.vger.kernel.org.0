Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3026A401500
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 04:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238851AbhIFC3S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Sep 2021 22:29:18 -0400
Received: from ozlabs.org ([203.11.71.1]:45153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234431AbhIFC3Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Sep 2021 22:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630895290;
        bh=+pAa/eR4v7fOkpCC//6IVlxYA28AMktSFDdO91ILrSg=;
        h=Date:From:To:Cc:Subject:From;
        b=teUpPLlgXbzkx+duhQfGCVMUiSKQmGqLIwDc9lbgGOPv+r3TVRx2Nrr4Oy4SHwdDB
         LDuFlFq5f8zUDE6HI4/PPTHm1G4/nXJGbarVpVnblvTAdJioHg2HUDjyOQVKzlrrxI
         hhq1Xs/2IpjmF8AkLXmJdc71EO1lhvK7G8tU5rwSgZ2BrVITnKb5bjjnGwdRWu8y2H
         tCK/tf/F909ASytZZlB4q4dP8VJ/a7CPO5xZgO3+ETYKogxK8/QvXnwKSuxn/YU0JB
         Z1lKwehEQmIq1z51jHpY75RKQ1zkGXvHlIkqTlIGFdf2gChX97MSYOlN4QPkhFp2II
         k0KEGjc4B8zEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2skx63NJz9sVw;
        Mon,  6 Sep 2021 12:28:09 +1000 (AEST)
Date:   Mon, 6 Sep 2021 12:28:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xie Yongji <xieyongji@bytedance.com>
Subject: linux-next: manual merge of the vhost tree with Linus' tree
Message-ID: <20210906122806.2ca7e715@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MNbI+rgE4FGM3nXEZp89sFZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MNbI+rgE4FGM3nXEZp89sFZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  fs/eventfd.c

between commit:

  b542e383d8c0 ("eventfd: Make signal recursion protection a task bit")

from Linus' tree and commit:

  0afdb2abbff3 ("eventfd: Export eventfd_wake_count to modules")

from the vhost tree.

I fixed it up (I removed eventfd_wake_count as I could not see any added
use for it) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/MNbI+rgE4FGM3nXEZp89sFZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1fLYACgkQAVBC80lX
0Gxyggf8CecNxONqquYz4i9PJ8d8Jx8tC4Uk4XO6kt2ADjun7rkZm0HXjL3Mn7Lz
2AwMW6HGCzjemcFLt0OFjJm6KQqa4AAkLMdjW4z4tEpxiiGbvXDQAMvocyGwj7+S
Ok0fdZo/KT4gmQ9Seyg1o2ii1B60/xUW5zAROQ7XKIs9jT2qhMuAXCDZ1tYK5qTs
XWpOlIqLnDzYTZoWXDDnkYqVSYyYOphP8+gGD1gSiXj2jO91jDvTrsnfxCtTVqNC
5SdbQxeW3MXMxTR1rILAcbdKAX9MAONGwHX/M8QRLrqAMbc2oAb4vlrA6+4v+q0p
xCADysuiMWfSq2joh2qIg7hmvmFs8w==
=JnAW
-----END PGP SIGNATURE-----

--Sig_/MNbI+rgE4FGM3nXEZp89sFZ--
