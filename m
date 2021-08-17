Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3849A3EF528
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 23:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhHQVtt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 17:49:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234261AbhHQVtn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 17:49:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gq4Rj0tGsz9sWl;
        Wed, 18 Aug 2021 07:49:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629236946;
        bh=db2UfRo+fKW/AMF7JDZcE9P1JfPzoM60rtgFK9oK6QA=;
        h=Date:From:To:Cc:Subject:From;
        b=DHObwQAudZJDvnjIzIMHITm880++C5t+nIWhdS1CREi6Kq8cqLz5cRyeKu98UzS3f
         HeBPV/Tfxi1M6s0p7kHamRR19mZAgCLptuLwx5fQuwUNclYiasSAoHj2ERxM4HqM26
         7FnWuuaOd5VsM03jMMNjd4inYeyQ6+8ux+24k9KE/vEg7t9Ety3uE8sdSU2mHaiyR0
         sSSMpcKua4VO9tgokg48jxZYsowQO4YN2DQw+Qern2yByDjjNCIIjrUMhsx3sn/Jy+
         jWGcjmV3S2A3xRD4rZ3uSws5iJf/2g9CVE6J7nxo6N1WJ2eoKW6ogsLHd8Nj+WbdDo
         RSndri7cM+IOw==
Date:   Wed, 18 Aug 2021 07:49:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20210818074903.2da12b1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0BOt+Ld.jaAm/odgH1pMKz2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0BOt+Ld.jaAm/odgH1pMKz2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fcc750e0f4d8 ("i2c: s3c2410: fix IRQ check")

Fixes tag

  Fixes: 2bbd681ba2b ("i2c-s3c2410: Change IRQ to be plain integer.")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 2bbd681ba2bf ("i2c: xlp9xx: Driver for Netlogic XLP9XX/5XX I2C contr=
oller")

Or maybe you meant:

Fixes: e0d1ec97853f ("i2c-s3c2410: Change IRQ to be plain integer.")

--=20
Cheers,
Stephen Rothwell

--Sig_/0BOt+Ld.jaAm/odgH1pMKz2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcLs8ACgkQAVBC80lX
0GxgGAgAo+PXQBjiamzZyLDHb1O6CwkH6xkuJJ6QV6ljIj7FZO5kfPhSF5k+pqJ3
MZJLMn6kPzlPi6hPvsItUgCWuv0RmESGbRfsP9GPe6yB9paXpSm/omqLZp+6Ialo
RY7JbHG6bwRS0QR+eYHjbHvEcz8zIhvT3gy6XVC1OKhCmYhUdZUBqhJxUZ3BpL05
JAqjiRv0Q4XPnu/a9clorpZA41XDkZZdA0Z19p35IBuPBFhN1j1fKCsXfDjpSQFX
O1ve59EkPv+lGcgIPgWIid36gnLhcUaZP/FoUwfel5SOBSGS1Bzi2cJjB/vIA3nB
UzcYK1l7gBaR8ZzmYrjEUrYp3TvIhA==
=8TYm
-----END PGP SIGNATURE-----

--Sig_/0BOt+Ld.jaAm/odgH1pMKz2--
