Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE421A69BB
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731461AbgDMQVS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731410AbgDMQVS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:21:18 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14519C0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:21:18 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id x26so3463835pgc.10
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6pS745GjQHFJeHytVRacl+jdJQMkQrNiaxuyqSMFQek=;
        b=CAAIdbsfjyss2rKXn7AV32dFaB2B8K2XA3SCpTtSdyoR+wi5etLEiI22UxbrstrUKE
         Rh/euDgdN0g696kmJiwQIuVXgwbr3PaCZEYb9oxpiO1atn1tG0AnCsvOnKHJOckRBbdu
         Lxdkec18NW7zpEITCzSB93zyMVcKZ6rmAhF6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6pS745GjQHFJeHytVRacl+jdJQMkQrNiaxuyqSMFQek=;
        b=JyZtfD+XgeF2XQR9OWFcqdHrpHl/NXxGrkwL1AJMysp6B/m/9gXNL63CByxf3pqguw
         M6mYhn/9Of8nJ5ht5wkwyDs7fYN4HF0dUNmXOBeS28jWsPZc/IZDiBtxJTDCn1Vxr8hl
         ekmJXNWifdDGhalRGlIF81re+uOz8v+HQcN9FCYEy/XAit7NmQMwTg2O4bD7l6ftITif
         yJejFHnK5zD1H9INApfKW49hnP/VRde9Nx7+DDeYiLVpu6uiqggLZQ9Eg7Dm0uyoA70p
         slGiKBnFJOms85pzTEmX9r3H3SDRFuisgU6LSLB17DZnrZX9Leqp7T4v7erkOmNnKdIY
         68JA==
X-Gm-Message-State: AGi0PuZLHjeMTQvOQDlffHO0mec2MfBViYWKQKaGVSY+MZKlzsM5BzHa
        7aal8LLsc8f1wPtdF2F8h79Zwg==
X-Google-Smtp-Source: APiQypJXILjYL4yTSqjD4rCkR72AZ/b/nx1ZIc+n9oPzvWxSQn2CwA1f/Bfs2FtOtZcHscpSkexpow==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr17530163pgo.90.1586794877591;
        Mon, 13 Apr 2020 09:21:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w66sm5611018pfw.50.2020.04.13.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:21:16 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:21:15 -0700
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: imx_mu_scu_rx(): Memory - corruptions
Message-ID: <202004130921.01C9D700D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Mar 19 15:49:52 2020 +0800
    0a67003b1985 ("mailbox: imx: add SCU MU support")

Coverity reported the following:

*** CID 1461658:  Memory - corruptions  (OVERRUN)
/drivers/mailbox/imx-mailbox.c: 214 in imx_mu_scu_rx()
208     		ret = readl_poll_timeout(priv->base + priv->dcfg->xSR, xsr,
209     					 xsr & IMX_MU_xSR_RFn(i % 4), 0, 100);
210     		if (ret) {
211     			dev_err(priv->dev, "timeout read idx %d\n", i);
212     			return ret;
213     		}
vvv     CID 1461658:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array of 8 4-byte elements at element index 31 (byte offset 127) by dereferencing pointer "data++".
214     		*data++ = imx_mu_read(priv, priv->dcfg->xRR[i % 4]);
215     	}
216
217     	imx_mu_xcr_rmw(priv, IMX_MU_xCR_RIEn(0), 0);
218     	mbox_chan_received_data(cp->chan, (void *)&msg);
219

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461658 ("Memory - corruptions")
Fixes: 0a67003b1985 ("mailbox: imx: add SCU MU support")

Thanks for your attention!

-- 
Coverity-bot
