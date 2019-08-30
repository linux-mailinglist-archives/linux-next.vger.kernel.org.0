Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9389A2FBF
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 08:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfH3GX6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 02:23:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:57268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfH3GX4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Aug 2019 02:23:56 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3217321721;
        Fri, 30 Aug 2019 06:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567146235;
        bh=VouSvHWn/UeSvOBRtH3j7qOpgQGa4fijdPuKdzan2zc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BQM9J3mW81+oE3Z0EpA+xgWr51mmCFx+jJ28N+PwVlRRBAxyYc41qwKOsHIk6VzYQ
         yvTG7IxUXinorwWkYfXGT8OgIC7/EsSGZSutcK2Bz7PzNgWnTLF+oAGoYGfEyLfhgi
         zaNYeEja6KPjdOUDnVcMaSoXbHvSVdO5nHJkEj/s=
Date:   Fri, 30 Aug 2019 15:23:51 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-Id: <20190830152351.9311610b5cffb93110cbd6da@kernel.org>
In-Reply-To: <20190829175931.sru23aud33hrdqbj@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
        <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
        <20190827155911.ct2zzo2zhcrauf3z@treble>
        <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
        <20190828155147.v6eowc7rr7upr7dr@treble>
        <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
        <20190828161331.kvikro257blxtzu5@treble>
        <20190828163433.4ltoxmtuujkqspar@treble>
        <20190829105356.1fd4859f49c142945146855f@kernel.org>
        <20190829175931.sru23aud33hrdqbj@treble>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Hi Josh,

On Thu, 29 Aug 2019 12:59:31 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> On Thu, Aug 29, 2019 at 10:53:56AM +0900, Masami Hiramatsu wrote:
> > Hi Josh,
> > 
> > On Wed, 28 Aug 2019 11:34:33 -0500
> > Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > 
> > > On Wed, Aug 28, 2019 at 11:13:31AM -0500, Josh Poimboeuf wrote:
> > > > Turns out this patch does break something:
> > > > 
> > > >   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c
> > > > 
> > > > I'll need to figure out a better way to whitelist that
> > > > XEN_EMULATE_PREFIX fake instruction thing.  I'll probably just teach
> > > > the objtool decoder about it.
> > > 
> > > Hi Masami,
> > > 
> > > Is it possible for the kernel x86 decoder to recognize the
> > > XEN_EMULATE_PREFIX prefix?
> > > 
> > >         asm(XEN_EMULATE_PREFIX "cpuid"
> > >                 : "=a" (*ax),
> > >                   "=b" (*bx),
> > >                   "=c" (*cx),
> > >                   "=d" (*dx)
> > >                 : "0" (*ax), "2" (*cx));
> > > 
> > > is disassembled to:
> > > 
> > >       33:       0f 0b                   ud2
> > >       35:       78 65                   js     9c <xen_store_tr+0xc>
> > >       37:       6e                      outsb  %ds:(%rsi),(%dx)
> > >       38:       0f a2                   cpuid
> > > 
> > > which confuses objtool.  Presumably that would confuse other users of
> > > the decoder as well.
> > 
> > Good catch! It should be problematic, since x86 decoder sanity test is
> > based on objtool.
> 
> I think you mean the decoder test is based on objdump, not objtool?

Yes, it was my mistake. It depends on objdump.

> Actually I wonder if X86_DECODER_SELFTEST is even still needed these
> days, since objtool is enabled on default configs.  Objtool already uses
> the decoder to disassemble every instruction in the kernel (except for a
> few whitelisted files).

Sometimes it have found bugs, so I would like to keep it. That test runs
build time and in-kernel decoder is somewhat critical. It is better to
run a test before install it.

> 
> > But I don't want to change the test code itself,
> > because this problem is highly depending on Xen.
> > 
> > > That's a highly unlikely sequence of instructions, maybe the kernel
> > > decoder should recognize it as a single instruction.
> > 
> > OK, it is better to be done in decoder (only for CONFIG_XEN_PVHVM)
> > 
> > BTW, could you also share what test case would you using?
> 
> Enable CONFIG_XEN_PV and CONFIG_STACK_VALIDATION, and remove the
> STACK_FRAME_NON_STANDARD(xen_cpuid) line from
> arch/x86/xen/enlighten_pv.c.  objtool will complain:
> 
>   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c

Ah, OK, so that is for objtool, not for in-kernel decoder (anyway both
need the fix.)

> Basing it on CONFIG_XEN_PVHVM may be problematic.  The decoder is
> duplicated in the tools directory so objtool can use it.  But the tools
> don't know about kernel configs.

Yes, in that case you need enable it always.

> BTW, I'm not sure if you're aware of this, but both objtool and perf
> have identical copies of the decoder.  The makefiles warn if they get
> out of sync with the kernel version.
> 
> We will always need at least one copy of the decoder in tools, because
> the tools subdir is supposed to be standalone from the rest of the
> kernel.  Still, I may look at combining the perf and objtool copies into
> a single shared copy.

Yes, we need to fix both.

> 
> > And what about attached patch? (just compile checked with/without CONFIG_XEN_PVHVM)
> 
> I copied the decoder to objtool, removed the CONFIG_XEN_PVHVM ifdef, and
> played a bit with the includes, and got it to compile with objtool, but
> it still fails:
> 
>   $ make arch/x86/xen/enlighten_pv.o
>   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c

[...]
> @@ -58,6 +60,30 @@ void insn_init(struct insn *insn, const void *kaddr, int buf_len, int x86_64)
>  		insn->addr_bytes = 4;
>  }
>  
> +static const insn_byte_t xen_prefix[] = { XEN_EMULATE_PREFIX };

Oops, this must be __XEN_EMULATE_PREFIX. Mine is also have same bug.
since insn_byte_t is char, that makes no error, but it should be
initialized with __XEN_EMULATE_PREFIX, not XEN_EMULATE_PREFIX.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
