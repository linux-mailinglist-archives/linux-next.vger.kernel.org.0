Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F61CF9849
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 19:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfKLSMl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 13:12:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36232 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfKLSMl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 13:12:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACI4ImR048502;
        Tue, 12 Nov 2019 18:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=HFK7hmQptaUwos03Cqcu6qFFSCxbEbNwSYfgrcqwYKQ=;
 b=nBpFLDnTkCSs5iQkMHOpnIt9In6sWjzjCFFiGRRycjguTXewTmivmsXUcJuquIhjzfae
 aTGFzaA2vUwF/Wx9YUdCgSeRv0ObjbgVRQmj9RbtdM7rtOPG8kkJqmbItADZkvlWUcF6
 l/NE1WIYTv2v7lEEDcD0cIx8dRJS7Kwo7BkRmTTUvoJwUClRWwKPfqgRV4Lf4fXeUvye
 WQR0RnioroqROb5zVAD7jhqg3xd881k1o8aWyFiIawri7GW4g/NK59OzXLeEl9EDIQG0
 EvCLBdqt0XGtOp9wbKnciOCUOXO5kIe+BnmDiZmlJ0jq74AdQ0yVp4qcl1Lc13lWJ2rb dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2w5ndq6ph7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Nov 2019 18:12:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACI3ffh072283;
        Tue, 12 Nov 2019 18:12:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2w7j022m7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Nov 2019 18:12:27 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xACICQCg024313;
        Tue, 12 Nov 2019 18:12:26 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 12 Nov 2019 18:12:26 +0000
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20191105211920.787df2ab@canb.auug.org.au>
 <0892a018-152f-629d-3dd0-60ce79f2887b@oracle.com>
 <871rue4so0.fsf@mpe.ellerman.id.au> <87v9rp3o5e.fsf@mpe.ellerman.id.au>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <59d733a0-8250-606d-962b-4170e6e1b4fa@oracle.com>
Date:   Tue, 12 Nov 2019 10:12:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87v9rp3o5e.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120155
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/11/19 4:59 PM, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>>
>> Mike Kravetz <mike.kravetz@oracle.com> writes:
>>> On 11/5/19 2:19 AM, Stephen Rothwell wrote:
> ...
>>> From 4b3ab017e639e4e583fff801e6d8e6727b7877e8 Mon Sep 17 00:00:00 2001
>>> From: Mike Kravetz <mike.kravetz@oracle.com>
>>> Date: Tue, 5 Nov 2019 15:12:15 -0800
>>> Subject: [PATCH] powerpc/mm: remove pmd_huge/pud_huge stubs and include
>>>  hugetlb.h
>>>
>>> This removes the power specific stubs created by commit aad71e3928be
>>> ("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") used when
>>> !CONFIG_HUGETLB_PAGE.  Instead, it addresses the build break by
>>> getting the definitions from <linux/hugetlb.h>.
>>>
>>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>>> ---
>>>  arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 3 ---
>>>  arch/powerpc/include/asm/book3s/64/pgtable-64k.h | 3 ---
>>>  arch/powerpc/mm/book3s64/radix_pgtable.c         | 1 +
>>>  3 files changed, 1 insertion(+), 6 deletions(-)
>>
>> The two pgtable headers are included eventually by our top-level
>> pgtable.h, and that is included by over 100 files. So I worry this is
>> going to break the build somewhere in some obscure configuration.
>>
>> I'll push it through some test builds and see what happens.
> 
> Seems OK, it didn't introduce any new build failures.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>

Thank you Michael!

I'll add it to the other patch as a 'proper series' so this can be a
requisite patch for the other.

-- 
Mike Kravetz
