Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC18348B4B
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 09:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhCYIOf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 04:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhCYIOH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 04:14:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54634C06175F
        for <linux-next@vger.kernel.org>; Thu, 25 Mar 2021 01:14:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kt15so1405944ejb.12
        for <linux-next@vger.kernel.org>; Thu, 25 Mar 2021 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=78aguTeECvUqJlFCjkOA3FPCTCA4cU4wQo18ZlFqVds=;
        b=A7YyUkwtr95GFkpeaWC4lArNds0PM2j+ltyi94/BVLKquE2TPOuZoUIXYvTSWNp9yy
         I8wY5UUIXbbJepSAEs0aG4Cx1UrU4YNSmKKTbyTZ/hQRQ3/mg6tY/OL0dFumP/mgMOOj
         ktomNhRkhvDRI86UBoXPx2nczQ0dp9K+79Lmd6OVSTJUKeLAxQ5WZkC1Es9f6NJxi5+k
         3V3zpH8sUBYfhDsoef/Gn7JwUtYcxLjLuOVMtLJHIGor4cLhJT7CurAQ4T6H2pKJodQn
         Mq9hz7cWghbRpCEcKp9rHcDca1KvfK+oiFKBopJhojtquG8C9W4p2u1vzy9yt2pNKwBC
         YzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=78aguTeECvUqJlFCjkOA3FPCTCA4cU4wQo18ZlFqVds=;
        b=jRBq/znFA6r/xT8nGn5/WwGchayWtXlMYXgmogfAQiz0S+ScYOW0ufTmlp51xBu08i
         dCD13jl3mD+iyqUd0P9lnpWVa5nOlvIcS3ZOxhhSCMkQNy7oWcS2FgmVU44C5GhthwYV
         +UCFL3yVVZzfwvyVdyoTPsucmKEx4qCPoKrUGhDI1y1pGlsgN5TBoFsSy9g+CITxMb4S
         OKYF4+on/jZELsM+z/HXGq0H6cN/HPZAQPSZ07M3A8jsNBCpVmfzVCU9owC8WvDG0GjF
         FMLhgQ4r6Ylf8526Mc40EKquT+NRI9Jvhqcmtahmw3L4Gu92RkbPLw81jrM1O5542RpI
         Zo3g==
X-Gm-Message-State: AOAM533ShgvPw1fSr8wesDdsFyOaF5fDnl0TAcdvbCDrPxyhCQ8bS3lJ
        l0+5TGNrxxj0Mzhy0+5jv7dhog==
X-Google-Smtp-Source: ABdhPJxu076cJzW6tB5muGPClE9084UQpEb68XbJV1pH77d5TlcH9qR+ghus+bT1v176SEyeawViaw==
X-Received: by 2002:a17:906:4f02:: with SMTP id t2mr7888320eju.121.1616660046098;
        Thu, 25 Mar 2021 01:14:06 -0700 (PDT)
Received: from [192.168.1.54] (hst-208-220.medicom.bg. [84.238.208.220])
        by smtp.googlemail.com with ESMTPSA id nd36sm2056890ejc.21.2021.03.25.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 01:14:05 -0700 (PDT)
Subject: Re: linux-next: manual merge of the opp tree with the v4l-dvb tree
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>
References: <20210323112705.3094525d@canb.auug.org.au>
 <20225c7e-1151-7865-2bc6-a1e5694c3d65@linaro.org>
 <20210325042530.5clexogqy77v75sm@vireshk-i7>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <49a8bca3-d18b-9977-23c2-1dba6e61ef85@linaro.org>
Date:   Thu, 25 Mar 2021 10:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325042530.5clexogqy77v75sm@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Viresh,

On 3/25/21 6:25 AM, Viresh Kumar wrote:
> On 24-03-21, 16:49, Stanimir Varbanov wrote:
>> Thanks Stephen!
>>
>> On 3/23/21 2:27 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the opp tree got a conflict in:
>>>
>>>   drivers/media/platform/qcom/venus/pm_helpers.c
>>>
>>> between commit:
>>>
>>>   08b1cf474b7f ("media: venus: core, venc, vdec: Fix probe dependency error")
>>>
>>> from the v4l-dvb tree and commit:
>>>
>>>   857219ae4043 ("media: venus: Convert to use resource-managed OPP API")
>>>
>>> from the opp tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>>>
>>
>> I don't know what is the best solution here.
>>
>> Viresh, Can I take the OPP API changes through media-tree to avoid
>> conflicts?
> 
> I already suggested something similar earlier, and I was expecting
> Thierry to respond to that.. Not sure who should pick those patches.
> 
> https://lore.kernel.org/lkml/20210318103250.shjyd66pxw2g2nsd@vireshk-i7/

I guess you meant this thread.

https://lore.kernel.org/lkml/20210314163408.22292-1-digetx@gmail.com/

> 
> Can you please respond to this series then ?
> 

Done.

-- 
regards,
Stan
