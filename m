Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E923A24C6E4
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 22:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgHTUzU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 16:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:33972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgHTUzS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 16:55:18 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E89BB20885;
        Thu, 20 Aug 2020 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597956916;
        bh=0sC4plwLSrHCEwGCAy2r05gwxbQdkP/sGe8Xwz3RSX0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KtEB4K2Mxe1YWeBfBpp3kbuupp93sDeZqu4W10cnBxvmYNgrjShbUr0OMMtAIQjP7
         lZBfhetsS8S/oetCoDroqLe+PjwWsWeZOh8x/xndisyuxV+YdpX5yd8s5j18W1ef/F
         azzTZZq2iebAalbcSX7ngCZBAPabFw5wZG5hOMaI=
Date:   Thu, 20 Aug 2020 13:55:15 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        linuxarm@huawei.com, Barry Song <song.bao.hua@hisilicon.com>,
        John Hubbard <jhubbard@nvidia.com>, Jan Kara <jack@suse.cz>,
        =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shuah Khan <shuah@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: mm/gup.c:1922:7: error: implicit declaration of function
 =?UTF-8?B?4oCYaXNfdmFsaWRfZ3VwX2ZsYWdz4oCZ?=
Message-Id: <20200820135515.c36b35449143c723f0800f5b@linux-foundation.org>
In-Reply-To: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
References: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 20 Aug 2020 14:59:52 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> arm and riscv architecture build failed on linux next 20200820 tag.
> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
> arm-linux-gnueabihf-gcc" O=build zImage
> 
> 348#
> 349../mm/gup.c: In function ‘get_user_pages’:
> 350../mm/gup.c:1922:7: error: implicit declaration of function
> ‘is_valid_gup_flags’ [-Werror=implicit-function-declaration]
> 351 1922 | if (!is_valid_gup_flags(gup_flags))
> 352 | ^~~~~~~~~~~~~~~~~~
> 353cc1: some warnings being treated as errors
> 

Yes, thanks.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-gup-dont-permit-users-to-call-get_user_pages-with-foll_longterm-fix

fix CONFIG_MMU=n build

Link: https://lkml.kernel.org/r/CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Barry Song <song.bao.hua@hisilicon.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/gup.c |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

--- a/mm/gup.c~mm-gup-dont-permit-users-to-call-get_user_pages-with-foll_longterm-fix
+++ a/mm/gup.c
@@ -1759,6 +1759,25 @@ static __always_inline long __gup_longte
 }
 #endif /* CONFIG_FS_DAX || CONFIG_CMA */
 
+static bool is_valid_gup_flags(unsigned int gup_flags)
+{
+	/*
+	 * FOLL_PIN must only be set internally by the pin_user_pages*() APIs,
+	 * never directly by the caller, so enforce that with an assertion:
+	 */
+	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
+		return false;
+	/*
+	 * FOLL_PIN is a prerequisite to FOLL_LONGTERM. Another way of saying
+	 * that is, FOLL_LONGTERM is a specific case, more restrictive case of
+	 * FOLL_PIN.
+	 */
+	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
+		return false;
+
+	return true;
+}
+
 #ifdef CONFIG_MMU
 static long __get_user_pages_remote(struct mm_struct *mm,
 				    unsigned long start, unsigned long nr_pages,
@@ -1789,25 +1808,6 @@ static long __get_user_pages_remote(stru
 				       gup_flags | FOLL_TOUCH | FOLL_REMOTE);
 }
 
-static bool is_valid_gup_flags(unsigned int gup_flags)
-{
-	/*
-	 * FOLL_PIN must only be set internally by the pin_user_pages*() APIs,
-	 * never directly by the caller, so enforce that with an assertion:
-	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
-		return false;
-	/*
-	 * FOLL_PIN is a prerequisite to FOLL_LONGTERM. Another way of saying
-	 * that is, FOLL_LONGTERM is a specific case, more restrictive case of
-	 * FOLL_PIN.
-	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return false;
-
-	return true;
-}
-
 /**
  * get_user_pages_remote() - pin user pages in memory
  * @mm:		mm_struct of target mm
_

