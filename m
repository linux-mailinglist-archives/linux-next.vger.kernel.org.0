Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A6F65E7FD
	for <lists+linux-next@lfdr.de>; Thu,  5 Jan 2023 10:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjAEJiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 04:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjAEJiP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 04:38:15 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A23B551FA
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 01:38:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t15so26660008wro.9
        for <linux-next@vger.kernel.org>; Thu, 05 Jan 2023 01:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BW+jke2kqtKoGVzg/iH2TwkCn3Tdko68KcTkVQfNJcI=;
        b=bPiCFWoXUF0MgcVxIG38yQt/fFkcMaKhM5Kb03ym9neICCSQl/rNrCLDQ758vgtR6A
         Y9+O48dearJukIp4QyANXkLbcETf7f7DYhFd+5L3OJ7732hKFrxyrZWEKH5rqGYzoPJt
         EXRY5p/VOHEBju/VjOP3agNVzOfKhfdjwXYpSTGlVFdPyMFQWxFfidhHfdltImxb5mFK
         0XAomC9p48dydhBwalAkcpTaRqZguIZ8JdWmNV0yAtn0fUkycSr0XzJe8MVhvBb847xT
         xlBs0a3NZcP1eMkw4DB6s/NScZQntQoSMMbIcd8pWATx8mIcqGAn3tPuDdZRTYKuiRfo
         Mw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BW+jke2kqtKoGVzg/iH2TwkCn3Tdko68KcTkVQfNJcI=;
        b=ydyTnwpJ8oovujvU1d6++QuhVT+PQ9LEe6uOMggE0DmYBkXQwmD5NE70atZFrCnaU3
         A+HS1O7dJrRDxXilBKLESbE+BML00XTF/Co3gss6c5yTjVmoPEF5qweKLeHbOaZlL5u4
         Uhly2W2hnlQeS3u5NwAspRosEyBtWkwbbx18Q86ZwKaF4o1cdS6GDWRg8CPbRUwfcFGK
         Qz8SQixIXKCglsF0ZaQW+iV1JXBnmvaxYW661GJbDVkMu7nFnKv+rPNbH39VR84UbOZj
         DPupdgkuhgROTNaKyy2JCyOll/zQH+lHiuaN3LtNnybrZjpue4mkeNK63AR76MqYocfq
         qJ3Q==
X-Gm-Message-State: AFqh2krFYF9pPyYH/tmMkGDOFwDkiSskWRHddz/wl3fIMOatUeJDrftW
        JzJZW1JCdRLKbRpfZt8XC8JZVA==
X-Google-Smtp-Source: AMrXdXtuK49JPtjNrCLktlG+iUS0xh/ScGcjp3uD0kJfFisrp1mMG4/T+F8UYCE6xoghkbHV7dS5Lg==
X-Received: by 2002:a05:6000:12ca:b0:29e:611f:260d with SMTP id l10-20020a05600012ca00b0029e611f260dmr6030471wrx.49.1672911493001;
        Thu, 05 Jan 2023 01:38:13 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id y6-20020adfdf06000000b002879c013b8asm22411988wrl.42.2023.01.05.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 01:38:12 -0800 (PST)
Message-ID: <733f80e8-0377-a4f9-df44-9a1f2c94fa95@linaro.org>
Date:   Thu, 5 Jan 2023 10:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: linux-next: build failure after merge of the thermal tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Daniel Lezcano <daniel.lezcano@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230105104634.54cd6cd4@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230105104634.54cd6cd4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 05/01/2023 00:46, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> make[4]: *** No rule to make target 'drivers/thermal/thermal_acpi.o', needed by 'drivers/thermal/built-in.a'.  Stop.
> 
> Caused by commit
> 
>    cc54ca385577 ("thermal/acpi: Add ACPI trip point routines")
> 
> Forgot to "git add" a new file?

Yes, correct.

> I have used the thermal tree from next-20221226 for today.

I dropped the patches and updated the branch.

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

