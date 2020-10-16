Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9607428FD65
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 06:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732682AbgJPEp3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Oct 2020 00:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732681AbgJPEp3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Oct 2020 00:45:29 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACFDC061755;
        Thu, 15 Oct 2020 21:45:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CCD9K0dycz9sTL;
        Fri, 16 Oct 2020 15:45:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602823525;
        bh=IZ9uxiJir1imi0VpApOxDxJVp70IayGufBk0hlupfX0=;
        h=Date:From:To:Cc:Subject:From;
        b=DWQ3Poap1yK08hABeSIUMGKyEFqN8LmOF22QUNnoS+CSCGf+T0t96W/F1gEuNZm3B
         prCeI2fb6Abwqjhky52K76FV4nd17aZ0CnS4cpB9GcsJ0EeKNIMgUyE9Ss6Di0+QHB
         FkMjq2UJHovboJ/DQLqnUB+1CTcD+0ujyoozZCaUi47xNtSCeNretxAIYe9mmGbC0J
         pfH7IeUd1Y99NQGHwoxehOsVHUDJTpZLcqw/4QvVl8ror9zP1VldL6yCFMbeEglAgD
         gx2qMv4PHm8/IsCF6k2oYSxb0ojuI1XMHu3l+hkAL49P27drsTfg2qY8hvov+ueTAa
         DEy/Ktwf0OQ4w==
Date:   Fri, 16 Oct 2020 15:45:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201016154523.2c27a5b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dOmcBL72Qj7OshN1RDBYStd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dOmcBL72Qj7OshN1RDBYStd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/readahead.c: In function 'page_cache_sync_ra':
mm/readahead.c:565:8: error: 'filp' undeclared (first use in this function)=
; did you mean 'file'?
  565 |   if (!filp)
      |        ^~~~
      |        file

Caused by commit

  f65bd470e7ed ("mm/readahead: add page_cache_sync_ra and page_cache_async_=
ra")

interacting with commit

  09d008e3868e ("readahead: use limited read-ahead to satisfy read")

from the block tree.

I have added the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Oct 2020 15:39:09 +1100
Subject: [PATCH] mm/readahead: fix up for "readahead: use limited read-ahea=
d to satisfy read"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/readahead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index a673ec53de37..b4d162b38bd6 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -562,7 +562,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	 * we're congested or tight on memory.
 	 */
 	if (!ra->ra_pages || blk_cgroup_congested()) {
-		if (!filp)
+		if (!ractl->file)
 			return;
 		req_count =3D 1;
 		do_forced_ra =3D true;
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/dOmcBL72Qj7OshN1RDBYStd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+JJWMACgkQAVBC80lX
0GyMPgf/QGXeS1r/15Vd1sxX8vWFvDx6NZ6xgts3JIzdyIuyp4VKp/VoGP4enWDA
TfHRY9y77VbubOI6QBz9mdwK84d4HjfgpVeKUs35Zqy7llydR/OLARrwy+pT50t6
SQ5OKriyo8Kb4KX9Kj8VhvJkSvRqWI0CCpKoZoEIam7oAniS4sqxIQlnB67BuGt2
rYbJAtqhSAJPezjakb4ai0QF8uoCGN//Rrw8X/XZT6m1TQCGPPzFPEKah3lv1qRf
eNP+q++HIoO3UeJQy4yyM/OiV0drtP6G0S0qGt0hTDLK37zqThFrI3PJadz13ngW
ub88glyZjYv2HwLVgxwUgjseRcNaKA==
=Xfwt
-----END PGP SIGNATURE-----

--Sig_/dOmcBL72Qj7OshN1RDBYStd--
