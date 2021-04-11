Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272B535B748
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 00:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbhDKWoB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 18:44:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:28851 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbhDKWoA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 18:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1618181023; x=1649717023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I1Q2xUBcjAkEFsaEbDcitfFYKd+s3AMG7Y5IcjLr4kk=;
  b=qQLwbb2toqT1ixT7O7qHVGwXCjr/860jk7el1vOkHvqeKcegYK9Pku+Y
   gSabH3yaEPCTaDm0SD5Tn1r2cvyArEc+RW6gvsI+jHp922wp6BVr33nGg
   i0TE4lPBWREy8CbHDTTsc/AKIC3pqaslzn0696kcJJ/qCqiHLgqctj37o
   5jfsw4Zi2vpkdOasaO46zrUCXUqcMhOx8bwzbu2HnHenIQay4u4bQjkTx
   a8t1gYycfms4iI5dqYQuB+K1a6GEZ/+OvVXbXCw3gNtojcbtXdq+besfq
   CWLhYEPSxF5eCSjGE7LxuPYC2mmoGUoIYYw3bYHVlunaYvhj0MegFct8m
   w==;
IronPort-SDR: Hr7Sumh4WeYvZkM1T0u3oU8pdyoX5oNTQonudzFpZ5s5ACjRHYxPHxDW7pSFqDE2xVdp9E4BZZ
 ab7XWMZkjJ46IoWdUbykeoE7xsKmH/mGpRsq6NPeVHSeCSP+OM6wRJ+KRzbBLkRWPwybW/b6uu
 GeppT7fNFEdP9OcYlqbq7s/DIRyKdG8L4b0pzX8qZ15JkDmnwwiyUwgLNE5B5mIUqNVWAjjOzX
 gEGzgCs+0Ma7KruohP5LGRihrsujN22zetsu57NbcP+sX+F/9DR2A9UUVArG/2895QbmZv9spE
 86E=
X-IronPort-AV: E=Sophos;i="5.82,214,1613404800"; 
   d="scan'208";a="168934600"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2021 06:43:42 +0800
IronPort-SDR: mAdV1Inpow40nU1jHjr0eQUzPgMTM/GYK8FFLiGHEZJ74dPGtsRpjVxlxkziuah4xuG3XS5EjK
 YLVWM6NLvmV0z1FIVDYTmJYKzPhxqCYI0hBaC/ydgd+WHuKMD/PpOyXuBMHNWRs23wgVvIQnMw
 EVKvgTMhmAWtxgh8V9Oc9bEK3nY17FjSyG/1xBZRg2ZDhKgI9g1TCZL5f4kb0EokMz6T+3gn8V
 MBbWmFBP3cu8w8pnrXNAZkNS+BZOUaY626hL/FmPAjoSIPZOn+PmGtUohLm17pkhot9HXF9Fdl
 gdalcQvf/JC/XGcYtQ+Nt200
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2021 15:23:15 -0700
IronPort-SDR: KRMcSUOc1pbqStg3fGtq6Dhm1HNeMML85hCaLgEcbsJ0ciy8EMdxsEbfEl43E2xLJn8B+TSJvC
 XtX3PyITI+/p5ivTwMS1fFk7O51Ko6r2RGOYKefNiKx9/zZPQRUmOj+EeZm+mWK3nRkW6ff/Qe
 erniri/yQXfy3VCbt2GDPenCA7RG+fbROI0c0SNDRiZA9yjFrJ10st5ch0A39Yl09cOfSeDQ8F
 ah1r9ZLBHLCbOP/6d2gBgD1sixTR7Pz0+PtfuiEY71NTIcOB5oVXC0SW05f9r0ioYa/+5LMUav
 WS0=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2021 15:43:43 -0700
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-block@vger.kernel.org
Cc:     hch@lst.de, axboe@kernel.dk, Johannes.Thumshirn@wdc.com,
        hare@suse.de, Damien.LeMoal@wdc.com, naresh.kamboju@linaro.org,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH] gdrom: fix compilation error
Date:   Sun, 11 Apr 2021 15:43:30 -0700
Message-Id: <20210411224330.4983-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Use the right name for the struct request variable that removes the
following compilation error :-

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=sh
CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
'HOSTCC=sccache gcc'

In file included from /builds/linux/include/linux/scatterlist.h:9,
                 from /builds/linux/include/linux/dma-mapping.h:10,
                 from /builds/linux/drivers/cdrom/gdrom.c:16:
/builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':
/builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
(first use in this function)
  586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
      |                                                             ^~

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/cdrom/gdrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index e7717d090868..742b4a0932e3 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -583,7 +583,7 @@ static blk_status_t gdrom_readdisk_dma(struct request *req)
 	read_command->cmd[1] = 0x20;
 	block = blk_rq_pos(req)/GD_TO_BLK + GD_SESSION_OFFSET;
 	block_cnt = blk_rq_sectors(req)/GD_TO_BLK;
-	__raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
+	__raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(req->bio),
 			GDROM_DMA_STARTADDR_REG);
 	__raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG);
 	__raw_writel(1, GDROM_DMA_DIRECTION_REG);
-- 
2.22.1

