Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBC52DD5E1
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 18:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgLQRRf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 12:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgLQRRe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 12:17:34 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059C7C0617A7
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 09:16:54 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id c7so29418934edv.6
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=32HWdLH3ahsWaEMBqr4y/T3+8il/2Dtt23Z7+8cwuBg=;
        b=xglzgtO4m5n8iIyIsHmLKdgtxJZMRETXJD3N9AFBCk971dKtusTiMP11YDGsV0n2JN
         YI0p7cgfm1aokX2+vJoIeWVnk8EnkRfupLBb/xcXqij8EDWox3Hjb5jxu8v3DtHG+7kW
         t6ekoHDoVtzae1sD6r8an/j90BVe29ef9yCbRL284r/BJiU6d+wIfHvOIwlYdpT2GlVc
         TGt7kHMvS2wU7vWgJyiKGaQoZymtOEfY376QpLj1pZqfpXcqTZqlkk/rEDCGTgbCkX0K
         6g94z8dSYoyFvtbh/iWDGtaNy9hVv1NiLCHwntfFfhr+//5YQ4BVDtPNevApE/pE0F8s
         +/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=32HWdLH3ahsWaEMBqr4y/T3+8il/2Dtt23Z7+8cwuBg=;
        b=DQzV6CDUkZ9o6AwSNRXXCYM141nsXBMpfuk9EmZoHSziDJwVPe41lYV2u0v2pM7UEC
         EwnLfZ2wXxsSenLgt9cEpdSgITIlo24yDAbkvf8DN0M1YtjMcg+n39dyW5U8Aw3r532h
         UfuOLMtEiRXO/zpDlRfosgSg7Tw+vDdRZ98z0Tmxend0wRVHu0Qk+AXfeNtZ2ThyoDEC
         rVzbc88gG6wkMcIvf3y9Mokag6w21alu+GSDNhkCzuAdMSoy2DHJqI8MIYNzVFLSI94Y
         BF4tIbi7oCy8Ay6OIiCnglcMC/AwbOesV7CXYSzJsVmcJESSs7yJyHiN0JeAZIASrrWW
         f4tQ==
X-Gm-Message-State: AOAM533h+rcNcQAvvr3R1ypqd150e1twYOrrKkDK3duMoNYLX23bwL2f
        yIdsFkk+34WMJmKtPck2Q+9QqKu+wWVCsQRiSNl8ag==
X-Google-Smtp-Source: ABdhPJwzyOBERpFYFJlriRomCHY+nJifkNHHwNdb49sktchEgC38YrZ6TB3nSfmerTQFK5EgepAbcgolT5bZbcLJvtA=
X-Received: by 2002:aa7:da8f:: with SMTP id q15mr322625eds.239.1608225412524;
 Thu, 17 Dec 2020 09:16:52 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsVud9EmeDnijucxAN49a8S5zjnML6LSmmnPTG3cO5-Hg@mail.gmail.com>
 <20201216160330.GG2657@paulmck-ThinkPad-P72> <CA+G9fYsqcSjzEfGerJ_bJJJ3e00Cnqe0zE9yjqfQQYM78UQgtg@mail.gmail.com>
 <20201217152406.GS2657@paulmck-ThinkPad-P72>
In-Reply-To: <20201217152406.GS2657@paulmck-ThinkPad-P72>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Dec 2020 22:46:41 +0530
Message-ID: <CA+G9fYtd0=Uw4t861T6Y0VhArGQO_C=NzP1TUxRhD9SQvR3MdA@mail.gmail.com>
Subject: Re: i386: rcu-torture: WARNING: at kernel/rcu/rcutorture.c:1169
 rcu_torture_writer [rcutorture]
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Is this reproducible?  If so, could you please try bisection?
Yes. This issue is reproducible.
I will run bisection and get back to you (might take some time).

- Naresh
