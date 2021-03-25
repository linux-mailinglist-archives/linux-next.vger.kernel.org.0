Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D915348C56
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 10:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhCYJKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 05:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhCYJKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 05:10:23 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455A9C06174A
        for <linux-next@vger.kernel.org>; Thu, 25 Mar 2021 02:10:23 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id m7so1140327pgj.8
        for <linux-next@vger.kernel.org>; Thu, 25 Mar 2021 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TYj9k0I7RZEz57gwWvDtRISrOqiColW76Vz6PZDGR6s=;
        b=TqYqOhOD0CvZC4dj/wLI3VHgqJuEer0t8ullOBdtdiMBPAjfgrEoB9rQDHzus8Wl/S
         ooEFjb0JZWvX6wSGCMlaow0RaBJzepLMEXarC/snZFEHLnaNwDrQmKvCDDjcEaQP3yK7
         szBWGlDNZSyIOKcI8FeFnvlAQExN0a61aCv70YFT1B5i+x9smSMx6o18FwpKD+fhV5pB
         HF5j3IpeURPIfHzp7TD1ojoJuyCj61HWA2KoowO4dHKLqDntQRsnPXmJdD7+ZN/IuqFF
         YF0jeojxf3IuTl5qVh8wjKzywSP+fyWxhzr9VCJXpbuyXQIPo7Y7jttWZsDyxQ1xnp0p
         HxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TYj9k0I7RZEz57gwWvDtRISrOqiColW76Vz6PZDGR6s=;
        b=Oh7yJLzZgld2d+L8Vbz1gVPtd3iyu7F8DRWsWUB7XVSBg7eEsdxW+9Onckq6ToKU94
         CMnlgFrt6VBQXFw9BrHEBNkxfZekNzzD/SC1CwQkBKS5AyU/CnJlMML5n0hDaSDzf5uG
         SPhbna1Q6TxGNpCsHBAYH0w3wLoodhJlph+zCZq8WzHooM4lHO9USJGwdw+M3M5N+QBY
         xTPbk+LWlDbX31mnOFJfC2kdqFigvmFPbVJ88tWYWf4CNEbSRUtQAL84q/vBCjctVUme
         t73apSDVVQVYbm08W/TRTl8hxTh8w+JETxdF43kpWiPt4hxlbSBg4eNfyqA4awuCbi/H
         AoDg==
X-Gm-Message-State: AOAM532IZ3bXtDVQtY7XtdNbmOAjTzav931P+wjoDFkE+om25ArzhCn/
        X65Hs+ET0GYYXiajgyB4/JSmoQ==
X-Google-Smtp-Source: ABdhPJz7TLT7iPZVbNsDge2Vn4xwLRmNGeBrurRVRwgs3nBM1CYnETndoftqZcYMPjvn7d82H8YIJw==
X-Received: by 2002:a63:6a84:: with SMTP id f126mr6552366pgc.352.1616663422831;
        Thu, 25 Mar 2021 02:10:22 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id w17sm4854759pgg.41.2021.03.25.02.10.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 02:10:18 -0700 (PDT)
Date:   Thu, 25 Mar 2021 14:40:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: linux-next: manual merge of the opp tree with the v4l-dvb tree
Message-ID: <20210325091016.hcbbysmvtren32e6@vireshk-i7>
References: <20210323112705.3094525d@canb.auug.org.au>
 <20225c7e-1151-7865-2bc6-a1e5694c3d65@linaro.org>
 <20210325042530.5clexogqy77v75sm@vireshk-i7>
 <49a8bca3-d18b-9977-23c2-1dba6e61ef85@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a8bca3-d18b-9977-23c2-1dba6e61ef85@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25-03-21, 10:14, Stanimir Varbanov wrote:
> I guess you meant this thread.
> 
> https://lore.kernel.org/lkml/20210314163408.22292-1-digetx@gmail.com/

I actually thought some other stuff is having the merge issues (as I
was expecting something to happen there) :)

Anyway, you did the right thing. Thanks.

-- 
viresh
