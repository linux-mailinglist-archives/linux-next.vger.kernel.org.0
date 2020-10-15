Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFC828EFBD
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 11:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbgJOJ7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 05:59:46 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:36628 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgJOJ7q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 05:59:46 -0400
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602755983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PlevN6yVm2HnwK034FXsfndh/959DVQqNZzufhIKA04=;
        b=MUall/o1Ep8FjtYpBzVZioQvmMADRw3NIf1+4jtH439kFEfQO7IzV5DdgPPCuGe2H9dcGg
        kuu4rqtx+yhEcLgMy77E1udhVGeD1SpMD6+LIqDmauOIw/EzjDa5bySQgnqsejbxLWB3TI
        zewbm0x4K1tJDEVb0E7B3pReYa+RFBME9ESzd3mAC9KkGi+vLmrdRk2rcJVFoSUvmYyDoG
        vtDgcaxRqaQ3+XQL9exk1Nfn+io2ZeTAxqvet3P6eKF1KDU75BbTTuenrT6Qjkz4Dh3QFo
        McKE19QQLuWbQTNXsHTndMUA3JAixGCJVy472NJCg1EkDdciYAR0CS1bGMeMOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602755983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PlevN6yVm2HnwK034FXsfndh/959DVQqNZzufhIKA04=;
        b=z7V9dWcnjheORrqANNNbcItCw4NhNMjaxJ1idCJ71t24jY3QPie81gGDA7E7nctNIdESAb
        3zo7jyQ72+1K7TCQ==
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Petr Mladek <mladek.petr@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] printk: ringbuffer: Wrong data pointer when appending small string
In-Reply-To: <20201015063137.GA3668@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com> <20201014140514.GB17231@alley> <20201014151311.GB13775@alley> <20201014175051.GC13775@alley> <20201015063137.GA3668@jagdpanzerIV.localdomain>
Date:   Thu, 15 Oct 2020 12:05:42 +0206
Message-ID: <875z7bhks1.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-10-15, Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:
>> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>> index 2493348a1631..24a960a89aa8 100644
>> --- a/kernel/printk/printk_ringbuffer.c
>> +++ b/kernel/printk/printk_ringbuffer.c
>> @@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
>>  
>>  	/* If the data block does not increase, there is nothing to do. */
>>  	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
>> -		blk = to_block(data_ring, blk_lpos->begin);
>> +		if (wrapped)
>> +			blk = to_block(data_ring, 0);
>> +		else
>> +			blk = to_block(data_ring, blk_lpos->begin);
>>  		return &blk->data[0];
>>  	}
>
> Great catch.

Indeed. I don't know how we missed that one. :-/

Reviewed-by: John Ogness <john.ogness@linutronix.de>
