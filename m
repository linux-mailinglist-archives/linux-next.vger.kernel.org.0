Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81F11B7981
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgDXP0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 11:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727063AbgDXP0S (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 11:26:18 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35B6C09B045
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:16 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id y6so3993907pjc.4
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=pL5amLqlDDtqRSOURf7ddVjxbIj6P2pWANFWK1mRASI=;
        b=dBjPpXzDCklOGOvWka4qa5HPmviYqBecSvF28zoXjqv3cDo5HCdKtXa0KiLT2g8xty
         tHGYP/whLNKXBS5rl+MUpXVKp2CWdLmiL+KIzDfQvkdF8lU8JycAMFqUap8wnONWqWdN
         V2en8uOiQvBni9HCRa3emHdliem1PNttTHEuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=pL5amLqlDDtqRSOURf7ddVjxbIj6P2pWANFWK1mRASI=;
        b=it/ywn9Yb4FsFi9ezTVcS+10Qb9UDcJQafTFXSK3avCls3PVojMJ9DcBe/LOiGboZA
         LAeqq43JM0v192iX3VX4Ri43u00WAAk0eGHFmNAyi8yVrnJpYWQN69ORzBKLVCBrz0VU
         ON2BFnAOlrH6xMJ+sbNEXATqbU7ycU/JzWePGDGaAZUPLd41X9eW4LJ9fF+SshOi/nb5
         dR6OGz0CgwhkBgS0Ra1pO192JGT+XFSoaFr5+MEoRf81pGCiIwn791LFAFkVdLp0y5K4
         Ywqesa5i+TwqSNiGbojVORGDkr/azLg4IQEJ03R1Q1BHmhxllm/ZFUZ8BR6cQZcS8wK/
         978g==
X-Gm-Message-State: AGi0PuZl06tuYH4YurbNqA52/j9Hxkqo+gjTH9BP5pwm+aAG9PO8sj0p
        JaMq6V1Mfokj9NF6EwUgfCnJDA==
X-Google-Smtp-Source: APiQypK1dnbhlY1c/Z8Ig+u2/rjNyfJd1tXgn+A7OafxyRika9wurInjBz0nJmqYIRLhT2TsLzgVPw==
X-Received: by 2002:a17:90b:2388:: with SMTP id mr8mr6729481pjb.107.1587741976252;
        Fri, 24 Apr 2020 08:26:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm6330733pfc.7.2020.04.24.08.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:26:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 24 Apr 2020 08:26:14 -0700
To:     Tzu-En Huang <tehuang@realtek.com>
Cc:     Yan-Hsuan Chuang <yhchuang@realtek.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rtw8822c_dpk_cal_coef1(): Error handling issues
Message-ID: <202004240826.6E2BADAF7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200424 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Sep 9 15:16:08 2019 +0800
    5227c2ee453d ("rtw88: 8822c: add SW DPK support")

Coverity reported the following:

*** CID 1492716:  Error handling issues  (CHECKED_RETURN)
/drivers/net/wireless/realtek/rtw88/rtw8822c.c: 3147 in rtw8822c_dpk_cal_coef1()
3141
3142     	rtw_write32_mask(rtwdev, REG_NCTL0, BIT_SUBPAGE, 0x0000000c);
3143     	rtw_write32(rtwdev, REG_RXSRAM_CTL, 0x000000f0);
3144     	rtw_write32(rtwdev, REG_NCTL0, 0x00001148);
3145     	rtw_write32(rtwdev, REG_NCTL0, 0x00001149);
3146
vvv     CID 1492716:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "check_hw_ready" without checking return value (as is done elsewhere 20 out of 21 times).
3147     	check_hw_ready(rtwdev, 0x2d9c, MASKBYTE0, 0x55);
3148
3149     	rtw_write8(rtwdev, 0x1b10, 0x0);
3150     	rtw_write32_mask(rtwdev, REG_NCTL0, BIT_SUBPAGE, 0x0000000c);
3151
3152     	for (path = 0; path < rtwdev->hal.rf_path_num; path++) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492716 ("Error handling issues")
Fixes: 5227c2ee453d ("rtw88: 8822c: add SW DPK support")

Thanks for your attention!

-- 
Coverity-bot
