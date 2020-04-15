Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF64A1AB170
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 21:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440357AbgDOTRB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 15:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437909AbgDOTQx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 15:16:53 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF48C061A0C;
        Wed, 15 Apr 2020 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=XpaPanv1P8dxEy8FWJJXMKpNO3YbUQ5peJRz4Dbpbbc=; b=gGS2zUUaAdPJoqNmMnnZpkxb+X
        I9saZqG+BFe4uyf5jhZSM8T2w3EnlsbJ3GsmHI7HB2SnFNoF8Bo6rr1ZI/nmitRPBDcaqG3UPUmrs
        yRGIaQxS9ZO08/AQUIJ6gKkITOnVM+9igfKuHn8Igyq4fqTQtY4XpmobWOLmdP2+LhYwZM57yZDu7
        4vET80BOlTyFSU1f61QE0LdtAb5GXW4Vcz1hvcBUG+W2UV+oVON0S+wZ/haFuokER+rmafEIzyTzH
        /TRBTuIkIeiCVMOqoB9Qzkk9oErSbZP6rQKyHvobv/S/zdzgjwPS7k3DmU/LTOXAaPieKd7xHCmOa
        KAmQiAKA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOnWl-0000Eo-4n; Wed, 15 Apr 2020 19:16:51 +0000
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Steven Rostedt <rostedt@goodmis.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200410132706.170811b7@canb.auug.org.au>
 <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org>
 <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
 <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
 <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com>
 <f90fc906-395b-79be-8f44-3807586766f7@infradead.org>
 <CAFd5g46ZaEVoMb2hO94A41Z=YH6ntTdXstZUhHu67mwOKY+QsA@mail.gmail.com>
 <20200415185545.GA1632@home.goodmis.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26e0f0dd-4ea2-14e7-fae5-81a5a1451272@infradead.org>
Date:   Wed, 15 Apr 2020 12:16:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415185545.GA1632@home.goodmis.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/15/20 11:55 AM, Steven Rostedt wrote:
> On Tue, Apr 14, 2020 at 12:26:29PM -0700, Brendan Higgins wrote:
>> On Sat, Apr 11, 2020 at 11:22 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 4/11/20 10:36 PM, Naresh Kamboju wrote:
>>>> FYI,
>>>>
>>>> Is this problem related to,
>>>>
>>>> Regression reported on Linux next 5.6.0-rc4-next-20200305 on x86_64,
>>>> i386, arm and arm64. The steps to reproduce is running kselftests lib
>>>> printf.sh test case.
>>>> Which is doing modprobe operations.
>>>>
>>>> BUG: kernel NULL pointer dereference, address: 00 - ida_free+0x76/0x140
>>>>
>>>> https://lore.kernel.org/linux-kselftest/CAFd5g46Bwd8HS9-xjHLh_rB59Nfw8iAnM6aFe0QPcveewDUT6g@mail.gmail.com/T/
>>>>
>>>
>>> Looks similar. Lots of fwnode, software_node, ida stuff there.
>>
>> Sorry for the late reply, I was out.
>>
>> Yeah, I am pretty sure it is the same. Heikki proposed a fix that I am
>> going to try.
> 
> My test suite just tripped over this bug. Is this the patch that you think
> fixes it?
> 
> https://lore.kernel.org/linux-kselftest/20200414081513.GD2828150@kuha.fi.intel.com

Yes, it is, but GregKH and Rafael Wysocki don't seem to like that patch
and are suggesting some changes in lib/kobject.c (only pseudocode,
no patch yet).

> I'll add it to see if I can continue my testing.

See the thread
[PATCH v1] kobject: make sure parent is not released before children

Here is Rafael's suggestion:
https://lore.kernel.org/linux-kselftest/CAJZ5v0hNemTDVa_S-FfVMbrKjM-RWYoHh88asnUvTNxZinY2cw@mail.gmail.com/

-- 
~Randy

