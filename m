Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C51F28ED16
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 08:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgJOGbm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 02:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgJOGbm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 02:31:42 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7551C061755;
        Wed, 14 Oct 2020 23:31:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n9so1249666pgf.9;
        Wed, 14 Oct 2020 23:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=unLyiKTH/EkbVuJB3NBfpT/3LKUpTBhnwnEORQ/5hr0=;
        b=cK+HkO9w4p08cFRZVKjDccvUHV16t2KsRQsSrIc/aUCeT0yKsdauSkBmys9AB3jU7O
         uIN/8vZxH8UL6iFuysJe5Nx3x13xYtB5bG1RmmazcP64UAOsx4QBmyS/095/ay5cukhp
         m29z8018Ou7kZoF9f1/X/C8aG0lBzKpujssMQkBrxXIeJDAlA578SPG2VDUsbSC4jCZF
         DBkGyS1+jMx2/ZqxCcnBvc0ugesU6lwbNcxnQClvO7tBcHk2jr8JabRctNvH44D+96t4
         OUWBH4Ie4NCGcYh9vnKbzpU/KVuBClSK8Ydi7wHven6eD6Usu7/vjR2sZgMLgZxo3Ynf
         SwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=unLyiKTH/EkbVuJB3NBfpT/3LKUpTBhnwnEORQ/5hr0=;
        b=toNad3vgvFmP9KRI2nxLrxgUQFvQO6UU4j/hUSVkW+eUDkEQX8QpiULhVmbXoCsJ9+
         KQdte96QTQQYQMiUrqSz/LQpHDDTNreMs+jNTkEgtfRFub9HltPhYcf2Jv884/qFWK8t
         Om9qaBrZuv7Z8KIuHRa6neDQznlvi27YHUw/ewDcnJeiOJr0c4IRnL7BG+nu3ljlhdfJ
         SSHHnrQqxxH4uOb2gCfSrSxZgBpLPasYHFyd7NrHl78XC6CcFR28KcNDR4zadXzp9T/k
         iZebyUZcejUqRXNx99GqAh0e6cqV+8RkCigTNJ59vN/iRyuyPov487jkFU1nWQrlHzgT
         1V2g==
X-Gm-Message-State: AOAM530YPqJnBTVzxR1jmxvD5LHnZzguIXEttJnnLaXhnnt00xxl2LW+
        WZX3aGhfTv70tuvKsGXHlo0=
X-Google-Smtp-Source: ABdhPJy1Dmz68MUB/Zc05m4DGKww5Xa4EJ/OX4HoWgEwnKYuOf0rRVacq1aZQ8FnpCkqOzwv+zUojw==
X-Received: by 2002:a63:5a0a:: with SMTP id o10mr2115126pgb.77.1602743501127;
        Wed, 14 Oct 2020 23:31:41 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id z18sm1822440pfn.158.2020.10.14.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:31:40 -0700 (PDT)
Date:   Thu, 15 Oct 2020 15:31:37 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Petr Mladek <mladek.petr@gmail.com>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
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
Subject: Re: [PATCH] printk: ringbuffer: Wrong data pointer when appending
 small string
Message-ID: <20201015063137.GA3668@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley>
 <20201014151311.GB13775@alley>
 <20201014175051.GC13775@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014175051.GC13775@alley>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/10/14 19:50), Petr Mladek wrote:
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 2493348a1631..24a960a89aa8 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
>  
>  	/* If the data block does not increase, there is nothing to do. */
>  	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
> -		blk = to_block(data_ring, blk_lpos->begin);
> +		if (wrapped)
> +			blk = to_block(data_ring, 0);
> +		else
> +			blk = to_block(data_ring, blk_lpos->begin);
>  		return &blk->data[0];
>  	}

Great catch.

Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
