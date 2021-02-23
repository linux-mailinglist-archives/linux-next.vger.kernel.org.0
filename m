Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254333223C8
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 02:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhBWBnU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 20:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhBWBnU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 20:43:20 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BACC061574;
        Mon, 22 Feb 2021 17:42:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl1yP3JMpz9sS8;
        Tue, 23 Feb 2021 12:42:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614044557;
        bh=gVNsiXGE2bRlvKPDsjmJ5KtA6gn9a3CHhl4fzKMgUjc=;
        h=Date:From:To:Cc:Subject:From;
        b=ATV/jPlA3Ez3zCBKWpuBnZ0pAGwVm4JQQ1EtdJUHJj1qmUd08xMfqKDM/JHQgrWxo
         U0UlMyN/6YveIiKB1TdV+C7IGOyoQmrX5bttbMl3nf1IDzc7zTCtaAX2SFLYLBsJE2
         uzwyC7A2EQRCDrDmXOJrRJKZQ+6cMITgV6ctQ4dlzkutbL/p1GB0Qu2ecqwHgBL0JB
         oxbAnpi0h8ZjvH+TRikhr3WfRaVFCjTJcal3MefhBptqOnlLZixk8o47l/XA8g5IwI
         Q7XfwTLBI3KeQIOPDPD1Ehm+TTRVPIAFrHMFyW6I/kg5gPmzyP62N5/ZQcW0BKxoaN
         WL/j5O5qiHO2Q==
Date:   Tue, 23 Feb 2021 12:42:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20210223124236.7bdf0871@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.F.nGcB8KBgDtD__V1h+=2t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.F.nGcB8KBgDtD__V1h+=2t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/io_uring.c: In function 'io_sq_thread':
fs/io_uring.c:6787:3: error: implicit declaration of function 'io_ctx_disab=
le_sqo_submit' [-Werror=3Dimplicit-function-declaration]
 6787 |   io_ctx_disable_sqo_submit(ctx);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  a6afa091d06a ("io_uring: move SQPOLL thread io-wq forked worker")

I have used the block tree from next-20210222 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.F.nGcB8KBgDtD__V1h+=2t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0XYwACgkQAVBC80lX
0GyK2ggAn9cF4SJ+05mFAkByWQmm3o7loRWxJqNoAFlaciqKXSatmRw8tgmC9Xw3
EmTQsoFbyjY8Fr3KHGkZZCGE5sjMttPM8VunyQPng/EBTqV9IoFGKESFoYmPtS4d
Lf+DQJqDcwKHlhK5XPhKi2vhbob4vtjxnfMtDvQ1YfA7d9aQz6uP87TLxahhpO2+
+3VJQAK7emcOLW/Pzv/y3Og5mE3fHy1X61+KTmGtCXSATaxN6XuYHuz7I3hBy8c+
ejVbB+rPj6Fg8PFMI6lh31QDwBzjajLRFphR9wNGA2cSUVkoFK+ru1zkGvZ9404Z
dzdIjOO02770ENF4KRLj83GsoUj/Iw==
=zFF+
-----END PGP SIGNATURE-----

--Sig_/.F.nGcB8KBgDtD__V1h+=2t--
