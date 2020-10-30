Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C6A29F971
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 01:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgJ3AHU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 20:07:20 -0400
Received: from ozlabs.org ([203.11.71.1]:36261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgJ3AHU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 20:07:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMjKw75S7z9sSG;
        Fri, 30 Oct 2020 11:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604016438;
        bh=sGf50em3yT6dIG2fe8tv0b6NAMvmRRDR9Yq2uV+/U9s=;
        h=Date:From:To:Cc:Subject:From;
        b=BQjsk+aDpZQSE0lXvaOXM3EO8+m5USYvhpvEMlG+4NKbzqk9UkWqIvW2rp3ntE1Jk
         xu13yksdOa8O1YYXKmruzljAs1RH2uM2PYcXDFIXHkSOU5U6zihp6gPGhxbzvj/Jjx
         HdOEyRwYwrrrrhXoOFWkOtCeZAXsVhUuKoSZEDK4uyUGhT7lOHWlyB7Bk7AIbgpicp
         LPWTg9zRTl7mFWASm7lK+Ejj1tH7+LKKNM9uJJzhjzl9C5kf/2uQoMaUCE7uon/vyF
         e27FwRo7DTDlLKGtd3o1Ls3P7Zmp2DXnBXBSV99FaaAp0SyuU6b7FNlizSvEjimCmE
         ppS3W4SVXSsCg==
Date:   Fri, 30 Oct 2020 11:07:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201030110712.040bc95f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.geHD3LELS7R9Z6MK345B/0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.geHD3LELS7R9Z6MK345B/0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/nouveau/nouveau_ttm.c: In function 'nouveau_ttm_init':
drivers/gpu/drm/nouveau/nouveau_ttm.c:320:19: error: implicit declaration o=
f function 'swiotlb_nr_tbl' [-Werror=3Dimplicit-function-declaration]
  320 |  need_swiotlb =3D !!swiotlb_nr_tbl();
      |                   ^~~~~~~~~~~~~~

Caused by commit

  ee5d2a8e549e ("drm/ttm: wire up the new pool as default one v2")

I have used the drm-misc tree from next-20201029 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.geHD3LELS7R9Z6MK345B/0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+bWTAACgkQAVBC80lX
0GzA6Af/SHTmV9HS7xi53yCbWQA1iMSH1yPzT7VYgT7UmPmZpVfnqd9sTuve84ta
mxJvPXDbnIOB3/KDI0HxxLv61VCsBmyU+ORqeDZmvN5kGzs6RakjWpRjscor0TSJ
Trl8xYFHKcPX9e1t9Ee9ySQ8QROJ83Y7g9XLaKwnzWWhU3bbTkOHn99xXSAwBx2U
LnYAg54lhLkaMUvgb6tYYJWmIHl/K6j5S78IZPJjqEn4mbBB4bMPomKR8XMFoiG6
tqUWLlo8G8UvewvH7ZEhTKWkjGfXFFkzu4kmxJZBWZMQPtsJMcCeKv8254TQPWqz
ZZrQmKSKiKLngw7NLIM/DpN7jBD6QA==
=qblq
-----END PGP SIGNATURE-----

--Sig_/.geHD3LELS7R9Z6MK345B/0--
