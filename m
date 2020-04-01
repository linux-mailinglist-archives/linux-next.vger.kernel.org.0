Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD0B19B8BD
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 00:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732669AbgDAW6c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 18:58:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732537AbgDAW6c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 18:58:32 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C90F6206E9;
        Wed,  1 Apr 2020 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585781912;
        bh=Kh5mNuBzVwAUptRbGYaW4hwn1mM92cXaa8ZH4GIqyjI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mOb+cGJ7ozCiEGTcffpZLjjIhX/YfB87UB79kLOqNXD9sin9Cz/8lhnY3QO1BzwYm
         NtfIJodLgwn/VC52YbQgVigMxgejaxGtrf9PvJcN268SqE31KE/lmPnnklVAlHdxZe
         6FhtA2DePSOteTR8L+1/YbllmSydqyteDpGR0FH8=
Date:   Wed, 1 Apr 2020 15:58:31 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Longpeng <longpeng2@huawei.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Wilcox <willy@infradead.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-Id: <20200401155831.24aa79ebbb14c654a2bee8c0@linux-foundation.org>
In-Reply-To: <20200331195612.64c06485@canb.auug.org.au>
References: <20200331195612.64c06485@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 31 Mar 2020 19:56:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (i386
> defconfig) produced this warning:
> 
> mm/hugetlb.c: In function 'huge_pte_offset':
> cc1: warning: function may return address of local variable [-Wreturn-local-addr]
> mm/hugetlb.c:5361:14: note: declared here
>  5361 |  pud_t *pud, pud_entry;
>       |              ^~~~~~~~~
> cc1: warning: function may return address of local variable [-Wreturn-local-addr]
> mm/hugetlb.c:5360:14: note: declared here
>  5360 |  p4d_t *p4d, p4d_entry;
>       |              ^~~~~~~~~
> 
> Introduced by commit
> 
>   826ddc88e2cf ("mm/hugetlb: fix a addressing exception caused by huge_pte_offset")

I can reproduce this (i386 defconfig, gcc-7.2.0).

I can see no way in which this makes any sense.  Hopefully it's a gcc
bug but it's hard to see how it could have messed up this fairly simple
code.
