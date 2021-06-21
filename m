Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C9E3AEA1C
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 15:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhFUNg5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 09:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhFUNg4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 09:36:56 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2EBC061574;
        Mon, 21 Jun 2021 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=CNc3Xrd1K/29qEhkYTyaxdo3gNoefxPfA82KPR08cuk=; b=UZA5zknswNexCVjedhqpVnPkpR
        jRvjNhwuxJabuyR3UILC2fJTLArSkub5DrIrVf3s2tVutN33fBI2I+Fdj5m3pnfgWVzVvw5KB7bTL
        aOSJRCaBA0/DCBgV/Y8zsJz/StwXe8g5J00PdKRs9RSJLw2IDAXjnBvqEVMoCbaPK7NVVb33QcOqI
        EPWwPF4jCTxRXqgQO4IUM8DgDmIpZ+NMnhM5dlZjjQWwJJT6g5iJtU6HXN6Bur/NEKi0pJZrK2Eps
        njtjkvO8OnwRH69da/OY+MMYanN2x8Cxk/dcpP6Z7KSk8sSqqU80EjQ8wN49XH7UmLDMRXciOTVqs
        l85eq8nw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lvK4I-00AFPk-GY; Mon, 21 Jun 2021 13:34:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D72DD3001C0;
        Mon, 21 Jun 2021 15:34:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B7AE5200E3586; Mon, 21 Jun 2021 15:34:32 +0200 (CEST)
Date:   Mon, 21 Jun 2021 15:34:32 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: Tree for Apr 16 (objtool: warnings)
Message-ID: <YNCVaPtEWlsvQfjw@hirez.programming.kicks-ass.net>
References: <20210416213625.14542675@canb.auug.org.au>
 <b3778b1a-9494-4724-5066-c000f7fb5e94@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3778b1a-9494-4724-5066-c000f7fb5e94@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 16, 2021 at 10:50:49AM -0700, Randy Dunlap wrote:
> On 4/16/21 4:36 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210415:
> 
> 
> on x86_64, objtool is not liking retpoline.o:
> 
> $ gcc --version
> gcc (SUSE Linux) 7.5.0
> 
> 
> Is there already a patch for these?
> 
> 
> ===== build-r8840.out =====
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup

Damn, sorry I missed this. I know what the problem is, but I've yet to
find a solution that's not terrible... hold on.
