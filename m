Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D109D441ADB
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 12:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhKALsU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 07:48:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50470 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhKALsT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 07:48:19 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 8F66D212C2;
        Mon,  1 Nov 2021 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635767145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=udXCdAEmS4VTvg1V1PFPhQUcJosQzWcPRY0wGlGXD48=;
        b=jmYuh594Y+YTjMR45WeakBcsbZNx9IH6J2lQX2xfbgRCPSuWGLNp2PQP2MBR4h4a6DhPXA
        7htuByfWnFdFd80bZNGVt8rIgYWtcYSo7SCLKA3LRBdtuY0cICTt4RcNNW3DMEQ9QglQY+
        68wyj5HsI2lR9zhFxLgPekj9xJkrSKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635767145;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=udXCdAEmS4VTvg1V1PFPhQUcJosQzWcPRY0wGlGXD48=;
        b=9ar6MWqPsaOboVyRjARG1N1/HTxU6FZRd/p7AdnhSpqFQxo0kgOr3ZgbBvO0wk5Bmj0pgg
        xFUkN5za82qqGbAw==
Received: from quack2.suse.cz (unknown [10.163.28.18])
        by relay2.suse.de (Postfix) with ESMTP id 81C27A3B87;
        Mon,  1 Nov 2021 11:45:45 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 2766D1E0922; Mon,  1 Nov 2021 12:45:45 +0100 (CET)
Date:   Mon, 1 Nov 2021 12:45:45 +0100
From:   Jan Kara <jack@suse.cz>
To:     Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ext3 tree
Message-ID: <20211101114545.GB21679@quack2.suse.cz>
References: <20211028232100.03d394fd@canb.auug.org.au>
 <87y26camhe.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y26camhe.fsf@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 28-10-21 18:05:49, Gabriel Krisman Bertazi wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi all,
> >
> > After merging the ext3 tree, today's linux-next build (htmldocs) produced
> > this warning:
> >
> > Documentation/admin-guide/filesystem-monitoring.rst:60: WARNING: Definition list ends without a blank line; unexpected unindent.
> >
> > Introduced by commit
> >
> >   c0baf9ac0b05 ("docs: Document the FAN_FS_ERROR event")
> 
> Hi Stephen, Jan,
> 
> I'd suggest the patch below.

Thanks. I've added the patch to my tree.

										Honza

> 
> Thank you,
> 
> -- >8 --
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> Date: Thu, 28 Oct 2021 17:17:47 -0300
> Subject: [PATCH] docs: Fix formatting of literal sections in fanotify docs
> 
> Stephen Rothwell reported the following warning was introduced by commit
> c0baf9ac0b05 ("docs: Document the FAN_FS_ERROR event").
> 
> Documentation/admin-guide/filesystem-monitoring.rst:60: WARNING:
>  Definition list ends without a blank line; unexpected unindent.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  .../admin-guide/filesystem-monitoring.rst     | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/admin-guide/filesystem-monitoring.rst b/Documentation/admin-guide/filesystem-monitoring.rst
> index 5a3c84e60095..ab8dba76283c 100644
> --- a/Documentation/admin-guide/filesystem-monitoring.rst
> +++ b/Documentation/admin-guide/filesystem-monitoring.rst
> @@ -35,9 +35,11 @@ notifications is Ext4.
>  
>  A FAN_FS_ERROR Notification has the following format::
>  
> -  [ Notification Metadata (Mandatory) ]
> -  [ Generic Error Record  (Mandatory) ]
> -  [ FID record            (Mandatory) ]
> +  ::
> +
> +     [ Notification Metadata (Mandatory) ]
> +     [ Generic Error Record  (Mandatory) ]
> +     [ FID record            (Mandatory) ]
>  
>  The order of records is not guaranteed, and new records might be added
>  in the future.  Therefore, applications must not rely on the order and
> @@ -53,11 +55,13 @@ providing any additional details about the problem.  This record is
>  identified by ``struct fanotify_event_info_header.info_type`` being set
>  to FAN_EVENT_INFO_TYPE_ERROR.
>  
> -  struct fanotify_event_info_error {
> -	struct fanotify_event_info_header hdr;
> -	__s32 error;
> -	__u32 error_count;
> -  };
> +  ::
> +
> +     struct fanotify_event_info_error {
> +          struct fanotify_event_info_header hdr;
> +         __s32 error;
> +         __u32 error_count;
> +     };
>  
>  The `error` field identifies the type of error using errno values.
>  `error_count` tracks the number of errors that occurred and were
> -- 
> 2.33.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
