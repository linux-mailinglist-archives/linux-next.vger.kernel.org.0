Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FD6216420
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 04:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGGCrV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 22:47:21 -0400
Received: from mail106.syd.optusnet.com.au ([211.29.132.42]:40107 "EHLO
        mail106.syd.optusnet.com.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726434AbgGGCrU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 22:47:20 -0400
X-Greylist: delayed 1130 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 22:47:19 EDT
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au [49.180.53.24])
        by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id 3B3135EC6A5;
        Tue,  7 Jul 2020 12:28:26 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
        (envelope-from <david@fromorbit.com>)
        id 1jsdLN-00022O-Kd; Tue, 07 Jul 2020 12:28:25 +1000
Date:   Tue, 7 Jul 2020 12:28:25 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>
Subject: [PATCH] xfs: fix non-quota build breakage
Message-ID: <20200707022825.GL2005@dread.disaster.area>
References: <20200707102754.65254f1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707102754.65254f1e@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
        a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
        a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=20KFwNOVAAAA:8
        a=xNn8sikHWVDSonxqqocA:9 a=CjuIK1q_8ugA:10
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


From: Dave Chinner <dchinner@redhat.com>

Oops, I forgot that you can config out quotas because nobody
ever does that when they build XFS anymore.

Fixes: 018dc1667913 ("xfs: use direct calls for dquot IO completion")

Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/xfs_dquot.h | 1 -
 fs/xfs/xfs_quota.h | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_dquot.h b/fs/xfs/xfs_dquot.h
index fe9cc3e08ed6..71e36c85e20b 100644
--- a/fs/xfs/xfs_dquot.h
+++ b/fs/xfs/xfs_dquot.h
@@ -174,7 +174,6 @@ void		xfs_qm_dqput(struct xfs_dquot *dqp);
 void		xfs_dqlock2(struct xfs_dquot *, struct xfs_dquot *);
 
 void		xfs_dquot_set_prealloc_limits(struct xfs_dquot *);
-void		xfs_dquot_done(struct xfs_buf *);
 
 static inline struct xfs_dquot *xfs_qm_dqhold(struct xfs_dquot *dqp)
 {
diff --git a/fs/xfs/xfs_quota.h b/fs/xfs/xfs_quota.h
index aa8fc1f55fbd..c92ae5e02ce8 100644
--- a/fs/xfs/xfs_quota.h
+++ b/fs/xfs/xfs_quota.h
@@ -13,6 +13,7 @@
  */
 
 struct xfs_trans;
+struct xfs_buf;
 
 /*
  * This check is done typically without holding the inode lock;
@@ -107,6 +108,8 @@ extern void xfs_qm_mount_quotas(struct xfs_mount *);
 extern void xfs_qm_unmount(struct xfs_mount *);
 extern void xfs_qm_unmount_quotas(struct xfs_mount *);
 
+void		xfs_dquot_done(struct xfs_buf *);
+
 #else
 static inline int
 xfs_qm_vop_dqalloc(struct xfs_inode *ip, kuid_t kuid, kgid_t kgid,
@@ -148,6 +151,12 @@ static inline int xfs_trans_reserve_quota_bydquots(struct xfs_trans *tp,
 #define xfs_qm_mount_quotas(mp)
 #define xfs_qm_unmount(mp)
 #define xfs_qm_unmount_quotas(mp)
+
+static inline void xfs_dquot_done(struct xfs_buf *bp)
+{
+	return;
+}
+
 #endif /* CONFIG_XFS_QUOTA */
 
 #define xfs_trans_unreserve_quota_nblks(tp, ip, nblks, ninos, flags) \
