Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEA321642A
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 04:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgGGCw6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 22:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGGCw6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 22:52:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CD1C061755;
        Mon,  6 Jul 2020 19:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=JYHLauFPnWtT+mhbK3luKWopm/oGT2fxXYiZQWZB2cY=; b=s9a3G/NG0zUAZVwjTQwOLUO0LO
        ++sfl2mBc4bxaft+PLjx9DQep8vUP73F8t5X9XkVumXZ0v1WflITxYhAnkAu+ttf6vhL/Ap6QRKUO
        U+vzmgSDVscLoPb+pvFB/zLL2W7do0EGuQorKSFUvYkcBrBRLfDZNbmqUDKPuZ7wSuIFGawxV6kHr
        QV/a63xeXPG90CgVU+y9Lm50AAFnz4H+bJcNNv4ffYN4dfcGHs7T14p8K+rKdOl/xlsfKYC0aFir5
        ATL7bDhGacBoJMVcjhKMt9BUvhjezGPFi/fp4HyLKUTAHp+ZeogcoNKVPND1iyJlRPpAYP4960jpH
        XgKqdNMQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsdj4-0001qH-Ch; Tue, 07 Jul 2020 02:52:55 +0000
Subject: Re: linux-next: Tree for Jul 6 (mm/memory_failure.c)
To:     Joonsoo Kim <js1304@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200706174001.2d316826@canb.auug.org.au>
 <d458c18d-9c5e-9c45-0d65-e317571b6d56@infradead.org>
 <20200707003500.GA27886@js1304-desktop>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <207e6a52-7ca0-250d-de89-7297285d9d13@infradead.org>
Date:   Mon, 6 Jul 2020 19:52:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707003500.GA27886@js1304-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/6/20 5:35 PM, Joonsoo Kim wrote:
> On Mon, Jul 06, 2020 at 09:59:06AM -0700, Randy Dunlap wrote:
>> On 7/6/20 12:40 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200703:
>>>
>>
>> on i386:
>>
>> when CONFIG_MIGRATION is not set/enabled:
>>
>> ../mm/memory-failure.c: In function ‘new_page’:
>> ../mm/memory-failure.c:1688:9: error: implicit declaration of function ‘alloc_migration_target’; did you mean ‘alloc_migrate_target’? [-Werror=implicit-function-declaration]
>>   return alloc_migration_target(p, (unsigned long)&mtc);
>>          ^~~~~~~~~~~~~~~~~~~~~~
>>
>>
>> -- 
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Hello,
> 
> Thanks for reporting.
> 
> Below is the fix for this error.
> Andrew, Could you squash this fix into the patch,
> "mm-migrate-make-a-standard-target-allocation-function.patch"?
> 
> Thanks.
> 
> 
> ------------------->8-------------------
> From 5fac269125dfb2d03e38a75319305e0e70b23a4b Mon Sep 17 00:00:00 2001
> From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Date: Tue, 7 Jul 2020 09:16:58 +0900
> Subject: [PATCH] mm/migrate: fix for
>  mm-migrate-make-a-standard-target-allocation-function.patch in mm tree
> 
> new_page_nodemask() is renamed to alloc_migration_target in
> mm-migrate-make-a-standard-target-allocation-function.patch, but,
> one declaration for !CONFIG_MIGRATION case is missed. This patch fixes it.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Joonsoo Kim <iamjoonsoo.kim@lge.com>

Works for me. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> ---
>  include/linux/migrate.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 5e9c866..cc56f0d 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -60,8 +60,8 @@ static inline int migrate_pages(struct list_head *l, new_page_t new,
>  		free_page_t free, unsigned long private, enum migrate_mode mode,
>  		int reason)
>  	{ return -ENOSYS; }
> -static inline struct page *new_page_nodemask(struct page *page,
> -		int preferred_nid, nodemask_t *nodemask)
> +static inline struct page *alloc_migration_target(struct page *page,
> +		unsigned long private)
>  	{ return NULL; }
>  static inline int isolate_movable_page(struct page *page, isolate_mode_t mode)
>  	{ return -EBUSY; }
> 


-- 
~Randy
