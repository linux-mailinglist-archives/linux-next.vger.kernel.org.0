Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89561AEE2B
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 17:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfIJPKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 11:10:53 -0400
Received: from ozlabs.org ([203.11.71.1]:41965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbfIJPKx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 11:10:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46ST4J1tPYz9s4Y;
        Wed, 11 Sep 2019 01:10:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568128250;
        bh=aoTIYRp7peYZiE+TXTLfLFyQ53Zbvaf6xr3h0aWndyc=;
        h=Date:From:To:Cc:Subject:From;
        b=TV22LbY9UPupLC3medhAwwRc5+Jeqlh6Bkzl82vwKfJWzYxG7dLL+V6+2KEsPQG7z
         wcyzxuvIQ0yHrKDKCfbcRGrFJRV1EDl68pRwRMO5m2A/VkvTxYj//2CAKiB/0+B7Xd
         42kslQ02mdZyg3wMNuWoyptnFgC0GFqvD4o3qD7wt9TT9u+gtxeatqosHNZ8/qbHVf
         QPFLeISAp/3kQi/uFjzQgJ1p9f8lr7VNy1f80//qxONTWCz9U+Iv8iCiDkLNxZ2hod
         If7YevIHscHFmaINlfZWAlLxLKQGrjqU77NQSOo1HjQxGut+s5LbF99gF0TEdt9uF4
         bX4K2aqQNUJ8Q==
Date:   Wed, 11 Sep 2019 01:10:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: Fixes tag needs some work in the y2038 tree
Message-ID: <20190911011034.3bae9ee3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S5C.=bsUr7rtZGW3yNn0cwS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S5C.=bsUr7rtZGW3yNn0cwS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e83dd16c24d8 ("fix compat handling of FICLONERANGE, FIDEDUPERANGE and FS_=
IOC_FIEMAP")

Fixes tag

  Fixes: d79bdd52d8be7 54dbc15172375 ceac204e1da94

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

So (presumably):

Fixes: d79bdd52d8be ("vfs: wire up compat ioctl for CLONE/CLONE_RANGE")
Fixes: 54dbc1517237 ("vfs: hoist the btrfs deduplication ioctl to the vfs")
Fixes: ceac204e1da9 ("fs: make fiemap work from compat_ioctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/S5C.=bsUr7rtZGW3yNn0cwS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13vOoACgkQAVBC80lX
0GzuDAf9F/1qwJOLmEv3UX6XFctYMUxrhL4/qZBy2zVZuTwmF2GD1SH0PnXAeLCZ
I1sKqfjYjWxd4XP7fOSfr2YcsnrcVbpgnQdchv1Q1BH4EVISbY1gRIvNAFoQw7TR
gSUV0cebZVwb6fFJImo42XWQ64RUeXa+rL5Nis/h2u3nXPl0J9YIwknBTtjOq+rj
dMa+i8+AWUeTCLDS+d3EPNeyXjdCWKYqK6lJzgs8hOhYH662bRkZuO3aAlnWhaY4
pxM/f1JFtQcISFs7n1qsO0Li7QOTXU3AbVegx/g63Xg/+ZpIWAlhitTUYH6Jr6eD
mA2POPrnE0sF7vR0u/ADbZrjYtuQMg==
=vWUy
-----END PGP SIGNATURE-----

--Sig_/S5C.=bsUr7rtZGW3yNn0cwS--
