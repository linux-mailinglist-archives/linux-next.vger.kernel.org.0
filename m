Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0355D1BD6F7
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 10:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgD2IRJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 04:17:09 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37361 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2IRJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2020 04:17:09 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200429080944euoutp0298c9804446a9e675f09bcf198582f78d~KO-7Vy-zT2956529565euoutp02Y
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2020 08:09:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200429080944euoutp0298c9804446a9e675f09bcf198582f78d~KO-7Vy-zT2956529565euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588147784;
        bh=E3/63fbyPb1GHXrZ02mRszxPZgR2rp/bdliWjE9lF2w=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=thX8FtCR9dKALIGQ5h7liJQBUubXV/Y+9OddUvEPRW4D8RV6I9xgvB1nAYmgmo0HG
         1zLwwQG99nrJxmNEupC/kODoMMbM80jy0tqDk4ZawkZdrY6LPxSQ6LsdrSsKlZ2WSG
         9IX53FB8sT4PKe1BbvZ6wQnBVLN/lq/LxMpEVT0A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200429080944eucas1p2d9ee84166e661b360e6a767576d36cda~KO-7GsICW2934929349eucas1p2S;
        Wed, 29 Apr 2020 08:09:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 71.3F.60679.74639AE5; Wed, 29
        Apr 2020 09:09:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200429080943eucas1p2af0045f4b5380ea86c25cb9d450e10fe~KO-6vhcg41870118701eucas1p29;
        Wed, 29 Apr 2020 08:09:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200429080943eusmtrp1e3d8e6c0416c8e5c71e95937ac5a609a~KO-6u5W4E2531225312eusmtrp1Z;
        Wed, 29 Apr 2020 08:09:43 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a1-5ea93647ac3c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.DF.08375.74639AE5; Wed, 29
        Apr 2020 09:09:43 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200429080943eusmtip20c65c021fe08c81e0347decbea7b2a6f~KO-6ZxqqE1358413584eusmtip2P;
        Wed, 29 Apr 2020 08:09:43 +0000 (GMT)
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <997e83ad-1966-6ebd-13d1-05617b67b7f8@samsung.com>
Date:   Wed, 29 Apr 2020 10:09:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200429083329.30ff39a1@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87ruZivjDPavt7ZY+PAus8WVr+/Z
        LGZP2MxkcXnXHDaLgwvbGC227r3K7sDm0XjjBpvH3m8LWDzudx9n8vi8SS6AJYrLJiU1J7Ms
        tUjfLoEr4+DsMywFLyUr1i5dyNTAuEK0i5GDQ0LARGL/ZCCTi0NIYAWjxP1Xd1ghnC+MEtde
        T2GCcD4zSmz5uoeti5ETrOPi3wcsEInljBJzz05lhnDeMkp077nDDlIlLOAucfxHIxPIDhEB
        bYkDvwVAapgFfjJKfN9wjgmkhk3ASmJi+ypGkBpeATuJxiMaICaLgKrE1GUmIBWiAhESnx4c
        ZgWxeQUEJU7OfMICYnMKmEtMWHwXbBOzgIHEkUVzWCFscYlbT+YzQdjyEtvfzmGGuHkVu8S2
        894QtovE2juzoeLCEq+Ob2GHsGUkTk/uAftLQmAdo8TfjhfMEM52Ronlk/9BfW8tcefcLyjb
        UWLlncMskHDkk7jxVhBiMZ/EpG3TmSHCvBIdbUIQ1WoSG5ZtYIPZ1bVzJfMERqVZSF6bheSd
        WUjemYXknQWMLKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzEC083pf8e/7GDc9SfpEKMA
        B6MSD+8GnhVxQqyJZcWVuYcYJTiYlUR4H2UsixPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zo
        ZayQQHpiSWp2ampBahFMlomDU6qBsWORW0Fgae8+f4dHO6avfCT18Aqf+1n11hAfuxUXgjfJ
        KW8XO7Z4zRP+J3FSm0t1l9e77FbZ9izh06LW12WFe70OzHE95FL1L+NYYmTDzdfN+T0lF9bx
        s5kGbf8gtC6Ox/bQLOs/qyM3vNj67R9Lae2E9hU2nK8V9/XOXpY4+f1hG8Woe9ONniuxFGck
        GmoxFxUnAgB9PjuWMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7ruZivjDOYvV7JY+PAus8WVr+/Z
        LGZP2MxkcXnXHDaLgwvbGC227r3K7sDm0XjjBpvH3m8LWDzudx9n8vi8SS6AJUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+DsMywFLyUr1i5d
        yNTAuEK0i5GTQ0LAROLi3wcsXYxcHEICSxklDi++ztbFyAGUkJE4vr4MokZY4s+1LjaImteM
        Eg1P/jCCJIQF3CWO/2hkAqkXEdCWOPBbAKSGWeA3o8T645OgGrYzSszeNYUJpIFNwEpiYvsq
        RpAGXgE7icYjGiAmi4CqxNRlJiAVogIREod3zAIbzysgKHFy5hMWEJtTwFxiwuK77CA2s4Ce
        xI7rv1ghbHGJW0/mM0HY8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5x
        Ym5xaV66XnJ+7iZGYHRtO/Zz8w7GSxuDDzEKcDAq8fBu4FkRJ8SaWFZcmXuIUYKDWUmE91HG
        sjgh3pTEyqrUovz4otKc1OJDjKZAv01klhJNzgdGfl5JvKGpobmFpaG5sbmxmYWSOG+HwMEY
        IYH0xJLU7NTUgtQimD4mDk6pBsbgnU3lgfva2xVMrnr9qD7Kskr/ltAjOT4HS8NPx56Guj+x
        SNr7YlfMPyNrPqfKR3c6TO1urpOaymjOy5ko2PlXYZGXt1gA685dl3kjly/gPLrK7ElmvlvZ
        3cLqZ76KS4Ol2l2X+N13WNqTecpldY6hV3Jch8PD1Nxj/z1m7hL61pqZqFkWoMRSnJFoqMVc
        VJwIAMYTVJ3EAgAA
