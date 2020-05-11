Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE781CD8B8
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 13:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgEKLns (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 07:43:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:48916 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgEKLnr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 07:43:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9EA4FADC1;
        Mon, 11 May 2020 11:43:48 +0000 (UTC)
Date:   Mon, 11 May 2020 13:43:44 +0200 (CEST)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Jiri Kosina <jikos@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the livepatching tree with the
 modules tree
In-Reply-To: <20200508180524.6995b07e@canb.auug.org.au>
Message-ID: <alpine.LSU.2.21.2005111341390.24623@pobox.suse.cz>
References: <20200508180524.6995b07e@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 8 May 2020, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the livepatching tree got a conflict in:
> 
>   kernel/module.c
> 
> between commits:
> 
>   db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT_MODULE_RWX #ifdefs")
>   5c3a7db0c7ec ("module: Harden STRICT_MODULE_RWX")
> 
> from the modules tree and commit:
> 
>   e6eff4376e28 ("module: Make module_enable_ro() static again")
> 
> from the livepatching tree.
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
> diff --cc kernel/module.c
> index c69291362676,a26343ea4d50..000000000000
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@@ -2055,29 -2023,20 +2042,30 @@@ static void module_enable_nx(const stru
>   	frob_writable_data(&mod->init_layout, set_memory_nx);
>   }
>   
>  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  +				       char *secstrings, struct module *mod)
>  +{
>  +	const unsigned long shf_wx = SHF_WRITE|SHF_EXECINSTR;
>  +	int i;
>  +
>  +	for (i = 0; i < hdr->e_shnum; i++) {
>  +		if ((sechdrs[i].sh_flags & shf_wx) == shf_wx)
>  +			return -ENOEXEC;
>  +	}
>  +
>  +	return 0;
>  +}
>  +
>   #else /* !CONFIG_STRICT_MODULE_RWX */
>  +/* module_{enable,disable}_ro() stubs are in module.h */

The line should go away too as part of the final conflict resolution, but 
we'll have to deal with that later while sending pull requests.

Otherwise it looks good.

Thanks
Miroslav

>   static void module_enable_nx(const struct module *mod) { }
> + static void module_enable_ro(const struct module *mod, bool after_init) {}
>  -#endif /*  CONFIG_STRICT_MODULE_RWX */
>  -static void module_enable_x(const struct module *mod)
>  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  +				       char *secstrings, struct module *mod)
>   {
>  -	frob_text(&mod->core_layout, set_memory_x);
>  -	frob_text(&mod->init_layout, set_memory_x);
>  +	return 0;
>   }
>  -#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>  -static void module_enable_nx(const struct module *mod) { }
>  -static void module_enable_x(const struct module *mod) { }
>  -#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>  -
>  +#endif /*  CONFIG_STRICT_MODULE_RWX */
>   
>   #ifdef CONFIG_LIVEPATCH
>   /*
> 

