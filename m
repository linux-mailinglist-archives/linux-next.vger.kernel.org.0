Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6215A136A65
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 11:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgAJKAe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 05:00:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46438 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbgAJKAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 05:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578650433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZEJOe+m0LRVK77DXnNtP8p/BGUzC9JGv9T2KHXsbmK4=;
        b=cH4QITWTXwQjYFr5+9gUMKCOPQiEd35hXSER+qDJXvyHBs/LsS1ZlVdnY/A10Q0b0s/Rmy
        B/0HAty9b0xohzyjQ+PZE3B/3bJDdct9rvm3iF1icC3mkrjkXYx8dd5sLOESvEtjJ6NJNX
        hVi+9+qanqKaaD71rPF+goQNXOV5lp8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-4WzszoouMy-Scx3JCh4Y4w-1; Fri, 10 Jan 2020 05:00:30 -0500
X-MC-Unique: 4WzszoouMy-Scx3JCh4Y4w-1
Received: by mail-wm1-f72.google.com with SMTP id p5so277728wmc.4
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2020 02:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ZEJOe+m0LRVK77DXnNtP8p/BGUzC9JGv9T2KHXsbmK4=;
        b=WoZj8DlNiIxue+cCqfzrr02GwzXOuLAYwnvV4wuSUx02DU01VWGsfqGOZlyfH8q8Lw
         aomak+iN1lvKGTWBlOJvHJm1xS+kH75jvUv7lY8D6kUv7gELhgesZu43+LG6SH0Uuiqa
         kFhwacyEUzSrZu6sEI3OaDf+vAoG0/rQT+43zJaXvQYR++gR5eJPaa6SPER4JJMl0+i6
         x0+bUlGoteXi/+gkCnqG+QlH6lBFAhbB/T7+kXZOAC2m7yiA8BMsmQ3iYEanz+6C8MUw
         ClapT+q7gsUk+nSTRV2ojr6z5sObaUktXErpHW2HYzFQaDBNiMOiopaoaBoAHD93+CRp
         vAqQ==
X-Gm-Message-State: APjAAAU+mq+T+NlQbCcV4ID79a59bbRmcXKtqwp1TAy3UOYkK38avPpI
        Zx7LXyf0NgsjmHnGmOAjnVL1ApYrdv4MajVFFQqTXi38GVAUK3WgtCiO5dh3L9kmH9hxD9uWkpm
        L/LSpbjsvV/OVXglQ1zf/oQ==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr2654033wru.318.1578650429349;
        Fri, 10 Jan 2020 02:00:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzErJyAjuanB6s1sCbANE2E/oqAF+bCw5sVhk6ja2jWTr1CS4wpkn39zXrNHRXvqQTq2ed4BQ==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr2654007wru.318.1578650429097;
        Fri, 10 Jan 2020 02:00:29 -0800 (PST)
Received: from orion ([213.175.37.12])
        by smtp.gmail.com with ESMTPSA id r5sm1569207wrt.43.2020.01.10.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 02:00:28 -0800 (PST)
Date:   Fri, 10 Jan 2020 11:00:26 +0100
From:   Carlos Maiolino <cmaiolino@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200110100026.xrt4avwsbbuobe7x@orion>
Mail-Followup-To: Carlos Maiolino <cmaiolino@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200110175729.3b5d2338@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110175729.3b5d2338@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Meh...

On Fri, Jan 10, 2020 at 05:57:29PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> fs/inode.c:1615:5: error: redefinition of 'bmap'
>  1615 | int bmap(struct inode *inode, sector_t *block)
>       |     ^~~~
> In file included from fs/inode.c:7:
> include/linux/fs.h:2867:19: note: previous definition of 'bmap' was here
>  2867 | static inline int bmap(struct inode *inode,  sector_t *block)
>       |                   ^~~~
> 
> Caused by commit
> 
>   65a805fdd75f ("fibmap: Use bmap instead of ->bmap method in ioctl_fibmap")
> 
> I have added this patch for today:

I had a fix to it, in one of my previous patches but I forgot to add it to this
version.

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 Jan 2020 17:53:19 +1100
> Subject: [PATCH] fs: fix up for !CONFIG_BLOCK and bmap
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 9f894b25af2b..590f36daa006 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1598,6 +1598,7 @@ void iput(struct inode *inode)
>  }
>  EXPORT_SYMBOL(iput);
>  
> +#ifdef CONFIG_BLOCK
>  /**
>   *	bmap	- find a block number in a file
>   *	@inode:  inode owning the block number being requested
> @@ -1621,6 +1622,7 @@ int bmap(struct inode *inode, sector_t *block)
>  	return 0;
>  }
>  EXPORT_SYMBOL(bmap);
> +#endif

The problem with this fix, is the fact bmap() could still be called for some
users even withouth CONFIG_BLOCK, so, it needs to have a dummy function to
return -EINVAL in case CONFIG_BLOCK is disabled.

I'll send a patch to fix it. Thanks for spotting it Stephen.

>  
>  /*
>   * With relative atime, only update atime if the previous atime is
> -- 
> 2.24.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Carlos

