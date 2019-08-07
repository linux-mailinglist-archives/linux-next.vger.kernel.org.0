Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC98D855CE
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 00:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388978AbfHGWaA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 18:30:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388957AbfHGWaA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 18:30:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463mQs59Nyz9sDB;
        Thu,  8 Aug 2019 08:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565216998;
        bh=zsFPluW2CRVSt2vs6Wzrp/nI+v2Oa0DgSGQjD9eO0K8=;
        h=Date:From:To:Cc:Subject:From;
        b=W5JgnCs4zNQuIUAlWqkdZOUElLazip8elLSYcbjH2GeC1piKbXyUkgjReQ4IIA6a4
         bbDpHqWWd0BkW90AfYHlif2vUEJbUq4AFEAwvOEAEvS8kUddzK9SU1Ng8fRUieGDlA
         VlJaHdU8xBloFTJntdUm/GxiMZxuaugZ1k7Pb/pdalW9VCw/oxaXiisaATLDfAeJmK
         Y8xl7MGKWiBy7nZX9DfAJ+zXXdCShs5AzskQoeuXkQDQ15uJLjXHnRBy83F10kYobK
         Cjt9ozY/JfJymX+I0xyYVG3e2MuOmuzxVipVsMRjhwCzNwMtXTe5vvIrL0+dWyPvtC
         ayxssPayrPiDw==
Date:   Thu, 8 Aug 2019 08:29:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the dma-mapping-fixes tree
Message-ID: <20190808082948.781f0033@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//e7w6quHHJBxWNoN5myhrRd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//e7w6quHHJBxWNoN5myhrRd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping-fixes tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

/home/sfr/next/next/mm/migrate.c: In function 'migrate_vma_collect':
/home/sfr/next/next/mm/migrate.c:2350:61: error: 'mm_walk' undeclared (firs=
t use in this function)
  mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm_walk.mm,
                                                             ^~~~~~~

Caused by commit

  f4c1f66bf710 ("pagewalk: seperate function pointers from iterator data")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Aug 2019 08:25:40 +1000
Subject: [PATCH] pagewalk: fix up missed conversion in migrate_vma_collect()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 75de4378dfcd..585113d2e37d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2347,7 +2347,7 @@ static void migrate_vma_collect(struct migrate_vma *m=
igrate)
 {
 	struct mmu_notifier_range range;
=20
-	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm_walk.mm,
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, migrate->vma->=
vm_mm,
 				migrate->start,
 				migrate->end);
 	mmu_notifier_invalidate_range_start(&range);
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_//e7w6quHHJBxWNoN5myhrRd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LUNwACgkQAVBC80lX
0GyZZwf/buSmNHVmHUkaqLzIKnhW/b2Z69EQoTpuc0KTI47ibM3RbzRNlNsOUuDb
F0ebQiYTpvXwI4p6vgZnMXQykduOY/jG4ybG3yVDmukaucy9JX+uK+NYnwmFocZT
wCtlLpy8eepM7YT1zd1lPg+vkmoxak4BCTzO4Tx3r0oBUj17Vl6DCeaxMKvtuoZX
Ri/cHgC4Oqb/E9UjUBXOVd2n9XOLZAt5PSY1FOfl+3Th9a90MBGUQv3+JJ+uvMca
kYoEtuy8o5XdUGTzYO5SI9bZtAzkR5gmhyf9gkpYwMtj7KjZLx+7r8BaIhrRJbTb
nUfP6KNh2hzN+nDTSYIAPgdRZIMDZA==
=u7pW
-----END PGP SIGNATURE-----

--Sig_//e7w6quHHJBxWNoN5myhrRd--
