Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E785143BC4A
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 23:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbhJZVX6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 17:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbhJZVX5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 17:23:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C87DC061570;
        Tue, 26 Oct 2021 14:21:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u11so1685324lfs.1;
        Tue, 26 Oct 2021 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c5OBCOayNM+ahOKWFCvMvbMLQyTktxuakOI4SZHS+Q8=;
        b=NdAfM41w1YbqQtkF8LWRgH8Zaa+v49Pt3WuNqytZiTQqIi7WATGox5KyIy+udKDVvv
         Y37BYqaJwAfaZEr0zTGVVM49sLFN6kasNPaIMsNZOPS0Dcb2O2RXzWRvUQFcSqzQS0PT
         l7ObzpdXGhF24KdmvwokP7N4h5wma9BlmDRz12+0DqCNYxgs3KTWiL3O42kCdk5169Jw
         ltP9xn4ePVDY9jz+baUj2HeQxCprbwOFISQID3qyV2GzS+CGQrW6+7/Q60ZXayUNlVkE
         p/A+R9GYIia3f3J/SYLU4sTSvIp+aRoylkM7XxyLn5hW7eTcWAPkx5NLk+Wj0WfuEycT
         72lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c5OBCOayNM+ahOKWFCvMvbMLQyTktxuakOI4SZHS+Q8=;
        b=4lC5sDUMsK4vfHw/AZ6iAWz8AfKkG3plMdaFCdt3LAp0nQA7bsO28EnVLLnYtbVr51
         xuhR11IxADs2pjQ05Y/u7lY+ttirxSfsKIGEczQFT7vd3Cm9nUAtQhqTS3V1fwM4HJKE
         0ZQMGkM4rqzgFPqF3od7gb7E6fGpUhFLrgQ5SX+JIubhGMrlksaC+u1dE3jVVugDHPSd
         AdWZFXqb/2gY5jxLgaYC4ZijILw+vl8slrXOmSAHgFa0gSB/2W0mLwgzJbZsS/Da+VV/
         Pbib0c+bIq/is2yN5lJa1plOSZkRoS4ta3+nxcanAcSKn8uRpU1sI8K7bB4jQehDn0yH
         kLCg==
X-Gm-Message-State: AOAM530MCG4BA7X62uMXP8qtL8CktL1sEDwVx+pxi93+3A9fr3PqB2sZ
        3Y8n8XPPJKKwSRK55cZ9c7jPqWD2l1Q=
X-Google-Smtp-Source: ABdhPJxPNfzhptmXfaiLTa79HodQwgyptJ5vN986WIoVIxJ6zwj6xrGO51laa6qMvytsjvn4bw1gcQ==
X-Received: by 2002:a19:ac4a:: with SMTP id r10mr25258478lfc.393.1635283290515;
        Tue, 26 Oct 2021 14:21:30 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id d22sm479076lji.127.2021.10.26.14.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 14:21:30 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Prathamesh Shete <pshete@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "Kartik ." <kkartik@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211026162852.6cf2a2aa@canb.auug.org.au>
 <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dad7a9b1-6521-801c-d8b8-75dca8a4bfdd@gmail.com>
Date:   Wed, 27 Oct 2021 00:21:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

26.10.2021 15:30, Prathamesh Shete пишет:
> Fixed following warnings and error.
> Attached the patch that fixes the issue.
> Please help apply the Patch.
> 
> Thanks
> Prathamesh.
> 
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au> 
> Sent: Tuesday, October 26, 2021 10:59 AM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kartik . <kkartik@nvidia.com>; Prathamesh Shete <pshete@nvidia.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build failure after merge of the pinctrl tree
> 
> Hi all,
> 
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_get_group':
> drivers/pinctrl/tegra/pinctrl-tegra.c:293:12: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   293 |     return &pmx->soc->groups[group];
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/tegra/pinctrl-tegra.c:282:25: warning: unused variable 'g' [-Wunused-variable]
>   282 |  struct tegra_pingroup *g;
>       |                         ^
> drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_gpio_disable_free':
> drivers/pinctrl/tegra/pinctrl-tegra.c:341:10: error: 'return' with a value, in function returning void [-Werror=return-type]
>   341 |   return -EINVAL;
>       |          ^
> drivers/pinctrl/tegra/pinctrl-tegra.c:327:13: note: declared here
>   327 | static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   a42c7d95d29e ("pinctrl: tegra: Use correct offset for pin group")
> 
> I have used the pinctrl tree from next-20211025 for today.
> 

The tegra_pinctrl_get_group() should return const and not cast the
pointers. Please make another patch to fix it properly.
