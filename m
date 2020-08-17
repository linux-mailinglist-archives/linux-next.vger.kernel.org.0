Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA95247B22
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 01:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgHQXiM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 19:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQXiL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2020 19:38:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAE3C061389;
        Mon, 17 Aug 2020 16:38:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVr7y3zHPz9sRK;
        Tue, 18 Aug 2020 09:38:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597707486;
        bh=glBGkMEeeVmAs1ezPi175DVrKUs2y/psfxcXJaM7nzo=;
        h=Date:From:To:Cc:Subject:From;
        b=SAhdMq9zewewaqx+pB/kaXx4rrvUkTwNKvCfP+uwLWxpsKQYj9ge1VffcVneTYBHp
         rUBu+4zsuShzoDf0aG7hNoxMKHkcNeQeowoI9EEmNC1cufC4KmLT67eGNLQOnt7p5f
         TgRJSpDgPIKfxdolpSp9r7/UNmacsEnKXoMLEjj3EgGFG8KHwwFcEuaiPNNCHdBS39
         mrA53Rq+CBY/yluST2dNXzYc4FNhi0VKdnkazbracd6Gq7QnccM5wwLeHKC3de5wJU
         McoyJNTvPYnck62BqgJjTvDCXTpB6lAG1iMkTw0lrYySYAk/6b+dj0kZ/xcYY2woJR
         AzW3XR52JjnFQ==
Date:   Tue, 18 Aug 2020 09:38:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20200818093805.11c0c3c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P4xDWas+LsMVjT5qYAfbDHA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P4xDWas+LsMVjT5qYAfbDHA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/boot/inflate.c: In function 'zlib_inflate':
arch/powerpc/boot/inflate.c:399:3: error: 'fallthrough' undeclared (first u=
se in this function)
  399 |   fallthrough;
      |   ^~~~~~~~~~~
arch/powerpc/boot/inflate.c:399:3: note: each undeclared identifier is repo=
rted only once for each function it appears in
In file included from ./arch/powerpc/boot/decompress_inflate.c:12,
                 from /home/sfr/next/next/arch/powerpc/boot/decompress.c:33:
./arch/powerpc/boot/inflate.c: In function 'zlib_inflate':
./arch/powerpc/boot/inflate.c:399:3: error: 'fallthrough' undeclared (first=
 use in this function)
  399 |   fallthrough;
      |   ^~~~~~~~~~~
./arch/powerpc/boot/inflate.c:399:3: note: each undeclared identifier is re=
ported only once for each function it appears in

Caused by commit

  02b894b985cb ("treewide: Use fallthrough pseudo-keyword")

I have used the kspp-gustavo tree from next-20200817 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P4xDWas+LsMVjT5qYAfbDHA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl87FN0ACgkQAVBC80lX
0GwHMAf/aups+qKemoa+luhPfLUuaxOrRhOTvI7O1fEmYiT6quseyKDG0ucEP6qh
hep8jZhxhNyc6lTOgqmS+k4LsQBHbwLoryD0TTrjxmlX4oG/n4EsWR8YU4XFM9pV
mQOKfvR+oHwGNWc9LEW7+CuXqlO6O6LVgilmT48zbrpRYAhKYMbou85cEBidjTIA
XH6tATXqt1DmLpH21K6Xi/cHAqXaMGh88CM4NtwnaqqIka6f2wzvikxf0Bf4/fnX
JNn4e3WXRY6d4kL5mWrI+2FbEPCJnaS3OfIbA1iZTDh+vHpHVFQi7z+gKZsQt5p1
8s9uWrWvTj84iDEb6khVr8EZSGW/BQ==
=rHLK
-----END PGP SIGNATURE-----

--Sig_/P4xDWas+LsMVjT5qYAfbDHA--
