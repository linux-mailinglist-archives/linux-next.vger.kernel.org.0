Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B5A7C4DB7
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 10:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjJKIy2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Oct 2023 04:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjJKIy1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2023 04:54:27 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB63CF
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 01:54:24 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c08b7744so19503907b3.3
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697014464; x=1697619264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zH5QrFCjv5ZipE/KpwO//sI0l+pqqDjyBG53m2JUhl0=;
        b=b6KcPWVxwKeEkkODydCYIkygdMwARo9Rqc53EB5nDG4E/qL063Lwm5SmO9MRVc8oOF
         2e3QODQtrtSSoR3lYaHY+tdladKUOoawg+t4Yz6hAPO21x+WXeGgQPOskZFlOOXP/dge
         4luLpg6rXTqh3Vz7OssMmU7Tv7ht8jIJutdg+lURInIjQq5CtqhaCfWC9XVvvWnvAEQf
         9/AeIiwsBm7lIfX4clr5ehkAJr9IQRPlXpBvmAeQhlOamraC8hESUfiks8ZhP3nQe0ba
         /5F5TR5qQg7JIZ9BaZstWkEXLk9gpB5naKD5D4RGkBuVDlTb+MRbRDyywVOHcKjJJV9U
         7CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697014464; x=1697619264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH5QrFCjv5ZipE/KpwO//sI0l+pqqDjyBG53m2JUhl0=;
        b=HCtSS+mkJVh7bQOvGQGazWMcSFUQucgw3DcywzIENKoV/JD3RUaau1W3jcatcxOvhj
         kO+DlPw7KqItVtozAcULLb5adpuFcFCp1QEB7MfyyDjd18uGkhxkQeDhtEx7FKCYjHGt
         FzydvJ8cbttXQuZzMpykuaHMSUoNszo8pvdVxXSuxTTc28L0eAwzQSDSsTOeoSx/zWCS
         kTjgpIxTTuUrFAylPnfjkd9rMrKp6VrjR0gSl2CPKckAW4GXEGNmx9/RNJ9+e9SLnGIl
         4jsKg7Ht8Szw7TSQqEY6umSI+tXmQWVdglxAwNPXPd+hXnk1z1GFL54pmydWewNeDRV0
         HTqg==
X-Gm-Message-State: AOJu0YwTaTJhobPKzyyiB+0K+147sp4voVLjCc+vNp1tK9smda1MslNr
        2qWlFfehUIGxr/eMdE0VaFWdKA==
X-Google-Smtp-Source: AGHT+IG3/8Fud7dLpVKVMvk9HytI+uy/duWMjpUyJ9J0H7qyzYKXxxlvQOtu1E9VsXQzTDzpyVu4lA==
X-Received: by 2002:a25:bbcd:0:b0:d89:4d9b:c492 with SMTP id c13-20020a25bbcd000000b00d894d9bc492mr17024444ybk.22.1697014463874;
        Wed, 11 Oct 2023 01:54:23 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79049000000b0068fe7c4148fsm9510446pfo.57.2023.10.11.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:54:23 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:24:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: next: Build error on arm64: `modpost: "of_find_next_cache_node"
 [drivers/cpufreq/qcom-cpufreq-nvmem.ko] undefined!`
Message-ID: <20231011085421.h4qtizye4m3rjuov@vireshk-i7>
References: <8f982779-d7d6-494b-affc-9ecd44b1e23a@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f982779-d7d6-494b-affc-9ecd44b1e23a@leemhuis.info>
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11-10-23, 10:49, Thorsten Leemhuis wrote:
> Hi Dmitry, my linux-next builds for Fedora failed today with this error:
> 
> > + /usr/bin/make -s 'HOSTCFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -mbranch-protection=standard -fasynchronous-unwind-tables -fstack-clash-protection   ' 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' ARCH=arm64 'KCFLAGS= ' WITH_GCOV=0 -j4 modules
> > drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c: In function 'dpaa_set_coalesce':
> > drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:502:1: warning: the frame size of 4112 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> >   502 | }
> >       | ^
> > drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: In function 'dpaa_fq_setup.constprop':
> > drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1000:1: warning: the frame size of 8224 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> >  1000 | }
> >       | ^
> > ERROR: modpost: "of_find_next_cache_node" [drivers/cpufreq/qcom-cpufreq-nvmem.ko] undefined!
> 
> A quick search on lore found that the 0-day bot encountered a similar
> problem early July:
> https://lore.kernel.org/all/202307030626.PUPpfATh-lkp@intel.com/
> 
> Back then it afaics was caused by "cpufreq: qcom-nvmem: create L2 cache
> device" which is new in todays next, which makes it a likely suspect for
> my problem. That's why I decided to write this mail. But note, I didn't
> verify if that patch really causes the trouble; hence if you think it
> might be something entirely different, let me know.
> 
> Full build log:
> https://copr-be.cloud.fedoraproject.org/results/@kernel-vanilla/next/fedora-38-aarch64/06516038-next-next-all/builder-live.log.gz
> 
> I don't have the config file at hand, but it should be the following one
> processed with "make olddefconfig"
> https://www.leemhuis.info/files/misc/kernel-aarch64-fedora.config

of_find_next_cache_node() needs to be exported for modules.

Dmitry, can you send a patch for that and mention that it needs to go
in via my tree ?

-- 
viresh
