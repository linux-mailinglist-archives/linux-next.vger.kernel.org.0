Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2E835751D
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 21:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355674AbhDGTpN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 15:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355666AbhDGTpM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 15:45:12 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DE4C06175F
        for <linux-next@vger.kernel.org>; Wed,  7 Apr 2021 12:45:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so63033pjv.1
        for <linux-next@vger.kernel.org>; Wed, 07 Apr 2021 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=v4I3tezR5lYkXA8UNsH0naFNiwD/+ZGgD9NGyzm9vYs=;
        b=Q0R5njWvCe+01oO565VDqa2sZ39PejVgvsleXpcwKf8nOUD5xf9ackWkjkxSAGKZzs
         dckWTRFrsudBULhczqQLF9kzGC/j1gcrd+1w9XdTZLT5hcoB+5m5K5RiDhJoMn/I0G1F
         I8r4SdFSS00UotobgQ71FJMTtxqgqdfm8EvzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=v4I3tezR5lYkXA8UNsH0naFNiwD/+ZGgD9NGyzm9vYs=;
        b=jkqMrEpmpVmD0l3zPgGy/PDbfdmMn/Naj6DiBYj0cEJ+KTnm3yG8NTiBC0XiEL8D5n
         o2qufp5eUBqiFCmTtPIKZutjAo4LsghkJF+cCSObkLNUcPBjFF6TuyO3/Blk7EHU63Lh
         LEupGGBIPatg3kOxKeA/vR4jV7BZAm+qyOLFXsrI3OGXWcrgStgh06ZMq78RV4pVe7l7
         zlgIEisuejWVg3VeoliAhoyFwBWXuPa7YcVudhYLzC0woGimetWXX5W+ZYKcoP+G2aVd
         PT6O6gfMHRSVtWCFZnIkNSFIPlXF1+Wmo806eaMU058t7GWlHfZka3zpyKSvzLvjqyCg
         Bglg==
X-Gm-Message-State: AOAM5321mL4Y/6EVcXBhU+LqSnvidMDP8XyifasBrNBKIbguOwvKqpSs
        LExYEavNlKsxXOSIGBGH2huXXA==
X-Google-Smtp-Source: ABdhPJxeLOFpntgt59JjuRya6uYe5UNgTmcejZXTjiGNLXbnswvBmnEv6nitT/PvKNy+e6b2ma5YCQ==
X-Received: by 2002:a17:90a:5d86:: with SMTP id t6mr3614528pji.176.1617824701251;
        Wed, 07 Apr 2021 12:45:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f21sm6059532pjj.52.2021.04.07.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 12:45:00 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 7 Apr 2021 12:44:59 -0700
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: venus_isr(): Null pointer dereferences
Message-ID: <202104071244.2149B476B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210407 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Jun 20 08:53:40 2017 -0300
    d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")

Coverity reported the following:

*** CID 1503707:  Null pointer dereferences  (REVERSE_INULL)
/drivers/media/platform/qcom/venus/hfi_venus.c: 1100 in venus_isr()
1094     {
1095     	struct venus_hfi_device *hdev = to_hfi_priv(core);
1096     	u32 status;
1097     	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
1098     	void __iomem *wrapper_base = hdev->core->wrapper_base;
1099
vvv     CID 1503707:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "hdev" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
1100     	if (!hdev)
1101     		return IRQ_NONE;
1102
1103     	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
1104     	if (IS_V6(core)) {
1105     		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503707 ("Null pointer dereferences")
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")

Thanks for your attention!

-- 
Coverity-bot
