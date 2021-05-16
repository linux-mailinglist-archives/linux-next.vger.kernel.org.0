Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38068381D27
	for <lists+linux-next@lfdr.de>; Sun, 16 May 2021 08:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhEPGgK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 May 2021 02:36:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhEPGgJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 May 2021 02:36:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B07816100A;
        Sun, 16 May 2021 06:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621146895;
        bh=tOJvyDBi93XagwPx1i9XtsXpSm6miDwPi3jE4SjKmmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KhZ5MoWo5uLP7ivqT7mfz2z9+6AQblT/RCUsxVJQfjLb0HGY8QymxsszvURVe2Ixo
         ibYuevSbFOgfIO1VYGOsjvtfna8ne2XHXqQZDsPcKV3ds1aX0Y8gAnGLn5frEWP6qT
         6PUJOMGCGGkmyf07hkcHhvjJzyY6CGvG40Ip9fNvwg++DVnJ1DsZm4gaEE/iFMAvAB
         kzvdzpj2QEMnD8K6H6nPpLNX0QVVIjDrpPk+jazympQB5sN2kbALWZdRuQDA1h/d7W
         /d70KrpYnpf1SXm1eP8ss+bdUOjiHNj+/7e/gqEnsd44LlVIFKCgrUkc570JJFkYEN
         pXJebVP+DLqhg==
Date:   Sat, 15 May 2021 23:34:49 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Hyeonggon Yoo <42.hyeyoo@gmail.com>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <YKC9CeAfw3aBmHTU@archlinux-ax161>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 15, 2021 at 11:24:25PM +0200, Vlastimil Babka wrote:
> On 5/15/21 11:09 PM, Hyeonggon Yoo wrote:
> > Hello Vlastimil, recently kbuild-all test bot reported compile error on
> > clang 10.0.1, with defconfig.
> 
> Hm yes, catching some compiler bug was something that was noted to be
> possible to happen.
> 
> > Nathan Chancellor wrote:
> >> I think this happens because arch_prepare_optimized_kprobe() calls kzalloc()
> >> with a size of MAX_OPTINSN_SIZE, which is
> >>
> >> #define MAX_OPTINSN_SIZE                                \
> >>       (((unsigned long)optprobe_template_end -        \
> >>          (unsigned long)optprobe_template_entry) +     \
> >>         MAX_OPTIMIZED_LENGTH + JMP32_INSN_SIZE)
> > 
> >> and the optprobe_template_{end,entry} are not evaluated as constants.
> >>
> >> I am not sure what the solution is. There seem to be a growing list of issues
> >> with LLVM 10 that were fixed in LLVM 11, which might necessitate requiring
> >> LLVM 11 and newer to build the kernel, given this affects a defconfig.
> >> Cheers,
> >> Nathan
> > 
> > 
> > I think it's because kmalloc compiles successfully when size is constant,
> > and kmalloc_index isn't. so I think compiler seems to be confused.
> > 
> > currently if size is non-constant, kmalloc calls dummy function __kmalloc,
> > which always returns NULL.
> 
> That's a misunderstanding. __kmalloc() is not a dummy function, you
> probably found only the header declaration.
> 
> > so what about changing kmalloc to do compile-time assertion too, and track
> > all callers that are calling kmalloc with non-constant argument.
> 
> kmalloc() is expected to be called with both constant and non-constant
> size. __builtin_constant_p() is used to determine which implementation
> to use. One based on kmalloc_index(), other on __kmalloc().
> 
> It appears clang 10.0.1 is mistakenly evaluating __builtin_constant_p()
> as true. Probably something to do with LTO, because MAX_OPTINSN_SIZE
> seems it could be a "link-time constant".

This happens with x86_64 defconfig so LTO is not involved.

However, the explanation makes sense, given that the LLVM change I
landed on changes the sparse conditional constant propagation pass,
which I believe can influence how LLVM handles __builtin_constant_p().

> Maybe we could extend Marco Elver's followup patch that uses
> BUILD_BUG_ON vs BUG() depending on size_is_constant parameter. It could
> use BUG() also if the compiler is LLVM < 11 or something. What would be
> the proper code for this condition?

This should work I think:

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 9d316aac0aba..1b653266f2aa 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -413,7 +413,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 	if (size <=  16 * 1024 * 1024) return 24;
 	if (size <=  32 * 1024 * 1024) return 25;
 
-	if (size_is_constant)
+	if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION > 110000) && size_is_constant)
 		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
 	else
 		BUG();
