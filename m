Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B82E42460C
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 20:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhJFS25 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 14:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhJFS24 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 14:28:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8858EC061746;
        Wed,  6 Oct 2021 11:27:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j5so14152784lfg.8;
        Wed, 06 Oct 2021 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=708AEQuiZCijIwgOwtwo8A7GWADAWmYjkj9nf4ZRlHg=;
        b=ke5w+08CcVwD+HJiZkbjHA9caJEdInWj/PMhuZqcwnBbLLnOfrybA1ymnNbQOH/MKW
         8pP31snlAo7u2dHLKBMnX0ldcuidq73JmxlCN3ceux2QU96YhvlxOWB82RWJkUG9VgP9
         cvB3H3BC66hwXa741Mbj4U54zRn8NWVFPawYmqFb70HP2OhGe1Zs6/twp6RrKclkBGHO
         F8k5zKzlapyUnpLu/r4yvPwZ1BncNQQhZOT7eq7WFwcu4hV6DN/CROXAjKNVBgPQMTX5
         MnDHQc+7u/H5kbA9NqwevA5Z9rY5Fd/WASNgkVj6b4AfpMkCJU6aoPVQxUHCEQAFtCS8
         V4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=708AEQuiZCijIwgOwtwo8A7GWADAWmYjkj9nf4ZRlHg=;
        b=0KL0KVnBhzEaxuTkToQ/TXHTVzbFTJl/kQ2LvFjZwYRtSesNmKknQvt46gNM7Yguqk
         9hsNUHgVrsyGlhFydbjr5Qofk8fNbFBvevIhTNBYp23GEwGfpzqTeUraHbEPTz2zYO9p
         BdmUGqg5SwPgaiZXGkaSWYprdJFCk8bZnUQSlWfJRl7qN67KnSXwLuiwgF5YJo/SVy9z
         s95OTT43a+1yZEeASN/5lvwgKyf6Dmvm9kdIr0a9oC9WsUHjo6bpe6GZfRdAV8gKcyHH
         d9tFiRAxVGy5WmrW0znDjFzSR+UconPSzuj4LHZVd3IiOECwErO014hdv7bnTDYKcsLM
         vJrA==
X-Gm-Message-State: AOAM5301zHYL+zJzJ4lWeQGjo/xkUZAxZ57Ck5yYS0dSXyyjGMGjQpbi
        cGmSrqes2KlP6erdc2/Vdl2tR34JLeU=
X-Google-Smtp-Source: ABdhPJyBbs//gLeSNdZPqby54P777sC+ew4qK7qRkKAxn2oKFQmtbjM6W/hMBOE2SWJsncZm0naNJQ==
X-Received: by 2002:a05:6512:39d2:: with SMTP id k18mr10734863lfu.379.1633544821819;
        Wed, 06 Oct 2021 11:27:01 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id a15sm2360693ljk.46.2021.10.06.11.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 11:27:01 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the tegra tree
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211005103952.0914094d@canb.auug.org.au>
 <445e6daa-f210-74c5-cf8d-4aa138136b7e@gmail.com>
 <YV3kQPYVKraegCf5@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ed5e10f-7415-4de5-bc2d-a189b78660bd@gmail.com>
Date:   Wed, 6 Oct 2021 21:27:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV3kQPYVKraegCf5@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

06.10.2021 21:00, Thierry Reding пишет:
...
>>> Presumably caused by commit
>>>
>>>   bbe30ae68d14 ("cpuidle: tegra: Enable compile testing")
>>>
>>> I have used the tegra tree from next-20211001 for today.
>>>
>>
>> Stephen, thank you. Now I recall what was the actual reason for my
>> version of the patch [1]. Thierry, please use my original patch, thanks.
>>
>> [1]
>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20210912202907.28471-5-digetx@gmail.com/
> 
> Sorry, I forgot to reply to this yesterday. I found a simpler fix for
> this and I pushed that yesterday. Today's linux-next didn't have the
> build failure anymore, so I guess it worked.

It works, thanks.
