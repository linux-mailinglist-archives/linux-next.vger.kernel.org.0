Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD51136B9D
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 12:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbgAJLEB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 06:04:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25584 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727682AbgAJLEA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 06:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578654239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ULOVTMVDqAaA1RLSX77fffpqFQaKmKj4WAvS8G6y3qE=;
        b=RSWDEdl0FrUWAjp7gQ0T6fu2Z8wqS52wP55fRbW8jhfxeeghdrwq9OH77NolGqjmf41WVI
        9fLdbLdCQ4AiTc0FfNAb2+H2pMBBjKkFQPdPyhGNZ95j2AzfMAVRveW2BxRfQGFSUqdvBF
        OzhgY/CMJaLOd9SFb/RLKCTCVNfeqUw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-plXWdyDbOmK94UsI72oAGA-1; Fri, 10 Jan 2020 06:03:57 -0500
X-MC-Unique: plXWdyDbOmK94UsI72oAGA-1
Received: by mail-wr1-f69.google.com with SMTP id f10so738985wro.14
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2020 03:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ULOVTMVDqAaA1RLSX77fffpqFQaKmKj4WAvS8G6y3qE=;
        b=nlK5zfs36mFz+qy+4Je8ABvjivQjpn0lYDsf/k9h0ieH5KoVGRdSRvSxJMErZUhiCK
         PhdgY7gx1FNTYzPrbPK1gtdzY/w1R22XfjEwX8kf6z19WCdaeQYj9OJoRps+WZjICwEq
         savH825vaFASSu7wqBSNDsjkoiMupFYWpL+dBOE+bPixLwDjQDYckhtWWZy3Q0eTRiEM
         WsMxmmfb423q5wF6nOZE60AHeev8rpEYtzSqstfpL5QqJkUZ891c2MOKjmJoFDK4z20m
         PrrmgHXypzbYWWAKFJ4i+5WVWDHg5bSyPnBUHhdQjnwm1opvMqT+jPw2D7/RK3LjOVOW
         zg8A==
X-Gm-Message-State: APjAAAVtMUuWcrSHeiOAweLF5FoWRsCOYZHcVF94wq7YtShQ+tBuP10s
        Wkl283xe8ts6IGxPwrFGZgQ1Ny7YMTlyJJmC61+QKwDsyPpG1MsqxztZNBFcaJAUKxiy6uE5UhJ
        uQMM33brWHVp9koaiLqN8Kg==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr3632343wmi.128.1578654236393;
        Fri, 10 Jan 2020 03:03:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxiKRM13Xd1Qan5MRjTjamzFk3V0rFLzaLiX22VRyLN1pQimrtTB1j7dEj52V7YMsGG8cFTA==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr3632307wmi.128.1578654236076;
        Fri, 10 Jan 2020 03:03:56 -0800 (PST)
Received: from orion ([213.175.37.12])
        by smtp.gmail.com with ESMTPSA id v3sm1755346wru.32.2020.01.10.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 03:03:55 -0800 (PST)
Date:   Fri, 10 Jan 2020 12:03:53 +0100
From:   Carlos Maiolino <cmaiolino@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200110110353.klnooeqv4b6ipxid@orion>
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

Oh, no, that's not the same issue I thought, and the patch applied does have the
dummy function.

/me grabs more coffee...


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

Eitherway, I am not 100% sure this is the right fix for this case, I remember
some bmap() users who didn't need CONFIG_BLOCK, so we may still need to export
it without CONFIG_BLOCK.
Can you please send me your configuration?

Thanks.





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

