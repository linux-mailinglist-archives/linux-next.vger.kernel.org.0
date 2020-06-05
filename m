Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CDE1EF232
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 09:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgFEHhX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 03:37:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgFEHhW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 03:37:22 -0400
Received: from linux-8ccs.fritz.box (p57a23121.dip0.t-ipconnect.de [87.162.49.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 522112074B;
        Fri,  5 Jun 2020 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591342642;
        bh=42lNXDc+eD0B5deInF5/wSWwEObeLr7OYsIYxqz+zsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vNpsScCNyCtvMxoun6FVSXpIBc+s4rEntnG84DyNCEEU6+txnewyMvA3PGoVFbPCB
         FMQ7FFDpMkXSZfyuy6KMpCV6fPneT/ZMuznKi4AFglrvwbhK6C79SvtpOhhOS+grtf
         svj9bxKw88hQ9nDvxSfNFAtyfCNM0FsS9SbkW7w0=
Date:   Fri, 5 Jun 2020 09:37:17 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the livepatching tree with the
 modules tree
Message-ID: <20200605073717.GA10481@linux-8ccs.fritz.box>
References: <20200508180524.6995b07e@canb.auug.org.au>
 <20200605144557.4f8e2a42@canb.auug.org.au>
 <nycvar.YFH.7.76.2006050855290.13242@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2006050855290.13242@cbobk.fhfr.pm>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Jiri Kosina [05/06/20 08:56 +0200]:
>On Fri, 5 Jun 2020, Stephen Rothwell wrote:
>
>> > Today's linux-next merge of the livepatching tree got a conflict in:
>> >
>> >   kernel/module.c
>> >
>> > between commits:
>> >
>> >   db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT_MODULE_RWX #ifdefs")
>> >   5c3a7db0c7ec ("module: Harden STRICT_MODULE_RWX")
>> >
>> > from the modules tree and commit:
>> >
>> >   e6eff4376e28 ("module: Make module_enable_ro() static again")
>> >
>> > from the livepatching tree.
>> >
>> > diff --cc kernel/module.c
>> > index c69291362676,a26343ea4d50..000000000000
>> > --- a/kernel/module.c
>> > +++ b/kernel/module.c
>> > @@@ -2055,29 -2023,20 +2042,30 @@@ static void module_enable_nx(const stru
>> >   	frob_writable_data(&mod->init_layout, set_memory_nx);
>> >   }
>> >
>> >  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>> >  +				       char *secstrings, struct module *mod)
>> >  +{
>> >  +	const unsigned long shf_wx = SHF_WRITE|SHF_EXECINSTR;
>> >  +	int i;
>> >  +
>> >  +	for (i = 0; i < hdr->e_shnum; i++) {
>> >  +		if ((sechdrs[i].sh_flags & shf_wx) == shf_wx)
>> >  +			return -ENOEXEC;
>> >  +	}
>> >  +
>> >  +	return 0;
>> >  +}
>> >  +
>> >   #else /* !CONFIG_STRICT_MODULE_RWX */
>> >  +/* module_{enable,disable}_ro() stubs are in module.h */
>> >   static void module_enable_nx(const struct module *mod) { }
>> > + static void module_enable_ro(const struct module *mod, bool after_init) {}
>> >  -#endif /*  CONFIG_STRICT_MODULE_RWX */
>> >  -static void module_enable_x(const struct module *mod)
>> >  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>> >  +				       char *secstrings, struct module *mod)
>> >   {
>> >  -	frob_text(&mod->core_layout, set_memory_x);
>> >  -	frob_text(&mod->init_layout, set_memory_x);
>> >  +	return 0;
>> >   }
>> >  -#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>> >  -static void module_enable_nx(const struct module *mod) { }
>> >  -static void module_enable_x(const struct module *mod) { }
>> >  -#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>> >  -
>> >  +#endif /*  CONFIG_STRICT_MODULE_RWX */
>> >
>> >   #ifdef CONFIG_LIVEPATCH
>> >   /*
>>
>> This is now a conflict between the modules tree and Linus' tree.
>
>I've made Linus aware of this coming when sending livepatching tree, but
>given the fact that the modules tree hasn't been merged yet, Jessica, I
>believe it'd make sense to point it out again once sending your tree.

Yep, will do. Thanks!
