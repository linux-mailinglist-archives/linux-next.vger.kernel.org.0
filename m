Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D2E3509D7
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 23:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhCaV6Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhCaV5z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:57:55 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30943C061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:57:55 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso2001908pjh.2
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=v07k/r/amrZz49gpDsh6ED4Q/KPXlvMeomlIT0lP8Bw=;
        b=P4vuyCuCSLUn60YmahZ6W7uy0Rx5kF5OWm9mauSzyERsVLmZMQYnyEf6dBA0tjDeZX
         /S9E57WySIoitOXcnnPW+1xz9JuQXV106lQX7HlBVk/+1MweIko/ATUNMDvEyVZNa7gA
         IJQAkNR+djA0OWFycglaXXJTnKqQxrHltUTH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=v07k/r/amrZz49gpDsh6ED4Q/KPXlvMeomlIT0lP8Bw=;
        b=lXyKBYMY7Lbse1DOpJGWtKE1gW6HEjELwtpuJ84PaocRXBKuqqbXQNQyq8xvRa8gfx
         bej1L/Jn5SquY9/TT14BmMfSto/E36IcJMIbs/ZqNoz4sNLGbUnuhK6WHMARwbyR7yor
         E4RyrbepGteRyv3qLJgll/InFhxHE5v7rMuM5aLn6dhFM+MfGWHerg8PSrcER/cXTcxi
         ujBdGeN7ByNTlq8kUd5epnX9H1mXzwu/2lDYjiEGaitxylw5LhYUoXfKMYXt0QHxqfqi
         wxXJa1T6yPV0LpWF+8dF5eG9KfS1tAo1WZR7sPmK1T8ZNAwiUBPVBoaX/Zr5dulaoZM4
         4JYA==
X-Gm-Message-State: AOAM530yv2IWBUMlHzaO7wadVlikDXYV9bRoxWdUk2zdD8sRjCX4xGFD
        lvjJPB9rTcGn43ce4oDv0A93Yu3Y1QQTUg==
X-Google-Smtp-Source: ABdhPJy2Un9Vfp5D5OMCT9uPjuhTHmRmj6xZqj6jd/JnH/5S1LBXvIL+IJjmvLj3g/SjlY/8g+6xRQ==
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr5433062pjb.74.1617227874765;
        Wed, 31 Mar 2021 14:57:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a7sm3193102pfo.105.2021.03.31.14.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:57:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:57:53 -0700
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: qcom_swrm_transport_params(): UNUSED_VALUE
Message-ID: <202103311457.EB3BBBF03E@keescook>
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
    128eaf937adb ("soundwire: qcom: add support to missing transport params")

Coverity reported the following:

*** CID 1503591:    (UNUSED_VALUE)
/drivers/soundwire/qcom.c: 672 in qcom_swrm_transport_params()
666
667     	ret = ctrl->reg_write(ctrl, reg, value);
668
669     	if (pcfg->lane_control != SWR_INVALID_PARAM) {
670     		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
671     		value = pcfg->lane_control;
vvv     CID 1503591:    (UNUSED_VALUE)
vvv     Assigning value from "(*ctrl->reg_write)(ctrl, reg, value)" to "ret" here, but that stored value is overwritten before it can be used.
672     		ret = ctrl->reg_write(ctrl, reg, value);
673     	}
674
675     	if (pcfg->blk_group_count != SWR_INVALID_PARAM) {
676     		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
677     		value = pcfg->blk_group_count;
/drivers/soundwire/qcom.c: 678 in qcom_swrm_transport_params()
672     		ret = ctrl->reg_write(ctrl, reg, value);
673     	}
674
675     	if (pcfg->blk_group_count != SWR_INVALID_PARAM) {
676     		reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
677     		value = pcfg->blk_group_count;
vvv     CID 1503591:    (UNUSED_VALUE)
vvv     Assigning value from "(*ctrl->reg_write)(ctrl, reg, value)" to "ret" here, but that stored value is overwritten before it can be used.
678     		ret = ctrl->reg_write(ctrl, reg, value);
679     	}
680
681     	if (pcfg->hstart != SWR_INVALID_PARAM
682     			&& pcfg->hstop != SWR_INVALID_PARAM) {
683     		reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503591 ("UNUSED_VALUE")
Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")

Thanks for your attention!

-- 
Coverity-bot
