Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E52B17F2AF
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 10:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgCJJFG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 05:05:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23827 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726486AbgCJJFG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 05:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583831104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z8M89yh2o8qCh7hRUgk/BdUfIvQzZ4pvg1NsyaqSzVM=;
        b=dWipGhVKp6djjLyKFU3ZcdjWcUm4tzc/H0SbhdXpmZYbx1MNzP2/qtX5bWqPMAkYRw+MI9
        cCoh1DhmXlVz1oOLxFQcekAYY3ECYRFTA7IB82eL2ZugsrEKGxhXeRWnOqQsqkoJcjxUFx
        fYMjbLi+e+3m+NipSZOgl2GodR4yqXI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-gYOsAQVmPoWvtfwu5h1MlA-1; Tue, 10 Mar 2020 05:05:03 -0400
X-MC-Unique: gYOsAQVmPoWvtfwu5h1MlA-1
Received: by mail-qv1-f70.google.com with SMTP id r16so8638619qvp.13
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 02:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z8M89yh2o8qCh7hRUgk/BdUfIvQzZ4pvg1NsyaqSzVM=;
        b=BjfpUBR6SRNyxU1NnIgjFDqhayuU2dFS3QClys82h7trECsZiihRjq+4P+AZ2O3jq4
         4F6XM7e1Y9riqBJbgSVV8Bt66UxXuFJFI83LhSG3GjUvH4ctCx+zyKHP7jzRGYYGm1Xg
         Xvj2/cfpg0BdQM3la9LCFMmSTJOfBhnYCHT36oSuEdT4QtOOQVfW/szyoU2lqzqY/R1l
         GAinOvrCbuivuB4nsSRQOoqTlSmaBX56XRUVBLpSn1vmOwxPgK3Dv3iXrNUl75SguWEt
         XBw7QFenJ2sKeX0Yz4JXI1ErZ4CfV2BSZGQaVQtFU0Z1hQyT2qLDWI7ITk1b2jqT0qJ/
         Ko7Q==
X-Gm-Message-State: ANhLgQ30umGmYSReQTX6BJJgcCi7DsrG2rmGkbHtN6hvkHRh0iEj5v+q
        LzOcGBcj+EFhEEi8ooxK/pTD6QC4nEdlC915Z005xRRoxISIYdaQFE19xYzPiM/wMKsYQ/FNn4a
        4yI9w2YeRann5nvay3Jtoaw==
X-Received: by 2002:a05:6214:1808:: with SMTP id o8mr2701751qvw.187.1583831102931;
        Tue, 10 Mar 2020 02:05:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vunNOR8JXPFd6n8xYppj56UliWV70QigDA7M9ZuBdznJhfA6O4S2PhnHJ9QEf3uXaknJxp3WA==
X-Received: by 2002:a05:6214:1808:: with SMTP id o8mr2701733qvw.187.1583831102613;
        Tue, 10 Mar 2020 02:05:02 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
        by smtp.gmail.com with ESMTPSA id v21sm20794233qto.97.2020.03.10.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 02:05:01 -0700 (PDT)
Date:   Tue, 10 Mar 2020 05:04:56 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Message-ID: <20200310050017-mutt-send-email-mst@kernel.org>
References: <20200310190205.7c152ef9@canb.auug.org.au>
 <c7a2f5f7-6e30-cfbe-99b8-722be517ed20@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a2f5f7-6e30-cfbe-99b8-722be517ed20@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 09:39:21AM +0100, David Hildenbrand wrote:
> On 10.03.20 09:02, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   drivers/virtio/virtio_balloon.c
> > 
> > between commit:
> > 
> >   b5769cdc14fc ("virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM")
> > 
> > from the vhost tree and commits:
> > 
> >   b64c4d5bea98 ("virtio-balloon: pull page poisoning config out of free page hinting")
> >   80c03575431c ("virtio-balloon: add support for providing free page reports to host")
> > 
> > from the akpm-current tree.
> > 
> > I looked at the conflict for a while but could not easily see how to
> > reconcile it, so I decided to revert the vhost tree commit for today.
> > Some advice would be appreciated.
> > 
> 
> Yes, the free page reporting features are currently in Andrews tree and
> most probably won't go via the vhost tree due to the core-mm changes.
> Ideally, the VIRTIO_BALLOON_F_DEFLATE_ON_OOM fix would go in unchanged,
> because some people might be interested in backporting it (it's not a
> stable fix, though).
> 
> I think rebasing any way round shouldn't be too hard.
> 
> @Alex, Michael, what's your thought on this?

I propose rebasing on top of the akpm tree and merging through there.
David could you do the rebase pls? I'll review and ack.

While there, keeping virtio_balloon_unregister_shrinker and
virtio_balloon_register_shrinker around might be a good idea to
minimize backporting pain.

> -- 
> Thanks,
> 
> David / dhildenb

