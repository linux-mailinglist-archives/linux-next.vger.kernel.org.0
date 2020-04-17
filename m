Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9EC1AE7D1
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 23:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgDQVwG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 17:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728215AbgDQVwF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 17:52:05 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A91C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:52:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id ay1so1450207plb.0
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YvO7603rAq2pgY13UhxzJKiMocQRrgmOIynMnR9I48I=;
        b=K6iwJ60utxASOM7DjLRtTsu4Qsy84Arw/tTIfEadb38yHvIm+RbAfdeSyqelKrAXjA
         Vb7ZoevC5JcE8hacpn4DhduWy0k2LWUL4OSC1PVB64WZxs1TOXgeciYn0QAP6WgSxa5M
         jNMQEcrVPwUT68wtYMol7VVNXdwcsre9diPwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YvO7603rAq2pgY13UhxzJKiMocQRrgmOIynMnR9I48I=;
        b=dg63bwPagF5UV6knlVoJJgGlAWHq9UzjrfgK9dTZKN6FXvsm1Yu80Sh/yLlLKa5dd7
         zc1g23kJe6y+td9eREEHpLu9UZkh/6d7Fv/scfPW4mJ1eJhpIZanHiI8DdHnDMmxubLL
         cMSUp9hkPvQBiYCqnXQCqYUj2FzrJzg1+8OGbcO0z7yE61b1LWPE+zrFrNnINnvyvpsI
         QqmL/XpxgPOXI+JtGensWONig6igRFIr5jpDoWNC6J6BKMaY04zTzeDGGHwD9A+KcKva
         /+6LbvnJ+QFp7cpkZE6Ispzin/eTrlk/uw3v1gm9/jVRJjzJqy1J/tGaGdrZBTuJFT6U
         NTAA==
X-Gm-Message-State: AGi0Pub/BEYtDFdsd187LEYz/lmnzxJ8yzyLGIlOaJcyvqvF87+8c4YV
        IEq5ghFgIh8SmHqQXw2qCfpTQA==
X-Google-Smtp-Source: APiQypK+ARGlmxWYr3sj39SDdGqHCfum55ZYL7tKPE6UfsThiNkB6smM1bFta4uuPkd/6xGTsAa+iA==
X-Received: by 2002:a17:902:9b95:: with SMTP id y21mr5520648plp.101.1587160323365;
        Fri, 17 Apr 2020 14:52:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c84sm12215332pfb.153.2020.04.17.14.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:52:02 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 17 Apr 2020 14:52:01 -0700
To:     Manish Narani <manish.narani@xilinx.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: sdhci_versal_sdcardclk_set_phase(): Uninitialized variables
Message-ID: <202004171451.9D7ED8B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200417 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Apr 6 23:13:31 2020 +0530
    f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")

Coverity reported the following:

*** CID 1492645:  Uninitialized variables  (UNINIT)
/drivers/mmc/host/sdhci-of-arasan.c: 784 in sdhci_versal_sdcardclk_set_phase()
778     		regval |= SDHCI_OTAPDLY_ENABLE;
779     		sdhci_writel(host, regval, SDHCI_ARASAN_OTAPDLY_REGISTER);
780     		regval |= tap_delay;
781     		sdhci_writel(host, regval, SDHCI_ARASAN_OTAPDLY_REGISTER);
782     	}
783
vvv     CID 1492645:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "ret".
784     	return ret;
785     }
786
787     static const struct clk_ops versal_sdcardclk_ops = {
788     	.recalc_rate = sdhci_arasan_sdcardclk_recalc_rate,
789     	.set_phase = sdhci_versal_sdcardclk_set_phase,

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Human edit: also on line 860, same issue.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492645 ("Uninitialized variables")
Fixes: f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")

Thanks for your attention!

-- 
Coverity-bot
