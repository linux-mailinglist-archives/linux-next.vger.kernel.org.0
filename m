Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD9C310398
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 04:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBEDbN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 22:31:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:35944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229987AbhBEDbM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 22:31:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7622464DE9;
        Fri,  5 Feb 2021 03:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612495831;
        bh=YrnJlDPd8sRkbI4GL0GqRMYmTyTpnNvvG+lac6F9V/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ohybSbE8a4cofvH7Y+2h62Bs65embXZ/zkbaOJ+5zN4JVJe9Mj8NM9V8uqr1tHgLe
         6nCGRtrWIXzX4Hx9NRkWKoVfK3kgREwoLK9+JWGx7KF93/jISDGeR0A+4R2Plo393a
         6iBnKTF6UKVlBjDbQ8rW84Y+3lflr6mM/sHS9vZ5ghLOr0copawfrU/soMz+KGyrX6
         N29u+1PcaYtI7hZSpl68thX84OXXy2UfKSMk91V3JY+piv5qefBYc19QoU/hMegdf0
         h5ayYcQmDopXDK6Wjw334A+AXYMVfg5O0SsZ7nu9rusqpqH/yg1yob1DVynCGOzjJL
         oZN2VCfxdVfGA==
Date:   Thu, 4 Feb 2021 19:30:30 -0800
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-xfs@vger.kernel.org,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Allison Henderson <allison.henderson@oracle.com>
Subject: Re: [PATCH] xfs: fix unused variable build warning in xfs_log.c
Message-ID: <20210205033030.GL7193@magnolia>
References: <20210205031814.414649-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205031814.414649-1-jhubbard@nvidia.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 04, 2021 at 07:18:14PM -0800, John Hubbard wrote:
> Delete the unused "log" variable in xfs_log_cover().
> 
> Fixes: 303591a0a9473 ("xfs: cover the log during log quiesce")
> Cc: Brian Foster <bfoster@redhat.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Darrick J. Wong <djwong@kernel.org>
> Cc: Allison Henderson <allison.henderson@oracle.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> Hi,
> 
> I just ran into this on today's linux-next, so here you go!

Thanks for the tipoff, I just realized with horror that I got the git
push wrong and never actually updated xfs-linux.git#for-next.  This (and
all the other gcc warnings) are fixed in "xfs-for-next" which ... is not
for-next.

Sigh.....  so much for trying to get things in for testing. :(

--D

> 
> thanks,
> John Hubbard
> NVIDIA
> 
>  fs/xfs/xfs_log.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
> index 58699881c100..5a9cca3f7cbf 100644
> --- a/fs/xfs/xfs_log.c
> +++ b/fs/xfs/xfs_log.c
> @@ -1108,7 +1108,6 @@ static int
>  xfs_log_cover(
>  	struct xfs_mount	*mp)
>  {
> -	struct xlog		*log = mp->m_log;
>  	int			error = 0;
>  	bool			need_covered;
>  
> 
> base-commit: 0e2c50f40b7ffb73a039157f7c38495c6d99e86f
> -- 
> 2.30.0
> 
