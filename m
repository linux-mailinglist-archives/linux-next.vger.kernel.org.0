Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC5D2542AE
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgH0Jq5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 05:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0Jqy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 05:46:54 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85154C06121B
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 02:46:54 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g1so2959122pgm.9
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=puFJvvkCYrkSU+2mPd9TFfTDEUDnHWynPJmwVQsczvM=;
        b=nZ/62gMns/bukvTuVDxNH3hPPBZPeUmZJEAtRljc29m5I5JU/ap3Nh55OSh2k/8xbj
         cK3H8jAR9QuSXDUqjXrV2RVp7MBinIEdmMnuJql2N5ytH5NuPPLBlHwBS2XDN7RlEYE4
         hPvYBRFZ2BkyZ4a6HIG685o06n1pBth12eFirf5R0gIR2q6M7eoqL17hdoqAehb0ccNM
         zyhmF2W0fv+YXTmZfY3VSTQcPDBC3eUaRHW+Fh21qPKAlHf6efuYFZyC3T6m7qgJnaye
         NG94u0ZJfXLOR5j0bekn2LzgDkaOJcl+FD2E4GaUXUqg/Szbj7Bygnv4JGl8jwFibGq8
         WWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=puFJvvkCYrkSU+2mPd9TFfTDEUDnHWynPJmwVQsczvM=;
        b=YXKKXOmkFuqU7iA6eeqn+mhnuMd4+JfSvOS/i4pHOW5FVhxW+Z0HTkfseTZnNBQhHj
         njzl16/55anJ4EEADZCzSVJzm3eHCBR104MmXgZ2P3RYtg/o702RtWAbnLMWAmNHv+Xu
         S/H/TykKOgpNVvWrErypWW3n9XWFoUQG7w14mEV2Xgj0NZpevGhooopuZupsogbN1yyA
         MPCKIjEZ0Klw4OmP43p3GdscnamSLUXzOu/zO7pOHFmfcfEXYzwYOJy9yc0w/S2CW4rL
         MCONAnQVLuz8a1BaVqFvjVuGVviZwiJSjPyhh68RyZ62y1tJ2OY5g5jSGOlDS7xk2w+V
         D0RQ==
X-Gm-Message-State: AOAM5313/6NNEmcSTkAA9KI3mv4shK4g0TCJkrsGviKA/L/ar1y8nr5a
        GmCLeWMzUZagwbfy+54u2DdR/w==
X-Google-Smtp-Source: ABdhPJxCi6eODIe7Txd+wQ73Y3W8HmoSgDpmEbe/MekUfNFLM3VQCuM8ZvaiR0tBC3F+5+3OutFfOA==
X-Received: by 2002:a62:4ed4:: with SMTP id c203mr15581343pfb.151.1598521613728;
        Thu, 27 Aug 2020 02:46:53 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id s10sm1720942pjl.37.2020.08.27.02.46.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 02:46:53 -0700 (PDT)
Date:   Thu, 27 Aug 2020 15:16:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, sbhanu@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>, nm@ti.com
Subject: Re: WARNING: at drivers/opp/core.c:678
 dev_pm_opp_set_rate+0x4cc/0x5d4 - on arm x15
Message-ID: <20200827094651.3grvs6ungv3dh7y3@vireshk-i7>
References: <CA+G9fYvK5UkERLuBSRH5t2=j5==dbtw45GTMta9MafyJDqFsFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvK5UkERLuBSRH5t2=j5==dbtw45GTMta9MafyJDqFsFA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 27-08-20, 15:04, Naresh Kamboju wrote:
> While boot testing arm x15 devices the Kernel warning noticed with linux next
> tag 20200825.
> 
> BAD:  next-20200825
> GOOD:  next-20200824
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 3a00d3dfd4b68b208ecd5405e676d06c8ad6bb63
>   git describe: next-20200825
>   make_kernelversion: 5.9.0-rc2
>   kernel-config:
> https://builds.tuxbuild.com/LDTu4GFMmvkJspza5LJIjQ/kernel.config
> 
> We are working on git bisect and boot testing on x15 and get back to you.

Was this working earlier ? But considering that multiple things
related to OPP broke recently, it may be a OPP core bug as well. Not
sure though.

Can you give me delta between both the next branches for drivers/opp/
path ? I didn't get these tags after fetching linux-next.

-- 
viresh
