Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7469733F43D
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 16:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhCQPsq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 11:48:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:58598 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232461AbhCQPsN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 11:48:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A0DDBACA8;
        Wed, 17 Mar 2021 14:53:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 6584F1F2B76; Wed, 17 Mar 2021 15:53:03 +0100 (CET)
Date:   Wed, 17 Mar 2021 15:53:03 +0100
From:   Jan Kara <jack@suse.cz>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 17
Message-ID: <20210317145303.GD2541@quack2.suse.cz>
References: <20210317194241.1bf057bd@canb.auug.org.au>
 <YFHvbXwwRn5scIcz@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFHvbXwwRn5scIcz@osiris>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 17-03-21 13:00:45, Heiko Carstens wrote:
> On Wed, Mar 17, 2021 at 07:42:41PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release on Friday this week.
> > 
> > Warning: Some of the branches in linux-next are still based on v5.12-rc1,
> > so please be careful if you are trying to bisect a bug.
> > 
> > News: if your -next included tree is based on Linus' tree tag
> > v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> > consider rebasing it onto v5.12-rc2. Also, please check any branches
> > merged into your branch.
> > 
> > Changes since 20210316:
> > 
> > New tree: cifsd
> > 
> > The cifsd tree gained a build failure for which I applied a patch.
> > 
> > The drm-intel tree gained a conflict against the drm tree.
> > 
> > The tip tree gained a build failure so I used the version from
> > next-20210316.
> > 
> > The rcu tree gained a build failure so I used the version from
> > next-20210316.
> > 
> > Non-merge commits (relative to Linus' tree): 4404
> >  4125 files changed, 288074 insertions(+), 79674 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> 
> This does unfortunately not compile on s390 due to commit 72dd1ce7ebd3
> ("quota: wire up quotactl_path").

Thanks for the fix and sorry for inconvenience. Fixed up patch pushed out
so tomorrow's next tree should be fine.

								Honza

> 
> The patch below fixes it:
> 
> diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
> index 4aeaa89fa774..a421905c36e8 100644
> --- a/arch/s390/kernel/syscalls/syscall.tbl
> +++ b/arch/s390/kernel/syscalls/syscall.tbl
> @@ -445,4 +445,4 @@
>  440  common	process_madvise		sys_process_madvise		sys_process_madvise
>  441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
>  442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
> -443  common	quotactl_path		sys_quotactl_path
> +443  common	quotactl_path		sys_quotactl_path		sys_quotactl_path
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
