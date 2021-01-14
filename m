Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B982F5694
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 02:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbhANBtc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 20:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729889AbhANAcY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 19:32:24 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6013FC061786;
        Wed, 13 Jan 2021 16:31:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGQGQ2Jmmz9sVw;
        Thu, 14 Jan 2021 11:31:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610584272;
        bh=It9u9AKn8AqBdEwES376MSZ2+L2Lf5GTcdM2JalDxYM=;
        h=Date:From:To:Cc:Subject:From;
        b=q98T5wVzCNjJktmx2+1FOtj7sQImUpqYcy0fQPY0+Torhr+Xfw9453WacLy1wXVaM
         IVpxEFG5LZ7lltJkDI8SY9CoZ5d4Lu5/9Ey23znTPXn5Oov/f4Z206iLfedsP2zX1v
         9p1gRN6gFB+yjARaPX5XYu+5U+So7m4Je8jMkeo73h43zoT4N3uIIdFMpo/2iFPCin
         joggwauko+vU4xegW/hiBkMZDosMwL+F4NqwQo8sdUhynId4ZhoQosTEdzokcCSW3v
         9spztwD1RIms1nUNwdbnX1Ku7aMTZ6pz1p8y1YTmnlqcjnaQ6VbdIBpvCbpk5Vw70y
         Q9CSxN7ROv4LA==
Date:   Thu, 14 Jan 2021 11:31:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210114113107.622102e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.60J4ibaN=8y4IZ8pGCRClm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.60J4ibaN=8y4IZ8pGCRClm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/drm_cache.c: In function 'drm_need_swiotlb':
drivers/gpu/drm/drm_cache.c:202:6: error: implicit declaration of function =
'mem_encrypt_active' [-Werror=3Dimplicit-function-declaration]
  202 |  if (mem_encrypt_active())
      |      ^~~~~~~~~~~~~~~~~~


Caused by commit

  3abc66706385 ("drm: Implement drm_need_swiotlb() in drm_cache.c")

I have used the drm-misc tree from next-20210107 again for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.60J4ibaN=8y4IZ8pGCRClm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl//kMsACgkQAVBC80lX
0Gzqswf/ULSfqCkg299tDBU1Jv00UQUpTkd2drH/SRDVl76H3qegClo8UzQnkpNS
g4xUBFGhY5gnjwrT7lbeDobdFaZxDA6pJWfAESEYev7/Sm31gKxNXQBTVDF/+yEk
8gIcSjyg24WYTjSZCNLOd4Fo9GoDur5nReYvjz0aSF3+YwHi8QcFKVawcgtiufEj
QK/hjDBQfWuULsFe2I1VeXP+Z9MGRMvm2udW/Pok1vh1GmKLSGCIcRrdAQD0u9Dc
uYHXUAFNRC/+mpWEOcAXXJUbwHwMiI5rb9GjqZmd/JWM1hhidDcbtZg/CqpsMYMk
maZV82UkTtFvMKEo3DhJQBBREE+wiA==
=V+bW
-----END PGP SIGNATURE-----

--Sig_/.60J4ibaN=8y4IZ8pGCRClm--
