Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76690F866C
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfKLBez (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:34:55 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:41274 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLBez (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:34:55 -0500
Received: by mail-pf1-f169.google.com with SMTP id p26so12099054pfq.8
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GMh97Msx/7CLVx/FjUIZvhqU++cWg4ak3zgemHsbRsY=;
        b=hJTCsS2M+L53BYclNghsHDnN9VDqZyYBGKhJgrLt5G4ilhdJO7p6yNx7V6wJ+15sR5
         WCYFu0uDyytledczSH6R+fL1mJ25f9CVeolUwmt7gRO87y0Q4UHwiEjqwFZv91ONatqa
         Mbox7hKPfXqIhNSsQWW0yobZ+WeYIy7sOPUBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GMh97Msx/7CLVx/FjUIZvhqU++cWg4ak3zgemHsbRsY=;
        b=nkHTxxRlFiwvktJ6Sk977lNTNVIik4ygKLRPhIE7JurT28iYHI4t8fWIN+YZ6IwEmg
         3sv+w6EGoP/vXpWtV9W6UFKg7D1fanWxyluuCeWrBtZmIYwHcDlqMyBZMHEpbDdgvSV1
         cp/Wo2hy1SEHsD5Qlw37jUx3fuCLaIpWh9Z6riEzFM/OwikKzbPfFX1Vlcz7srehQNcb
         U/+KtfwjdgnLW3Bti/+hwC782VYPRk9wdrj19BgK9uZzl7wB3YfhFy3zU8x1tv81PXZ6
         rbosyQpmxcEMttqVW7wCcV1UZ/URnrU/Yi7Zy2QVQiwG1HIjpZL8iAf0yP3yeovGhmKP
         LWUg==
X-Gm-Message-State: APjAAAW61NlwWpcXioZ6vsaTGaF1UEzvQFnxQr2/CXeB/6r9gQ0pxvZL
        EWqq9230C8RxvE9nk166txtyig==
X-Google-Smtp-Source: APXvYqwB93ChJ4dpTyIxpybad466Y7dvcnFvnJrvYr0HBwfUeZ+ljCfh48V5jwtc9JmjV1g9Yhgdsg==
X-Received: by 2002:aa7:8e56:: with SMTP id d22mr33629738pfr.3.1573522494774;
        Mon, 11 Nov 2019 17:34:54 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r15sm12743703pfh.81.2019.11.11.17.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:34:53 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:34:52 -0800
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rk_gmac_setup(): Error handling issues
Message-ID: <201911111734.5975EF8C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve int/unit warnings")

Coverity reported the following:

*** CID 1487850:  Error handling issues  (CHECKED_RETURN)
/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: 1227 in rk_gmac_setup()
1221     	int value;
1222
1223     	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
1224     	if (!bsp_priv)
1225     		return ERR_PTR(-ENOMEM);
1226
vvv     CID 1487850:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "of_get_phy_mode" without checking return value (as is done elsewhere 43 out of 44 times).
1227     	of_get_phy_mode(dev->of_node, &bsp_priv->phy_iface);
1228     	bsp_priv->ops = ops;
1229
1230     	bsp_priv->regulator = devm_regulator_get_optional(dev, "phy");
1231     	if (IS_ERR(bsp_priv->regulator)) {
1232     		if (PTR_ERR(bsp_priv->regulator) == -EPROBE_DEFER) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487850 ("Error handling issues")
Fixes: 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve int/unit warnings")


Thanks for your attention!

-- 
Coverity-bot
