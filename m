Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9ACE128A
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 08:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733296AbfJWG4F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 02:56:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41312 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfJWG4F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 02:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WgOs9pzdvdtNRCgzQWI6VcaIx+3VIwVkgD8z52aiT5g=; b=dNOT3gDUaGYOa6WU8rTLoR1cE
        7yDkzHxc3jklpk9EyxqlN+oGw4L1VU0Z4CBtmDooh6tZpZkvuwPIT2+GGYMXQqkF/v49ofJvaRezD
        Lc+C24kvDOFNncGA2U5VbiSmgtxBWSPTeYDC9dWd545cOxviTyf0GG2+Tr5UuRRP6tr2f6gQ9jkf+
        n2F1nZTHpRJvXnllmn8JZ9SAghXN0o5MJFgfc4gZlX5YkNy4rERKBqKn2Ev74wQKEKLoOHbC36b7A
        0qz4jXBHrITP99kbuAtPFiTibRhs43cCPLde7X7HVYXzAY6GqdbJjV8fH7ogiSJ82jI6PVzICivVG
        jaCs9BLeA==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iNAYt-00039t-J2; Wed, 23 Oct 2019 06:56:03 +0000
Subject: Re: linux-next: Tree for Oct 23
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salyzyn <salyzyn@android.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20191023155519.2d6765d4@canb.auug.org.au>
 <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
 <CAMuHMdX1rhmvpWBHzvDYRNeYyotNp2ct1ysy4Jd0SjVUvGJd-Q@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <46ae49f0-dbf0-0f11-3eba-e81197efbed0@infradead.org>
Date:   Tue, 22 Oct 2019 23:56:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX1rhmvpWBHzvDYRNeYyotNp2ct1ysy4Jd0SjVUvGJd-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/19 11:44 PM, Geert Uytterhoeven wrote:
> On Wed, Oct 23, 2019 at 8:17 AM Shaokun Zhang
> <zhangshaokun@hisilicon.com> wrote:
>> +Cc: Mark Salyzyn
>>
>> There is a compiler failure on arm64 platform, as follow:
>> zhangshaokun@ubuntu:~/linux-next$ make -j64
>>   CALL    scripts/atomic/check-atomics.sh
>>   CC      arch/arm64/kernel/asm-offsets.s
>> In file included from ./include/linux/sysctl.h:30:0,
>>                  from ./include/linux/umh.h:9,
>>                  from ./include/linux/kmod.h:9,
>>                  from ./include/linux/module.h:13,
>>                  from ./include/linux/acpi.h:29,
>>                  from ./include/acpi/apei.h:9,
>>                  from ./include/acpi/ghes.h:5,
>>                  from ./include/linux/arm_sdei.h:8,
>>                  from arch/arm64/kernel/asm-offsets.c:10:
>> ./include/uapi/linux/sysctl.h:561:29: error: expected ‘,’ or ‘}’ before ‘__attribute__’
>>   NET_IPV6_TEMP_PREFERED_LFT __attribute__((deprecated)) = /* NOTYPO */
>>                              ^
>> scripts/Makefile.build:99: recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
>> make[1]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
>> Makefile:1108: recipe for target 'prepare0' failed
>> make: *** [prepare0] Error 2
>>
>> It's the commit <79f0cf35dccb> ("treewide: cleanup: replace prefered with preferred").
> 
> After receiving a report from kisskb for failures for m68k, looking at
> http://kisskb.ellerman.id.au/kisskb/head/f3c452cfc59c817950b150b51ec2b33409d7640b/
> and doing some testing, it looks like this construct is supported by gcc-7
> and gcc-8, but not by gcc-4.6.3 and gcc-5. Don't know about gcc-6.

I guess that's a different problem than the misspelled PREFERED before the __attribute__.

-- 
~Randy
