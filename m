Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48FE10F827
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 07:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfLCG5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 01:57:14 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35550 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLCG5N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Dec 2019 01:57:13 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so2275489wro.2;
        Mon, 02 Dec 2019 22:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rTUIIMa2Hzz+bG0D78hRLm6CQ+jqv7MwcIq2lP6UkG8=;
        b=XzpQHiVedEvbcc5uDZ3UD9P6PNM/Q9mKkCl7qz8mmb+djhAofY7885Yx4cRDxHu2nc
         edoVj/oa0yjA7TJ+EkooBjqeB8G4y9ScfVYSqcG/V5iT1dGg9/SNbaD6TxNcmgyhmJKT
         ecT0QGp151RbjwAGDaHyTeH/FVB/KHKGM1dctwO1JMJu/nM5fbAFl1dcSEETRokjZHzs
         w895yd37IjUhPsQBHQ7rwUdbTuLD0FzJqp/mQA+iRxAtjjji8tBbW3QvT8KNcD/2PThT
         Cvb+7JKUaeBZUd4D1yktjHEvOr1Pz0WsSd8j9vivbulxa8k0Tnd50MCVgH/M+z7ZmDbk
         j0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rTUIIMa2Hzz+bG0D78hRLm6CQ+jqv7MwcIq2lP6UkG8=;
        b=P/8jUhBfEvAMrtfTxc3H4pWDuyeaHIg5j4T1/wdBkr+aH5CNurx1GKDO8TANEW9u+w
         KHetiaGxrsURyVoEbKbQlHKCMWCDlvjVsAnaZJaTZZeKKSUrBy+Xkdk2CdxI2beresd+
         CZIJYh1oE5hc95gN9bMLVAHesWH1SJy9zpJYG9lqq3p19dA8ge7o7VvLpnAZuDwmDFze
         4SzYUiQstOefXF1LxFJLRX5h00oXYCmZIh5ZAHaweL16iShkaHLQ2oNs7tqh0b8JJr+5
         MSFIfzKWkcuBaTdQ7BBN26xLEvii/lphVjLGFL5DuDlydSTS8LE0BwzPUFWLiEWBHuyh
         nRuA==
X-Gm-Message-State: APjAAAXbst/C1hhXwCCqXnAJi4kVgxNUhe0IJHA0ukEqLwv3zdMnm2UW
        u6K5UfQ8USZukxMYjE4F+i8=
X-Google-Smtp-Source: APXvYqy24hL+4+zcTBHsYMEZud/htdzwnF7c7NYz5GXAwY2IVKKbL+AkbNL6cOjQdMi9sPgNYY54Aw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr3288902wrv.77.1575356231839;
        Mon, 02 Dec 2019 22:57:11 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id x7sm2258024wrq.41.2019.12.02.22.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 22:57:11 -0800 (PST)
Date:   Tue, 3 Dec 2019 07:57:09 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20191203065709.GA115767@gmail.com>
References: <20191203131024.6e36ed88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203131024.6e36ed88@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/mm/pat_interval.c
> 
> between commit:
> 
>   91298f1a302d ("x86/mm/pat: Fix off-by-one bugs in interval tree search")
> 
> from Linus' tree and commits:
> 
>   70bfed57a6de ("x86/mm/pat: Move the memtype related files to arch/x86/mm/pat/")
> 
> from the tip tree.
> 
> I fixed it up (I just removed the file - there may be further updates
> required) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

No, the correct resolution is to apply the 91298f1a302d fix to the new 
file - which is in -tip and which I've now also pushed out to -next, so 
-next should pick it up tomorrow.

Thanks,

	Ingo
