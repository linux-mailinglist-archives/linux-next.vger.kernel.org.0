Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4FFCF0581
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 19:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390457AbfKES5P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 13:57:15 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45132 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390651AbfKES5P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 13:57:15 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5Ie0N5004984;
        Tue, 5 Nov 2019 18:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=B6MKKzfbNgjx/kFsRlq8otjS+qYaBD7mQ/iKB+gBQeA=;
 b=bjbAQX6KZmJ8MdCiw4YdUoTZ3UFdpaej6XWrZWm2ae26k9xkS1inIXz4LOcZfDc4h2kJ
 elzMbMDTy20WLYHEO07GW2tk523SMvtjhoMgayYeeWmdzOXs+saFAtwt9Li3gWMx22C0
 Cdu5i9W9WozjafXptMUR3kGoz/H7dj6VXfHR7JydGqGY3trsLVW2nJ1l1hv7rhqPmWXu
 t0utcZUvEo3aRv2/cL03lyc0Wp1Q3rLkaK5ADsKg4Z9K1UX/a1bUfJtVRx6kZFeGaR/M
 7dUuSZqZhGfeBRbFZgP+BH0XZNGGYocPUVHjF/uk0Cousjv9jC4Qk7fNechaveQAzGU6 pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2w12er8hj5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Nov 2019 18:57:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5IdLkn032481;
        Tue, 5 Nov 2019 18:57:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2w35ppea0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Nov 2019 18:57:02 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA5Iv06t026257;
        Tue, 5 Nov 2019 18:57:00 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 Nov 2019 10:57:00 -0800
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191105211920.787df2ab@canb.auug.org.au>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <dfffdd41-611c-e9c3-d059-6339c3bc0c47@oracle.com>
Date:   Tue, 5 Nov 2019 10:56:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105211920.787df2ab@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911050155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911050155
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/5/19 2:19 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> In file included from arch/powerpc/mm/mem.c:30:
> include/linux/hugetlb.h:233:19: error: redefinition of 'pmd_huge'
>   233 | static inline int pmd_huge(pmd_t pmd)
>       |                   ^~~~~~~~
> In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
>                  from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>                  from arch/powerpc/include/asm/book3s/64/mmu.h:46,
>                  from arch/powerpc/include/asm/mmu.h:356,
>                  from arch/powerpc/include/asm/lppaca.h:47,
>                  from arch/powerpc/include/asm/paca.h:17,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from arch/powerpc/mm/mem.c:16:
> arch/powerpc/include/asm/book3s/64/pgtable-4k.h:74:19: note: previous definition of 'pmd_huge' was here
>    74 | static inline int pmd_huge(pmd_t pmd) { return 0; }
>       |                   ^~~~~~~~
> In file included from arch/powerpc/mm/mem.c:30:
> include/linux/hugetlb.h:238:19: error: redefinition of 'pud_huge'
>   238 | static inline int pud_huge(pud_t pud)
>       |                   ^~~~~~~~
> In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
>                  from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>                  from arch/powerpc/include/asm/book3s/64/mmu.h:46,
>                  from arch/powerpc/include/asm/mmu.h:356,
>                  from arch/powerpc/include/asm/lppaca.h:47,
>                  from arch/powerpc/include/asm/paca.h:17,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from arch/powerpc/mm/mem.c:16:
> arch/powerpc/include/asm/book3s/64/pgtable-4k.h:75:19: note: previous definition of 'pud_huge' was here
>    75 | static inline int pud_huge(pud_t pud) { return 0; }
>       |                   ^~~~~~~~
> 
> Caused by commit
> 
>   9823e12e021f ("hugetlbfs: convert macros to static inline, fix sparse warning")
> 
> I have reverted that commit for today.

Thanks Stephen,

I will fix up and send another version via Andrew's tree.

-- 
Mike Kravetz
