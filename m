Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBF93E589F
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 12:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbhHJKxP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 06:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbhHJKxK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 06:53:10 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCF0C061798;
        Tue, 10 Aug 2021 03:52:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkVCc4Hd6z9sT6;
        Tue, 10 Aug 2021 20:52:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628592764;
        bh=vtV72N/6CXOBMdQ8dnyKzP6eHxhfD9bbPPt/kxc714s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Xr0XHJojlnUMD9eSnSpyIjYffahV2dZ3E/LJbSw+WRR1bdtreiHXh+I4e2t9gZFmu
         X5PxiJ2M9n9l/f9+Fx5Sa2IxKTRzBw22PrS3rzqoZmlR3JSBfI6dOr/ydncQKxhBoO
         zOqEY4L5ZjX48JlbmSEBPx277ikorjlD82AWdqu6Caic1wfHpZVV7COJlaH9yLQPEt
         Ll/Rm6Oft1EaV2Sevi2mOyANVz8W+hyyd8GKK5sgRxRiIEz/z7WMRklDsz+TjawwR4
         zaYKi2HRmz+iSyfF0dPDaymtqEPbv4wLIVP1aD8Wf/zzy7rAt4sZnhRHiUOXPgyKcw
         FfQhwWWoB1I7g==
Date:   Tue, 10 Aug 2021 20:52:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210810205243.25dfa994@canb.auug.org.au>
In-Reply-To: <20210810203135.7eb7b01a@canb.auug.org.au>
References: <20210810203135.7eb7b01a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IQVe25qW/YHVMv4WEmyNRjS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IQVe25qW/YHVMv4WEmyNRjS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Aug 2021 20:31:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the block tree, today's linux-next build (or32
> or1ksim_defconfig) failed like this:
>=20
> mm/page-writeback.c:2044:6: error: redefinition of 'laptop_sync_completio=
n'
>  2044 | void laptop_sync_completion(void)
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/memcontrol.h:22,
>                  from include/linux/swap.h:9,
>                  from mm/page-writeback.c:20:
> include/linux/writeback.h:345:20: note: previous definition of 'laptop_sy=
nc_completion' was here
>   345 | static inline void laptop_sync_completion(void) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   5ed964f8e54e ("mm: hide laptop_mode_wb_timer entirely behind the BDI AP=
I")
>=20
> This build does not have CONFIG_BLOCK set.

These as well:

In file included from include/linux/workqueue.h:9,
                 from include/linux/mm_types.h:16,
                 from include/linux/mmzone.h:21,
                 from include/linux/gfp.h:6,
                 from include/linux/xarray.h:14,
                 from include/linux/radix-tree.h:19,
                 from include/linux/fs.h:15,
                 from include/linux/backing-dev.h:13,
                 from mm/backing-dev.c:5:
mm/backing-dev.c: In function 'bdi_alloc':
mm/backing-dev.c:821:42: error: 'laptop_mode_timer_fn' undeclared (first us=
e in this function)
  821 |  timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
      |                                          ^~~~~~~~~~~~~~~~~~~~
include/linux/timer.h:126:28: note: in definition of macro '__init_timer'
  126 |  init_timer_key((_timer), (_fn), (_flags), NULL, NULL)
      |                            ^~~
mm/backing-dev.c:821:2: note: in expansion of macro 'timer_setup'
  821 |  timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
      |  ^~~~~~~~~~~
mm/backing-dev.c:821:42: note: each undeclared identifier is reported only =
once for each function it appears in
  821 |  timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
      |                                          ^~~~~~~~~~~~~~~~~~~~
include/linux/timer.h:126:28: note: in definition of macro '__init_timer'
  126 |  init_timer_key((_timer), (_fn), (_flags), NULL, NULL)
      |                            ^~~
mm/backing-dev.c:821:2: note: in expansion of macro 'timer_setup'
  821 |  timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
      |  ^~~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--=20
Cheers,
Stephen Rothwell

--Sig_/IQVe25qW/YHVMv4WEmyNRjS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESWnsACgkQAVBC80lX
0GzN6gf/R0jYgtK1azA+j9YEOzbEPlFHvwOdYZKLLHJbSv0dLFv+wIAct7BzO7Ql
BfbYg3yE3o8gfU4jOoQArdREi+aU+WQwjxfHND7M8N0Re6EBsWvaRt94KyO9g/s0
B7OJ7ykFK1JdyzhkU3mFf3Ym3T7rZWzk4q+44WQN/dX9dM5GA+Zgu7d3Aj3TuuuF
PqUgSmf6yItJLq8HY1kFQEgnRCxZjwiJNpk9j1DcjnqBqXYT3JyC2QGJpjKuyk3q
lmxA3ChaOuTnBrH7sElgDAEGRQ2av5BvM6pxQcY6fNNgYosJJkfqSi3teZ77LemN
dZP9IkRd4vl23xElgNfB7lcFrY0cKQ==
=wr1A
-----END PGP SIGNATURE-----

--Sig_/IQVe25qW/YHVMv4WEmyNRjS--
