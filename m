Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3190B262A37
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 10:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIII0Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 04:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgIII0V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 04:26:21 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6BEC061755;
        Wed,  9 Sep 2020 01:26:20 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so1407800wmi.1;
        Wed, 09 Sep 2020 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0tser96rfwYDofy0EPeasgbVCZPbEY4uhvx+UNJk7TY=;
        b=BPnzPnO4oojkbPwwQ+0Z61XoMwy6xYQQjtqbkQFAMBZZi0u2dYGWUYuTuhCQDBnylT
         pxRTHvu/EFFhd/QFpWTxRI/iQkaI7wvBE6NqGmbAJQl6jzPAdc+YZevHGIB4vQy1UTP2
         kFhNq2lvB61ZSBHEtCsg6fWNkQUYp1VTsHfgy4NAEgUNhICBJmxpVlAmVPXrRdKJP8lQ
         pDv/AgNWCr5FQfsegNeWRO3S2jATIcW4F21Z4J4AV85E/oe0Hw5X4BjFZy1daUaXkyQs
         z7B+/v4LZEoAQ93xKVCYVlduyJcBC+iVMJ8LdP66/9/azKhj/0/qrQZL7MwM0R5jrgh5
         QMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0tser96rfwYDofy0EPeasgbVCZPbEY4uhvx+UNJk7TY=;
        b=H6IGnv1J3rIDTCeCdnYA7NgoDDFoLR/ejQgiXm7cw7ni5bA/NS4/VSCYrTdj9HFeFn
         F4vq8GnbjePRGafYXrBBQJc66DP96YQp7X7rKPwdhlluHEVvy57yHKTnU93mtIN1Pa1s
         yRMyTyGM0TKNaufo/FVSao1xA7TUz+D/iffF2aeEHq6JIq0C1jnxf8ULwALBhy4f+oTJ
         lUA5i5FNT9sWdBHe4VxmRwTbqUCp7n5b4HonZA1PbWWwOYcZOn7BbFoz+SYkqdmBM6+a
         nZboFk8kjCtnFQENYbVh4FbrUhDtxQZbAhVSTd1mN6FL/BiI06W4pglndMXrqTdEWv0I
         8uDw==
X-Gm-Message-State: AOAM531uP+LrO8SQtFBMdbvaccescBbcNYXiqCyDmxuIV/b0vPq5hVqA
        Te9mtULUYVU/Rj2QNPoVdm4=
X-Google-Smtp-Source: ABdhPJyraZ15izydbCG6UBgB4j4rhsVZ2DuZgUSzsoM3JvzdEpsWBZA+CaCVMh9UKb9tgibKOdkJtQ==
X-Received: by 2002:a1c:dec2:: with SMTP id v185mr2357481wmg.1.1599639978820;
        Wed, 09 Sep 2020 01:26:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
        by smtp.gmail.com with ESMTPSA id o128sm2672667wmo.39.2020.09.09.01.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 01:26:18 -0700 (PDT)
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Erin Lo <erin.lo@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ced30a81-5893-6379-cdc1-c2e57d35bae4@gmail.com>
Date:   Wed, 9 Sep 2020 10:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 02/09/2020 18:23, Krzysztof Kozlowski wrote:
> On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
>>>> From: Eddie Huang <eddie.huang@mediatek.com>
>>>>
>>>> Add scp node to mt8183 and mt8183-evb
>>>>
>>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>>>
>>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>>>
>>> Bjorn, do I understand correctly that you don't send emails to the list
>>> informing of the inclusion of a patch/series in your tree?
>>>
>>> Anyway applied now to v5.9-next/dts64 :)
>>
>> arm64 build dtbs failed on linux next 20200902.
> 

Sorry I was on vacation.

> I just hit it as well... I wish the kernel was built after applying
> patches... it would make the next a better place.
> 

Right...

I'll remove the patch now until this is fixed. Once again sorry for the trouble.

Regards,
Matthias
