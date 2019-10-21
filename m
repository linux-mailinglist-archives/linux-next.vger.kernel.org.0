Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC1BDED66
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 15:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbfJUNVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 09:21:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60200 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbfJUNVY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 09:21:24 -0400
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iMXbA-00010Y-Lr; Mon, 21 Oct 2019 13:19:48 +0000
Date:   Mon, 21 Oct 2019 15:19:48 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191021131947.yih3wqjbfroaj4dz@wittgenstein>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
 <20191021131149.GA19358@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191021131149.GA19358@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 03:11:49PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 21, 2019 at 02:35:49PM +0200, Peter Zijlstra wrote:
> > On Fri, Oct 18, 2019 at 08:33:11AM -0700, Randy Dunlap wrote:
> > > On 10/18/19 12:03 AM, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Changes since 20191017:
> > > > 
> > > 
> > > on x86_64:
> > > lib/usercopy.o: warning: objtool: check_zeroed_user()+0x35f: call to __ubsan_handle_shift_out_of_bounds() with UACCESS enabled
> > 
> > Blergh... I suppose the below will fix that. I'm a bit conflicted on it
> > though, the alternative is annotating more ubsan crud.
> 
> By popular request; here's that alternative. Completely untested :-)

Am I not getting some mails? :)
I prefer this one as it allows us to avoid working around this in
usercopy.c. Should especially make if this potentially helps in other
cases as well?

> 
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
