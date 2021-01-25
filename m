Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BD03047B5
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 20:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbhAZF6C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:58:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728745AbhAYN17 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611581183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bQDcl3KYNDiDDnrKJ86psMQMy6kJz0IT2cXbDAOLy2c=;
        b=DmNStPbqM2ddpgMhoYreZxVodIKAkOuYk55RlpXeWEc2fnY8wFhsIHMDMAMBTKMeqOUESr
        g1lGI89+jMMnYb9YCh51RCiejCRDT9WyEjlwiQByLUA9rZH2kw9nkab04w4Cf5uJhljykP
        9rapSVAzMbL8r+fnquc90ZE6sOntFa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-JwJSEQ32Nr-Tw8M4dElF_A-1; Mon, 25 Jan 2021 08:26:21 -0500
X-MC-Unique: JwJSEQ32Nr-Tw8M4dElF_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B3FAFA81;
        Mon, 25 Jan 2021 13:26:19 +0000 (UTC)
Received: from bfoster (ovpn-114-23.rdu2.redhat.com [10.10.114.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D159F60C9C;
        Mon, 25 Jan 2021 13:26:18 +0000 (UTC)
Date:   Mon, 25 Jan 2021 08:26:16 -0500
From:   Brian Foster <bfoster@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <20210125132616.GB2047559@bfoster>
References: <20210125095532.64288d47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125095532.64288d47@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 09:55:32AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/xfs/xfs_log.c: In function 'xfs_log_cover':
> fs/xfs/xfs_log.c:1111:16: warning: unused variable 'log' [-Wunused-variable]
>  1111 |  struct xlog  *log = mp->m_log;
>       |                ^~~
> 
> Introduced by commit
> 
>   303591a0a947 ("xfs: cover the log during log quiesce")
> 

Oops, patch below. Feel free to apply or squash into the original
commit.

Brian

--- 8< ---

From 6078f06e2bd4c82111a85a2032c39a56654b0be6 Mon Sep 17 00:00:00 2001
From: Brian Foster <bfoster@redhat.com>
Date: Mon, 25 Jan 2021 08:22:56 -0500
Subject: [PATCH] xfs: fix unused log variable in xfs_log_cover()

The log variable is only used in kernels with asserts enabled.
Remove it and open code the dereference to avoid unused variable
warnings.

Signed-off-by: Brian Foster <bfoster@redhat.com>
---
 fs/xfs/xfs_log.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 58699881c100..d8b814227734 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1108,12 +1108,11 @@ static int
 xfs_log_cover(
 	struct xfs_mount	*mp)
 {
-	struct xlog		*log = mp->m_log;
 	int			error = 0;
 	bool			need_covered;
 
-	ASSERT((xlog_cil_empty(log) && xlog_iclogs_empty(log) &&
-	        !xfs_ail_min_lsn(log->l_ailp)) ||
+	ASSERT((xlog_cil_empty(mp->m_log) && xlog_iclogs_empty(mp->m_log) &&
+	        !xfs_ail_min_lsn(mp->m_log->l_ailp)) ||
 	       XFS_FORCED_SHUTDOWN(mp));
 
 	if (!xfs_log_writable(mp))
-- 
2.26.2

