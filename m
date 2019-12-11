Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7EE11A3A1
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 06:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfLKFGx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 00:06:53 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44675 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfLKFGw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2019 00:06:52 -0500
Received: by mail-pf1-f196.google.com with SMTP id d199so1155406pfd.11
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 21:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ifjsPJTQzkQ2KlgKp76bEF84qFDaLY48iNcB7Bofick=;
        b=vVvt1OVHSL5OQJeIbM36oMNSMhmv1CaIQUmRcBppurMgdJYqfT4JjdCQECqr5i9T9j
         SnaN/VrPUt5s6UNCAyFFMkg401bPAC1kakvx6GZ7yl9cMeqVjr2Dv3YBwCMrQXSVxRaR
         M36+jQ48T8w5U/vVOk+BEyfH7Cu068fg+ppB1MF/h7Odyacbk4Fv1MyZ3e8RWJYPe8Wj
         DAixZ8kOrMDsB8jRPudLtwUR1yGesqx3/VUm2FiBcFXwrQ4Dh7t7DzJfcahilT8IIKEP
         hWtIIUZbJyMyFwXrQRsz5EwWCGWRPZmrPubWqVNs6ZZjERYpBDbNL9XnyRaYCjFhNIA3
         iCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ifjsPJTQzkQ2KlgKp76bEF84qFDaLY48iNcB7Bofick=;
        b=Yz5bVZfCd63mJGbbp5M7SH/zGpdccuO5bp24xvW3pdDO0g8/VI3T71wMDsj3GqdI9Z
         ZAUVBKQQCHik+lMwnIL5h1GTditVx8XXqRo77YOwv50xgVdITM+6XeMG3kaVZ99Kv0EQ
         vwQK+yfAlORN9KQo1d5JiylQS3Kdcoas6jf8BgAc9qSvCL2EAJEPfqgTdOX2WVfjSovv
         GM8m6lfO+toR3LX7Jr65spwZpD557w9OBprUlxWbLcn0VQcUzuqJXiEcR7bhGO454fP1
         Mw+JezFUYvl3w8aMTDijdPjVCnYlh6I1P6EAlOn73Wd5KF1AMObhxlMeD+NhUWVDLFDJ
         O0JQ==
X-Gm-Message-State: APjAAAVz+O7QZcg55iDza0omfFhv0MbqGidDintAG888cFJ2MI9rMbz5
        VG3GoXLfJuprR3I+/bIyZKTWDnXIVu8=
X-Google-Smtp-Source: APXvYqxbK292MGhDd5Bk+LBvMluPSMJquMNhdtJad9GSB25pwbMbUKFckEq1WO5QxUgL15z0v3EMrg==
X-Received: by 2002:a63:7843:: with SMTP id t64mr2068017pgc.144.1576040812087;
        Tue, 10 Dec 2019 21:06:52 -0800 (PST)
Received: from localhost ([122.171.112.123])
        by smtp.gmail.com with ESMTPSA id w5sm763907pgb.78.2019.12.10.21.06.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 21:06:51 -0800 (PST)
Date:   Wed, 11 Dec 2019 10:36:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the cpufreq-arm
 tree
Message-ID: <20191211050649.2dgu3ufn2ltkgvce@vireshk-i7>
References: <20191211142100.423ef8b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211142100.423ef8b0@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11-12-19, 14:21, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   dfb3f45d17b6 ("cpufreq: scmi: Match scmi device by both name and protocol id")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks.

-- 
viresh
