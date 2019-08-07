Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C57985522
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 23:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbfHGV15 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 17:27:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730529AbfHGV15 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 17:27:57 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 144D72186A;
        Wed,  7 Aug 2019 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565213276;
        bh=qIsPVmF/GYciT+NXgQsfrCXseiH7rATJnnCGWlARXqc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AIcFK2y1KC2COaKg8q00+EtU7rcA7lCc14vce0BDJl8xmLhIW6r5LbH+3Zv2Pv/3j
         WVfoBD75OJLsRFw6EiWVo0BxzknBHxyclusqg23eBADyu2zVJQzfFXqwNTkXTv3W1W
         SsUqR83tfhecM6wOyVuqpfow5IqRJgP9gY8j/X3s=
Date:   Wed, 7 Aug 2019 14:27:55 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Song Liu <songliubraving@fb.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Message-Id: <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
In-Reply-To: <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
References: <20190807183606.372ca1a4@canb.auug.org.au>
        <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
        <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
        <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
        <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 7 Aug 2019 21:00:04 +0000 Song Liu <songliubraving@fb.com> wrote:

> >> 
> >> Shall I resend the patch, or shall I send fix on top of current patch?
> > 
> > Either is OK.  If the difference is small I will turn it into an
> > incremental patch so that I (and others) can see what changed.
> 
> Please find the patch to fix this at the end of this email. It applies 
> right on top of "khugepaged: enable collapse pmd for pte-mapped THP". 
> It may conflict a little with the "Enable THP for text section of 
> non-shmem files" set, which renames function khugepaged_scan_shmem(). 
> 
> Also, I found v3 of the set in linux-next. The latest is v4:
> 
> https://lkml.org/lkml/2019/8/2/1587
> https://lkml.org/lkml/2019/8/2/1588
> https://lkml.org/lkml/2019/8/2/1589

It's all a bit confusing.  I'll drop 

mm-move-memcmp_pages-and-pages_identical.patch
uprobe-use-original-page-when-all-uprobes-are-removed.patch
uprobe-use-original-page-when-all-uprobes-are-removed-v2.patch
mm-thp-introduce-foll_split_pmd.patch
mm-thp-introduce-foll_split_pmd-v11.patch
uprobe-use-foll_split_pmd-instead-of-foll_split.patch
khugepaged-enable-collapse-pmd-for-pte-mapped-thp.patch
uprobe-collapse-thp-pmd-after-removing-all-uprobes.patch

Please resolve Oleg's review comments and resend everything.
