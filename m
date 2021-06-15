Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB603A79C4
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 11:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhFOJGu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 05:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhFOJGu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 05:06:50 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC79C061767
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 02:04:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l9so13673661wms.1
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=azraPx2CuM+PqVhQ6THOfSTqn5eTC/JzUNbAuofVDPc=;
        b=poZzHZS5mvH8o2dT1R1iqGzibJXdj9l0iUCTFL5Sz63AG9zh28Fv5/d1ycPk0XYqk5
         oeUThLaof2REJAORyu6DuK7yYTrVMo1CPKf7W3r5wMZRM2VZYHumzy2uE+Vm1RlL0BQh
         cCQAGmve/E9N5Y1vx8rRMombVDPO2OITc8oPIMo7l4j6JWH37GXJR7xxtFjQ7wHqbCPE
         6VdlMy+ROHkj9AhwNOJtTnXpJRfauezni9WiubLmEfjHTZ+OE9xzmIpNMAWV9rDhwTDv
         8uBDSWsqK4lUKgX7+QgI5d/pGvHh2Hv5wBXeSl2tci1WV4qgSerSogfgFz6z13zSr0+V
         nUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=azraPx2CuM+PqVhQ6THOfSTqn5eTC/JzUNbAuofVDPc=;
        b=K1OL8cMjl7bVMk20tkVIw2JmNSGfv+c6+YZGKX/zTUdcFKOfagdQ2kbSA5HUQJdx6D
         KUydnDUZR3h2mqRE67RKXyIXto1Fkd/OHwqSUupjOxZ8R1KYYVemp7jcK4VioGbYvWgN
         g2OE4H8Nr6YSbDkbgM5ceqXjm3QHNs8cIdEWHhIQKaoc7mkpTf0xG4XtYmFOr9XU5/KT
         eopiGHCWjZ2LiaQvKZzdjK+Htf5NHCNdt162DtxeL2KF1Znb/79pxv20Ph65Iek1OT7h
         bE0VanrMKZoPc7draB/nCMYXcvAmoZ1d4lHErM8kemndmqtM0BZ/4VJ0YDrGhbxKGzw6
         Ck1g==
X-Gm-Message-State: AOAM533r2nr/I+mY1xEOahkjzKMs2kRVaIro5xDcUnRe9c4MXPVzcc4S
        VOHeQwZ50i2IVNeUQEu2YSkCX4XJstWGDg==
X-Google-Smtp-Source: ABdhPJwri4T/IWomdlG9V/mKcyLcVS7AlStgdy0a25nv+xOm6WI31CzY/zlsgIDmu6NJXEGlrIHX5g==
X-Received: by 2002:a1c:e354:: with SMTP id a81mr21416208wmh.98.1623747884621;
        Tue, 15 Jun 2021 02:04:44 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v7sm18369200wru.66.2021.06.15.02.04.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:04:44 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210615173239.7a871019@canb.auug.org.au>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5e418b29-3075-7e35-9b2d-efc8df945eed@linaro.org>
Date:   Tue, 15 Jun 2021 10:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210615173239.7a871019@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Many Thanks Stephen for reporting this,

I can see that two symbols have been interdependent, I have a fix for 
this, will send it today.

--srini


On 15/06/2021 08:32, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> modules_install) failed like this:
> 
> depmod: ERROR: Cycle detected: snd_soc_wcd938x -> snd_soc_wcd938x_sdw -> snd_soc_wcd938x
> depmod: ERROR: Found 2 modules in dependency cycles!
> 
> Caused by commit
> 
>    045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> 
> (at least reverting the commit fixes the build).
> 
> I have reverted that commit for today.
> 
