Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C05E67DD26
	for <lists+linux-next@lfdr.de>; Fri, 27 Jan 2023 06:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjA0Fjp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Jan 2023 00:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjA0Fjo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Jan 2023 00:39:44 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7F22449C
        for <linux-next@vger.kernel.org>; Thu, 26 Jan 2023 21:39:43 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4c24993965eso53061697b3.12
        for <linux-next@vger.kernel.org>; Thu, 26 Jan 2023 21:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7GiQ7w1X2hhFSR7NAHawrhOM+1bixV1+YFnoXy42vGU=;
        b=QVl2mReNZWpLX20IPMiqSZF9jDaiI62lV6nbC4xS2ZQ0+ObGDve/qVNNBlnqQ5Tvls
         d1gDBrRB17QYETlrVwh4qMiMYLiz1+2bw06RLaZtuxtdZ2DnTyouIcUQXyI9ydyxaP8l
         Pd8a35a9B86U2rajp2eNZCL0lNhf0VeFYF/ddJAFoe2K1/RprOOBjM/Dax11DDxZ/w4l
         HdVi1U8z6ziXzGQYMrbI5TLDeVTN1nFzMylQ5XdQhUe05W3N0Zv35LvNKs3G92ZLUACA
         f6kDF2jZIZ2BPLhjMs3TURmadw8LHz5FZF6vd5XJ+pGRNDXaKswxXsUrkT+K3k1DqxOm
         iauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GiQ7w1X2hhFSR7NAHawrhOM+1bixV1+YFnoXy42vGU=;
        b=hd7DzJpY97DFSJhMSY31Auf0YKuQgnx/5AqCW6didyS/Iggum8+Cim3gfGe8IDblId
         kMaZKSseULDsPk5XjZhFqGEcomFA9yHPYD84XULLkS64yNYrIqvwMqXOZUc63QDEX7/K
         Ptm8kwYSa+Us4UM2scRX4jKHCK3w6MmBzzwUI8cNYytWTVjYF54YjWKv9C3PgU8uY891
         2IZ1O+2RscwHmHkPpJ0pdjZBZFjhVM5dSlzmQW2XPfzGveiYFa4bNelkdsNrYyWcYAmV
         2p/orA8uWZvTWGCrhEr563ehLRzkuwo0mGEcXPboMKaJOl5CAepBGoEvIjK2zqtKtv97
         t24A==
X-Gm-Message-State: AO0yUKUUGrF9NA3nEojsmn/Rc8bGdTEUk7vDuBiB/eU2bnbiOc0bR8kO
        iyzRNuS2uJlGIrQo8DOqiJglbjWoczYlz5/HnsDY8Q==
X-Google-Smtp-Source: AK7set91Hj+5JRIUMgFdCdTiKxYQbRYY0lmNdodkcHw8zPBgiHAgAOtNrL4ORfklzYuu+CmGMvnIJgOvZY5W8zbJr9s=
X-Received: by 2002:a0d:cb41:0:b0:507:e228:fd85 with SMTP id
 n62-20020a0dcb41000000b00507e228fd85mr956460ywd.132.1674797982893; Thu, 26
 Jan 2023 21:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20230127162143.1a3bc64b@canb.auug.org.au>
In-Reply-To: <20230127162143.1a3bc64b@canb.auug.org.au>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 26 Jan 2023 21:39:31 -0800
Message-ID: <CAJuCfpGSQk45mvCxCUhWTD1GjKs=XYmjOeZTEUerpo-ZKnTByA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with the rdma tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Dean Luick <dean.luick@cornelisnetworks.com>,
        Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Leon Romanovsky <leon@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 26, 2023 at 9:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the mm tree got a conflict in:
>
>   drivers/infiniband/hw/hfi1/file_ops.c
>
> between commit:
>
>   1ec82317a1da ("IB/hfi1: Use dma_mmap_coherent for matching buffers")
>
> from the rdma tree and commit:
>
>   6fe0afd07701 ("mm: replace vma->vm_flags direct modifications with modifier calls")
>
> from the mm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Stephen,
Conflict resolution for 6fe0afd07701 looks good to me.
Thanks,
Suren.

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/infiniband/hw/hfi1/file_ops.c
> index e03b0207856e,c6e59bc480f9..000000000000
> --- a/drivers/infiniband/hw/hfi1/file_ops.c
> +++ b/drivers/infiniband/hw/hfi1/file_ops.c
> @@@ -424,17 -403,8 +424,17 @@@ static int hfi1_file_mmap(struct file *
>                         ret = -EPERM;
>                         goto done;
>                 }
> -               vma->vm_flags &= ~VM_MAYWRITE;
> +               vm_flags_clear(vma, VM_MAYWRITE);
>  -              addr = vma->vm_start;
>  +              /*
>  +               * Mmap multiple separate allocations into a single vma.  From
>  +               * here, dma_mmap_coherent() calls dma_direct_mmap(), which
>  +               * requires the mmap to exactly fill the vma starting at
>  +               * vma_start.  Adjust the vma start and end for each eager
>  +               * buffer segment mapped.  Restore the originals when done.
>  +               */
>  +              vm_start_save = vma->vm_start;
>  +              vm_end_save = vma->vm_end;
>  +              vma->vm_end = vma->vm_start;
>                 for (i = 0 ; i < uctxt->egrbufs.numbufs; i++) {
>                         memlen = uctxt->egrbufs.buffers[i].len;
>                         memvirt = uctxt->egrbufs.buffers[i].addr;
> @@@ -560,9 -528,11 +560,9 @@@
>                 goto done;
>         }
>
> -       vma->vm_flags = flags;
> +       vm_flags_reset(vma, flags);
>  -      hfi1_cdbg(PROC,
>  -                "%u:%u type:%u io/vf:%d/%d, addr:0x%llx, len:%lu(%lu), flags:0x%lx\n",
>  -                  ctxt, subctxt, type, mapio, vmf, memaddr, memlen,
>  -                  vma->vm_end - vma->vm_start, vma->vm_flags);
>  +      mmap_cdbg(ctxt, subctxt, type, mapio, vmf, memaddr, memvirt, memdma,
>  +                memlen, vma);
>         if (vmf) {
>                 vma->vm_pgoff = PFN_DOWN(memaddr);
>                 vma->vm_ops = &vm_ops;
