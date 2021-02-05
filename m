Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D9731036C
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 04:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhBEDT0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 22:19:26 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18130 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhBEDTY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 22:19:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601cb9130000>; Thu, 04 Feb 2021 19:18:43 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 03:18:43 +0000
Received: from sandstorm.attlocal.net (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 5 Feb 2021 03:18:43 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     <linux-xfs@vger.kernel.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "Brian Foster" <bfoster@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Allison Henderson <allison.henderson@oracle.com>
Subject: [PATCH] xfs: fix unused variable build warning in xfs_log.c
Date:   Thu, 4 Feb 2021 19:18:14 -0800
Message-ID: <20210205031814.414649-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612495123; bh=ASnYnjm4ba2tgEUkk1b0klQ5FfM48WwNnO1q6DJgM1c=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=SL4/B2oMY4KpQU9uD3g6V1R6HO00UTizJybPXf7jx0BGfgUyiofPP8/aW+P0LZ4Lx
         R/FqZ8FwdgYv7F8tu4lz139P63b9cqZqYPJJ7ht0YZf6ydJ8AmYxDZkQMeqiuOFETo
         8BmwfeOJPxnRPWfLvzfDz3l86fEABAExGzenMMqnTo6oI0rSrqPjbAyd2OAUyJhE3F
         +dh4Z8mtcbJeBOxdsIpbzH+o1xSXvryzCyZ8V/uUOWVaqxHXFy7ra0s0RxRO+LKkwN
         cYqMmDJG8yuKrq6fmQDfleUgvC2MfSwerZiIH6fw+bpSvgAZ9Dtr2Ry2ZSyDpoNeLz
         irz+1iu3ooFHg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Delete the unused "log" variable in xfs_log_cover().

Fixes: 303591a0a9473 ("xfs: cover the log during log quiesce")
Cc: Brian Foster <bfoster@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Darrick J. Wong <djwong@kernel.org>
Cc: Allison Henderson <allison.henderson@oracle.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
Hi,

I just ran into this on today's linux-next, so here you go!

thanks,
John Hubbard
NVIDIA

 fs/xfs/xfs_log.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 58699881c100..5a9cca3f7cbf 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1108,7 +1108,6 @@ static int
 xfs_log_cover(
 	struct xfs_mount	*mp)
 {
-	struct xlog		*log =3D mp->m_log;
 	int			error =3D 0;
 	bool			need_covered;
=20

base-commit: 0e2c50f40b7ffb73a039157f7c38495c6d99e86f
--=20
2.30.0

