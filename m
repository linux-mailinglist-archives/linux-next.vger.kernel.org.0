Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BFB3AC2BB
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 07:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhFRFFa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 01:05:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64678 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231193AbhFRFFa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Jun 2021 01:05:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15I4ekJV050542;
        Fri, 18 Jun 2021 01:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2ydnrkHBg6fnhjgCtI9cMXcSBTbhCcux5VKPTMhEzPM=;
 b=iLCmwTH6TYfIN0rktEJvrjMDWaSWj67Igae6oIJ7PgnL9nZuK97i1Cnm9sLrcybxbpNb
 sDzBITj6K+CSDvloRuA7BW9JzyA5CHUcjjogKacALBot7RwkvA2DcRoTYUQftjSbHdoV
 6Vo0FTjE7nPuOOcsBF4xkgevqysnlELCqph0z5N2K+0FAuLG9jL5vf08j5F/ttMvJ5/1
 3cvQZqdqG3kO+iun7EVoG02qdg4HJZCxwDl8LItjMN/VV2AkWdDhhD+9N9Hz9Hklsfkr
 GvMshEV5RRSaPZOfqb0XkAenP7yaAFY3KGP7L7L+akf19JYkJ6BZC3JfBihZhB/Gl/2a HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 398kdqt7he-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 01:02:50 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15I4iMLe060784;
        Fri, 18 Jun 2021 01:02:49 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 398kdqt7gt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 01:02:49 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15I4vWvX022039;
        Fri, 18 Jun 2021 05:02:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma03ams.nl.ibm.com with ESMTP id 394mj8u371-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 05:02:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15I52j1R31195526
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 05:02:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8CBE74203F;
        Fri, 18 Jun 2021 05:02:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7E5ED42045;
        Fri, 18 Jun 2021 05:02:43 +0000 (GMT)
Received: from [9.77.205.195] (unknown [9.77.205.195])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 18 Jun 2021 05:02:43 +0000 (GMT)
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to
 `__compiletime_assert_342'
To:     Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-next@vger.kernel.org, clang-built-linux@googlegroups.com,
        lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
 <YMtTdU2b9fI3dnFD@casper.infradead.org> <YMuOSnJsL9qkxweY@archlinux-ax161>
From:   "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6f3c5317-2877-9a57-0126-e9305f000269@linux.ibm.com>
Date:   Fri, 18 Jun 2021 10:32:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMuOSnJsL9qkxweY@archlinux-ax161>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KhHjSAm-d0ZelsT_a4H8fgIMkznLNc1z
X-Proofpoint-GUID: 6tc93sbjgoVTXTqU4G_PjrCr1DOBa4zE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_17:2021-06-15,2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180024
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/17/21 11:32 PM, Nathan Chancellor wrote:
> Rebuilt the CC list because most people were added based on the
> incorrect bisect result.
> 
> On Thu, Jun 17, 2021 at 02:51:49PM +0100, Matthew Wilcox wrote:
>> On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
>>> On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>> x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
>>>> mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
>>>
>>> The git bisect pointed out the first bad commit.
>>>
>>> The first bad commit:
>>> commit 928cf6adc7d60c96eca760c05c1000cda061604e
>>> Author: Stephen Boyd <swboyd@chromium.org>
>>> Date:   Thu Jun 17 15:21:35 2021 +1000
>>>      module: add printk formats to add module build ID to stacktraces
>>
>> Your git bisect probably went astray.  There's no way that commit
>> caused that regression.
> 
> My bisect landed on commit 83f85ac75855 ("mm/mremap: convert huge PUD
> move to separate helper"). flush_pud_tlb_range() evaluates to
> BUILD_BUG() when CONFIG_TRANSPARENT_HUGEPAGE is unset but this function
> is present just based on the value of
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> 
> $ make -skj(nproc) ARCH=x86_64 CC=clang O=build/x86_64 distclean allnoconfig mm/mremap.o
> 
> $ llvm-readelf -s build/x86_64/mm/mremap.o &| rg __compiletime_assert
>      21: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT   UND __compiletime_assert_337
> 
> $ rg TRANSPARENT_ build/x86_64/.config
> 450:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> 451:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> 562:# CONFIG_TRANSPARENT_HUGEPAGE is not set
> 
> Not sure why this does not happen on newer clang versions, presumably
> something with inlining decisions? Still seems like a legitimate issue
> to me.
> 

gcc 10 also doesn't give a build error. I guess that is because we evaluate

      if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {

  to if (0) with CONFIG_TRANSPARENT_HUGEPAGE disabled.

switching that to if (1) do results in BUILD_BUG triggering.

Should we fix this ?

modified   mm/mremap.c
@@ -336,7 +336,7 @@ static inline bool move_normal_pud(struct 
vm_area_struct *vma,
  }
  #endif

-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) && 
defined(CONFIG_TRANSPARENT_HUGEPAGE)
  static bool move_huge_pud(struct vm_area_struct *vma, unsigned long 
old_addr,
  			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
  {

