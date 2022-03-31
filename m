Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A54ED501
	for <lists+linux-next@lfdr.de>; Thu, 31 Mar 2022 09:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiCaHu4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Mar 2022 03:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiCaHuy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Mar 2022 03:50:54 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8C11C114
        for <linux-next@vger.kernel.org>; Thu, 31 Mar 2022 00:49:07 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2e5e31c34bfso244948277b3.10
        for <linux-next@vger.kernel.org>; Thu, 31 Mar 2022 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VMe7G7k2F3sJkaSPUU9OrwOFeasEXkAartozpYsWHIc=;
        b=DxzC7NLOdCvcI2Y6Jkn7NtrjSTk/HjFQ5Xoc+vrI1kB+adkprJc036rzhEcY7WIsb4
         hi6VZZ41bmjouckANvMCufUEo9vlehxdqn+3bgc2SyyUQWyntDDxBggQ22Tn22tsTq0u
         RswaETTPPBGNkDOFF6cAE+nsIDQg8cQKSQge3IFXm5blV8hxJw2Eg2YFNto1XLqC5s9c
         bEzWJam1SuIWN+0KSl9Qgcmn+hHK/Fp5JrNZMY6LYrR2oKsP/e168fjnqAGYixSMP340
         jlv98Y8dweJgi8sEeL1SJX1b2LL8VEuDYSx10oZ0Uir7rrQeBm0+JVkcNScDUx8Oxd8w
         HKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VMe7G7k2F3sJkaSPUU9OrwOFeasEXkAartozpYsWHIc=;
        b=6lDbauHh2vmdDJwtTrbeDBudBFquS1u/zGcfeH9Q5/Fh2X3bIOCZ2LTZHTEqQSjfHF
         t2IcmvT67Gl1Yg+D6p8YX7PfjY7Wj+vWvihmp34SwBVSOeGuvPW4cMjuT7rk5J1I/HcL
         2679gxVwx1u7+76+QAZd8bqyTNl7IsaBiXqBH71PyGIMSMIDgqohTeGVik12rJJXBF0q
         DUQBAFnBMIxpIZfS/37A4xzr/VkOXxlE/IgyeK006zf0RzomZ6MiHcbBaJ7GCITvGmp+
         3ONkdEMYErLYOIZLvJU2Q1rkZOYaHqoC1t1kZUfnuu+ZP9iuHkpu8qddiGX2yxQl6X86
         2Qbg==
X-Gm-Message-State: AOAM531lLW0mKQixXGxte2abMLQq61yally4sZRBcyPrl4RGtgtSrC4G
        e2xPUmSYL3+uzJ/NTfogUGUOxQIH8uhc3VhSNOHeoA==
X-Google-Smtp-Source: ABdhPJwm1aZ7lVTNgZks7FI5cru3hzVpoo623xthni2Gg4cDDSwbU6DVUUuvFoJCZFISyNoBIH7VYUNZV2+9SgkMfcU=
X-Received: by 2002:a81:591:0:b0:2e5:cdb0:9363 with SMTP id
 139-20020a810591000000b002e5cdb09363mr3788408ywf.265.1648712947039; Thu, 31
 Mar 2022 00:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsntwPrwk39VfsAjRwoSNnb3nX8kCEUa=Gxit7_pfD6bg@mail.gmail.com>
 <8c81e8ad-6741-b5ed-cf0a-5a302d51d40a@linuxfoundation.org>
 <20220325161203.7000698c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <08c5c6f3-e340-eaee-b725-9ec1a4988b84@linuxfoundation.org>
 <CA+G9fYsjP2+20YLbKTFU-4_v+VLq6MfaagjERL9PWETs+sX8Zg@mail.gmail.com> <20220329102649.507bbf2a@kernel.org>
In-Reply-To: <20220329102649.507bbf2a@kernel.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 31 Mar 2022 13:18:56 +0530
Message-ID: <CA+G9fYsX=NfUoSXHGEqo_pPqrZ7dxt8+iiQMiAm4dEemNtwq1g@mail.gmail.com>
Subject: Re: kselftest: net: tls: hangs
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Netdev" <netdev@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jakub,

> Can you check where the process is stuck and it's state?
> /proc/$pid/stack and run that thru scripts/decode_stacktrace
>

Steps to reproduce:
          - cd /opt/kselftests/default-in-kernel/net
          - ./tls &
          - tests_pid=$!
          - echo $tests_pid
          - sleep 90
          - cat /proc/$tests_pid/stack | tee tests_pid_stack.log
          - cat tests_pid_stack.log

[<0>] do_wait+0x191/0x3a0
[<0>] kernel_wait4+0xaf/0x160
[<0>] __do_sys_wait4+0x85/0x90
[<0>] __x64_sys_wait4+0x1c/0x20
[<0>] do_syscall_64+0x5c/0x80
[<0>] entry_SYSCALL_64_after_hwframe+0x44/0xae

Detail test log can be found here in this link [1]

I do not see any output from
./scripts/decode_stacktrace.sh  stack-dump.txt


- Naresh

[1] https://lkft.validation.linaro.org/scheduler/job/4812800#L2256
