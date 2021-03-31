Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6607B3509D3
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 23:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCaV5p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCaV5g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:57:36 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6739BC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:57:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id j25so4726pfe.2
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8dPt3Yq/zYzGw4ILH2pZmZ6RzAjkGhIoUA2qN4z7AD0=;
        b=fkT4euBWh/9gkclxFcq7bi9T2K+EaWT21y6kdbAjoyzQ7b1R1SH1vPkrh+HUxYS9jb
         ALTmbEaF8zrmzMU7o7EVkaJXnGkxmI3LXpV+PCUIKRQShPz5OJU3M554CYm4jg8pkXt2
         sx6EOCTGf/yF9G8a0pgsuVbp79JW0DH1G6PnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8dPt3Yq/zYzGw4ILH2pZmZ6RzAjkGhIoUA2qN4z7AD0=;
        b=dONCH7tFbRgf1RzEUH8/ujuBwLy9xNyGOalapdmLPefwUC+vzkA5L0Hm8YGQUTFbQW
         G6XmoO3buOwY+b3ECWE0tH5kP3hvpUnyKlv1X6iOgZ6x3oBXROmlxyerH0RUQxiuqAPr
         rTaiWkn9NF2w57qTJY5EIEoIadhu3xSZT+tEUR0AQ9fJ406ynuQmjTnfyUMnUDShV7AL
         Tq5EpFjTUtWIAkib+D4HwYT48Gj13r0HSa2/4XNrh5y3s+nEvn9Ye98KWnXodKowSXT5
         JC5KBzepzf0PStLWC1AXKs1Gvzmi5ydo8yxdr4QxV6RLEd0C5K+DA5v/ZBisJf2DwJ2R
         nsAA==
X-Gm-Message-State: AOAM533GdJ26CVHPyFxDwSnmdvOtI3MO84AThRpaquCHEQ3r3VJh1MdY
        /uej7M3GkFycR65NzaPt0HfPDg==
X-Google-Smtp-Source: ABdhPJwmhykCUpU7u/+cKG/jCEj/2uEBVgKPcsgAbLuRsXfKlQJwtVtIKuXRbHT+17ArZNaSWFI/IQ==
X-Received: by 2002:a63:390:: with SMTP id 138mr5045170pgd.8.1617227855918;
        Wed, 31 Mar 2021 14:57:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u84sm3497718pfc.90.2021.03.31.14.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:57:35 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:57:34 -0700
To:     Jyri Sarha <jsarha@ti.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: wiz_mode_select(): Uninitialized variables
Message-ID: <202103311457.661F86EC4@keescook>
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
    7ae14cf581f2 ("phy: ti: j721e-wiz: Implement DisplayPort mode to the wiz driver")

Coverity reported the following:

*** CID 1503592:  Uninitialized variables  (UNINIT)
/drivers/phy/ti/phy-j721e-wiz.c: 344 in wiz_mode_select()
338     	for (i = 0; i < num_lanes; i++) {
339     		if (wiz->lane_phy_type[i] == PHY_TYPE_DP)
340     			mode = LANE_MODE_GEN1;
341     		else if (wiz->lane_phy_type[i] == PHY_TYPE_QSGMII)
342     			mode = LANE_MODE_GEN2;
343
vvv     CID 1503592:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "mode" when calling "regmap_field_write".
344     		ret = regmap_field_write(wiz->p_standard_mode[i], mode);
345     		if (ret)
346     			return ret;
347     	}
348
349     	return 0;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503592 ("Uninitialized variables")
Fixes: 7ae14cf581f2 ("phy: ti: j721e-wiz: Implement DisplayPort mode to the wiz driver")

Thanks for your attention!

-- 
Coverity-bot
