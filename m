Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA2E362736
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243879AbhDPRvV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 13:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbhDPRvU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 13:51:20 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB73C061574;
        Fri, 16 Apr 2021 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=Rl/OvkGvMyoblWMfeC4/G+ciVzmdL8nn9QM4PUm4ghg=; b=dnZRU81av1NEhG1OeA72UEWNxY
        MYFX77xBfd91KxgBrbojfZFGIRufl7nipxPlRvUQ9gBrmrZcFXPwSePtz+6tn/8PPY7j2AOEHu421
        yThrV6ExSMz17C9uAWohCGIQF1M6Irfnu+b/U4wBF+Ag+82cQ3MXrbI1Gt03HolwBD3lV9ht7+M7C
        0yEdCRm/krHyKuR+q3OI/xRDmGYSSYXzIwZsDQ+Q3kKKSI8XIQEIG0DT8B9fAgqJhfU0rReu44CNs
        B4NYo1wLJJoetnRrPr3dm7pi89pF3VRzT5YOcCP0X04XvRTgo65y1p6FzqBPyXZlS4g5Y1wKhnSlx
        UHVTz08A==;
Received: from [2601:1c0:6280:3f0::df68]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXScG-002zqV-7y; Fri, 16 Apr 2021 17:50:53 +0000
Subject: Re: linux-next: Tree for Apr 16 (objtool: warnings)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210416213625.14542675@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b3778b1a-9494-4724-5066-c000f7fb5e94@infradead.org>
Date:   Fri, 16 Apr 2021 10:50:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210416213625.14542675@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/16/21 4:36 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210415:


on x86_64, objtool is not liking retpoline.o:

$ gcc --version
gcc (SUSE Linux) 7.5.0


Is there already a patch for these?


===== build-r8840.out =====
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
===== Enter/Return to continue; 'r' to remove =====
===== build-r8841.out =====
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
===== Enter/Return to continue; 'r' to remove =====
===== build-r8844.out =====
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
===== Enter/Return to continue; 'r' to remove =====
===== build-r8846.out =====
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
===== Enter/Return to continue; 'r' to remove =====



thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
