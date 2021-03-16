Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935F433CCB3
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 05:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCPEsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 00:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhCPEsc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 00:48:32 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B991C06174A
        for <linux-next@vger.kernel.org>; Mon, 15 Mar 2021 21:48:32 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c16so16388085ply.0
        for <linux-next@vger.kernel.org>; Mon, 15 Mar 2021 21:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SzYgSD52MMc6W9e/iXobaze0AIN/9e342iYaGD6sHwU=;
        b=pxauHAxjA3A8T1tY4HEnP+igTGGVIKUACufX9aYjS9egmSGpyKIif0XLHdVwAl0u3U
         b4WtWtPdPL9hxbVDvELPd1VwcPVyUfiO8a0RhDtPiNL1wzZhXqqm4lbmIYL4IE4RRGBD
         K7FTqdGTt4ihID4e4nFE7Z1yXUTb1TpbhpBWfvSvY9cICq+vVMHQnb+WM5ddHTx2+yYk
         +4koPT+THDcefMhZKCnSMUNSzlh0MPyRgSiV2hetm+SmvS4szPx0NiO7xdi2SDj4Ayrb
         Y+EguaYRB87ZZ4uUOOfyN67fq/gpaM/4edN1MCADnFNbh/SmV6GFK5pPfccXwcs2W4Ih
         dirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SzYgSD52MMc6W9e/iXobaze0AIN/9e342iYaGD6sHwU=;
        b=LCDu/dBtYgK9mjdReejHSHKI0UnMBvqd0WD1YecrMD/igogxKhQa8xqAWzwZpmEYW8
         Whm78fEN9j5Np2Z0Gf3nxtRuGQnjH5ji0qxb5LpblkNo69bskqFiHp2vLBFs/PvFuCgQ
         oXOSwv10iCgQ3q6rcqB4RnVobs+g1q0wkZJdvexX9oSUryqMqqUcPHGHDTSXfJYn2MpD
         lhjStEJW5+GvUqCx9fvEj34bffjyYKYx/GN1QeEXxgwlTDs+7N1zRnSzmQ0IMLST+rSL
         lUfATEuAh4z8eM4uPLZ7Wwjc3x3cZThIZPmPnE5Pbp5bedLU+0Q8AWBj1cBrcBI0toBS
         ZmiQ==
X-Gm-Message-State: AOAM532PrrnXNxygrJ/VSdojCk4BPeP5y4L2ZcLg5xvgf9co106WuY3O
        TWTQhWYhmLuLVlMJ16DWgcx/iQ==
X-Google-Smtp-Source: ABdhPJzS2YFHTnUWBJjFUQ/Q8Y1wWNPBBN/k7ix1UJRAYORoxRN0pF/JCu/3etAGj63zduG6RVuWnw==
X-Received: by 2002:a17:903:31ca:b029:e6:65f:ca87 with SMTP id v10-20020a17090331cab02900e6065fca87mr14664409ple.85.1615870111898;
        Mon, 15 Mar 2021 21:48:31 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id fa21sm1219533pjb.25.2021.03.15.21.48.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Mar 2021 21:48:31 -0700 (PDT)
Date:   Tue, 16 Mar 2021 10:18:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the opp tree
Message-ID: <20210316044828.lhl3ex5672kaydhn@vireshk-i7>
References: <20210316111511.64e7bf21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316111511.64e7bf21@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 16-03-21, 11:15, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the opp tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from include/linux/devfreq.h:15,
>                  from drivers/base/power/main.c:36:
> include/linux/pm_opp.h:341:1: warning: 'devm_pm_opp_register_set_opp_helper' defined but not used [-Wunused-function]
>   341 | devm_pm_opp_register_set_opp_helper(struct device *dev,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   357b804aa0b9 ("opp: Change return type of devm_pm_opp_register_set_opp_helper()")
> 
> The "inline" was removed :-(

Fixed and pushed. Thanks.

-- 
viresh
