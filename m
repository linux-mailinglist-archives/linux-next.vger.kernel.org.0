Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3678C182D30
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 11:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCLKNf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 06:13:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33835 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725978AbgCLKNd (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 06:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584008012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ejjCb6q7RFGex98QgUcKFdkFFuRhyJT6HKlrMbk1V7o=;
        b=gm6FGjZscELt61+WdcUcexOyYRglg6O1LyIhYMHaXiQzwuZ6FX2L/Br7kWTOMSwoE+sy8x
        994/vdtLnl19f3HlJXsT/bGrIrnuUP0by9x/D/yA4HYYLLKbnKRgxIZuKVr/NW8jN0bd6T
        QTxNkzUcA2lhbNwYbjRPAOkt6LM9TEI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-PPjdMHr9OgWNf8K8V24qZQ-1; Thu, 12 Mar 2020 06:13:28 -0400
X-MC-Unique: PPjdMHr9OgWNf8K8V24qZQ-1
Received: by mail-ed1-f69.google.com with SMTP id r30so4428670edi.9
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 03:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejjCb6q7RFGex98QgUcKFdkFFuRhyJT6HKlrMbk1V7o=;
        b=qDDglIqU0qiVh0DQ2r5dpA2xLk9HCx31zMa9C6M9OOZokYEDtFqTEV1j3LUVg1YJs9
         +E+7g06rIzdt20C0cU0znOeYu0+g03XRcmXTqg9iwBdW9ASgavm73pTBvtfnk4Pgvn93
         KZnMtnnaIHkXHzlYN1+z1/JRuXtA/zklLpcER3Gb/EG6qxPrsu9zUW1/+uNh3hs3rQ3i
         F8otBqb81fsIGM/F9rRzWBNuUZo2FsQWMpqDe5m3xbqxRZDzqdgfVHSAjiaDnMF8BAo6
         UTR6WnbJqkWYS2HW/f6M+NuggGZLakV6S+D+IpRxDTY67kLWXx6RJdrQ/Qnh/pg8e2lx
         z2+A==
X-Gm-Message-State: ANhLgQ0M8Ije4Qp3F7Cii9kQ5N9q+M95aPew9X4Q/9PpI00gEbloJQP6
        aDd7iC2OCPEgT1imwSi260IXc/Z9WUEy1pleODNxL9bGZtjfFBzKYA4R6wWycsppNQEVbrX5N/5
        W9wKuA9ed+hVuSO3DCQe5xnO+gW8ryxp1V27jVA==
X-Received: by 2002:a17:906:52c9:: with SMTP id w9mr6171793ejn.70.1584008007514;
        Thu, 12 Mar 2020 03:13:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvpEEsl+KDmI2d5YoafqKJXuS1jFr+++rr3fY/v2Mogk34K+lvAjJl+ymSHsNqgBDuc+bVz8D/6j6haGwk/nZA=
X-Received: by 2002:a17:906:52c9:: with SMTP id w9mr6171780ejn.70.1584008007278;
 Thu, 12 Mar 2020 03:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200312135457.6891749e@canb.auug.org.au>
In-Reply-To: <20200312135457.6891749e@canb.auug.org.au>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Thu, 12 Mar 2020 11:12:51 +0100
Message-ID: <CAGnkfhztbmpP0=KT-iNbkUGKerhX04ENFsexA4_2cP_RUs0Png@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Coly Li <colyli@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 12, 2020 at 3:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from fs/erofs/xattr.h:10,
>                  from fs/erofs/inode.c:7:
> fs/erofs/inode.c: In function 'erofs_read_inode':
> fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first use in this function); did you mean 'PA_SECTION_SHIFT'?
>   197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
>       |                               ^~~~~~~~~~~~~~~~~~
> fs/erofs/inode.c:122:30: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
>   122 |   inode->i_blocks = nblks << LOG_SECTORS_PER_BLOCK;
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> fs/erofs/internal.h:197:31: note: each undeclared identifier is reported only once for each function it appears in
>   197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
>       |                               ^~~~~~~~~~~~~~~~~~
> fs/erofs/inode.c:122:30: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
>   122 |   inode->i_blocks = nblks << LOG_SECTORS_PER_BLOCK;
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> In file included from fs/erofs/data.c:7:
> fs/erofs/data.c: In function 'erofs_read_raw_page':
> fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first use in this function); did you mean 'PA_SECTION_SHIFT'?
>   197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
>       |                               ^~~~~~~~~~~~~~~~~~
> fs/erofs/data.c:226:4: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
>   226 |    LOG_SECTORS_PER_BLOCK;
>       |    ^~~~~~~~~~~~~~~~~~~~~
> fs/erofs/internal.h:197:31: note: each undeclared identifier is reported only once for each function it appears in
>   197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
>       |                               ^~~~~~~~~~~~~~~~~~
> fs/erofs/data.c:226:4: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
>   226 |    LOG_SECTORS_PER_BLOCK;
>       |    ^~~~~~~~~~~~~~~~~~~~~
> fs/erofs/data.c: In function 'erofs_bmap':
> fs/erofs/internal.h:197:31: error: 'PAGE_SECTORS_SHIFT' undeclared (first use in this function); did you mean 'PA_SECTION_SHIFT'?
>   197 | #define LOG_SECTORS_PER_BLOCK PAGE_SECTORS_SHIFT
>       |                               ^~~~~~~~~~~~~~~~~~
> fs/erofs/data.c:351:16: note: in expansion of macro 'LOG_SECTORS_PER_BLOCK'
>   351 |   if (block >> LOG_SECTORS_PER_BLOCK >= blks)
>       |                ^~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   61c7d3d5e015 ("block: refactor duplicated macros")
>
> I have used the block tree from next-20200311 for today.
>
> --
> Cheers,
> Stephen Rothwell

Hi,

I was building a kernel without erofs. Just including
include/linux/blkdev.h will fix it, should I amend the
patch or send a fix?

Cheers,


--
Matteo Croce
per aspera ad upstream

