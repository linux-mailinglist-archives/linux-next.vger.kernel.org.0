Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E125E6B3D
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 03:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfJ1C7t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Oct 2019 22:59:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727395AbfJ1C7t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Oct 2019 22:59:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 471fZp0xqSz9sPc;
        Mon, 28 Oct 2019 13:59:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572231586;
        bh=A99ViC7xdtIhVkC13zYqRE2VkM66MXhtZs7WENWuq6M=;
        h=Date:From:To:Cc:Subject:From;
        b=RyJvM3Ql7sOS1kVJskXSEHLpAxu2pooYLlRv7GkREEWWHvslnt0mjtzZxhWnOXkLc
         MBLBopoPB1aQTvRJI5YunFbFu0Ix7fKvm9/Q3JpuoM3YU0vRQP87s/yNZg1rwO00Gv
         Qhu6Z5uQULiozWdviKOatijAXtHHazuebUA9D5laLDk8QZK/EOVFjS9V3g2Yj93SwH
         8gR1L6co3BoVlxMaqO2HlXmrSJ/KSVeMIfEfKGmFan1TfyAcI214cx3qS/5aljxIxO
         Y10B69MR8dHgQ//ttwe6SEyKJQM9D0Ns6wYo7OsAACkW07aAMx3Ok1bvmS2GF36Yef
         PEJo4+JXU9I9A==
Date:   Mon, 28 Oct 2019 13:59:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20191028135945.5b2ed0fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S7w7HW1IKwIM54Qtue1azez";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S7w7HW1IKwIM54Qtue1azez
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/io_uring.c: In function '__io_sqe_files_unregister':
fs/io_uring.c:3010:12: error: invalid storage class for function 'io_sqe_fi=
les_unregister'
 3010 | static int io_sqe_files_unregister(struct io_ring_ctx *ctx)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
fs/io_uring.c:3010:1: warning: ISO C90 forbids mixed declarations and code =
[-Wdeclaration-after-statement]
 3010 | static int io_sqe_files_unregister(struct io_ring_ctx *ctx)
      | ^~~~~~

Caused by commit

  ed9e02e4bad1 ("io_uring: support for larger fixed file sets")

I have used the block tree from next-20191025 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/S7w7HW1IKwIM54Qtue1azez
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22WaEACgkQAVBC80lX
0GzRkggAgblmq0ejT4v2cuEjt39vjRaXd0cqVEglJGBiFqcGAt4jsH26hDVmtT0b
zI1czC3rOZH0DIHIcVjoLrUVVFKJ+39f4YJH/QKfTHbXsaMH806T0jrGDmZ0Xys2
STBT7yTDUktcUb78/hxlzU9LmZqtMi4BPmByIlVoqYy24aYI8+NnM4lPobpRJziW
vOemwb2x2x0h6kN2blNyoYv2BYOMuGHcQc6JXiCVIj1tF0oS7vg4LNSPccRrvDH9
YBdfd/bTo2vDXz/G55RKC/NtmXwToU3a+k15BGlz7jv062+68PgG/f3Zd1RbJv3H
i+jc4h0V3/8gLykvVhi+b/Wo1vQuyQ==
=8Ee+
-----END PGP SIGNATURE-----

--Sig_/S7w7HW1IKwIM54Qtue1azez--
