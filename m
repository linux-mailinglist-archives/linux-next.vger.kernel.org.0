Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6ACF9D36
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 23:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLWjY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 17:39:24 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37281 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLWjY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 17:39:24 -0500
Received: by mail-pg1-f196.google.com with SMTP id z24so12826269pgu.4
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 14:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mDXsshN7x2r2JPqfg+vPA1yEftVHnVvU0oPY+UoXotM=;
        b=RMti7fhMm8VKQasVXc971C+D01cmviipXaQZjz4qvA65j1PKft+sG5eyGMHGy5eI+H
         f/Br4hE93HiMugAfyhHlgCQRK7eWbixO6GcFdpveFUpYF3P0+kkb8mDtrSLHYzqDwQUz
         3bi1m8bDxA9NqG66B7wO7pX3IYommKYpkDdL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mDXsshN7x2r2JPqfg+vPA1yEftVHnVvU0oPY+UoXotM=;
        b=p1fRQTyBalMMOlxpv0NjCv1miOl0uRlvDcwxdYdVKeGc1pxAso18rl5HoJgtSJLd//
         UHOjxtcSjnf0M05b4wQs3IInFVuKGQDae9Zx8fn0hpIY68LSNsVql3Gapy4vwwqM6ZsN
         BG3Ke0m3AYiiI9gJsTwAKiWilWz1C+bTCDbYEnwspgevkIi82ohU6s1ZhKxPPdcM6dXt
         JgmY2nA8V/untTmyP4l6raaBWJFCXAsTKIz+CrJ3RTXlz57X+aVSRrnKWANBnD+D3XGl
         Rysr3Ln94oOaJDSfFGmCq4sBIIY7EPHtkaarcU6tRrG+KqeqGixeMeHrOZjOqb4EvSNW
         UOFQ==
X-Gm-Message-State: APjAAAX4/K24XYKUJDNbhd3dzC+da72dfM28jiaYp1joq4J3RFK5RDDm
        KfHBB/ocQ9P1PBqn7YieR6mQ0+FkRcE=
X-Google-Smtp-Source: APXvYqxwXtRqq/YAfrVswom5WIQlPTe5UQ729NTjDdmZSW+15hNVJWrZ31ryFZ6XWNWLzxocDSe/gQ==
X-Received: by 2002:a17:90a:970a:: with SMTP id x10mr242636pjo.39.1573598362562;
        Tue, 12 Nov 2019 14:39:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fz12sm128587pjb.15.2019.11.12.14.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:39:21 -0800 (PST)
Date:   Tue, 12 Nov 2019 14:39:20 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Qu WenRuo <wqu@suse.com>
Cc:     David Sterba <DSterba@suse.com>,
        Anand Jain <anand.jain@oracle.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: read_one_block_group(): Concurrent data access
 violations
Message-ID: <201911121438.F9D7311@keescook>
References: <201911111736.E0A3E2DDDB@keescook>
 <8c607908-6c8e-efb0-0079-7fa74ec98bed@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c607908-6c8e-efb0-0079-7fa74ec98bed@suse.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 02:05:40AM +0000, Qu WenRuo wrote:
> 
> 
> On 2019/11/12 上午9:36, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 593669fa8fd7 ("btrfs: block-group: Refactor btrfs_read_block_groups()")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
> > /fs/btrfs/block-group.c: 1721 in read_one_block_group()
> > 1715     		 *    truncate the old free space cache inode and
> > 1716     		 *    setup a new one.
> > 1717     		 * b) Setting 'dirty flag' makes sure that we flush
> > 1718     		 *    the new space cache info onto disk.
> > 1719     		 */
> > 1720     		if (btrfs_test_opt(info, SPACE_CACHE))
> > vvv     CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
> > vvv     Accessing "cache->disk_cache_state" without holding lock "btrfs_block_group_cache.lock". Elsewhere, "btrfs_block_group_cache.disk_cache_state" is accessed with "btrfs_block_group_cache.lock" held 12 out of 13 times (6 of these accesses strongly imply that it is necessary).
> 
> It's a false alert, as read_one_block_group() is running in mount
> context, nobody else can access the fs yet.
> 
> Of course we can hold the lock as it's going to hit fast path and no
> performance change at all, but I'm not sure what's the proper way to do
> in btrfs.

Okay, thanks for double-checking! Yeah, this looks like a hard one to
teach Coverity about... I'll add it to my notes! :)

-- 
Kees Cook
