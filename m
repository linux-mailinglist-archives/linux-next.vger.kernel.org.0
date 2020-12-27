Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC40A2E2FA9
	for <lists+linux-next@lfdr.de>; Sun, 27 Dec 2020 03:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgL0C1n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 26 Dec 2020 21:27:43 -0500
Received: from casper.infradead.org ([90.155.50.34]:33656 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgL0C1n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 26 Dec 2020 21:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8csmivsIXXVc5gk0iV/u0rkzDQSjKsASkLJbrXGW+SE=; b=BL5vtK6dtHrHzzZbpDIJu5WAps
        7I/YYTaPPpwIrn+i6WqtYGTOxRtiLHqsRONL7a0iUSJy1JR4eXrbC3oAPnYNqIWCvy+ENXjHALykr
        z+nXm+DQvva3L+ro0IF578FcttzMyAflEBpww+2zNMAw4AKVAqeDrVfUfIW7O20FdnPoKRtTRjEhu
        QU3bxCGV3gVUHKVwLCGBcSs8VYkRHCU0pnv3S3E7r1Ai511R24Tdw5YR1/6vDopY9ql/N0qmkkWQA
        X7BqZXf/R4R84PEPA4gwu6tiE7rvJE18Bqg/JfC96NSa5cPOj05xuVyiVPy2uCQIzfRmDPL3hV3xX
        0GLCA8Rw==;
Received: from c-73-157-219-8.hsd1.or.comcast.net ([73.157.219.8] helo=[10.0.0.253])
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ktLkw-0006nS-SA; Sun, 27 Dec 2020 02:26:11 +0000
Subject: Re: linux-next: Tree for Dec 23 (ia64: mmzone & sparsemem)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
References: <20201223154542.544915be@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4cea81fb-f8df-ec09-5591-1c8ca4f770d8@infradead.org>
Date:   Sat, 26 Dec 2020 18:25:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201223154542.544915be@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/22/20 8:45 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases between Dec 24 and Jan
> 3 inclusive.
> 
> Please do not add any v5.12 destined code to your linux-next included
> branches until after v5.11-rc1 has been released.
> 
> Changes since 20201222:
> 

on ia64 defconfig:

several of these:

In file included from ../include/linux/numa.h:25,
                 from ../include/linux/nodemask.h:96,
                 from ../include/linux/mount.h:15,
                 from ../fs/nsfs.c:2:
../arch/ia64/include/asm/sparsemem.h:14:40: warning: "PAGE_SHIFT" is not defined, evaluates to 0 [-Wundef]
   14 | #if ((CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)


and several of these:

In file included from ../include/linux/gfp.h:6,
                 from ../include/linux/xarray.h:14,
                 from ../include/linux/radix-tree.h:19,
                 from ../include/linux/idr.h:15,
                 from ../include/linux/kernfs.h:13,
                 from ../include/linux/sysfs.h:16,
                 from ../include/linux/kobject.h:20,
                 from ../include/linux/energy_model.h:7,
                 from ../include/linux/device.h:16,
                 from ../include/linux/async.h:14,
                 from ../kernel/async.c:47:
../include/linux/mmzone.h:1156:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
 1156 | #error Allocator MAX_ORDER exceeds SECTION_SIZE


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
