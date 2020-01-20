Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9821422F0
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 07:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgATGAJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 01:00:09 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38238 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgATGAJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jan 2020 01:00:09 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so15280502pfc.5
        for <linux-next@vger.kernel.org>; Sun, 19 Jan 2020 22:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DFjThD5KqeMZi/zXBmMw7tvmONl4MC0LP5kRzMUQwQY=;
        b=fRdy9FISKBGOtrPq94MvbSt01MUCNeIhsVans22cQTANqaaNvq6M/IBjDym08+/225
         2HpA3OhJR1qfQXE9QlvKeeLEqYTfeMZqkbt3tZMyrw1M4QZyq5UUq58+oYzCOdlAHarX
         oeAj1NyrwQl2BFwn9q8gsLHcRpWe2+O4OppSEUQ1k/VrxlCZOFPqV38UEVrjsrtUYmeU
         C2FxO25cEnKSuJ6DCcWuoTSAZdw1DDdrXQw0+y654FT52ICTJ8b4+Wl8XKlt9DHzkVbV
         bp/RD1ZP/yqirQu1ysja7LVN9SZWowcLC8KE6OZsOAhnZyX99q59188UmE/EZ3vbEMoI
         wJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DFjThD5KqeMZi/zXBmMw7tvmONl4MC0LP5kRzMUQwQY=;
        b=b7HZV9F2IGa8FdtPV/UfaNAyruyyd5swelU6ebXf9SvW+Vr18dT6sK01k5Rmj2amSP
         U0x8whtx0M5QqMShDfTnWKUPRFOOp8CBy0fxcjDMAGQR5wcTpIWVEneCK4uNbSIGidm9
         U8rpAm78l0PAcil83iGxtiVXrvZZ4KMtds+XLl1troGmrtlIyoXmtjLcxJkN8J0MfzQ+
         Enpqzn5ImouHBzHfQ+Tok8cPzmI2eGk8XMK5NWjmE/YQOI/srB0dhH9FlCoYX1XjeQks
         UWVAGeoxZJhJWuKXhdLDhQ1ntUglunUvFnRLGhCt3vHxCeB7kD0ZnWLCRjLXXEqxo7kE
         GJZg==
X-Gm-Message-State: APjAAAUsEF+byz6z9wHSCov+IhR/qop9QHSVUiATW3HVDAnAtP1AkN40
        1YhpaZASuTNDjWSS3yeiMxGrFQ==
X-Google-Smtp-Source: APXvYqzvgBcY8f/cIeCJBhyM78RkJZ88kv+h77VnoqksyXWYX8mMpcvOieW5fDE3qhmQBInYNYJnyw==
X-Received: by 2002:a63:1d1a:: with SMTP id d26mr55612556pgd.98.1579500008181;
        Sun, 19 Jan 2020 22:00:08 -0800 (PST)
Received: from localhost ([122.172.71.156])
        by smtp.gmail.com with ESMTPSA id w11sm38194423pfi.77.2020.01.19.22.00.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 22:00:07 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:30:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20200120060005.g7at22c4g2rxmpet@vireshk-i7>
References: <20200120163853.53da0ac5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120163853.53da0ac5@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20-01-20, 16:38, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig
> and a couple of other allnoconfigs) produced this warning:
> 
> kernel/sched/fair.c:5221:12: warning: 'sched_idle_cpu' defined but not used [-Wunused-function]
>  5221 | static int sched_idle_cpu(int cpu)
>       |            ^~~~~~~~~~~~~~
> 
> Introduced (I think) by commit
> 
>   323af6deaf70 ("sched/fair: Load balance aggressively for SCHED_IDLE CPUs")

Thanks for reporting this Stephen.

I have sent a fix for it now and cc'd you as well.

-- 
viresh
