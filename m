Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDED1FA52B
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 02:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFPAdd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 20:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFPAdd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2020 20:33:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059E4C061A0E;
        Mon, 15 Jun 2020 17:33:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49m8Lz21m4z9s1x;
        Tue, 16 Jun 2020 10:33:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592267611;
        bh=aOwHMLb94v6vF3ljqYfHs68Qb5hKAy50/k75k6iPohw=;
        h=Date:From:To:Cc:Subject:From;
        b=iy24DJgwi5I1myWuH8Hq1EOh/RpmDjxdqhUDNyWWZtXKkr8vnZ+t9yAv4KD3Tyr0F
         JDQESm8jqSyIFhZTk4zh8KzxYQa8A+vmutrzd06gSUJsAIwvwzlZ9IkXz/vNKdqAST
         b/B7tPfwPMRjuNLXjj/FHN8CfxPxHqZaSh+5B2sXRQyLywJvvWulPzfESezeXTdNzt
         pbVnIj5ZFsrMvtIrPJZVS3JibV2DsO3sf3olkM7aHIjHcPiUCw6dg67av1NefSSUmL
         6SaLtaRcF+70Z1FrAB8YtwDUMSfXx7jbZLYJpb+bw18bp+6/R4Xg9iBU5HXS82b+cA
         ztemVVE3YI7mQ==
Date:   Tue, 16 Jun 2020 10:33:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failures after merge of the vfs tree
Message-ID: <20200616103330.2df51a58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=oKx5ETu_l4OsvqGM4cYDZS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=oKx5ETu_l4OsvqGM4cYDZS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/dma/uniphier-xdmac.c: In function 'uniphier_xdmac_prep_dma_memcpy':
drivers/dma/uniphier-xdmac.c:293:7: error: implicit declaration of function=
 'kzalloc'; did you mean 'kvzalloc'? [-Werror=3Dimplicit-function-declarati=
on]
  293 |  xd =3D kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
      |       ^~~~~~~
      |       kvzalloc
drivers/dma/uniphier-xdmac.c:293:5: warning: assignment to 'struct uniphier=
_xdmac_desc *' from 'int' makes pointer from integer without a cast [-Wint-=
conversion]
  293 |  xd =3D kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
      |     ^
drivers/dma/uniphier-xdmac.c: In function 'uniphier_xdmac_prep_slave_sg':
drivers/dma/uniphier-xdmac.c:349:5: warning: assignment to 'struct uniphier=
_xdmac_desc *' from 'int' makes pointer from integer without a cast [-Wint-=
conversion]
  349 |  xd =3D kzalloc(struct_size(xd, nodes, sg_len), GFP_NOWAIT);
      |     ^
drivers/dma/uniphier-xdmac.c:373:4: error: implicit declaration of function=
 'kfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-declaration]
  373 |    kfree(xd);
      |    ^~~~~
      |    kvfree

Also, from the arm multi_v7_defconfig build:

drivers/dma/st_fdma.c: In function 'st_fdma_free_desc':
drivers/dma/st_fdma.c:233:2: error: implicit declaration of function 'kfree=
'; did you mean 'vfree'? [-Werror=3Dimplicit-function-declaration]
  233 |  kfree(fdesc);
      |  ^~~~~
      |  vfree
drivers/dma/st_fdma.c: In function 'st_fdma_alloc_desc':
drivers/dma/st_fdma.c:242:10: error: implicit declaration of function 'kzal=
loc'; did you mean 'vzalloc'? [-Werror=3Dimplicit-function-declaration]
  242 |  fdesc =3D kzalloc(struct_size(fdesc, node, sg_len), GFP_NOWAIT);
      |          ^~~~~~~
      |          vzalloc
drivers/dma/st_fdma.c:242:8: warning: assignment to 'struct st_fdma_desc *'=
 from 'int' makes pointer from integer without a cast [-Wint-conversion]
  242 |  fdesc =3D kzalloc(struct_size(fdesc, node, sg_len), GFP_NOWAIT);
      |        ^

Caused by commit

  f0187db056dc ("iov_iter: Move unnecessary inclusion of crypto/hash.h")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=oKx5ETu_l4OsvqGM4cYDZS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oE1oACgkQAVBC80lX
0Gx+Wwf/Zl/Nv1ASspKcETPJxP2JiUdQ4s2pyIEYtczQmFwvvnZQA651KDzrTFha
WBXfJFP25mMUJHaJYm55T6P74gzulKZBSCOb9RnsllFEr+NKJVfwUONQhOkiQJ3S
szP7EMkWOUJXiDDPlmDdMIrXGHxqcOjeLgdYNW0hLLuxdrPenYKZrRHrTupXXxv6
yo7+nUKz1AxJIrrxDsVnYoPfqJrQ7MutnBuAaWxGWa54ujl+xr9Bac9Dw42ynQWr
MCzJt38itfTYUObDrr78EtGDkIH/Zu5e0gZ1kccZ0hQZ5l9wbdGkxKnZsleBhoVf
ThNhm6BMS5y9+W+oVeopr9xzVjNlgg==
=52kQ
-----END PGP SIGNATURE-----

--Sig_/=oKx5ETu_l4OsvqGM4cYDZS--
