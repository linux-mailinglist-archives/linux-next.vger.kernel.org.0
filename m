Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C752EA06E7
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 18:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfH1QFT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 12:05:19 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57554 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbfH1QFT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 12:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gu+ey5Jy4rvnxx39Ee505nBrSERrJduL34bG+SWnbhM=; b=gQphJLQyPlt7ByVftc56y0Pot
        os0/bdf9hKzlTkroKlj6JQYs3lvhgotCSqcNqOE752JQv9ph7ZOli6fn++a3jtSBKXv2gfcz90DMd
        TYWR5MCH9yOJATG8EOPdV02fgwjf5WFTHXWNjxZv9MBxYu2JznY1KM8H9o6+cRgpz75av8KXW5+SE
        ER9GSPBm6p92arigIyAgHwmVv0qZNY95rgJDLLePj9godTExNnJuTFILD5ZuMINczDFAYhhZEuZK8
        CZxLlPzvIGYiVMWsnfLVJHR8HkeyS2JpqXsJ1K35NEkvu0yMJIJUEq/MjE50XmknhI0mVYXe+ATL6
        D73chTy/g==;
Received: from [2601:1c0:6200:6e8::4f71]
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i30Rj-0001rD-77; Wed, 28 Aug 2019 16:05:19 +0000
Subject: Re: linux-next: Tree for Aug 27 (objtool)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
 <20190827155911.ct2zzo2zhcrauf3z@treble>
 <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
 <20190828155147.v6eowc7rr7upr7dr@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
Date:   Wed, 28 Aug 2019 09:05:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828155147.v6eowc7rr7upr7dr@treble>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/28/19 8:51 AM, Josh Poimboeuf wrote:
> On Tue, Aug 27, 2019 at 12:05:42PM -0700, Randy Dunlap wrote:
>> On 8/27/19 8:59 AM, Josh Poimboeuf wrote:
>>> On Tue, Aug 27, 2019 at 08:40:07AM -0700, Randy Dunlap wrote:
>>>> On 8/27/19 2:05 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20190826:
>>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x33: unreachable instruction
>>>>
>>>>> gcc --version
>>>> gcc (SUSE Linux) 7.4.0
>>>>
>>>>
>>>> want more info?
>>>
>>> Yes, can you provide the .o and the .config?
>>>
>>
>> Sure.  The .o was 508KB, so I compressed it.
> 
> Thanks Randy.  Here's a tentative fix.  I need to make sure it doesn't
> break anything else.

Works for me on the reported failure.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 176f2f084060..35a40d610474 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -556,7 +556,7 @@ static int add_jump_destinations(struct objtool_file *file)
>  		    insn->type != INSN_JUMP_UNCONDITIONAL)
>  			continue;
>  
> -		if (insn->ignore || insn->offset == FAKE_JUMP_OFFSET)
> +		if (insn->offset == FAKE_JUMP_OFFSET)
>  			continue;
>  
>  		rela = find_rela_by_dest_range(insn->sec, insn->offset,
> 


-- 
~Randy
