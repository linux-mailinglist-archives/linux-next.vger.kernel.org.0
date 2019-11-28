Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D296910C0EB
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 01:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfK1AEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 19:04:15 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52884 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfK1AEP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Nov 2019 19:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=53+hrlQtcGBEMjO7oiLH00LUT8Y7sBWSq/6hZ1cRVno=; b=jaoo3tmCadIqF66YJqeM3Or7C
        EKTM99IUCcxVjssBHV/oGdQgUSdv4KEoXL8N+lJBVI7ApI9On9HF6D8C6ZIBB3s8QQwbWRoFUnRAs
        3d+rCq650BR59KBfiNLmnYyPYikIkgLtAFHsbbb2lH42Q2OnS/zv3jd7cXMz6FNBSnwQj6p7wCtFO
        YDbeCDRrVKntKLvEn8EJ5LYj5gR/rvGC2FDqnplzC9Ajy4rQ4/B1LtZFRfA89wXKLcvZAn9/RVt2p
        36Dt8BNBojivO2wopZNRy9A2sbYr2vcc2JIGHp3hQbLbEQNWkn4xQn9eFLug1xIx+2f3YmB0DAKRR
        miWYDlRKw==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ia7I6-0002qI-PG; Thu, 28 Nov 2019 00:04:14 +0000
Subject: Re: linux-next: Tree for Oct 14 (insn_decoder_test)
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masami Hiramatsu <mhiramat@redhat.com>
References: <20191014174707.469f596f@canb.auug.org.au>
 <2d83682b-6206-4992-63cc-342d61641c0a@infradead.org>
 <20191023144916.2cbd0ea16363b4cd4574f5ad@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3fe0f2d7-eab6-8224-bc48-ef513c7ce8e3@infradead.org>
Date:   Wed, 27 Nov 2019 16:04:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191023144916.2cbd0ea16363b4cd4574f5ad@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/19 10:49 PM, Masami Hiramatsu wrote:
> Hi,
> 
> On Mon, 14 Oct 2019 08:30:02 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 10/13/19 11:47 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20191011:
>>>
>>
>> on x86_64:
>>
>>   HOSTCC  arch/x86/tools/insn_decoder_test
>>   HOSTCC  arch/x86/tools/insn_sanity
>>   TEST    posttest
>> arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
>> arch/x86/tools/insn_decoder_test: warning: ffffffff81000bf1:	f7 0b 00 01 08 00    	testl  $0x80100,(%rbx)
>> arch/x86/tools/insn_decoder_test: warning: objdump says 6 bytes, but insn_get_length() says 2
>> arch/x86/tools/insn_decoder_test: warning: Decoded and checked 11913894 instructions with 1 failures
>>   TEST    posttest
>> arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x871ce29c)
> 
> Hmm, curious.
> 
> x86-opcode-map.txt said,
> f7: Grp3_2 Ev (1A)
> 
> and "0x0b" is 00001011b, Group encoding bits are 5,4,3 (reg field),
> so group index is 001.
> 
> GrpTable: Grp3_2
> 0: TEST Ev,Iz
> 1:
> 
> Hmm, "f7 0b" is not assigned to any instruction... (testl should be f7 03)
> 
> I've checked Intel SDM May 2019 version(*), but the Opcode Map (Table A-6. Opecode
> Extensions for One- and Two-byte Opecodes by Group Number) showed the group index
> 001 is still blank. I've also checked that Table B-13 (General Purpose Instruction
>  Formats and Encodings for Non-64-Bit Modes (Note that this has no REX prefix)) but
> I couldn't find "f7 0b".
> 
> At last, I found that on AMD64 Architecture Programmer's Manual Volume 3, Appendix A.2
> Table A-6. ModRM.reg Extensions for the Primary Opcode Map(**), which shows that both
> f7 + reg=000 and f7 + reg=001 are same. So only on AMD64, it is officially available
> instruction.
> 
> (*) https://software.intel.com/sites/default/files/managed/a4/60/325383-sdm-vol-2abcd.pdf
> (**) https://www.amd.com/system/files/TechDocs/24594.pdf
> 
> OK, so this should be fixed with below patch.
> 
> ------
>>From b3f45b86df25be59fcf417730ab4c69c6310eaad Mon Sep 17 00:00:00 2001
> From: Masami Hiramatsu <mhiramat@kernel.org>
> Date: Wed, 23 Oct 2019 14:45:35 +0900
> Subject: [PATCH] x86/decoder: Add TEST opcode to Group3-2
> 
> Add TEST opcode to Group3-2 reg=001b as same as Group3-1 does.
> 
> Commit 12a78d43de76 ("x86/decoder: Add new TEST instruction pattern")
> added a TEST opcode assignment to f6 XX/001/XXX (Group 3-1), but not
> added f7 XX/001/XXX (Group 3-2). Actually these TEST opcode is not
> described in Intel SDM Vol2, but described in AMD64 Architecture
> Programmer's Manual Vol.3, Appendix A.2 Table A-6. ModRM.reg
> Extensions for the Primary Opcode Map.
> 
> Without this fix, Randy found a warning by insn_decoder_test related
> to this issue as below.
> 
>   HOSTCC  arch/x86/tools/insn_decoder_test
>   HOSTCC  arch/x86/tools/insn_sanity
>   TEST    posttest
> arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> arch/x86/tools/insn_decoder_test: warning: ffffffff81000bf1:	f7 0b 00 01 08 00    	testl  $0x80100,(%rbx)
> arch/x86/tools/insn_decoder_test: warning: objdump says 6 bytes, but insn_get_length() says 2
> arch/x86/tools/insn_decoder_test: warning: Decoded and checked 11913894 instructions with 1 failures
>   TEST    posttest
> arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x871ce29c)
> 
> To fix this error, add TEST opcode according to AMD64 APM Vol.3.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/x86/lib/x86-opcode-map.txt       | 2 +-
>  tools/arch/x86/lib/x86-opcode-map.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
> index e0b85930dd77..4635ce298d1d 100644
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -907,7 +907,7 @@ EndTable
>  
>  GrpTable: Grp3_2
>  0: TEST Ev,Iz
> -1:
> +1: TEST Ev,Iz
>  2: NOT Ev
>  3: NEG Ev
>  4: MUL rAX,Ev
> diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
> index e0b85930dd77..4635ce298d1d 100644
> --- a/tools/arch/x86/lib/x86-opcode-map.txt
> +++ b/tools/arch/x86/lib/x86-opcode-map.txt
> @@ -907,7 +907,7 @@ EndTable
>  
>  GrpTable: Grp3_2
>  0: TEST Ev,Iz
> -1:
> +1: TEST Ev,Iz
>  2: NOT Ev
>  3: NEG Ev
>  4: MUL rAX,Ev
> 


-- 
~Randy

