Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AF82C8DCE
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 20:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgK3TQF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 14:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgK3TQD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 14:16:03 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526DDC0613CF;
        Mon, 30 Nov 2020 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=zRLl4Am2z3lS3pjFxRX/3zaKTLkSV2hTwMHlu/ANf0A=; b=U4UCi+AXhzH1Cbt6at7DQfFp27
        oxiFqMlh7v6xKc0WCk/fOm5So5N7FanCTA9jWPvEHaNRC4zlBj+zErjUgYefVcXbKfp46CZes0wVg
        WI6xsyO4E76/qm5k6Sa+hHnFmf4WJ7PJszcVFURVWgKwS/MKlkKmUSCuAomabBLEeOi3VXLzo/fvj
        Ixm/9OrtkuNWJ/cCnJeIKwu2aRdH5BBBxfR+4ieTJYYKVNa2TpzxuFRUjWap8ui50v3SzJylpouvC
        GGOwui558Ec1FXC9FM4bvcqXFZ+d8E9OpwbD+SPw4PHB8zQ4qm/Uj7XSpnwuDVvUvuIiqR6W+Ukeq
        DHXLZTXw==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kjodr-00022b-Tj; Mon, 30 Nov 2020 19:15:20 +0000
Subject: Re: [PATCH] signal/parics: Remove parsic specific definition of
 __ARCH_UAPI_SA_FLAGS
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
 <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
 <20201128084414.3daa87d2@canb.auug.org.au>
 <87pn3unbtv.fsf@x220.int.ebiederm.org>
 <87blfen46a.fsf_-_@x220.int.ebiederm.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5117dfaf-637d-34c2-048c-dd8dbbd15625@infradead.org>
Date:   Mon, 30 Nov 2020 11:15:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87blfen46a.fsf_-_@x220.int.ebiederm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/30/20 9:30 AM, Eric W. Biederman wrote:
> 
> Randy Dunlap wrote:
>> On 11/27/20 10:43 AM, Randy Dunlap wrote:
>>
>>> on parisc, _SA_SIGGFAULT is undefined and causing build errors.
>>>
>>> commit 23acdc76f1798b090bb9dcc90671cd29d929834e
>>> Author: Peter Collingbourne <pcc@google.com>
>>> Date:   Thu Nov 12 18:53:34 2020 -0800
>>>
>>>     signal: clear non-uapi flag bits when passing/returning sa_flags
>>>
>>>
>>>
>>> _SA_SIGGFAULT is not used or defined anywhere else in the
>>> kernel source tree.
>>
>>
>> Here is the build error (although it should be obvious):
>>
>> ../kernel/signal.c: In function 'do_sigaction':
>> ../arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function)
>>    24 | #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
>>       |                              ^~~~~~~~~~~~~
> 
> Stephen Rothwell pointed out:
>> _SA_SIGGFAULT was removed by commit
>>
>>   41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")
>>
>> which was added to Linus' tree in v5.10-rc1.
> 
> Solve this by removing the the parisc specific definition of
> __ARCH_UAPI_SA_FLAGS that was just added.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 23acdc76f179 ("signal: clear non-uapi flag bits when passing/returning sa_flags")
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Thanks, Eric.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


BTW, there are 2 typos for "parisc" in the Subject: line...


> ---
>  arch/parisc/include/asm/signal.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> I am applying this trivial fix to my signal-for-v5.11 branch.  Catalin
> you shouldn't need to do anything unless someone tests your tree on
> parisc.
> 
> diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
> index 30dd1e43ef88..715c96ba2ec8 100644
> --- a/arch/parisc/include/asm/signal.h
> +++ b/arch/parisc/include/asm/signal.h
> @@ -21,8 +21,6 @@ typedef struct {
>  	unsigned long sig[_NSIG_WORDS];
>  } sigset_t;
>  
> -#define __ARCH_UAPI_SA_FLAGS	_SA_SIGGFAULT
> -
>  #include <asm/sigcontext.h>
>  
>  #endif /* !__ASSEMBLY */
> 


-- 
~Randy
