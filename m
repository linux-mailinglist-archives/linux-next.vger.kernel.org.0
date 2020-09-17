Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BB126E540
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 21:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgIQTQr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 15:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgIQQS2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 12:18:28 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A7CC061220
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 09:10:55 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w16so3096259oia.2
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sIkLaR4efdKIlF3DeDLkZaf3VX9CKFcY1gO9EuwPjhw=;
        b=XU8RJN/MqigKWw0CVB3m421NSqReUXfksDaZGEyos2nBpoXl1ju1yQqAubTgkTJcbn
         Le3xlkK/DbAdJStJ9Kh9Bjhx49Wq/gJyUoaIS9wL37TLIYu4rZcIHLj1dV8yjD9eSchs
         PeAb/xmeHxw4VmpM/0bVHuVg3XX2EEkwKPFaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sIkLaR4efdKIlF3DeDLkZaf3VX9CKFcY1gO9EuwPjhw=;
        b=lGhQdZ2uF582c5otTKRpoDRpGS4WKoQLG7Pn/Qws372WGOeqGISwZ/kqHUATbg23ZN
         fWdNOccU3rtatOI6KhQjgyTgRT1FuPP6ggswWtlT8xRHyXaH8r0n911Wwms0nAPdG1Pw
         fGhWulYwrRhzUu/lmmT86uP5VdAOGAb9mRyo8CA3Y/hiecxyFU8yXAB6PNjKCRaeymPK
         CV5p9IIw5aprizUYFmtWQhoNabJ2vdkjaDmQeFwQ72HHOtTPP1yyCS0WZmU2EXoB1olL
         HzO1v6ly+2hJmo5TL8YU5kqncEsosL9nXbyJf3QMDxBkYeeAbKt2lqmdv+AAdJl49HXX
         LS2A==
X-Gm-Message-State: AOAM5300P2NOBUWVrsFlquMv1/Iu2un5/tzPVDMAjJ8CeTEX5oXjjzef
        GKt5tEkBEGUSFPl2oK7J/KVsoA==
X-Google-Smtp-Source: ABdhPJxKcRfkmpsNQA0mhR4Fli9We9m5QG7yYc9oVq3FyDc4BnJseyAtqM5dWR75FNB7KWGez3Xl9A==
X-Received: by 2002:aca:de08:: with SMTP id v8mr6613587oig.82.1600359050849;
        Thu, 17 Sep 2020 09:10:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d17sm126456oth.73.2020.09.17.09.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 09:10:50 -0700 (PDT)
Subject: Re: [REGRESSION] kselftest: next-20200915
To:     Justin Cook <justin.cook@linaro.org>
Cc:     LKFT <lkft@linaro.org>, lkft-triage@lists.linaro.org,
        linux-kselftest@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, shuah@kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <0100017492de8180-c524cff4-bd4e-4777-9f33-7e1da2c986d2-000000@email.amazonses.com>
 <CANKHsTfyE64ygNB0H0Nx=P63D-kqYa6aGOXS6ZmNUspLJJtS=Q@mail.gmail.com>
 <f9144c49-d39a-af67-2a5a-3828b86ea86c@linuxfoundation.org>
 <CANKHsTeOix88zT=d1ywROXXXZRxYnYOEzRQDJGJgoh4DVbnPjQ@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0263c321-5d2d-8822-6ed9-3ea24efce4dd@linuxfoundation.org>
Date:   Thu, 17 Sep 2020 10:10:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANKHsTeOix88zT=d1ywROXXXZRxYnYOEzRQDJGJgoh4DVbnPjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Justin,

On 9/17/20 9:52 AM, Justin Cook wrote:
> Shuah,
> 
> The report sent was meant to be a general summary, rather than a deep
> dive, of the results. Most of that information can be gathered by
> viewing the test details.
> 
>>      * Test details:
>>      https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20200915
> 
> If you open that link in a web browser, there are a number of ways to
> dig down into the results. If you have questions about the best ways
> to do this, please let me know.
> 

Yes. I did look at the results. It isn't easy to figure out. It would
help is cc'ing the test authors in addition to the list. There are two
failed tests if recall correctly, mm and kvm. cc'ing and subsystem
mailing lists and authors for the last commit for the test in question
will get you results quickly.

> Maybe that isn't the best way? I'm very open to feedback. I just tried
> to best copy the previous report that was being sent out to start.
> 

We had the same problem with the previous report. It just tells you
which tests regressed. It is a good start. Unfortunately without
tagging test authors/maintainers it won't get addressed.

thanks,
-- Shuah
