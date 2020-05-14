Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA631D27F6
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 08:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgENGiz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 02:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725831AbgENGiy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 02:38:54 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19A6C061A0E
        for <linux-next@vger.kernel.org>; Wed, 13 May 2020 23:38:54 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b190so889594pfg.6
        for <linux-next@vger.kernel.org>; Wed, 13 May 2020 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=trpCHC2rLO1MlJDoRWUVG8LcEP1hcZOfyLGO5G0f2rQ=;
        b=zZLliR++wDgRRitEX5/Q9ylF5d6B3oUNfdX3DFBcMpOGNH9uem9dfdhEl6CsbQIcl1
         RKxBNQ31tZfpVBcaQetcEmtZNGkBFyeNIQcwh+MdhtT5Pq/FnoyT+RiuQzXk4IHcEqSa
         uCvO0ewqL9e7wS1no4p8LF4r4y9m4UZV9Qnb73BodRNqEEuxTbU4sdxj0I2Zi4oRXd52
         ojFZoC/xcKc1ge95zTh+LRFW+AKazDEsx155A/4vxRHnQv4E+RwUAsiKT94hkIGwk3Wu
         zeEZXNZ8Hefywm3T16bvIwr3ouD3CqnoRCyBTLajdNVcO07siTiWXYRNNC+H+i8TD7MZ
         aGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=trpCHC2rLO1MlJDoRWUVG8LcEP1hcZOfyLGO5G0f2rQ=;
        b=pxvujyqhgE4zCvl38Y9zMluktCDZZUtqZIh1ZnUH1Ux18beE5WIzr+wjANPGH1f7ok
         N5DPV1nt2wrBJs/HPnKOsb6iFlHL/M91sAC9xGPpwIAwZ09wks0qk5mHmdFEOPfLFaeE
         ngr9rnCoHw0mOF5NuWd5uA5abdSJ4aOlbwWCjIlMz3tlJB9/2CP+jYrdvb2Vm8M8RB9F
         N48DZ3lw5C/pLtSBcLm3yhTC4e0TwP9DJOGXRRj3+jHvV3ugg9LAufEG3wZg2BVsoumc
         534VI0RoYSlztvjIObksiY5wkxL7q7/13GXiS+auJCfFOnRmoBsXTJVWUKiagxutf0oW
         E+Nw==
X-Gm-Message-State: AOAM533hjx3mQu45Dgfwxn36mjRLAX4yRTMiBCflumTaoKco4am8w98E
        bcgCVDnq+E6EwsGLAy5TtaJP1Q==
X-Google-Smtp-Source: ABdhPJznm23JfEqj5UmVgS4Swq3v1SnUWfjL55likkes1GYDPsbFDk1FcQ1ZXkwDTG5Sj5Lzzxi6lw==
X-Received: by 2002:a62:f24e:: with SMTP id y14mr2913204pfl.116.1589438334034;
        Wed, 13 May 2020 23:38:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id j26sm1351855pfr.215.2020.05.13.23.38.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 May 2020 23:38:53 -0700 (PDT)
Date:   Thu, 14 May 2020 12:08:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: linux-next: build failure after merge of the opp tree
Message-ID: <20200514063851.4yrixgabncsgtqii@vireshk-i7>
References: <20200514115811.1c6192b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514115811.1c6192b5@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 14-05-20, 11:58, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the opp tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> x86_64-linux-gnu-ld: drivers/opp/core.o: in function `dev_pm_opp_put_opp_table':
> (.text+0x76e): undefined reference to `icc_put'
> x86_64-linux-gnu-ld: drivers/opp/core.o: in function `dev_pm_opp_set_rate':
> (.text+0x2c59): undefined reference to `icc_set_bw'
> x86_64-linux-gnu-ld: drivers/opp/of.o: in function `dev_pm_opp_of_find_icc_paths':
> (.text+0x3ca): undefined reference to `of_icc_get_by_index'
> x86_64-linux-gnu-ld: (.text+0x441): undefined reference to `icc_set_tag'
> x86_64-linux-gnu-ld: (.text+0x542): undefined reference to `icc_put'
> 
> Caused by commit
> 
>   12fa389dcf86 ("OPP: Add support for parsing interconnect bandwidth")
> 
> I have used the opp tree from next-20200512 for today.

There is some issue with Kconfig dependencies, we are working on it
and until then I have removed the patches from linux-next branch.

-- 
viresh
