Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A8AE1023
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 04:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfJWCl6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 22:41:58 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35463 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388366AbfJWCl6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2019 22:41:58 -0400
Received: by mail-qk1-f195.google.com with SMTP id w2so18428215qkf.2
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2019 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q4raC0KDrg0Y3VOU96/cM0m4sT0Xq+RiWIVVbLsEG3o=;
        b=cGAgcBjNZ7OGStncxmS8AdWRHM1wBepX2aAZNEflgKnz6qUeoCLayiPuMzY7TIH8lb
         fZl60JgJSx6k4Y8w4Zru4lh2M1HrwdAVcQCLPDcNsvA+8EGfEQQeWdBIeN1Tlpn256u/
         h/84gUCUmLt2Zuy+lNfIEbDxqGKfn2u1zs5d6Ji4wzGjwioKo5QGUaVcRWFbZ8aFtRgy
         R+b5lFW1NAbamEvfz3/gsg2ZsZebWuE7hQg/GGI2hmU0wQ8LkFc090kkopPJf9XaiH+z
         NNuH3qT0o4Bca3w3Gy3SI5mkPZ728mqz8U7gmltkcZJOlbyxMidEHAe4/hlR/v6YZslS
         /8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q4raC0KDrg0Y3VOU96/cM0m4sT0Xq+RiWIVVbLsEG3o=;
        b=Wy5ZOqYpa6gXQz25qim/s11TmzVoEw5wGCSY2PNlUccaf09v5FPtZAnYjuBK8RkNN1
         wJza0A5SSvNWoS4RRbPP9BqRAwjAPj6NVJmWQAni56xVT15HtQlGBhN31sj0Tq0UUlQt
         4yAa5B7c5Shc+toqHysVCeyPUya/JsJ1UYe48JzLE8Mcv5LnJHTtTCC+QBuxWK7pXalt
         EVE2YUfogab1L10q1lUUGOCBIIRAJgcYEZqgZ9KkLVZXNJgVai9BUb3xb60i48uBC3SY
         UAoID7aotLLFDX7ueQtxBJcMupup4rsO3wi9U2w2WOTwLbXplsK/AueSNOXyUDdPJIYW
         s2Fg==
X-Gm-Message-State: APjAAAWs6KWeQNS7s2Adi97aawlkAjyAnu19Fom7nweRahIDzS1O74b8
        idGswrdRC8P3d2uNA5PKiLex5g==
X-Google-Smtp-Source: APXvYqxujctKv2HySWW6Y07W2SuJ8MZUeMGfRnect8SenIwk0zEEAi1cnR2+yCc96rV6CT1PWC8OfQ==
X-Received: by 2002:a37:7b44:: with SMTP id w65mr6367539qkc.409.1571798516742;
        Tue, 22 Oct 2019 19:41:56 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li937-157.members.linode.com. [45.56.119.157])
        by smtp.gmail.com with ESMTPSA id 76sm12508050qke.111.2019.10.22.19.41.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 19:41:55 -0700 (PDT)
Date:   Wed, 23 Oct 2019 10:41:49 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        acme@kernel.org, open list <linux-kernel@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        lkft-triage@lists.linaro.org
Subject: Re: Linux-next: 20191022: perf: bpf_helpers_doc.py: not found
Message-ID: <20191023024149.GA29009@leoy-ThinkPad-X240s>
References: <CA+G9fYvWdkmmkrq7hvADZ-1qnUNEwRULoTPfOQDnu1aZW8cDEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvWdkmmkrq7hvADZ-1qnUNEwRULoTPfOQDnu1aZW8cDEA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

On Tue, Oct 22, 2019 at 09:04:04PM +0530, Naresh Kamboju wrote:
> We have noticed perf (OE recipe) build failure on linux next 20191022.
> do you see this failure ?
> 
> /bin/sh: 1: perf/1.0-r9/perf-1.0/scripts/bpf_helpers_doc.py: not found
> Makefile:184: recipe for target 'bpf_helper_defs.h' failed
> make[3]: *** [bpf_helper_defs.h] Error 127
> make[3]: *** Deleting file 'bpf_helper_defs.h'
> Makefile.perf:765: recipe for target 'perf/1.0-r9/perf-1.0/libbpf.a' failed
> make[2]: *** [perf/1.0-r9/perf-1.0/libbpf.a] Error 2

I tested for two methods with linux-next, one is native building mode
for Arm64 building on DB410c board, another is cross compiling Arm64
binary on my x86 laptop.  Both cannot reproduce this failure.

After read your shared build log and I think the building process is
expected: Perf tool tries to build libbpf, so it changes to the
building folder 'BPF_DIR' (which is under $(srctree)/tools/lib/bpf/),
then failed to find file $(srctree)/scripts/bpf_helpers_doc.py.

Here $(srctree) means the kernel's root folder.

Seems to me, this failure is caused by missing to sync kernel files
$linux_src/scripts to the OE folder 'perf/1.0-r9/perf-1.0/scripts'?

Thanks,
Leo Yan

> Metadata:
> ------------------------------------------------------------------------
> kernel: 5.4.0-rc4
> git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> git branch: master
> git commit: a722f75b2923b4fd44c17e7255e822ac48fe85f0
> git describe: next-20191022
> Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20191022
> 
> Full build log:
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=hikey,label=docker-lkft/631/consoleText
> 
> - Naresh
