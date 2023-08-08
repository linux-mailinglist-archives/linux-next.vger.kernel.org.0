Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1E88774D26
	for <lists+linux-next@lfdr.de>; Tue,  8 Aug 2023 23:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjHHViL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Aug 2023 17:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjHHViG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2023 17:38:06 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB47B2E7C7
        for <linux-next@vger.kernel.org>; Tue,  8 Aug 2023 09:29:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so35270e87.0
        for <linux-next@vger.kernel.org>; Tue, 08 Aug 2023 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691512171; x=1692116971;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh7vVq+lBNgLIRPH9xxdchgiIa0a10vMXaN7DcI4VXc=;
        b=J+w/CFNAwMXR7/WLNcBnw9CHgdC9ozsFVYrR77X2s0GKWqlvXNczC6Bd9sPzd7oEnq
         2aML1Ux5OhENDKfWN+Ff5BdR2ZFfQfBObivCNnHHBCZIC0O5SsgvEr70D6kPC78kSXxS
         HeHz0CI5zrfIh85bCJYR45LXcQnCw8mO43YvsQP2z/8xksGPHnMRg3/noIRiEm8PiB00
         mUt7FvBIznsmUbwUcL1fvnTZEuDsV0VGgPcT8odz+PNQdfdxUvrZKqXPL2gltugEfVDi
         m2OuQJwzIKMV3YdOAMS+UgC4+ib5sjRTLKTTO7u5Dey3zy3GReAz7AtUpH1HFWipkGo+
         /qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512171; x=1692116971;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh7vVq+lBNgLIRPH9xxdchgiIa0a10vMXaN7DcI4VXc=;
        b=dndBzxJuS7siK4SUmbPkYZ75oIWA9/Dt899IvCNRVmu/5di2ji7X+YSpXgDZ8wr/wV
         CyttSlRovTdyHxnd5r2NUz4WKcNT3bE8PF2Sghbk4kxx+FcsyMuHWrXs9+uNoa+IZi6S
         Xw1Oj2OxcZXyk/KeQM1au/xJPdLLmsT5Ps9DSY2UfZc8PJaeeLj/iliq6p5TJhhR0Cu6
         DbjLRyd1+H/JM8RQB9J6xa5HcF8SMufMWusR5m1qEJ7d6xKpfPMaBHLlAvdbss6GnQNc
         KUHo2dnZHA0ZcDsCYrVcAYDy0GPhCHsahz9cjxrr8ap1viYeW6GcdUT2n5KfoD5kWBR3
         j0Sw==
X-Gm-Message-State: AOJu0YxCsEWDBS3+KfeSzWIFyrjcePAd8psViGSD2TgqXsT5q8hkJk9x
        Lj/blwLvFhiKPE1VXepPEkBfeO29Mko=
X-Google-Smtp-Source: AGHT+IFVdet6P7pamaYQCdT/9KDI9EZx6uC0iW72eggWnpMt/hWSErFnz0Z77X1f5cmXEaHHANP6WA==
X-Received: by 2002:a05:6512:10cf:b0:4f8:4b19:9533 with SMTP id k15-20020a05651210cf00b004f84b199533mr2325210lfg.19.1691476147113;
        Mon, 07 Aug 2023 23:29:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f8:1500::5? (dc78bmyyyyyyyyyyyyyct-3.rev.dnainternet.fi. [2001:14ba:16f8:1500::5])
        by smtp.gmail.com with ESMTPSA id n11-20020ac2490b000000b004fe20737eddsm1760212lfi.254.2023.08.07.23.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:29:06 -0700 (PDT)
Message-ID: <77da4183-465b-54be-5429-821f7cafb909@gmail.com>
Date:   Tue, 8 Aug 2023 09:29:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Signed-off-by missing for commit in the iio tree
Content-Language: en-US, en-GB
From:   Matti Vaittinen <mazziesaccount@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230808083925.7109a675@canb.auug.org.au>
 <f7a20a95-48fa-edc0-9724-bfb4484c155a@gmail.com>
In-Reply-To: <f7a20a95-48fa-edc0-9724-bfb4484c155a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/23 09:26, Matti Vaittinen wrote:
> Thanks Stephen!
> 
> On 8/8/23 01:39, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commits
>>
>>    a00cf70f16c9 ("iio: light: bd27008: Support BD27010 RGB")
>>    16a9947646f7 ("iio: light: bu27008: add chip info")
>>    ae8c47c51e5c ("dt-bindings: iio: ROHM BU27010 RGBC + flickering 
>> sensor")
>>
>> are missing a Signed-off-by from their committer.
>>
> 
> I am 99% sure I had SoB tags added in patches. 

100% sure now :)

https://lore.kernel.org/all/cover.1690958450.git.mazziesaccount@gmail.com/

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

