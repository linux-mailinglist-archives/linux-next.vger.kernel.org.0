Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6261939A2C3
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 16:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhFCOGl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 10:06:41 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:33426 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhFCOGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 10:06:41 -0400
Received: by mail-lf1-f50.google.com with SMTP id t7so1858671lff.0;
        Thu, 03 Jun 2021 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sYuxL4nj9tVsbiIRkQqNrv2LxSzvaJsLhi/PndX88+o=;
        b=ZtEg9IsWRo7g04mUoycUDEyt6DDSLHQAFrvFrzdzcdbtfwMKzYposnrxRL/kwFrJ0J
         LmquvBz1HzGgJbD2ji9jjfa6LtzjhTnECsLxJixm/xUZPCNihkfrq3W8GwP9xaGRPDs7
         Zw1zVrlx7chudghemkXHjL2tiBNpYsoREzojdxiTJQtGhUgX5l20eYoIwaQo8JoYRgv5
         7sIdAWki6jemAdCJyh2nSnwdOustBLfwppFv6ItdLTwtLUQljwQm86+GFDlgY69wBCGY
         56+1wWHuFR2kgEqXTMxJ7pukvOweVROGaUVxfKVeNCYEj/Jrd4dm5axA0vso6wNZPEWl
         CyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sYuxL4nj9tVsbiIRkQqNrv2LxSzvaJsLhi/PndX88+o=;
        b=G9sIgXqJaAeBP0s7Wg6wXeesRN4IbGUa85op9tWSJT56W02k2+c0QSjQ8ZMJCt4vyW
         F+IRfot45JrAq0RtFojwTP2rW6NHptNMIZIkQIooKxodd73vCCgfcPdci1T/DEwC+YZ/
         Qi+Y3PNM1qMItEeQYIRKA106q20y37cmPfD1JKpyCc5VuYtwD2Nla5msbg7+I/k53771
         Ll3CecXZuHrzJt8tofShWjkJXbREqWjCEYE8USb5tINISq6CZs1Sfas4eufq2Mns7fjB
         J2v7lKAvcsdTPuErzyfQCpFoUXwc6VcR7DvOhWDP/jXl1mHmPa0cVbFwEe5seJ9FlDIc
         Ms4A==
X-Gm-Message-State: AOAM533VUdxf0f1P17+kupQnCt3hlGwbEIBOAmAZfMt2EqmGHixqFFjq
        1kE2Rm3c69zMvmdmjDdqK3Fos2qRzMI=
X-Google-Smtp-Source: ABdhPJwsOlaolGoIvyy7lAw62seFPhAvq0G8KB8tHAq5kcyF9WP/rDqE0D2PelcJJX64sWsy7pYUGw==
X-Received: by 2002:a19:ca5d:: with SMTP id h29mr17369196lfj.370.1622729020667;
        Thu, 03 Jun 2021 07:03:40 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id w21sm327553lfu.174.2021.06.03.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 07:03:40 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8966e56c-4da4-b360-7ce6-19d0af114bb7@gmail.com>
Date:   Thu, 3 Jun 2021 17:03:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLjIqfeiaJqeJQtw@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

03.06.2021 15:18, Thierry Reding пишет:
> On Thu, Jun 03, 2021 at 05:01:48AM +0300, Dmitry Osipenko wrote:
>> 03.06.2021 03:35, Stephen Rothwell пишет:
>>> Hi all,
>>>
>>> After merging the tegra tree, today's linux-next build (x86_64
>>> allmodconfig) produced this warning:
>>>
>>> WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
>>>   Depends on [n]: MEMORY [=y] && TEGRA_MC [=y] && ARCH_TEGRA_210_SOC [=n]
>>>   Selected by [m]:
>>>   - TEGRA210_EMC [=m] && MEMORY [=y] && TEGRA_MC [=y] && (ARCH_TEGRA_210_SOC [=n] || COMPILE_TEST [=y])
>>>
>>> Probably introduced by commit
>>>
>>>   08decdd5b448 ("memory: tegra: Enable compile testing for all drivers")
>>>
>>
>> Thank you. This is a new warning to me, apparently this case wasn't previously tested by kernel build bot.
>>
>> Perhaps this should fix it:
>>
>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>> index 71bba2345bce..3f2fa7750118 100644
>> --- a/drivers/memory/tegra/Kconfig
>> +++ b/drivers/memory/tegra/Kconfig
>> @@ -47,7 +47,6 @@ config TEGRA124_EMC
>>  
>>  config TEGRA210_EMC_TABLE
>>  	bool
>> -	depends on ARCH_TEGRA_210_SOC
> 
> Why not just add a || COMPILE_TEST like we do for TEGRA210_EMC? Because
> TEGRA210_EMC being pulled in under COMPILE_TEST (and then pulling in
> TEGRA210_EMC_TABLE which is missing the alternative path) seems to be
> the root cause for this.

The anonymous Kconfig entry is unavailable by default, it can be only
selected by other entry, IIUC. In our case the TEGRA210_EMC_TABLE is
selected by TEGRA210_EMC, hence additional dependencies aren't needed
for TEGRA210_EMC_TABLE.
