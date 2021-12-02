Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9F546611B
	for <lists+linux-next@lfdr.de>; Thu,  2 Dec 2021 11:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237120AbhLBKIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Dec 2021 05:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241162AbhLBKIL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2021 05:08:11 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47F8C061759
        for <linux-next@vger.kernel.org>; Thu,  2 Dec 2021 02:04:48 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d24so58568381wra.0
        for <linux-next@vger.kernel.org>; Thu, 02 Dec 2021 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q1txYpUSZr7D7uPbcrO25oyFLvtG0YcSl+xSgR678CU=;
        b=s4DG6/X0sOK04u0D7nRFsOCfQL/+jtYSDxqFMxG40EDJ5GuWYXu9WaaowILfkgyn67
         tpytbRin5PwhfPSzENpVbcJkoWuqv7o/sYNS3lSdUMXQTw/Ijycr6ocqgw+ER6iyT4Sv
         fcY969eWHZiK6RecesJ3X6yWxEgPu7x3+gNNUUavMAJT0PaKlShhbiZi2/K3pgobbl6H
         oyZEjOKnYLeazQ+I+4Kvv+ZFLLAgVukJUHoMlGYwb14Swyskhd8d2+E530pOcMiGgrmM
         71TpNzl7Kv2zhq8K7YY9QIGXGifZS5moIgE035IDDdX60qhwJqJjwRRzgEk4klJykMrL
         kt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q1txYpUSZr7D7uPbcrO25oyFLvtG0YcSl+xSgR678CU=;
        b=B4cMS/SM5oBmYtz2CkeT6VGWg1BATYcVBMgrmtZCSfyqbV0aoryYb7c7ElNUdEdmYN
         pIK7sC3/JF2lhUzbiS4Zx9iAwnAN+p5hXn+MmoS73wILXmxzZCYdXhhNHAALIUp7Fl75
         hyPi4WoCsTqc/kxtUU2V3uMX0mtZfeRhvJ+5dQUlrHAFVzfbkfwSRtnofhdmJPwDaiLc
         Gaagd3BwBWZJLMjwGOISpjZibO1kIyQuDN317gLt0M3gKs7vM0dxml2mQN6YZXm45/XV
         rwcvfwULuvkuhoVxJ5jneJX4JKBth9I34yYH45e/qgQA8VDPT7qpwni8MD/idnzKl3ga
         4oHQ==
X-Gm-Message-State: AOAM533T+QoSSwfHhrUwl+IEwoa5sDeSmRhbfLwcMBz9hSo0ES9+9PMu
        NaVPLUr9/sVMb9/s3qJ8YkFwFIZ+W590HA==
X-Google-Smtp-Source: ABdhPJyCgBQhRwaqcmFlssyYNHQ8qnwc3j4ps6f61OlYNymOPCs3LjEfvAb7l2WH7H7klJ51hGksHQ==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr12952895wrj.575.1638439487003;
        Thu, 02 Dec 2021 02:04:47 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:72d0:52a1:d4ea:f564? ([2a01:e34:ed2f:f020:72d0:52a1:d4ea:f564])
        by smtp.googlemail.com with ESMTPSA id n13sm2161632wrt.44.2021.12.02.02.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 02:04:46 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211202102814.793d2f67@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f6e96a47-01a3-96f3-1ed7-e9a42c2b26bf@linaro.org>
Date:   Thu, 2 Dec 2021 11:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211202102814.793d2f67@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 02/12/2021 00:28, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/powercap/dtpm.c: In function 'init_dtpm':
> drivers/powercap/dtpm.c:466:21: error: unused variable 'dtpm_descr' [-Werror=unused-variable]
>   466 |  struct dtpm_descr *dtpm_descr;
>       |                     ^~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   f751db8adaea ("powercap/drivers/dtpm: Disable DTPM at boot time")

Rafael, will you drop the patch from your tree and I send a new one with
the local variable also, or shall I send a change on top of?

> 
> I have used the pm tree from next-20211201 for today.
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
