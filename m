Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F7A2CAF07
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 22:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgLAVm6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 16:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgLAVm6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 16:42:58 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38563C0613CF;
        Tue,  1 Dec 2020 13:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=l2Oeae6NL0kFSKsvco8NQ4DdQYBwC13sDMqlLfGc8OE=; b=pR6bQ/XUgLVbQTp4ph8cQdbBuh
        shsDS+CMsbdUQulEYZWA0i2P3TEUzjpHnmam3JlHLyYucLAC2p6wPPXQuZy1sBkcygWeunnldhryc
        2vBmkaz99xy6+K9qemjoFakepe0t1mm+vaPMd7I9Ps/1MDoMnorm6WwM0rXO7AGM7BlxDEPs9O1+3
        1AiqzkLQdid5fhMy7HzTph6XcIsWq5dauQ8ZIeTSdtm/HpFosXHqmb+m3aejhkJtiIVhfQdyOzuAk
        XShV32nJsEK5MIvt0orhHpZvM2VgMElEbYvTZVBK+Ev5tyd9nMJGdlukaIYHgzjDA3zGZW4FgDw3Y
        3kMtx24A==;
Received: from [2601:1c0:6280:3f0::1494]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkDPc-0006Bb-27; Tue, 01 Dec 2020 21:42:16 +0000
Subject: Re: linux-next: Tree for Dec 1 [crypto/aegis128.ko]
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ondrej Mosnacek <omosnacek@gmail.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20201201210349.7f617c65@canb.auug.org.au>
 <6a11bb20-2e3b-e106-8030-019580d176b1@infradead.org>
 <CAMj1kXFiv64fCs8yxm-Z3fktKGcOgWHCdbWrc_921mcx=_54vg@mail.gmail.com>
 <0a1696a3-b4ca-be1f-f50d-2dcd903f074c@infradead.org>
Message-ID: <271b8e92-b134-4447-e56e-c9fc9f60da94@infradead.org>
Date:   Tue, 1 Dec 2020 13:42:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0a1696a3-b4ca-be1f-f50d-2dcd903f074c@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/1/20 1:37 PM, Randy Dunlap wrote:
> On 12/1/20 1:29 PM, Ard Biesheuvel wrote:
>> On Tue, 1 Dec 2020 at 20:53, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 12/1/20 2:03 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20201130:
>>>>
>>>
>>> on i386 or x86_64:
>>>
>>> CONFIG_CRYPTO_AEGIS128=m
>>> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
>>>
>>>
>>> ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefined!
>>>
>>
>> Fix posted here.
>> https://lore.kernel.org/linux-crypto/20201130122620.16640-1-ardb@kernel.org/
>>
> 

thanks. That works for me also.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


>> Which compiler version are you using? This does not reproduce for me
>> with GCC 7.5.0
>>
> 
> gcc (SUSE Linux) 7.5.0
> 
> You could try the attached x86_64 randconfig file...
> 


-- 
~Randy

