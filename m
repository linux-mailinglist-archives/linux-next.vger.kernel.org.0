Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82B533D5C0
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 15:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhCPOaH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 10:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbhCPOaD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 10:30:03 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A353C06174A;
        Tue, 16 Mar 2021 07:30:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 15so20724354ljj.0;
        Tue, 16 Mar 2021 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0+3HYnpibIcAWdkNbHU8fQYPX0pnfBpvfaWaXWPc9D0=;
        b=KXRt6RBh5FHmcv9V9i+17SwAhbYc2pH59PJWVd3+Hf/fqUL6220xlZLkccPjtMeud0
         jVT5vqfc6uRyeVm1EEJTUcOmHlh56J4WgwFhj14RRLvCaulJCw7ZHn+KIupxhLZ10sn6
         0ikdB27oe6dzlDmNAZogqjxgPLqss4sEHUlEN3mDSLWo/3WAMcZIoRsu15GMefVsYEtK
         ZyekhO4P/nRch7uNjxAukg/aJ8YcxwiFrPFdGHLH8GqRu/UzhuJLRVGxpcMgATTQQeKe
         CmfEUdfUmOsml2dYDqv/L6BqZMicII3Amn0vjkSGE5yDHFRqpBAXt7Rqhvu4mZRzWXiN
         2ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0+3HYnpibIcAWdkNbHU8fQYPX0pnfBpvfaWaXWPc9D0=;
        b=Amr7rHbzKK9LzKh+jLqMxuDE/7SmGFTcp/UKNHwBXpSwBODPjGt3qjM9YHglQeppNq
         nALOZUrE+d8DnLcxZ3qH0o9UPnUVK5lJdvHBL/YzIGVntQcwUSqWfFITiS529Wi4pj/s
         uHlO2pBstI0kKpsUqjswn4sICG+aKoUu+J2awqzqWsdVrQWPlZ3gzb3+HYqGHxuZDDT6
         Mrc3x8Xz0f45j5xF4FKn+ST1tnN7zp19Dgd8s411Qca3GHmsIzWVCnzE/piVIXhWqmE+
         JveiTfvuFFkauzUbm1XqvnQxkBBswg5Vz1UsOSipCKrHY80js84bCY+Qk/6sgBibKa2M
         TrwA==
X-Gm-Message-State: AOAM532XRmCSGiV/lrFvU+NklMsGKrp+/PUJXmHqm1tZvaG8rJIQXC6/
        aOuM81YhtSwfOa7DKSgAJjkAIme4cz8=
X-Google-Smtp-Source: ABdhPJwY+dN5TsowQYTflJHCYDOkOAGIpd/ibq/P0t9Dh1zNMiJ9jRQs21fQ5sq/Qy8fGFNq3G7MVg==
X-Received: by 2002:a2e:144c:: with SMTP id 12mr2846379lju.113.1615905000455;
        Tue, 16 Mar 2021 07:30:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id b25sm3109013lfo.72.2021.03.16.07.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 07:29:59 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the opp tree
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210316111511.64e7bf21@canb.auug.org.au>
 <20210316044828.lhl3ex5672kaydhn@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <203906fb-b83e-881f-254e-349f4c9806fb@gmail.com>
Date:   Tue, 16 Mar 2021 17:29:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316044828.lhl3ex5672kaydhn@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

16.03.2021 07:48, Viresh Kumar пишет:
> On 16-03-21, 11:15, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the opp tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> In file included from include/linux/devfreq.h:15,
>>                  from drivers/base/power/main.c:36:
>> include/linux/pm_opp.h:341:1: warning: 'devm_pm_opp_register_set_opp_helper' defined but not used [-Wunused-function]
>>   341 | devm_pm_opp_register_set_opp_helper(struct device *dev,
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Introduced by commit
>>
>>   357b804aa0b9 ("opp: Change return type of devm_pm_opp_register_set_opp_helper()")
>>
>> The "inline" was removed :-(
> 
> Fixed and pushed. Thanks.
> 

Thanks!
