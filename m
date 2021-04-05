Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FA33548AB
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 00:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbhDEWjs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 18:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhDEWjs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Apr 2021 18:39:48 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A30C06174A
        for <linux-next@vger.kernel.org>; Mon,  5 Apr 2021 15:39:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id f12so6187457wro.0
        for <linux-next@vger.kernel.org>; Mon, 05 Apr 2021 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EEzk1zAVkLj1XoOLcUxtr/QN1pNMeMW9ckBMVbWeu5c=;
        b=CrZ8IZ9ad6jmgzbY0P3H+Bnd+RihRC3P3I2EEhspU3h5/8RSFMIkswXKlzoLZ9FFJt
         xR6EDdthzkgL7ImvmFtEDs2TDNi6lHSj7Q02M51j+/RPqgBw70S8udo+D1ymn72pZjva
         Z/PkdinE2P3SfxtTQC1ocxugaKb95WSpkcJXS1XdtJRIcf8WoxhloOndC7vKpT16rzBI
         W+Uk6i8ITuoRW16MlT7HRVxrdSAHIkosMtXTVYnSaZqQjEy6cwlJY1LooZze5XmXFvLg
         P4MZ5k2mNdaCKWeqKiEm6YDeflLoHM9Z//IgAC2G5akHU12oPkTFdVODDy82WeHUNtPv
         E72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EEzk1zAVkLj1XoOLcUxtr/QN1pNMeMW9ckBMVbWeu5c=;
        b=oxVeQM6M/NEDavsNF4D5gX98823N8r3sD8+s9IIQzkC28SmsdqNaMNOBj525wg2ZuJ
         HyIaOvwYy4pZMf0h+4kt4X7a6Fz0wa2g+XVpgyCHrSM+0yjFWLjU5HADKCyBsoT7YMa8
         97lyxqEhkBg3y7LQtAfTw7XXalcg3gOVOy5dlve6qCJh61MhF1CGKej3N36LI1tDHLQ1
         mVHPUBeVNedoimN8eq1xQAZSpfbVEJuZIyjk3iXE+8tyQDY8ojtlYbDnNzlC1Lgdrz9M
         NscHGybcyCeVh1JMzs4ev05e1Z2meCb2irR7xPW8b6RlAj+t5j2xdUu2pmYF0dE+/9vN
         csGw==
X-Gm-Message-State: AOAM533+vD/x/tUFnh43kIK1Wom5SE18vn3yudL41Pi/lyFW3YLZ/FJ3
        TYIIig1ZFQ/XVSTlfv+RDQesMI5FLhQ2YQ==
X-Google-Smtp-Source: ABdhPJw3sXRyr9l7X/GE2pwmLUKpWCQEHF3APbhgzEe1EJHT8iNsuyKhykpITLGLwuDGdKzzGWypxQ==
X-Received: by 2002:a5d:4537:: with SMTP id j23mr5271079wra.249.1617662379523;
        Mon, 05 Apr 2021 15:39:39 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d506:6f5d:adb6:da14? ([2a01:e34:ed2f:f020:d506:6f5d:adb6:da14])
        by smtp.googlemail.com with ESMTPSA id s9sm909578wmh.31.2021.04.05.15.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 15:39:39 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the thermal tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Guangqing Zhu <zhuguangqing83@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210406083545.150ae47e@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <5f17e143-246f-b1c4-2582-60db790ee0cd@linaro.org>
Date:   Tue, 6 Apr 2021 00:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406083545.150ae47e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 06/04/2021 00:35, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   5845dd350432 ("thermal/drivers/tsens: Fix missing put_device error")
> 
> Fixes tag
> 
>   Fixes: a7ff82976122 ("drivers: thermal: tsens: Merge tsens-common.c into
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tages over more than one line.  Also, please
> keep all the commit message tags together at the end of the commit
> message.

Fixed, thanks!

  -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
