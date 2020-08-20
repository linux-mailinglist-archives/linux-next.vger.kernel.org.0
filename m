Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7847C24AE26
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 06:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgHTEzd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 00:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgHTEza (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 00:55:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAD6C061383
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 21:55:29 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t11so487192plr.5
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 21:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GRp8cTUZBPo/wu89k8h8epcnL9DHpVbjZCAKx3RrQgQ=;
        b=YGCpuY4pBMHxmfFxopytOMMcB4y0x5jZmWAn5tHTr6WQO83cY7QCcUTIHjFA0m6AMo
         tJwdhlhX7Ux42xbhGjwhqc+syQa70uLkWCYUBbqTngTCUJeDBP1y2WZQscqfJWgn9BjH
         WHIzs+GR94AUsnwp+iTuSnps/HWIzS+tw0QtS0uO1aClkzYbb8wgCOheRc3dBoi44EJL
         5e+Z8EyM820gy3ugEzx/XipKaVfsVPq6wF5RPtUxcq+rU472Te70vboflFyyAIzO49xL
         +Cu/86gCi3IDElrFXPUF1/G5KY+nzGLDkKZ1yoAG3Om7An+U8JQMCb+AjmxJ6/LDTkDi
         Arjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GRp8cTUZBPo/wu89k8h8epcnL9DHpVbjZCAKx3RrQgQ=;
        b=PPMVOjdvX+MpsOIsyRYOBEoPhcneKHpsHWDbocjz4jZesXEJt4PPWKJt3gPUDcwnoY
         XloIUl/GbKoJZXKR/gEooxM+fwqLz3aX9QGZWkZQG9YAyF6jd5plV6kTDlHKqFQrx9Zi
         udU7F4RQ8teWjtZFcW1sar5JUSoVr2oxI/Mb/o22Dtg+37ZZwaE8NSi3Mv0VG6AGNysm
         C13V5HCR+MNdDXBmi5kkDItRw2sDTZujzdB7HswQfU+fpczvUQeTMZDtqJ1kOE1d9YVA
         qNe++p1ucRv40/JSBgEisvh0E8joCqqMfrr3R+o4UULN0RAL64ZppUCo3TvPBGdViWzo
         KELg==
X-Gm-Message-State: AOAM533ryLEL/FrYj9vrQb654vSGKcwKSOkQyWWPvVmiT6VLTPvec6Hs
        DgJ/Jx5jbwgOIUw10oMsnLPoDw==
X-Google-Smtp-Source: ABdhPJzG08ZecwZe7DwN7GpfesIUWObmPDODV7kFoEhzxl57lAFc+7O9ZvYrzMFwxS5oOXPQZR6f9A==
X-Received: by 2002:a17:90a:6d96:: with SMTP id a22mr974996pjk.165.1597899329192;
        Wed, 19 Aug 2020 21:55:29 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id x18sm968281pfc.93.2020.08.19.21.55.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 21:55:28 -0700 (PDT)
Date:   Thu, 20 Aug 2020 10:25:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20200820045526.rj2qs6uodje4josp@vireshk-i7>
References: <20200820080117.6d7bcf00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820080117.6d7bcf00@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20-08-20, 08:01, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   ceac7fc18ac7 ("opp: Enable resources again if they were disabled earlier")
> 
> Fixes tag
> 
>   Fixes: cd7ea582 ("opp: Make dev_pm_opp_set_rate() handle freq = 0 to drop performance votes")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

It came from the author and I failed to verify it :(

Rafael: Do you want me to resend the pull request with this fixed ? Or
something else ?

-- 
viresh
