Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9889243160D
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 12:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhJRK2x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 06:28:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231609AbhJRK2m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Oct 2021 06:28:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1110E6103D;
        Mon, 18 Oct 2021 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634552791;
        bh=ay2dJkSWk8dvggCwDM2rFTldFfZHxJ1l8l8yY5Ebeqk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lySFvHpQ4quAbHwn3m0kiK+OCNz9N6Rk0AMNZFjmT+1UfkGCvXlaoQt3vvl8V+0B4
         PLO4j+DLFHRYMFCJI/b76JfdbQPw6zq+H2UiskimnNn4rOjUG92O6DSQvu5KPeDXKW
         +kMg9XejnQfMKSd6+J52IvPGSv5ubDN+AEUiccSC9SlivZh23PgN8sycQb/lNFlfnk
         O3ji/LAsTvuu0w0mKDY1k8F7yKGaPx0Vj/Xazg5gd1SpmjMmyoNLzzeWIi64NuTgs5
         2pG2dtUnOceXB9asJTb1dPuFSjiUIt00wjeYp2InDl72BJl1H2+CwZ90+TgE3IraTX
         ezmiA/DephvDQ==
Date:   Mon, 18 Oct 2021 13:26:25 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <YW1L0fs84tn0pIR2@kernel.org>
References: <20211018192940.3d1d532f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018192940.3d1d532f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 18, 2021 at 07:29:40PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> init/main.c: In function 'xbc_make_cmdline':
> init/main.c:384:3: error: implicit declaration of function 'memblock_free_ptr'; did you mean 'memblock_free_late'? [-Werror=implicit-function-declaration]
>   384 |   memblock_free_ptr(new_cmdline, len + 1);
>       |   ^~~~~~~~~~~~~~~~~
>       |   memblock_free_late
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   d6e96e5e2e23 ("memblock: use memblock_free for freeing virtual pointers")
> 
> interacting with commit
> 
>   1ae43851b18a ("bootconfig: init: Fix memblock leak in xbc_make_cmdline()")
> 
> from Linus' tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Oct 2021 19:25:44 +1100
> Subject: [PATCH] fixup for "memblock: use memblock_free for freeing virtual
>  pointers"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks!

Andrew, can you please add this as a fixup to "memblock: use memblock_free
for freeing virtual pointers"?

> ---
>  init/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 9b7fdd04e8cb..2851ebbe1985 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -381,7 +381,7 @@ static char * __init xbc_make_cmdline(const char *key)
>  	ret = xbc_snprint_cmdline(new_cmdline, len + 1, root);
>  	if (ret < 0 || ret > len) {
>  		pr_err("Failed to print extra kernel cmdline.\n");
> -		memblock_free_ptr(new_cmdline, len + 1);
> +		memblock_free(new_cmdline, len + 1);
>  		return NULL;
>  	}
>  
> -- 
> 2.33.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Sincerely yours,
Mike.
