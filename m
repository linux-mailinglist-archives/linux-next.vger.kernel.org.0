Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231E5389A2E
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 01:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhESX4q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 19:56:46 -0400
Received: from ozlabs.org ([203.11.71.1]:59079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230159AbhESX4q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 May 2021 19:56:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FlqW00JSbz9sXH;
        Thu, 20 May 2021 09:55:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621468524;
        bh=ffbmhLlUqrP5dt1Od/JLqnNkwNr1qOYgQ/X4GWp/Vd8=;
        h=Date:From:To:Cc:Subject:From;
        b=oIAYtGR9gPLv82MA9Zdj9XgajeBcUxQ2452giyLJ8yK8B0E1ioDJVERaUPLk1LAO0
         HTerr8x7vx/MztHiEtsIVqEB8dmbDuoIQQ0vUcyWrryqPhazWLRoEWpp7PNLlvpm1j
         GtU8lnI6pEH9VlDdbY/UJFnIsniqltUVIcyahpay+OtkuTrmLc/XDKDKoibaZw+J07
         SqGgQyUjl/Wor65rOguxK1omyhPFNfPwKVIZjAz1il5dKN45VBoIPBL+ChLq/OacOG
         E6ccr97cJPZlLQO2E4rMJPPK08DGgVOEQ+K38jxEjVxK9XvBFOQTyzWZOOyskdifIM
         nnqSZsw2dDrcg==
Date:   Thu, 20 May 2021 09:55:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20210520095523.73d2dc94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3l9DJysPU0C=h/LTZi2mYSa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3l9DJysPU0C=h/LTZi2mYSa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/media/hantro/hantro_drv.c: In function 'device_run':
drivers/staging/media/hantro/hantro_drv.c:165:3: error: label 'err_cancel_j=
ob' used but not defined
  165 |   goto err_cancel_job;
      |   ^~~~
drivers/staging/media/hantro/hantro_drv.c: At top level:
drivers/staging/media/hantro/hantro_drv.c:168:2: warning: data definition h=
as no type or storage class
  168 |  ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->c=
locks);
      |  ^~~
drivers/staging/media/hantro/hantro_drv.c:168:2: error: type defaults to 'i=
nt' in declaration of 'ret' [-Werror=3Dimplicit-int]
drivers/staging/media/hantro/hantro_drv.c:168:24: error: 'ctx' undeclared h=
ere (not in a function)
  168 |  ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->c=
locks);
      |                        ^~~
drivers/staging/media/hantro/hantro_drv.c:169:2: error: expected identifier=
 or '(' before 'if'
  169 |  if (ret)
      |  ^~
drivers/staging/media/hantro/hantro_drv.c:172:2: warning: data definition h=
as no type or storage class
  172 |  v4l2_m2m_buf_copy_metadata(src, dst, true);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/hantro/hantro_drv.c:172:2: error: type defaults to 'i=
nt' in declaration of 'v4l2_m2m_buf_copy_metadata' [-Werror=3Dimplicit-int]
drivers/staging/media/hantro/hantro_drv.c:172:2: warning: parameter names (=
without types) in function declaration
drivers/staging/media/hantro/hantro_drv.c:172:2: error: conflicting types f=
or 'v4l2_m2m_buf_copy_metadata'
In file included from drivers/staging/media/hantro/hantro_drv.c:23:
include/media/v4l2-mem2mem.h:830:6: note: previous declaration of 'v4l2_m2m=
_buf_copy_metadata' was here
  830 | void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_v=
b,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/hantro/hantro_drv.c:174:5: error: expected '=3D', ','=
, ';', 'asm' or '__attribute__' before '->' token
  174 |  ctx->codec_ops->run(ctx);
      |     ^~
drivers/staging/media/hantro/hantro_drv.c:175:2: error: expected identifier=
 or '(' before 'return'
  175 |  return;
      |  ^~~~~~
drivers/staging/media/hantro/hantro_drv.c:177:15: error: expected '=3D', ',=
', ';', 'asm' or '__attribute__' before ':' token
  177 | err_cancel_job:
      |               ^
drivers/staging/media/hantro/hantro_drv.c:179:1: error: expected identifier=
 or '(' before '}' token
  179 | }
      | ^

Caused by commit

  9454974c75dd ("media: hantro: use pm_runtime_resume_and_get()")

I have used the v4l-dvb-next tree from next-20210519 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3l9DJysPU0C=h/LTZi2mYSa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmClpWsACgkQAVBC80lX
0GwHwwf/XSgHiZ93CK+/Rgjp+vjAeoIWtLHg3aAVkXloap2zALa51cm4Aon3Glov
DaYoxI7c+Q/CHiljkM2BRc6PbCVDqkLDE1BgG43G8ecv22+IwyCgDy/1lf+noKvY
s/Sy5XjCvktxMlt6U97HfdJkknU84eijLOoqS0fU1nWvF7qIW6sotVahsrcipoJC
Dp1iaJv+RxJo+1ZWr+mZG9hxRSeITM31WifAZdqn3SzsrTiQbJFLdvcZrVk2U7ND
EQb7ASo+p39fPrUCErr0/od8Ui0pfvpvTcy1OvUvXLHuzy0/Qk9XOhZdWGar+FBn
ZWKTfRxZLfARGVdeoJVLquUjxpEWNA==
=gd7a
-----END PGP SIGNATURE-----

--Sig_/3l9DJysPU0C=h/LTZi2mYSa--
