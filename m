Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04DF439082
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 09:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhJYHoh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 03:44:37 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53738 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJYHog (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 03:44:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0BD772177B;
        Mon, 25 Oct 2021 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635147734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B9Gr/w87oM1GZ6knpFYEuN+eOPWXlt8HDTDNPK9BBSY=;
        b=y2HW7dVtfcj27VspmqKPNU0vRwqjRPMVUaOe7ZjJh562WBTPzkXVpfBDTnVVlr5Qe9UqqK
        FMaL73DHRGurf/2m651IXqh1NBfVmLaIaiuIyVZi9TXgjZ70MY06nMfA4KVkPM9LVlqgif
        +0BNDmtfkDBM3UuwIoQTTN1PHZfrR8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635147734;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B9Gr/w87oM1GZ6knpFYEuN+eOPWXlt8HDTDNPK9BBSY=;
        b=HkSe65rJNoA5urH9PqVAC9HPPx6Q1ThFGr8UPUPcBYYMPTWpGrFKmwGLdElwheyd8brAvH
        IxqA9rrmINT5n2DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEBC81342A;
        Mon, 25 Oct 2021 07:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ph15OdVfdmENEQAAMHmgww
        (envelope-from <bp@suse.de>); Mon, 25 Oct 2021 07:42:13 +0000
Date:   Mon, 25 Oct 2021 09:42:12 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YXZf1KAgWobGNO5a@zn.tnic>
References: <20211025151144.552c60ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211025151144.552c60ca@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Oct 25, 2021 at 03:11:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/kernel/fpu/core.c: In function 'fpu_alloc_guest_fpstate':
> arch/x86/kernel/fpu/core.c:187:12: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
>   187 |  fpstate = vzalloc(size);
>       |            ^~~~~~~
>       |            kzalloc
> arch/x86/kernel/fpu/core.c:187:10: error: assignment to 'struct fpstate *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   187 |  fpstate = vzalloc(size);
>       |          ^
> arch/x86/kernel/fpu/core.c: In function 'fpu_free_guest_fpstate':
> arch/x86/kernel/fpu/core.c:212:2: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
>   212 |  vfree(fps);
>       |  ^~~~~
>       |  kfree
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup")
> 
> I have applied the following patch for today (because it was quicker
> than using the tip tree from next-20211022).

I cannot reproduce here. It could be uncovered by some stuff you merge
before tip/auto-latest or so.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 Oct 2021 15:04:13 +1100
> Subject: [PATCH] x86/fpu: include vmalloc.h for vzalloc etc
> 
> Fixes: 69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/fpu/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
> index 9c475e2efd4d..c55013fc82ab 100644
> --- a/arch/x86/kernel/fpu/core.c
> +++ b/arch/x86/kernel/fpu/core.c
> @@ -16,6 +16,7 @@
>  
>  #include <linux/hardirq.h>
>  #include <linux/pkeys.h>
> +#include <linux/vmalloc.h>
>  
>  #include "context.h"
>  #include "internal.h"
> -- 

I'm thinking I could simply fold in your change into 69f6ed1d14c6 ...

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
