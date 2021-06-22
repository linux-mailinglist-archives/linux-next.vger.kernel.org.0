Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4403AFD3E
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 08:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhFVGvD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 02:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhFVGvD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 02:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624344527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xmraLWMMpUxRRdYTYdUQ1uuQO8AbwKkAU0NHYrh72eo=;
        b=cvU4liuBdxNtxoo9FQyTl6+S9kIlgvivw/iN31MK5KbGqdTGykVYX3NRL77bXwNX2TtzyY
        WU5PKmf4FMZBk04UgzVnNOZIVw3jcdLlpms3rUxy4v9J8dZnzTC7NCqvOag12/llztiq7d
        eksWbkx6BynTrzkHh+hF6lfN1LY35iU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-kl9G6pi8MI2bXioFvYxwAA-1; Tue, 22 Jun 2021 02:48:45 -0400
X-MC-Unique: kl9G6pi8MI2bXioFvYxwAA-1
Received: by mail-wr1-f70.google.com with SMTP id k3-20020a5d62830000b029011a69a4d069so9105972wru.21
        for <linux-next@vger.kernel.org>; Mon, 21 Jun 2021 23:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmraLWMMpUxRRdYTYdUQ1uuQO8AbwKkAU0NHYrh72eo=;
        b=t/XkQ9DRoq2D4sViVM7Dgo9IeDLSy4cqBRnQQZRV3YtEd622SGopfvxh8bT7vjVQ+x
         vGpMjE9GmKKCck87RFVMeuIWOlNhSVM4wu8NPv6csBM7bAeJtn5VsQg2obOTl5t4VUSg
         Pi+l79s164tMbCLMeedw0VZcGrgMT82lA3gTA55N+FgomsmZ4varOhMbvMCh2pZxvSIm
         cHPyuVczlNDfOZbmpaRs/ffJb2Ssqq1gynjRhCaI87nTAxMVzKBV0rmhxzU6bgLiOvJc
         L+Cbe+67VnyXzNgGi1IKThxFTJMEGOVDCnIPjpr2oaWEX6Hj/T+2gpWZ1OPJxItAOHUe
         tj2Q==
X-Gm-Message-State: AOAM532jv8v8gjHjK7+lD2WX2goaVNX610+GsilsQd0P8Tdj4a/TK+P/
        hJXAbJBXspZ9OBOmzLkyQMX+mLLiqFE6cY12E7wlFhSWiikrmXds7st1w+3m/w6aE/ELTAf7eNS
        5WJYi+mYa9CbLvK7PXMMO4vLbpFCzm56UH0dJUQ==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr2688904wrb.289.1624344523591;
        Mon, 21 Jun 2021 23:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzd2FZ6E5eeGyaZjUNatElP6YHoFT1oLzYwouSlDO4Hf2iNZL5IDigTxUsYCjq2uTwfzIRZqH/wZnhL5QgGxU=
X-Received: by 2002:a5d:47af:: with SMTP id 15mr2688887wrb.289.1624344523452;
 Mon, 21 Jun 2021 23:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210611111231.7750bb60@canb.auug.org.au> <20210622113835.58589c3d@canb.auug.org.au>
In-Reply-To: <20210622113835.58589c3d@canb.auug.org.au>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Tue, 22 Jun 2021 08:48:32 +0200
Message-ID: <CAHc6FU5QKTVNos5x2uWZ8oCaMu6CEkqpan_zS6i1U2XqRpWyKQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gfs2 tree with the vfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 22, 2021 at 3:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Steven,
>
> On Fri, 11 Jun 2021 11:12:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the gfs2 tree got conflicts in:
> >
> >   Documentation/filesystems/porting.rst
> >   include/linux/uio.h
> >   lib/iov_iter.c
> >
> > between various commits from the vfs tree and the same, older version,
> > of the commits from the gfs2 tree.
> >
> > I fixed it up (I used the vfs tree versions) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
>
> I got more conflicts today.
>
> Can we please get that (old, buggy) version of this topic branch
> removed from the gfs2 tree

Done.

Thanks,
Andreas

