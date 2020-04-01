Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C32519B8D0
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 01:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733134AbgDAXHR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 19:07:17 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50808 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732537AbgDAXHR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 19:07:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031MwhpO164605;
        Wed, 1 Apr 2020 23:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=WL5Ur7dzF+Qcn/2z3vKEegL5D74WYKvJ8n1LOfA9uOE=;
 b=w+GLq3HaXQu4+PncOjDFxxH7fndneBEQ3FAiP1ll91i1iKMfVXmdkkTmJBKv+2r24x/o
 P9/TPXF9t5ugmwddRsazE0QXzpNAr6H7n1uO4J4aDtApEhmQ17FhdH+cHffVJvKjIJUO
 jCilJcm/jCQZv+AMvHhwau5Nt2xkpZZhpNhP/w/o7IfmDcKJvWgrIv4u6rLhotEQrQWA
 4EDPKGkvAeC8IVADefz3dDTf01DTJrLn466q/XjwisiDQxCjBIRGx+WBiynapN/y44wn
 iWhLDFZfZeYTOKJupP2dScvMHXFyjRqEWrFTvNNMjT35a8KX3jsX8Ane6LtEp/sYhG50 rQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 303aqhrscb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Apr 2020 23:06:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031MuuDG188039;
        Wed, 1 Apr 2020 23:06:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 302g2hdwte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Apr 2020 23:06:50 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 031N6l6K024907;
        Wed, 1 Apr 2020 23:06:47 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 01 Apr 2020 16:06:47 -0700
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Jason Gunthorpe <jgg@mellanox.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Longpeng <longpeng2@huawei.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
References: <20200331195612.64c06485@canb.auug.org.au>
 <20200401155831.24aa79ebbb14c654a2bee8c0@linux-foundation.org>
 <20200401230024.GY8514@mellanox.com>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <ed7a058f-ca84-2f0f-4d22-ce1eb8ce0645@oracle.com>
Date:   Wed, 1 Apr 2020 16:06:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401230024.GY8514@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010190
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010190
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/1/20 4:00 PM, Jason Gunthorpe wrote:
> On Wed, Apr 01, 2020 at 03:58:31PM -0700, Andrew Morton wrote:
>> On Tue, 31 Mar 2020 19:56:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> Hi all,
>>>
>>> After merging the akpm-current tree, today's linux-next build (i386
>>> defconfig) produced this warning:
>>>
>>> mm/hugetlb.c: In function 'huge_pte_offset':
>>> cc1: warning: function may return address of local variable [-Wreturn-local-addr]
>>> mm/hugetlb.c:5361:14: note: declared here
>>>  5361 |  pud_t *pud, pud_entry;
>>>       |              ^~~~~~~~~
>>> cc1: warning: function may return address of local variable [-Wreturn-local-addr]
>>> mm/hugetlb.c:5360:14: note: declared here
>>>  5360 |  p4d_t *p4d, p4d_entry;
>>>       |              ^~~~~~~~~
>>>
>>> Introduced by commit
>>>
>>>   826ddc88e2cf ("mm/hugetlb: fix a addressing exception caused by huge_pte_offset")
>>
>> I can reproduce this (i386 defconfig, gcc-7.2.0).
>>
>> I can see no way in which this makes any sense.  Hopefully it's a gcc
>> bug but it's hard to see how it could have messed up this fairly simple
>> code.
> 
> It is a code bug, there was a little thread about this. It happens
> because the address of a stack variable is passed into the pXX_offset
> functions which return that address when the page levels are folded.
> 
> I recommend to drop this patch until it is adjusted..

Yes, this patch causes at least the BUG here,

https://lore.kernel.org/linux-mm/CA+G9fYsJgZhhWLMzUxu_ZQ+THdCcJmFbHQ2ETA_YPP8M6yxOYA@mail.gmail.com/

-- 
Mike Kravetz
