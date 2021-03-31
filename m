Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFDE3509DC
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 23:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhCaV6u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhCaV6f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:58:35 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60DBC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:34 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2002039pjv.1
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=H0aHV+QoQ2IFRjwOE/9fzJ+siFh+c2KqOrGHMwjGAKM=;
        b=JzMtx2oIaUWmwFsT0uE7o08wYVPQ3GgZ5ngfvdBWyp7ZDnK5iYxyaDyOM2NnjvIY5e
         FGEw+MB+Q/HOFitxjwmQzMa3hVLGaV7+NZUGjriutpPnYhCGd+P2DJfWOXaIqMBtrTPN
         a/JpjmE6vnKnOeX2iVeKl6IK5iTHBXn1Q9180=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=H0aHV+QoQ2IFRjwOE/9fzJ+siFh+c2KqOrGHMwjGAKM=;
        b=GLyuCJkHpfxp3bQvmzu09OK0Xj7av699C8sS2pFDtHbJGrkI1+ZQYgl5GrPg6jhLt6
         B805PMDdClsN0RTo9h6/phx2KuGEzTlyrIOQ8IztZz+lX0X64FEhkJT900GAzYDOmaew
         1D5ZN/MNRpCFB5AaebIKCeEFjLHqDg3weldANWqjbk20SEZAQgBbzmO12mnwRs66RjN2
         Ak1S4IDA5HoRXVxkPYIQqsziAZmwPK2bfbbBb7ezNcK2WBnQtfGK2lDGxmDGZfePfbt2
         ai/gPAW867aQ5X7M6exlltkubLHpdXw9Ut3ib1yIxYIMdAD+5t3ppEiXqcT71eJl2kmV
         ZSIA==
X-Gm-Message-State: AOAM5305sqgxpZEboEej6OH2rPRzrtmWZ+wz4guFFhb7bRfuR0pMqAlO
        L9X6tBIA57kQLL2pDlOn/GMSPw==
X-Google-Smtp-Source: ABdhPJyHtw/WfctNpo0WIwO4XpyG4TaWdw5M/fVebtHrljrWy+R64LNceJ3yZheGadkrzTseyCoQaQ==
X-Received: by 2002:a17:902:c408:b029:e7:3242:5690 with SMTP id k8-20020a170902c408b02900e732425690mr5098718plk.85.1617227914376;
        Wed, 31 Mar 2021 14:58:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id co20sm3018274pjb.32.2021.03.31.14.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:58:34 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:58:33 -0700
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Swapnil Jakhade <sjakhade@cadence.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: cdns_torrent_derived_refclk_is_enabled(): Error handling
 issues
Message-ID: <202103311458.B02B4B13@keescook>
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
    2cca0228f364 ("phy: cadence-torrent: Add support to drive refclk out")

Coverity reported the following:

*** CID 1503589:  Error handling issues  (CHECKED_RETURN)
/drivers/phy/cadence/phy-cadence-torrent.c: 1678 in cdns_torrent_derived_refclk_is_enabled()
1672
1673     static int cdns_torrent_derived_refclk_is_enabled(struct clk_hw *hw)
1674     {
1675     	struct cdns_torrent_derived_refclk *derived_refclk = to_cdns_torrent_derived_refclk(hw);
1676     	int val;
1677
vvv     CID 1503589:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "regmap_field_read" without checking return value (as is done elsewhere 101 out of 117 times).
1678     	regmap_field_read(derived_refclk->phy_pipe_cmn_ctrl1_0, &val);
1679
1680     	return !!val;
1681     }
1682
1683     static const struct clk_ops cdns_torrent_derived_refclk_ops = {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503589 ("Error handling issues")
Fixes: 2cca0228f364 ("phy: cadence-torrent: Add support to drive refclk out")

Thanks for your attention!

-- 
Coverity-bot
