Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786D43A8339
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 16:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFOOwj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 10:52:39 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4696 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229937AbhFOOwj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 10:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1623768635; x=1655304635;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=h7JitUKvd260OU0nQerm2mqsf2MMNeE1rFFHSDrosFY=;
  b=a0iHLL829tBpaU4JPI++sn/iuJDZXlAVmWgfs2KU7z3WUPS+KETsZlk9
   bwXkJd/EXYYwHNWPknG+egYOWP5zx5N9wimRu3kXVJXB8DpSAqRqV72pQ
   7b3GEW7gfUkaf1R10F/857VLsURiBvmNFY9M/hUQpBKVsjvBi4ypS3GIk
   M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2021 07:50:34 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Jun 2021 07:50:34 -0700
Received: from [10.111.175.185] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 15 Jun
 2021 07:50:32 -0700
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
To:     Mark Rutland <mark.rutland@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, <lkft-triage@lists.linaro.org>,
        <regressions@lists.linux.dev>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
 <20210615124745.GA47121@C02TD0UTHF1T.local>
 <20210615131902.GB47121@C02TD0UTHF1T.local>
From:   Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <076665b9-9fb1-71da-5f7d-4d2c7f892103@quicinc.com>
Date:   Tue, 15 Jun 2021 10:50:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615131902.GB47121@C02TD0UTHF1T.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 6/15/2021 9:19 AM, Mark Rutland wrote:
> Looking some more, it looks like that's correct in isolation, but it
> clashes with commit:
> 
>   5831eedad2ac6f38 ("mm: replace CONFIG_NEED_MULTIPLE_NODES with CONFIG_NUMA")

Just a data point. Reverting the commit alone fixed the same crash for me.
