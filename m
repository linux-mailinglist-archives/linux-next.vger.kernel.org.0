Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00AE2F7151
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 11:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfKKKEI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 05:04:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:58620 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726768AbfKKKEI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 05:04:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 87B4FB166;
        Mon, 11 Nov 2019 10:04:06 +0000 (UTC)
Date:   Mon, 11 Nov 2019 11:04:06 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the tip tree with the xtensa tree
Message-ID: <20191111100406.GB1730@zn.tnic>
References: <20191111143154.13b0a7ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191111143154.13b0a7ac@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 11, 2019 at 02:31:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/xtensa/kernel/vmlinux.lds.S
> 
> between commit:
> 
>   158b6b99ba7b ("xtensa: merge .fixup with .text")
> 
> from the xtensa tree and commits:
> 
>   eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA")
>   94174c9b71c6 ("xtensa: Move EXCEPTION_TABLE to RO_DATA segment")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/xtensa/kernel/vmlinux.lds.S
> index c64abc15d38f,0043d5858f14..000000000000
> --- a/arch/xtensa/kernel/vmlinux.lds.S
> +++ b/arch/xtensa/kernel/vmlinux.lds.S
> @@@ -124,17 -126,16 +126,15 @@@ SECTION
>   
>     . = ALIGN(16);
>   
> -   RODATA
> +   RO_DATA(4096)
>   
> -   EXCEPTION_TABLE(16)
> -   NOTES
>  -  /*  Relocation table */
>  -
>  -  .fixup   : { *(.fixup) }
>  -
>     /* Data section */
>   
>  +#ifdef CONFIG_XIP_KERNEL
>  +  INIT_TEXT_SECTION(PAGE_SIZE)
>  +#else
>     _sdata = .;
> -   RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
> +   RW_DATA(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
>     _edata = .;
>   
>     /* Initialization code and data: */

LGTM.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
