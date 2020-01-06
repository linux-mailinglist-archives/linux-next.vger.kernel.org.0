Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10EA7130D47
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 06:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgAFFts (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 00:49:48 -0500
Received: from ozlabs.org ([203.11.71.1]:57651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgAFFts (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 00:49:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rl2d4Kf9z9sR4;
        Mon,  6 Jan 2020 16:49:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578289786;
        bh=tZmF/WDn1Rl9uQxu18Ig3v3tPGDxQ5X6sH5nqcnQnrw=;
        h=Date:From:To:Cc:Subject:From;
        b=FAT2GuUwSQEOC95zpXnmSjpcD7QNieVGZtWZd0RYoUgaHmNoXeWeGhxzyvJuak+NI
         FwvTJaiL5i0FpF6tTpTjF6o5O1/HRw8XLu5k8S2SFsAOzL8Op5B7MQl+xR2Ak2uO8q
         /4+SDMzmw5RLRv5Qf+IuAh8C18/H7vn7u3JmPDurDw5mzo+mCpxGvbgzVQYsirvLUC
         T90BKiUGyK8jY30y5umZTaPEWolRed2KVj3nJkL0sqspFih1A7gCmwjhiwuR6cEkAd
         0YgC043UMxpwKfufKvEeLFqqD12THCNp+zYcR9rGE2LnlptOFdUOPSygPHd8cJO0vl
         YObIU6/e4Ez2A==
Date:   Mon, 6 Jan 2020 16:49:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200106164944.063ac07b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xkYCoiMf93arr8aBlvWVIku";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xkYCoiMf93arr8aBlvWVIku
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "_debug_pagealloc_enabled_early" [sound/drivers/pcsp/snd-pcsp.ko] un=
defined!

Caused by commit

  6538817e7869 ("mm, debug_pagealloc: don't rely on static keys too early")

I have added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Jan 2020 16:44:57 +1100
Subject: [PATCH] mm, debug_pagealloc: need to export _debug_pagealloc_enabl=
ed_early

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/page_alloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 85811f1465e5..a41bd7341de1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -696,6 +696,7 @@ unsigned int _debug_guardpage_minorder;
=20
 bool _debug_pagealloc_enabled_early __read_mostly
 			=3D IS_ENABLED(CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT);
+EXPORT_SYMBOL(_debug_pagealloc_enabled_early);
 DEFINE_STATIC_KEY_FALSE(_debug_pagealloc_enabled);
 EXPORT_SYMBOL(_debug_pagealloc_enabled);
=20
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/xkYCoiMf93arr8aBlvWVIku
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SynkACgkQAVBC80lX
0GyeAggAk2sgUF6Wk0X6K3Yo33ZC7v4f5yCcmQ15RfKpWDhNDKETzN80wacIvnSl
FMIF7tnbCH8s8c3OY5fCxfK+jb1tA+L2FvxKrwqsifIJ8MKaY4XoDf8/c8q3QsIb
kKMYNj53DQcoxT3FAN059lVUkA/VLLE/MB1YI8UYD1HfIxgyREeCBgk+T6OVAgd3
OF/vS6VM+8VsFo4HVoKlbAv//q+47hEqJdj6Y1Q4jht7BKNxPWaOTPQwF4xJKmYA
MMtwFua50sxamdW0fvQpCuNevmDxL8FJbx2vwuqfRKsgloBkWX2DzHkvwaSsSeSx
xcQ8xf/VO6jAAozq4icxMtwSRfIdmg==
=7QBI
-----END PGP SIGNATURE-----

--Sig_/xkYCoiMf93arr8aBlvWVIku--
