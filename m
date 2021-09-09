Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C00405FBA
	for <lists+linux-next@lfdr.de>; Fri, 10 Sep 2021 00:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346492AbhIIWvs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Sep 2021 18:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345840AbhIIWvr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Sep 2021 18:51:47 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA567C061574
        for <linux-next@vger.kernel.org>; Thu,  9 Sep 2021 15:50:37 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id q17-20020a25b591000000b005a07d27bbdaso4451626ybj.3
        for <linux-next@vger.kernel.org>; Thu, 09 Sep 2021 15:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cOv81gwC9dNLZhqvyYQGhAuBKrBFj15moK9/frQLFMU=;
        b=GDxCPvAruNETvNqoBKUPqU9jy05fk1bp3PWMM3Ljuxl6vVxIF4AQAnIMwpKJNL0LlE
         edukWYZi/ADH6MMDY1rpxPA0nFuzcN0O/HhhCXj5JeU2H8usrlcbcEFiAAfPU/0G4lfE
         BqdZklQWBrxjTrfzfMgUdg0CoJ47EV2STC35HOBP3LIHVQaWtPaLBBKDGmHDa8hR/5QO
         gOl3G+o+CYR9ywt8QyMzByFXdPCGHdpf98uU3VYW+XYTS2L4GkQSRVa3V8Li/NYa3xWq
         ZvC7SBNBEbzrHUqY4YkInYgBnpGF2UpsarBT8r1XeZOU/GZOK7fmEP/cUJt6qsJwBaFW
         s2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cOv81gwC9dNLZhqvyYQGhAuBKrBFj15moK9/frQLFMU=;
        b=JlhZ68f2/YJ71f0GfYy92R5mxWyo1GfBvvsdnxiagEF0j08aoRmg135iCvEIsTVFWT
         Pt1J49/R5PVNU29g4xLSNMyKOu7g9f8oT51o+nIMFu/PdTz6FaNV6D8ej5RwjE+7F71R
         RJVKV8LWu0UwHB4vOEf4k7iMly2CG7XNGYJja6yKoi1Gx/tVLJz0HfQPYgmBNNiFvbuo
         9jC08kKbV+RDtpTbFd1LomYhYSGHv/WwPaAebITAW6DsiLIsCaIe3XAJaICXaRiT/3n6
         w5qhlHHpLlfwtXsJMZ8h2aofWih+WrvkFO+HA6n3xffIfRHEjhj/sfJgZpLm04KxzHNx
         f29A==
X-Gm-Message-State: AOAM532SMKceYqk/Cc3BjFPpbyRyFbtxHXw6eAx2LKyqa1RpiKLGONYs
        XMKLtcGT4IVCUjkLNNjEchQA9R3wnxuqnD+KKI0=
X-Google-Smtp-Source: ABdhPJwLFHXNgRlAL2YzqDpSi9C+NWVrDLnaDnOcMPOieXeSDgUkK6PEfuqwIliiam/Ydm/pGfidEk5vldeGCbWGJz0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9a5f:693a:26cc:1fd6])
 (user=ndesaulniers job=sendgmr) by 2002:a25:664c:: with SMTP id
 z12mr7299807ybm.62.1631227837092; Thu, 09 Sep 2021 15:50:37 -0700 (PDT)
Date:   Thu,  9 Sep 2021 15:50:35 -0700
In-Reply-To: <20210909182525.372ee687@canb.auug.org.au>
Message-Id: <20210909225035.3990728-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210909182525.372ee687@canb.auug.org.au>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: Re: linux-next: build failure while building Linus' tree
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     sfr@canb.auug.org.au
Cc:     axboe@kernel.dk, josef@toxicpanda.com, libaokun1@huawei.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ Rasmus

This was introduced in
commit f0907827a8a91 ("compiler.h: enable builtin overflow checkers and add
fallback code")
which added division using the `/` operator, which is problematic when checking
for overflows of 64b operands on 32b targets.

We'll probably need helpers from linux/math64.h and some combination of
__builtin_choose_expr/__builtin_types_compatible_p.

That will help us fix another compiler bug for older clang releases, too.
https://github.com/ClangBuiltLinux/linux/issues/1438.
