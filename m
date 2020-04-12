Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9AD81A5D05
	for <lists+linux-next@lfdr.de>; Sun, 12 Apr 2020 08:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDLGW1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 02:22:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50686 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgDLGW1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 02:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=TLR0jG8SVlsNfVKq1lmbl+a1kd+nOtWGR1Y3S14e3zU=; b=fURbKefqdhVksNv5MgH7xKehEI
        Ze4Gs6y6vAaND0wAkAcy7gaMJI3bjCOxFbtKhfF5MX8Czz8Ps2V9UV6aBPsjM0cdV/+SKSfQggK5l
        7f1m0NE1w52sP139N01th+wxHh0UREglhkAw6nI2mjWY8xyhved4u9+cBkem2IYqt5QmGVJeKhuMM
        uYC8ffPwcaOPxskBUAYCe2+ENHJhk7JRjp82Y3uuKnzr4HeKYZJMbAvZbGxNuKXP4tjdOD3AJ4Rqf
        PAflLHdmrn6plcA6pIyQUPaPGOGfTi3qhhBQ57hpr3SU/1oCjlfp8ycRxP7iOxEGBXJg482fnP8ky
        ZoMlPGcQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jNW0a-0002OY-63; Sun, 12 Apr 2020 06:22:20 +0000
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Brendan Higgins <brendanhiggins@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200410132706.170811b7@canb.auug.org.au>
 <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org>
 <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
 <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
 <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f90fc906-395b-79be-8f44-3807586766f7@infradead.org>
Date:   Sat, 11 Apr 2020 23:22:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/20 10:36 PM, Naresh Kamboju wrote:
> FYI,
> 
> Is this problem related to,
> 
> Regression reported on Linux next 5.6.0-rc4-next-20200305 on x86_64,
> i386, arm and arm64. The steps to reproduce is running kselftests lib
> printf.sh test case.
> Which is doing modprobe operations.
> 
> BUG: kernel NULL pointer dereference, address: 00 - ida_free+0x76/0x140
> 
> https://lore.kernel.org/linux-kselftest/CAFd5g46Bwd8HS9-xjHLh_rB59Nfw8iAnM6aFe0QPcveewDUT6g@mail.gmail.com/T/
> 

Looks similar. Lots of fwnode, software_node, ida stuff there.


thanks.
-- 
~Randy

