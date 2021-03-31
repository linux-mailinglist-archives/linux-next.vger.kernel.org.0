Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DC93509E7
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhCaWAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 18:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhCaWAD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 18:00:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FD5C061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:52 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id f17so8613132plr.0
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XTclIebc2gFw1AUuvlOqXBN/cAE04kAcYPmgSPAB9m8=;
        b=ReObV+EuPukLxWh/51FutC15x91tOj+OUIMeKAzr/+bQMYDA9CEDsvj6D9wZkY5ToR
         JjqbaV+DRZT3KX+uGG/m1MJ+5Rgas1N8c2Q9JiSmG/56dD9nsYTikbyWq6GtT99T1HlI
         k4upMOeq088mRelDGhDTwIuVq45P6PN8kvM6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XTclIebc2gFw1AUuvlOqXBN/cAE04kAcYPmgSPAB9m8=;
        b=M6xN4Ce+ecChHAycCNNANrdtg6tSOECT1gHzbaw8P7jpwyfOmp1TAEKecQNvmHTIqk
         lbpvcCCiShsPPlOURelnscKfWw2YYISDwJBU0BE/UVJ4Rz0TEcwS1hmWauK71pZhJS/w
         vyBbfrTuIa75flG+uN+sccw92ykvsZB7EEdWpw7ZWTOrscDnU1USPCBbcpauqp+8WNyi
         bmhLn4jlGshd3gq6IFI2NrmLfjs1AICdWU6H8dPZq6pn7xdQiMCplK/ZikQD7pJnVBLZ
         DnCEO1hCHbc4bizUZvKFUFnYhV+kNW2RwvnW8Q8Ajuz7sU6Vr5yh8XEhoj5eWhgJ9sbD
         huJQ==
X-Gm-Message-State: AOAM531NFFYoa7ZcUtSuqfZatUobkmd7/2QxOKmmIbkdfZbR8bxbnMlF
        5rl4x90b8IkbLE6TN8hIf2THIw==
X-Google-Smtp-Source: ABdhPJwyQYa7wjDnYdv3AI7M654iXH6YkzCqKci09+3ot/Qq+AaJ0+V9X1HaY2WGNBNUALZvGs0pbw==
X-Received: by 2002:a17:90a:7344:: with SMTP id j4mr5251307pjs.223.1617227992142;
        Wed, 31 Mar 2021 14:59:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t12sm3602156pga.85.2021.03.31.14.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:59:51 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:59:51 -0700
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: qcom_swrm_irq_handler(): Control flow issues
Message-ID: <202103311459.82A93D8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")

Coverity reported the following:

*** CID 1503584:  Control flow issues  (NO_EFFECT)
/drivers/soundwire/qcom.c: 446 in qcom_swrm_irq_handler()
440     			if (!value)
441     				continue;
442
443     			switch (value) {
444     			case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
445     				devnum = qcom_swrm_get_alert_slave_dev_num(swrm);
vvv     CID 1503584:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "devnum < 0".
446     				if (devnum < 0) {
447     					dev_err_ratelimited(swrm->dev,
448     					    "no slave alert found.spurious interrupt\n");
449     				} else {
450     					sdw_handle_slave_status(&swrm->bus, swrm->status);
451     				}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503584 ("Control flow issues")
Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")

Thanks for your attention!

-- 
Coverity-bot
