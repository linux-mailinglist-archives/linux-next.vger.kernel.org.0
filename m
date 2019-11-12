Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A143DF9405
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 16:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLPV0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 10:21:26 -0500
Received: from mail-qt1-f179.google.com ([209.85.160.179]:42342 "EHLO
        mail-qt1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKLPV0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 10:21:26 -0500
Received: by mail-qt1-f179.google.com with SMTP id t20so20110257qtn.9
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OOO/kRQz/n/ms07NEUSXIk1OldccFF5019QRd7YGzOA=;
        b=n2YL0hZJXjhHmUAQveEKSiP6iFfaqfJM+DXy4WOkRwKCaTywjV9H7SuI+Jjz+w4gxu
         NFRoQaVHSGspDZ/L/4H/xmyjKOowKhntlS7tKKKGJ+HVBB1Eaecoy1+7kaHfaMPcODns
         ex/pafK89u708pUG4Ds6Z1dcCup/5dAekbFq21iIEam+odH7nIZkRrtOCngcCYq6SsOY
         HzMwTpyI2/H0vi9FwK2XZOiUuBt/oFbtX75noDiu0JQOHwIH5SizCmVHOox5+qPDt27g
         UfxPm5gs9GlPhOojwz6+WZIIBbw6ye62+V5+rvDglSGzX/ZA4toWpoxQRVHcqG/GYDgf
         INKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OOO/kRQz/n/ms07NEUSXIk1OldccFF5019QRd7YGzOA=;
        b=AX7bcu9SI9nLG3r56vEGfTZBGkJu7kdG3p1GuPqPro12pdZXMYAC/YfNA80fDlMtap
         8qMduTjla5y0re2twy/Vyd1J8nRwwrwJZJw7jzR2qNdK5loc1mHE/u685iiytkf6DNxb
         QC6I6aJkdvKKSGW+hbn+WHsLlqu6H/vufpTSs005z+JbpNq60dvlWOAcxzik/Ire1lvp
         bFxl6GfMnSKvN2PS5EdQA68xUvyRiHItYinG6oALV+Azweg457T7XS43LyLOKR2dEALf
         h1KuGNAcHLPZBAf5ithOS+ZsAPicHUknSjyy25yUFA1THjFpZ+DWI+CJJmvPwNwteub2
         7IjQ==
X-Gm-Message-State: APjAAAVA96U9vl/f5HOXa3Mh+dKzNmSGXl3CJoCPwA1aKZFNBSRKxuEn
        +t15GhMq9GqcRl8TzGdn53S0Lw==
X-Google-Smtp-Source: APXvYqywyhsajYu8CDmf4m43BkMJIpzFudbb8MN+THXUpKGnCLRoh5aRd/uv1uUROYPIUmLdavd2Nw==
X-Received: by 2002:ac8:424d:: with SMTP id r13mr32241180qtm.111.1573572085527;
        Tue, 12 Nov 2019 07:21:25 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::aa8c])
        by smtp.gmail.com with ESMTPSA id n66sm9399047qkb.72.2019.11.12.07.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 07:21:24 -0800 (PST)
Date:   Tue, 12 Nov 2019 10:21:23 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     coverity-bot <keescook@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: shrink_node_memcgs(): Null pointer dereferences
Message-ID: <20191112152123.GB168812@cmpxchg.org>
References: <201911111735.8DBFBDF0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911111735.8DBFBDF0@keescook>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 11, 2019 at 05:35:37PM -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")
> 
> Coverity reported the following:
> 
> *** CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> /mm/vmscan.c: 2695 in shrink_node_memcgs()
> 2689     	memcg = mem_cgroup_iter(target_memcg, NULL, NULL);
> 2690     	do {
> 2691     		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> 2692     		unsigned long reclaimed;
> 2693     		unsigned long scanned;
> 2694
> vvv     CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> vvv     Dereferencing a pointer that might be "NULL" "memcg" when calling "mem_cgroup_protected".
> 2695     		switch (mem_cgroup_protected(target_memcg, memcg)) {

This appears to be a false alarm.

All the "culprit" patch did was rename the local variable
"target_memcg".

And while it's correct that memcg can be NULL (befor and after this
patch), it's the case only when mem_cgroup_disabled(), and
mem_cgroup_protected() checks for this case.
