Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0F139A37D
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 16:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhFCOkh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 10:40:37 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:41887 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhFCOkh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 10:40:37 -0400
Received: by mail-lj1-f169.google.com with SMTP id p20so7420814ljj.8;
        Thu, 03 Jun 2021 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hrCS3/M38iJScm6kFHBrw2Jktg25A1xuMFa4q3y6Sac=;
        b=jMBL3lLFeaiOxd99Hkx2P6Gn6gOYK0Ac1gja4uhJaXYmTsepD8tnXvF8IMbCy21/L/
         4nD7dc8O8WMlt1IJ7ssiViatyMluRFwInC3XlB9QDiMrC8af/gmygZDUet5qp1MC2Ru2
         Y0MFM0MARyOb/songip04vB40i0ZjmabqcsWziJrCOx4eF4Pt2VIrNBBAajZCNDoqlJ/
         3QBc5Srh/DNIAQFd3nDp/LkI1Z/VXbaLDULWNB8ILTAOw13JTC65q9hv6SzAk7u2dBWv
         1Kf7Vus2uIQXb1GPPD+rCLqT9qKR1Yas/FOL8mp2Ug5JFISkmhDrK9ndPPDEVvp5enxN
         4k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hrCS3/M38iJScm6kFHBrw2Jktg25A1xuMFa4q3y6Sac=;
        b=oSSI1PunkLXVJpgjBujnXAEeFpN+NQeYaQ72n++TAtM9J2rz05m4ISaCyHXFIRfR0J
         6QJSmr9/Ovcus+Uw3C7NAGUQ4yY81FPT/fXxDJNo/8WtKbwQduy/Vrd6FZc9W/pYtZWp
         XAb8ZDYW/prfPfplZ8yLMwtreAvW3UkPpb2mZb23dPyACgFQeFi4EGu/LwKWC+2feF7G
         /XNaxqji7qpADlg0nih/KA9jfi0P5lxw04C/oqJyq2aTnrHmqxpXUl35hvNO9I6eFFP/
         lqlF1R69cDMNp9SAzT7Wsw0I30WdySnOyq7Brs3XwQpXbJNV8WVDnB7zf9fFR7Ya/BnY
         zP4A==
X-Gm-Message-State: AOAM532iDHYAvptRrBiTcqpAukVB+/fGyz98Pry9Ql8TMLeAmKMQC2UP
        koaFzEGsCSqKu5sMCgSYiJxufD9F6JA=
X-Google-Smtp-Source: ABdhPJzaRC4PlHW+UGfS7nJgwd2RK7OPtpS/LL93OoL5pgA80gv/HTOu/SkGG+XgiSbQ9lOUCr46dg==
X-Received: by 2002:a2e:b0c8:: with SMTP id g8mr10554174ljl.453.1622731055908;
        Thu, 03 Jun 2021 07:37:35 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id t13sm385841lji.19.2021.06.03.07.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 07:37:35 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the tegra tree
To:     Thierry Reding <treding@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603103507.304b7626@canb.auug.org.au>
 <8d8f947e-2ba4-f7b8-cb85-dcee940c96b4@gmail.com>
 <YLjIqfeiaJqeJQtw@orome.fritz.box>
 <8966e56c-4da4-b360-7ce6-19d0af114bb7@gmail.com>
 <YLjomqomVuJ3QZNC@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5ed712a-3fb8-57c8-8738-090bfc23e7be@gmail.com>
Date:   Thu, 3 Jun 2021 17:37:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLjomqomVuJ3QZNC@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

03.06.2021 17:35, Thierry Reding пишет:
> On Thu, Jun 03, 2021 at 05:03:38PM +0300, Dmitry Osipenko wrote:
>> 03.06.2021 15:18, Thierry Reding пишет:
>>> On Thu, Jun 03, 2021 at 05:01:48AM +0300, Dmitry Osipenko wrote:
>>>> 03.06.2021 03:35, Stephen Rothwell пишет:
>>>>> Hi all,
>>>>>
>>>>> After merging the tegra tree, today's linux-next build (x86_64
>>>>> allmodconfig) produced this warning:
>>>>>
>>>>> WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
>>>>>   Depends on [n]: MEMORY [=y] && TEGRA_MC [=y] && ARCH_TEGRA_210_SOC [=n]
>>>>>   Selected by [m]:
>>>>>   - TEGRA210_EMC [=m] && MEMORY [=y] && TEGRA_MC [=y] && (ARCH_TEGRA_210_SOC [=n] || COMPILE_TEST [=y])
>>>>>
>>>>> Probably introduced by commit
>>>>>
>>>>>   08decdd5b448 ("memory: tegra: Enable compile testing for all drivers")
>>>>>
>>>>
>>>> Thank you. This is a new warning to me, apparently this case wasn't previously tested by kernel build bot.
>>>>
>>>> Perhaps this should fix it:
>>>>
>>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>>> index 71bba2345bce..3f2fa7750118 100644
>>>> --- a/drivers/memory/tegra/Kconfig
>>>> +++ b/drivers/memory/tegra/Kconfig
>>>> @@ -47,7 +47,6 @@ config TEGRA124_EMC
>>>>  
>>>>  config TEGRA210_EMC_TABLE
>>>>  	bool
>>>> -	depends on ARCH_TEGRA_210_SOC
>>>
>>> Why not just add a || COMPILE_TEST like we do for TEGRA210_EMC? Because
>>> TEGRA210_EMC being pulled in under COMPILE_TEST (and then pulling in
>>> TEGRA210_EMC_TABLE which is missing the alternative path) seems to be
>>> the root cause for this.
>>
>> The anonymous Kconfig entry is unavailable by default, it can be only
>> selected by other entry, IIUC. In our case the TEGRA210_EMC_TABLE is
>> selected by TEGRA210_EMC, hence additional dependencies aren't needed
>> for TEGRA210_EMC_TABLE.
> 
> The code guarded by TEGRA210_EMC_TABLE makes use of some symbols that
> are only available if ARCH_TEGRA_210_SOC is also defined. If we don't
> list the dependencies via Kconfig this could lead to a problem where
> somebody selected TEGRA210_EMC_TABLE without having a dependency on
> ARCH_TEGRA_210_SOC, which would then lead to a build error.
> 
> If we do represent the dependency in Kconfig, we'll get a warning like
> the above during the configuration step and the offending Kconfig option
> will end up disabled, and avoid the build failure.
> 
> Granted, this could be caught during patch review, and yes, there's not
> technically a need to encode this using Kconfig dependencies, but at the
> same time there's also no reason not to use the safeguards we have at
> our disposal to avoid this in a more automated way.
> 
> I'd prefer to stick with the explicit dependency in Kconfig, so I've
> updated the patch to match the dependencies to that of TEGRA210_EMC.

I don't mind if you prefer this explicit approach more. Thank you for
the fix.
