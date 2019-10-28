Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 005ADE7CAB
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbfJ1XEA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:04:00 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:35530 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729692AbfJ1XD7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:03:59 -0400
Received: by mail-pf1-f174.google.com with SMTP id d13so6970607pfq.2
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CFn3zfERHyr1Xod6LRkf4MMsZQz+EK3EOy3vPLT/n+w=;
        b=WrclJfEo4mQNNNPzlh0rrhmkwHkgDCIgY/FhVAyg+pyRUodblUWi54PDDdhdBZI1bd
         zRu2Jikme9u4NPyTxKnqGT0Dc/nZKuQb06SJtR8kl2xPImN5YoShyLf3bguF6QEmfMp5
         KHJIq9iQfBLC6ryMy8BVn+y42HSkSrr6rJUgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CFn3zfERHyr1Xod6LRkf4MMsZQz+EK3EOy3vPLT/n+w=;
        b=MmQ5Gtw7cr0fpzxFAWrqLM1mgULLs+HBhSMPYDR2AUFXmnedBIIRYX0jyaDsc00Xpz
         b7C7lG1gAWY2zz0OWMhgHrD/oTibxIPbIzcokXgfpaTYzLyDeH7E4LLHVYuQ8VDdMYPw
         hbGLjW6GpViKPrHzk4P1iflQpEdo/VbgTZqoNy8zID4sVXygM0PKCDKgoC+99WZvAwlg
         byEZmywowOjEKf0iX/TTs76x+u83ehFuhneKUj1dm43ExtDZOlZmlewTLtvcaF4SRxo2
         UzRfyFpIjt7A1Q372VIFZdlNGXpnYpVeF6Gn4Og1ccR7dJ9hLiLeu5sK+7a3zBbk1RzH
         IKAQ==
X-Gm-Message-State: APjAAAVgnGo2/gsZa+cBUeG+vpSl3D71wp6ZF3d2WtJVLsA/yM4bJhMq
        LdSoP+dIi7WiS9I7bkL10Y/1VQ==
X-Google-Smtp-Source: APXvYqz359oao6vnDBSqWCJ/59wSpBT9EczL81niSHLC/ahizdM12fqBLFjvvqeGoW/yv5qkmhyU/Q==
X-Received: by 2002:a17:90a:c244:: with SMTP id d4mr2186970pjx.117.1572303838706;
        Mon, 28 Oct 2019 16:03:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b3sm12845108pfd.125.2019.10.28.16.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:03:57 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:03:57 -0700
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: calibrate_8976(): Memory - illegal accesses
Message-ID: <201910281603.E90E9627A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")

Coverity reported the following:

*** CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
/drivers/thermal/qcom/tsens-v1.c: 245 in calibrate_8976()
239     	int mode = 0, tmp = 0;
240     	u32 *qfprom_cdata;
241
242     	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
243     	if (IS_ERR(qfprom_cdata)) {
244     		kfree(qfprom_cdata);
vvv     CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
vvv     Passing freed pointer "qfprom_cdata" as an argument to "PTR_ERR".
245     		return PTR_ERR(qfprom_cdata);
246     	}
247
248     	mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
249     	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
250

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487355 ("Memory - illegal accesses")
Fixes: 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")


Thanks for your attention!

-- 
Coverity-bot
