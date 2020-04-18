Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE991AF449
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 21:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgDRThD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Apr 2020 15:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726086AbgDRThD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 18 Apr 2020 15:37:03 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9623DC061A0C
        for <linux-next@vger.kernel.org>; Sat, 18 Apr 2020 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=AY/tfTF308Wu9GOlbcBGP0o20Z15sFscGz+qmVACpJA=; b=gRG0u1vuiwnxFd5XH0F2i+/dhp
        RLTxQohRMZwIvreyRyxqp3+FXNNfKDJxVivw6dkJc/bhhx7ET6rfXz1d8/xzt/l+PfUzwuOMNdxnT
        0fr1FpPeJ8QlCarHJQRPWGRYvfBAGnkxByeU5aU2VVY3erWc5cDKZevGQHhm0mHeTK4RS8pEm+EZm
        LhQn7mTJAFwBHOKpaEDWzXbLkZU53QqZZqKSwC8BeROAj7T6XgTyZioe0GNUmIPL0quRF8BqxZ3PX
        lUPciEtkz30RTgOZmnhHL6ukoPciHGUZnrl2n4QD+sQXWfi96CLNzTmbZvGfmE/09g43b6BLzkTMC
        USycCAug==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jPtGl-0001r9-9u; Sat, 18 Apr 2020 19:36:51 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id E8EA59834D1; Sat, 18 Apr 2020 21:36:48 +0200 (CEST)
Date:   Sat, 18 Apr 2020 21:36:48 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     coverity-bot <keescook@chromium.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Miroslav Benes <mbenes@suse.cz>, Borislav Petkov <bp@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: create_orc_entry(): Resource leaks
Message-ID: <20200418193648.GS2483@worktop.programming.kicks-ass.net>
References: <202004171457.E65664861F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202004171457.E65664861F@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 02:57:37PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200417 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Wed Apr 1 13:23:27 2020 -0500
>     e81e07244325 ("objtool: Support Clang non-section symbols in ORC generation")
> 
> Coverity reported the following:
> 
> *** CID 1492654:  Resource leaks  (RESOURCE_LEAK)
> /tools/objtool/orc_gen.c: 123 in create_orc_entry()
> 117     			rela->sym = find_symbol_containing(insn_sec,
> 118     							   insn_off - 1);
> 119     		}
> 120     		if (!rela->sym) {
> 121     			WARN("missing symbol for insn at offset 0x%lx\n",
> 122     			     insn_off);
> vvv     CID 1492654:  Resource leaks  (RESOURCE_LEAK)
> vvv     Variable "rela" going out of scope leaks the storage it points to.
> 123     			return -1;
> 124     		}
> 125
> 126     		rela->addend = insn_off - rela->sym->offset;
> 127     	}
> 128
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

This isn't a false positive, but I don't think we care. objtool is a
run-once short lived thing. Also, in the above case, if we error we
exit, absolutely no point in spending time on freeing memory.