X-CMS-MailID: 20200429080943eucas1p2af0045f4b5380ea86c25cb9d450e10fe
X-Msg-Generator: CA
X-RootMTR: 20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865
References: <20200420130118.7a866fd5@canb.auug.org.au>
        <CGME20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865@eucas1p1.samsung.com>
        <20200429083329.30ff39a1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Hi Stephen,

On 4/29/20 12:33 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 20 Apr 2020 13:01:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-misc tree, today's linux-next build (powerpc
>> allyesconfig) failed like this:
>>
>> drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
>> drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
>>   756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
>>       |                       ^~~~~~~~~~~~~~~~~~~
>>       |                       pgprot_cached
>> drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
>>
>> Presumably exposed by commit
>>
>>   a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
>>
>> I just turned off COMPILE_TEST again for today.  Please let me know when
>> this is fixed.
> 
> This still appears to have not been addressed.

Sorry for the delay, I've just posted a patch (also included below):

"[PATCH] video: fbdev: controlfb: fix build for COMPILE_TEST=y && PPC_PMAC=y && PPC32=n"

which should fix it.

Please verify it, thank you!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: controlfb: fix build for COMPILE_TEST=y && PPC_PMAC=y && PPC32=n

powerpc allyesconfig fails like this:

drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
  756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
      |                       ^~~~~~~~~~~~~~~~~~~
      |                       pgprot_cached
drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'

Fix it by adding missing PPC32 dependency.

Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: b/drivers/video/fbdev/controlfb.c
===================================================================
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -47,7 +47,7 @@
 #include <linux/nvram.h>
 #include <linux/adb.h>
 #include <linux/cuda.h>
-#ifdef CONFIG_PPC_PMAC
+#if defined(CONFIG_PPC_PMAC) && defined(CONFIG_PPC32)
 #include <asm/prom.h>
 #include <asm/btext.h>
 #endif
@@ -55,7 +55,7 @@
 #include "macmodes.h"
 #include "controlfb.h"
 
-#ifndef CONFIG_PPC_PMAC
+#if !defined(CONFIG_PPC_PMAC) || !defined(CONFIG_PPC32)
 #define invalid_vram_cache(addr)
 #undef in_8
 #undef out_8
