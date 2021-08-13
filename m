Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4113EB367
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 11:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239015AbhHMJlq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 05:41:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239207AbhHMJlq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Aug 2021 05:41:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GmJTp0cQBz9sPf;
        Fri, 13 Aug 2021 19:41:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628847678;
        bh=MgTdjtyqXs6l+nGr3YJKmFUswmIZQqUBVjq4dowdu1M=;
        h=Date:From:To:Cc:Subject:From;
        b=iYRa7h5yX8K5KGWvoTIRVJylsaBTQmTcnsQvaxDxEJi6QMVNk17/xn0hNfdVAvxzp
         +mm8S9l4M2GXbnBxBeO3EsV5AE64i4QKR5ZuyIxBFZjyzFl96kCuKQJhVmUediaoJh
         fI2ZnUnXk9qz3fGrrdVVJ501UQfG0Tlt4mEQ+pmFZ8csC3w4VNmuV3qQBbOWfymW2J
         mXgW6ZlcBqZIPfg6KYOaAg94SqUX2i6658mEqulpGyx9pZ6hgAW656u9/fmvxe9I1G
         /PfwopqnjoOvHKigAejTUFMiaKcEJgzpTnP32vZsi9fwd1sZ6ZnonNBh/6hOugAkDo
         x1Av0W4n5vmhA==
Date:   Fri, 13 Aug 2021 19:41:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20210813194116.3a0297d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zMXRQWyIZ1Usgbem1xWzMAY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zMXRQWyIZ1Usgbem1xWzMAY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

block/bio.c:1689: warning: Function parameter or member 'nr_vecs' not descr=
ibed in 'bio_alloc_kiocb'

Introduced by commit

  1cbbd31c4ada ("bio: add allocation cache abstraction")

--=20
Cheers,
Stephen Rothwell

--Sig_/zMXRQWyIZ1Usgbem1xWzMAY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEWPjwACgkQAVBC80lX
0GzZWggAk01tyAE1BEdnHk0rbsf0Spi5c9CapkKZKyxqX7cs6u2TnqZFvlGFPj/G
mhxC/16ugzoUqOdXMmAifpJYzzlzk7K9GbV3GEVXy+EGhYs9zJx0PMyFRVxwGJbM
v+bUor3lt6qJ69webt1AM2nXGvH/KGh+eMLl0m51ECqg4oEtMDJojW0kxdXkUOuV
6i3nttQQIsbs0lasH9Fw2I6RJ2nppe8B9ftEieGTbec+1WLrlDNgbQVGroR5c5e2
HpzJ/qgaNNQoxuCkaPJG5XHCHq7Cce6b6gh8N9L43ESNmZAmJDozEDQgsFbaUBj9
7vyZvl/t72Iq9ymAKjOT1tLpSsZnZA==
=qN6E
-----END PGP SIGNATURE-----

--Sig_/zMXRQWyIZ1Usgbem1xWzMAY--
