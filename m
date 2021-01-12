Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DC62F3D0F
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438113AbhALVhZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 16:37:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437026AbhALUpB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 15:45:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFjH60767z9t0G;
        Wed, 13 Jan 2021 07:44:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610484259;
        bh=yqCpSAk8Sc1V2NH2uugA0JZeTYMnho1fhkaaYPpYzV4=;
        h=Date:From:To:Cc:Subject:From;
        b=fAbopmsNEiS5sva8a4lF2Dh1UYSCzMGEw7fdiPBSC7Mwq2SNChaKEtecrHtzG5E5s
         MEFXXwG6zsazNnrqmJIrhs8wbqfO7j/efoPXu+6hxaFG35DI80MkPPTy1ACzmofmFc
         NxJzlOJYOD+GREeG9IDMPnwSecKu6ZayvMM2lgp7PwUfHm0GvLU121qJkWqbmec26M
         28HALYiN/q7sUoDXsS1fUq6gI64bPB2nC7iyUtwfls0LFBKWajM9g7hyCjVZQNh5Fq
         aMuqVvEE9yzwBRuaU8zzZY3J8fbFRjY81pQkXkJjgs5I5lII1LAMxqbhSuF9QCQNLt
         977EJqzprjS1g==
Date:   Wed, 13 Jan 2021 07:44:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Naushir Patuck <naush@raspberrypi.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-fixes tree
Message-ID: <20210113074417.4ba59594@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xcjI6mp_f__drN++xQURaG1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xcjI6mp_f__drN++xQURaG1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  95e9295daa84 ("media: Revert "media: videobuf2: Fix length check for sing=
le plane dmabuf queueing"")

Fixes tag

  Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dma=
buf queueing")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/xcjI6mp_f__drN++xQURaG1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+CiEACgkQAVBC80lX
0Gyefgf/WGj3z88wyhQUJh2GW/lGx6p3Xc77z+aEjJcZkOwAQSEJ1GH2oJ+PwcwP
Hp2YLiFEvbgBJG5JhEwPNvhCfD2D9W49UHn8clgGk+rnd6DXeKxQGIm1cYeQr1e+
24Munl5m6DYO356ge41OLk5VXzLdBCtfzFG3rSKeCvQu/e6eqLmWQS9lRR42E8Zv
IZRdAJy7dmFi5xdWNfrY5bi1l9yEI0yVkp9nMW7Bbboac6NLXeuBjlvYY57BG5wY
mpgz5PMqyFAZH1owrUgDtKllLqYfQJszDZbExVL3hgj3E3RB1oqlFnGU9ajrj0ff
wc+XX47zqMGYLUT9RvQZu9Xm0UCyIg==
=8LCk
-----END PGP SIGNATURE-----

--Sig_/xcjI6mp_f__drN++xQURaG1--
