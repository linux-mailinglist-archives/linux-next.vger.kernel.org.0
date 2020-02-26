Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E660016F5ED
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 04:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgBZDFg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 22:05:36 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45932 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729623AbgBZDFf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Feb 2020 22:05:35 -0500
Received: by mail-io1-f65.google.com with SMTP id w9so1650744iob.12
        for <linux-next@vger.kernel.org>; Tue, 25 Feb 2020 19:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZpoXmSgMubpOi5DQxpDALTYtlMkwTsn3LdFqrSxzDHI=;
        b=VQcINmPs7W5dpGMJBINFbHd6yvMbf22ThLQddwiXyeYpHR4PCI4PeVBa9ioLx2tkG8
         Isnk8ag7ErjArIdrBZYkQA0LsDVLirTcaKkB7k5NaIsPjtfbts/xsgCIxpzTiFQlbuob
         /sG1urZZG/LZoZQEGixRj7qURMgo5IEM/tHZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZpoXmSgMubpOi5DQxpDALTYtlMkwTsn3LdFqrSxzDHI=;
        b=K5+5n5JMH47A1swq1LL+DdHRJGcejjx/mS/0S/VsbZ8oFLREbdxxyrJ2hMU22AExvx
         X7LMOlhPrZsJnRgF5HioBgANeYpmxj9PAlk66VgBIxumf3ZTfZP37Q4sRhghD3XVVet5
         Hc90nrXAS2rIxE9HWn53HrfPG/kd/SLQ5x+dKiDATza8vrSNFTLVX2snaxOFt9MOs3ov
         DyUYS3YRNMPV+OxOcdalvzrmGDwe4v/18mcX7sWQgotV6RT/vcN1OPUTgr+FzsSjJcuu
         O7nlCRBK0JL3yP5WYLG/RixnHxKjTdDGTMEKaxIuQ07Y+RmnReAhPIpzRa7Nb7LemnRl
         WxBQ==
X-Gm-Message-State: APjAAAWSfTbZUuqG8dojXws0MgSpqDZLfVKg9P+2zXxVEA+iCCnJswvb
        8AHwHD09ab3hqN/nSD9nwNDCjW04SmfrEk0JYJVIxxj1
X-Google-Smtp-Source: APXvYqwzZpOup7HNjSuyaBr2WfdKmSPxs3zxBDbSBpnTKJKzjrq4aUtMcaYJS3D4NxC2YjwRsGV2uPLsVlQ2PmWN8/8=
X-Received: by 2002:a6b:c9c6:: with SMTP id z189mr1848962iof.285.1582686334967;
 Tue, 25 Feb 2020 19:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20200226135127.31667f48@canb.auug.org.au>
In-Reply-To: <20200226135127.31667f48@canb.auug.org.au>
From:   Devesh Sharma <devesh.sharma@broadcom.com>
Date:   Wed, 26 Feb 2020 08:34:58 +0530
Message-ID: <CANjDDBg0P=zi-L8kwd4RYCPt62U5zxdDyeST9ej6t4QqePp7iQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>,
        Selvin Xavier <selvin.xavier@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 26, 2020 at 8:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the rdma tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__free_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:78:2: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
>    78 |  vfree(pbl->pg_arr);
>       |  ^~~~~
>       |  kfree
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:16: error: implicit declaration of function 'vmalloc'; did you mean 'kmalloc'? [-Werror=implicit-function-declaration]
>   117 |  pbl->pg_arr = vmalloc(pages * sizeof(void *));
>       |                ^~~~~~~
>       |                kmalloc
> drivers/infiniband/hw/bnxt_re/qplib_res.c:117:14: warning: assignment to 'void **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   117 |  pbl->pg_arr = vmalloc(pages * sizeof(void *));
>       |              ^
> drivers/infiniband/hw/bnxt_re/qplib_res.c:121:18: warning: assignment to 'dma_addr_t *' {aka 'long long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   121 |  pbl->pg_map_arr = vmalloc(pages * sizeof(dma_addr_t));
>       |                  ^
>
> Caused by commit
>
>   0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
>
> I added the following fix for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 26 Feb 2020 13:46:02 +1100
> Subject: [PATCH] RDMA/bnxt_re: using vmalloc requires including vmalloc.h
>
> Fixes: 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/infiniband/hw/bnxt_re/qplib_res.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/infiniband/hw/bnxt_re/qplib_res.c b/drivers/infiniband/hw/bnxt_re/qplib_res.c
> index 4346b95963cf..fc5909c7f2e0 100644
> --- a/drivers/infiniband/hw/bnxt_re/qplib_res.c
> +++ b/drivers/infiniband/hw/bnxt_re/qplib_res.c
> @@ -44,6 +44,7 @@
>  #include <linux/inetdevice.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/if_vlan.h>
> +#include <linux/vmalloc.h>
>  #include "roce_hsi.h"
>  #include "qplib_res.h"
>  #include "qplib_sp.h"
> --
> 2.25.0
>
> --
> Cheers,
> Stephen Rothwell

Thanks!
Acked-by: Devesh Sharma <devesh.sharma@broadcom.com>
