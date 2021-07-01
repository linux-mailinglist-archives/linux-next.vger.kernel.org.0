Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65313B8CA6
	for <lists+linux-next@lfdr.de>; Thu,  1 Jul 2021 05:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhGADeC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Jun 2021 23:34:02 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:42612 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhGADeC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2021 23:34:02 -0400
Received: by mail-io1-f48.google.com with SMTP id v3so5783236ioq.9;
        Wed, 30 Jun 2021 20:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eP6Cb6SR36f3Izzbq0TD9Y6/0eZ5UtSs7iCbORNH1ik=;
        b=Vd5jkcFYVa62NmcfjAf9WFC/FwThR+3VvRtS3uwwzMwRgB+AjWu3brakhTu0AaM/Sg
         oDmndtzMTxGCD45ovHTxV1EwM5YD8LLb6nCgIULzn0o001boe+Yo0gid3tyNfZmG7vAY
         6BMJfuRGjyV5DxIzeHvMSqsuyeVlFkuA320oeU23BYzXEtcriyshY8jQJs1hKNEiG/Po
         n8fiF2MgGd/cxFKf05LG3xx0SH7HVBWMnucTjc7BzLdZ9PfeYhKD6LyUJF/GX4zGUtKi
         aqvV6WBFkFDxIzwriCE7YGvdYon0ah8s+eSO2Gfnn3AVSOZp+iokoF7/a8YNaXjo6J8y
         pmEg==
X-Gm-Message-State: AOAM533Hpcvjg1rYEPWelFeUnfeQtnipkFgUtS2Scik0XCVTV2NiDzCs
        089njBZsnTgUMl7NXHXwzeo=
X-Google-Smtp-Source: ABdhPJz+DBDY7WDARv2zW5IBatLkP+vwAPpscScC7O5hpYti5ftDt9FkUD8Ecr43RZugnSq2NZxrpg==
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr10501446iol.75.1625110291776;
        Wed, 30 Jun 2021 20:31:31 -0700 (PDT)
Received: from google.com (243.199.238.35.bc.googleusercontent.com. [35.238.199.243])
        by smtp.gmail.com with ESMTPSA id j3sm7857406ilo.0.2021.06.30.20.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 20:31:31 -0700 (PDT)
Date:   Thu, 1 Jul 2021 03:31:30 +0000
From:   Dennis Zhou <dennis@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        Ingo Molnar <mingo@elte.hu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 percpu tree
Message-ID: <YN03Ej89koHxICKQ@google.com>
References: <20210607183312.7dec0330@canb.auug.org.au>
 <20210701132316.01b6252a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701132316.01b6252a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Jul 01, 2021 at 01:23:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 7 Jun 2021 18:33:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   mm/memcontrol.c
> > 
> > between commit:
> > 
> >   0f0cace35fa6 ("mm, memcg: mark cgroup_memory_nosocket, nokmem and noswap as __ro_after_init")
> > 
> > from the percpu tree and commits:
> > 
> >   dfe14954c6e4 ("mm: memcg/slab: don't create kmalloc-cg caches with cgroup.memory=nokmem")
> >   3fd971b13287 ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5")
> >   53270d6d0c1f ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5-fix")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > Andrew, you may want to look at commit
> > 
> >   4d5c8aedc8aa ("mm, memcg: introduce mem_cgroup_kmem_disabled()")
> > 
> > from the percpu tree.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc mm/memcontrol.c
> > index 3c1641c67122,b9a6db6a7d4f..000000000000
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@@ -80,10 -80,10 +80,10 @@@ struct mem_cgroup *root_mem_cgroup __re
> >   DEFINE_PER_CPU(struct mem_cgroup *, int_active_memcg);
> >   
> >   /* Socket memory accounting disabled? */
> >  -static bool cgroup_memory_nosocket;
> >  +static bool cgroup_memory_nosocket __ro_after_init;
> >   
> >   /* Kernel memory accounting disabled? */
> > - static bool cgroup_memory_nokmem __ro_after_init;
> >  -bool cgroup_memory_nokmem;
> > ++bool cgroup_memory_nokmem __ro_after_init;
> >   
> >   /* Whether the swap controller is active */
> >   #ifdef CONFIG_MEMCG_SWAP
> 
> This is now a conflict between the percpu tree and Linus' tree.
> 

Yeah I'm aware. I'm planning on sending my PR tomorrow mentioning it. I
also have an example merge up in percpu#for-5.14-merge for Linus.

Thanks,
Dennis
