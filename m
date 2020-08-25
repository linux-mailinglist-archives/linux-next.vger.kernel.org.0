Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9715025131A
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 09:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgHYHZN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 03:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgHYHZM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 03:25:12 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D01C061574;
        Tue, 25 Aug 2020 00:25:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbL9d5lfPz9sTY;
        Tue, 25 Aug 2020 17:25:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598340310;
        bh=IHVKXyg7KO0cymnKWQuSk6EBWpBdMq6w4ZDA7AEAK5o=;
        h=Date:From:To:Cc:Subject:From;
        b=CQ9V9qcz5wxh+rhQkFw92ttAJP3CIIQ+vtPxa8YAHOy71KcLBhmqTC1Sb/8uHEw7L
         xYM4hqE57lPudAQM0TRT0Y7SEoE85IccfPVmZA2o87iWwJ+InVStOfWMEqjIfmZptB
         g9e2iA+kzevr76Se9dAudcsqdyFouoTXZcusPjJ8vk+nAhkfX8N0qzkzodqz93hTzz
         8RN1Xq/eKhexlmTB21fd92nLPAeDWYgR/xO9e6g79ufDC5C10oyqMBEKDlmRU1hzjs
         tpPMr3eW7cHTuGpTFWNaEOOEp6H+rd6NbPSKwYiZfF1zZl2BbKT0UuQiQ1RN8avOg4
         zwWZiLzqFbUeQ==
Date:   Tue, 25 Aug 2020 17:25:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200825172508.16800a4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0XdKUa4uf=srs_vk2cCgyyu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0XdKUa4uf=srs_vk2cCgyyu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
allnoconfig) failed like this:

mm/memory.c: In function '__apply_to_page_range':
mm/memory.c:2358:13: error: 'ARCH_PAGE_TABLE_SYNC_MASK' undeclared (first u=
se in this function)
 2358 |  if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
mm/memory.c:2358:13: note: each undeclared identifier is reported only once=
 for each function it appears in
mm/memory.c:2359:3: error: implicit declaration of function 'arch_sync_kern=
el_mappings' [-Werror=3Dimplicit-function-declaration]
 2359 |   arch_sync_kernel_mappings(start, start + size);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  a9354f1a10d5 ("mm: track page table modifications in __apply_to_page_rang=
e()")

I have added the following fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Aug 2020 17:17:12 +1000
Subject: [PATCH] ARCH_PAGE_TABLE_SYNC_MASK needs vmalloc.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory.c b/mm/memory.c
index 64352f8e3a70..fb5463153351 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -73,6 +73,7 @@
 #include <linux/numa.h>
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
+#include <linux/vmalloc.h>
=20
 #include <trace/events/kmem.h>
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0XdKUa4uf=srs_vk2cCgyyu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9EvNQACgkQAVBC80lX
0GyiFAf+NeJ9S0lOMmxu+XbzeFQ2/DYwiqxoCdo8/z/+DTatpt3rC9E/JF/wem/Z
NIvghka3K4gHFmwexNo47tlPy4xnXK7QEf31R3TU7jvg7bTwyrDfLlZmfu59AHKx
JFMjG365wvxii0wftM3tywp9wtKvv6Jx1wfr0/2en/g5x7/mx5Iuzpv8TBDIn7Ac
Y4NEU9ctGMnHC6UfZ8hQkXDrnpgGHf+CPbmlToQHV6nwB5HKPnG/HkALrzQ/baip
MZhqnfw/pA9JwDp/QYTRrd2ZcDdjPwK+TasiIk+NnhGK7SjT0fcrpcOnsEaC2reB
opZWwLtoizzDH/wZa89O7923km3nFQ==
=XbT7
-----END PGP SIGNATURE-----

--Sig_/0XdKUa4uf=srs_vk2cCgyyu--
