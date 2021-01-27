Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF94D3052A7
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 06:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhA0F7I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 00:59:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235008AbhA0DPR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 22:15:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F7F0205CA;
        Wed, 27 Jan 2021 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611717276;
        bh=D0Qq+Fw7Ddpu0yizF3n5QBzokiqxWrewo5KH/Easwik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fYWt+0D25u7m4Iq1090WJSF102xxsHTBSVde3fj9qpWZTIFJNRCq2YJIMyX8sPprW
         pUCd7qr/nvaZRES0gBYmtLm5Qx4GIKOelnPMlNH5EjgkAndsfH/8qEdgZSbtXRs6U/
         9eItQFngZuPySenDulB9lX+ZhcDRMnKxW9Z6bZzAXlPHMgsF6sMmOnkEdB8/66qoNQ
         FVt9rhhyVrXvbPNZX7/+0k0Inl2MAyDzoQOu7U9UsyYZHktIE35SYCBAboT2xNIqgS
         SJNq4zClby/GkEeWJ0YyYo113vyObZG8w26okc3VhHJd/X0T1iXH/Z/rVAcoUvHo+j
         8Vl4pUp/eDKfQ==
Date:   Tue, 26 Jan 2021 19:14:35 -0800
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Brian Foster <bfoster@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <20210127031435.GB7695@magnolia>
References: <20210125095532.64288d47@canb.auug.org.au>
 <20210125132616.GB2047559@bfoster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125132616.GB2047559@bfoster>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 08:26:16AM -0500, Brian Foster wrote:
> On Mon, Jan 25, 2021 at 09:55:32AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the xfs tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > fs/xfs/xfs_log.c: In function 'xfs_log_cover':
> > fs/xfs/xfs_log.c:1111:16: warning: unused variable 'log' [-Wunused-variable]
> >  1111 |  struct xlog  *log = mp->m_log;
> >       |                ^~~
> > 
> > Introduced by commit
> > 
> >   303591a0a947 ("xfs: cover the log during log quiesce")
> > 
> 
> Oops, patch below. Feel free to apply or squash into the original
> commit.
> 
> Brian
> 
> --- 8< ---
> 
> From 6078f06e2bd4c82111a85a2032c39a56654b0be6 Mon Sep 17 00:00:00 2001
> From: Brian Foster <bfoster@redhat.com>
> Date: Mon, 25 Jan 2021 08:22:56 -0500
> Subject: [PATCH] xfs: fix unused log variable in xfs_log_cover()
> 
> The log variable is only used in kernels with asserts enabled.
> Remove it and open code the dereference to avoid unused variable
> warnings.
> 
> Signed-off-by: Brian Foster <bfoster@redhat.com>

Looks ok to me...
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_log.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
> index 58699881c100..d8b814227734 100644
> --- a/fs/xfs/xfs_log.c
> +++ b/fs/xfs/xfs_log.c
> @@ -1108,12 +1108,11 @@ static int
>  xfs_log_cover(
>  	struct xfs_mount	*mp)
>  {
> -	struct xlog		*log = mp->m_log;
>  	int			error = 0;
>  	bool			need_covered;
>  
> -	ASSERT((xlog_cil_empty(log) && xlog_iclogs_empty(log) &&
> -	        !xfs_ail_min_lsn(log->l_ailp)) ||
> +	ASSERT((xlog_cil_empty(mp->m_log) && xlog_iclogs_empty(mp->m_log) &&
> +	        !xfs_ail_min_lsn(mp->m_log->l_ailp)) ||
>  	       XFS_FORCED_SHUTDOWN(mp));
>  
>  	if (!xfs_log_writable(mp))
> -- 
> 2.26.2
> 
