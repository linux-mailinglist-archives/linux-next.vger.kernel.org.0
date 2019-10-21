Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6B5DF239
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 17:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfJUP7U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 11:59:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52730 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729834AbfJUP7U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 11:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0d3OdHhsitZEf36EB7P9JTYv0iehqwkuJU2AOWE/RWY=; b=eBddPsKavOfPc2ro/R1LvA0fu
        KQQ1doWWM83f5s4v39sPAnIBYHhrUjlEw7r0kmpH9NUo3mR7loUB6UYYlxqSDLiyAE2EHqwzAT3b8
        Sloa+4jqayPhiivA00AMwLyO558Kc3PKe8JD/PY83vyt7YUuBnpP11oi+BJcyEnVN8tdAjOHNPwnj
        ZN8wJ2AEI/0py49dRUz5ODNi4isc0NdCd6aVBIL/A7vH6YWx2h18PmBxr2Jlf6jBDoso8NSo1zY0C
        wQy25nBQzDCgsp11GTy9YmmrOt+p8ZCjxhVnRlLNTAmuhrkGHg4UvSQPYr/ckJe/jT6K64sbPhxq0
        VULIfKjiw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMa5S-0001tE-Ca; Mon, 21 Oct 2019 15:59:14 +0000
Subject: Re: linux-next: Tree for Oct 18 (objtool)
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org,
        christian.brauner@ubuntu.com
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0700728a-009e-739d-6349-e67359c5074a@infradead.org>
Date:   Mon, 21 Oct 2019 08:59:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021131149.GA19358@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/21/19 6:11 AM, Peter Zijlstra wrote:
> On Mon, Oct 21, 2019 at 02:35:49PM +0200, Peter Zijlstra wrote:
>> On Fri, Oct 18, 2019 at 08:33:11AM -0700, Randy Dunlap wrote:
>>> On 10/18/19 12:03 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20191017:
>>>>
>>>
>>> on x86_64:
>>> lib/usercopy.o: warning: objtool: check_zeroed_user()+0x35f: call to __ubsan_handle_shift_out_of_bounds() with UACCESS enabled
>>
>> Blergh... I suppose the below will fix that. I'm a bit conflicted on it
>> though, the alternative is annotating more ubsan crud.
> 
> By popular request; here's that alternative. Completely untested :-)

Both patch versions build-tested successfully.  Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  lib/ubsan.c           | 5 ++++-
>  tools/objtool/check.c | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index 39d5952c4273..0dce3ff45b5b 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -359,9 +359,10 @@ void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
>  	struct type_descriptor *lhs_type = data->lhs_type;
>  	char rhs_str[VALUE_LENGTH];
>  	char lhs_str[VALUE_LENGTH];
> +	unsigned long flags = user_access_save();
>  
>  	if (suppress_report(&data->location))
> -		return;
> +		goto out;
>  
>  	ubsan_prologue(&data->location);
>  
> @@ -387,6 +388,8 @@ void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
>  			lhs_type->type_name);
>  
>  	ubsan_epilogue();
> +out:
> +	user_access_restore(flags);
>  }
>  EXPORT_SYMBOL(__ubsan_handle_shift_out_of_bounds);
>  
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 543c068096b1..4768d91c6d68 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -482,6 +482,7 @@ static const char *uaccess_safe_builtin[] = {
>  	"ubsan_type_mismatch_common",
>  	"__ubsan_handle_type_mismatch",
>  	"__ubsan_handle_type_mismatch_v1",
> +	"__ubsan_handle_shift_out_of_bounds",
>  	/* misc */
>  	"csum_partial_copy_generic",
>  	"__memcpy_mcsafe",
> 


-- 
~Randy
