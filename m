Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087213509E8
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbhCaWAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 18:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhCaWAC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 18:00:02 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7B4C06174A
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:00:02 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id s21so7388pjq.1
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=N4kurWnRUYXmR7z3KJBvyrU6Pp/Hk6bRXMnVv4qhpUw=;
        b=UysDK0tFln0ROMFobMSknIiOBcjN2FLMe1B5kPNlHcEJ4pLaoSNernczPzgy5Hy3oe
         /PSdtkEkNThR7t2At8UL0rasJyr8rkd/B0cCIWX/kOB5Ds6bQpQD97vfzxY5iM3DKfcK
         B6iYWAMPVx1skNQZQ3LRdc/wzUHra7q54y1Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=N4kurWnRUYXmR7z3KJBvyrU6Pp/Hk6bRXMnVv4qhpUw=;
        b=NIHxndVic4/BpgdeKW3ji74+lu9FM0JOsZMGQXHjkfFtVLxW9fg8M9xsVBdpEdJcPy
         mGNYpyhiiTuLzCMD1dTQmgeRN2fBa3vBfRdAG5jDjzmtngV3qoUTsr1o5ipsT88oqLPa
         pnIXfKVD/AJKLKtC05JzaExVnrGeJrfCTFyNCNdgFUJhwuKjrZ4tGS+wKVL69URxTW2d
         DG1MxOCYC9cv8AegsDzjES9W3qiNuf3zNsENl1IOgPrxLyvS5nYC6fA2CJv00HnvH1f1
         Gv+nIgDk5Bx1h31FJlorLIAdxjvu3yjN6ssKa79QEvmU/Giu+QRso4VSeanTs4Q9WlFT
         WXew==
X-Gm-Message-State: AOAM530n49A9T0G/4uJBKjiEY8tMuYQ+S3tZLw24i67tsi6Lyk+vvwbx
        Hd4hbt4Q4EraptXGjpXhLpBLYw==
X-Google-Smtp-Source: ABdhPJx+yVIizrn3TNkV0avPOzlugxQ8k0ukioAmiQ8vY0Mc4vNDxrGOASSexikBSeOz5hVkW3Tx+A==
X-Received: by 2002:a17:90a:fe05:: with SMTP id ck5mr5768761pjb.19.1617228001967;
        Wed, 31 Mar 2021 15:00:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i10sm12087380pjm.1.2021.03.31.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:00:01 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 15:00:00 -0700
To:     Torin Cooper-Bennun <torin@maxiluxsystems.com>
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: m_can_receive_skb(): Error handling issues
Message-ID: <202103311500.C1214192BE@keescook>
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
    1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to ensure skbs are sent from softirq context")

Coverity reported the following:

*** CID 1503583:  Error handling issues  (CHECKED_RETURN)
/drivers/net/can/m_can/m_can.c: 470 in m_can_receive_skb()
464     */
465     static void m_can_receive_skb(struct m_can_classdev *cdev,
466     			      struct sk_buff *skb,
467     			      u32 timestamp)
468     {
469     	if (cdev->is_peripheral)
vvv     CID 1503583:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "can_rx_offload_queue_sorted" without checking return value (as is done elsewhere 7 out of 8 times).
470     		can_rx_offload_queue_sorted(&cdev->offload, skb, timestamp);
471     	else
472     		netif_receive_skb(skb);
473     }
474
475     static void m_can_read_fifo(struct net_device *dev, u32 rxfs)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503583 ("Error handling issues")
Fixes: 1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to ensure skbs are sent from softirq context")

Thanks for your attention!

-- 
Coverity-bot
