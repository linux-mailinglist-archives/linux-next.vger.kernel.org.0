Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E58D41A3E0
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 01:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238143AbhI0Xqq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 19:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbhI0Xqq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 19:46:46 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D7BC061604
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 16:45:06 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id a3so27808415oid.6
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 16:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JqLoyICjuF0AXXSIJxZWZPthYH16d9bmYV5/mKUcF5M=;
        b=NLHq3GFzcb3P1kf6fkPVyPy1il/ki5lmwUVH245vrtXiR9t+KwNBGZ9cJBGwkdC+8o
         05dejqPh+yHo8ezYaH2uyDRwJHqzBz5AN/+SzlY3BZXs1VcwrhGtx+J/ByNkEe8Rv2nc
         Mw/PhVs9kea9XARMz4lV50wa3a3MAnErX2P1F7ZId88q+e3TFxY/yyG6gSVZDrYNImjR
         zZNXrmw50AohCgftt+zvOG2LvmYkHcTpfEXHBYXIwbfxPOIG75+wbI7ZLeZ7vJ+/IRe5
         gwVLttENGufX9kdD+yNMAb9UaQBVG8RQiF/4R2lQfOIs3aUA/6Gp1G1kqC4ElWEjX24f
         oP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JqLoyICjuF0AXXSIJxZWZPthYH16d9bmYV5/mKUcF5M=;
        b=RsT8j4vxY82noqc3fiaYgTH9/NRBfph/kSso23Vl1VmX9tDL2JCe5oXgce5dSdV1gr
         zvQuz0WosEku9IvMrePl5vlKGPR0t+z0QEWvzgyvQLLw0AAO8TjjFk6vzx0K8k6UJ6zl
         t+FHQKGnd3kQqP2dvRsfoF3DsIva4Duv74P72qQV1M8KCKltlIaratKuf5IEge4qtUvn
         +vD24lhCnEebUk0ODjmwOdSkue4+jLdgQkeCplVRn/gyYwqrR0DkTH8xxcALivl78UTe
         ThFcH4rfL2tPEeiz0M8QZvjaylbHkZCfTi+mvLQaeAa2oN8P+JtIcBhg/r7wr0vdEcgL
         qNLw==
X-Gm-Message-State: AOAM530JDQlGrEIrLw/jPIzLKtV0cDKITJuZ4Oq96nq9BrKsXH0OZFGV
        R3SkUwUfaZmS0YP68OirdJ7pkA==
X-Google-Smtp-Source: ABdhPJzARudOjETO9PUHhAQSkJqm/aqe1/7TH24GozVdoehLcwYVkUDv+GFx5qXoh5GYpj+XnWrG4A==
X-Received: by 2002:a54:4818:: with SMTP id j24mr1321940oij.150.1632786305410;
        Mon, 27 Sep 2021 16:45:05 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g23sm4458276otn.40.2021.09.27.16.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:45:05 -0700 (PDT)
Date:   Mon, 27 Sep 2021 16:45:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rpmsg tree
Message-ID: <YVJXpBwfdMYKaE0R@ripper>
References: <20210928084011.3f2318fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928084011.3f2318fc@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon 27 Sep 15:40 PDT 2021, Stephen Rothwell wrote:

> Hi all,
> 
> Commits
> 
>   5346c95245ad ("dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT example")
>   e24acced0dd9 ("dt-bindings: remoteproc: k3-r5f: Cleanup SoC compatible from DT example")
>   6944d19dfd0d ("remoteproc: mediatek: Support mt8195 scp")
>   3c14c79a4c32 ("dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema")
>   fc265554dbc8 ("dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp")
>   d75e3e9fa929 ("dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp")
>   4d2236dbeb09 ("remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote procesor")
>   059efbbfa03a ("dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc")
>   ee3eec23f843 ("remoteproc: imx_rproc: Change to ioremap_wc for dram")
>   9da2a820edc7 ("remoteproc: imx_rproc: Fix rsc-table name")
>   f64051b28d2d ("remoteproc: imx_rproc: Fix ignoring mapping vdev regions")
>   cfaa53387e8b ("remoteproc: imx_rproc: Fix TCM io memory type")
>   a46fb6875d39 ("remoteproc: Fix the wrong default value of is_iomem")
>   c7e587505b2b ("remoteproc: elf_loader: Fix loading segment when is_iomem true")
>   a57645ea04bf ("rpmsg: Change naming of mediatek rpmsg property")
> 
> are missing a Signed-off-by from their committer.
> 
> All presumablyrebased :-(
> 

That's exactly the case, I rebased Mathieu's patches to avoid having the
sha1s of the already published commits change, and wasn't aware that the
rebase would alter the committer field (but it does make sense in
hindsight).

I've now signed all the changes off and pushed the branches again,
hopefully no one will "notice"...to much...Going forward we'll avoid
rebasing things and shouldn't run into this problem again.


May I ask what tool you use to detect this? Given that checkpatch
doesn't care about the committer (afaict)...

Regards,
Bjorn
