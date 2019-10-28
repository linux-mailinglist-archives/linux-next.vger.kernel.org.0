Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C74BE7CB4
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbfJ1XGK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:06:10 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:37593 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XGJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:06:09 -0400
Received: by mail-pg1-f171.google.com with SMTP id p1so8050027pgi.4
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=S96i213Dq2b7CfeK/9YmMVb8Y2pJ0GLDvWFbRl9IKqc=;
        b=bBtHwgU+k9tZP7g1lbKJ+VdtyWXlF1DE+eDasMqS/KD4l7xXGX8+h5tcsqk9114VuV
         H6vfhy0riJ+XzGkLYcycd/tu2HT85L8gC1B3Siyp3Fdp+TP3ZrCGnpWmBwVW+uaJS6zB
         Juaao/y+yeeNwB0Eompao4O/0KNbAK3d3ylgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=S96i213Dq2b7CfeK/9YmMVb8Y2pJ0GLDvWFbRl9IKqc=;
        b=Zp/WYdLphZzN6FHXH3IDnEj5HMpO4ryOpmgtjLm5zqv6d20Zl1CWwqsVwwoN2NTOZA
         rhLX2z2nvtQunC/TN2mdp6n+HSjHP3wVBNvxXQzLn4D2S7z8UEdlZQGzZm+ewQzNZ0D4
         SkuReLypx8KjewkEW1KHZQpmreeog9IjDeGSCR3HR9JYCQWE+7EZORmyAjaLFyMiAaWS
         x9Bcl+4x4H/zb728NTDMNSm0cvwuWeiQ1VrhgwpDntKAeFU/xxLtaU85zDssR/HDuK5H
         3DPUTETn77lH/VxG1st80IQvrF9/DXjZvlnFipPwWbP2S05YH/2CJArEchNO/rdJ6xOW
         v4aQ==
X-Gm-Message-State: APjAAAXcS2ldCiVDvku3I/L1NdcflCgYUj5KEx2jDL9sNCkm/Et/Q6X8
        0nUl3bwzcC4mY4zgpGPtK8NWgg==
X-Google-Smtp-Source: APXvYqw2nEvEulKQbf3a/+QuBll7cTvDJZOquO0lXnBCflEd3K0FMnbDyRn2WQQIcpPTyV86v21Xmw==
X-Received: by 2002:a63:1c03:: with SMTP id c3mr15419115pgc.198.1572303967658;
        Mon, 28 Oct 2019 16:06:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g11sm3815367pfo.86.2019.10.28.16.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:06:06 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:06:06 -0700
To:     Tzu-En Huang <tehuang@realtek.com>
Cc:     Yan-Hsuan Chuang <yhchuang@realtek.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Chris Chiu <chiu@endlessm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rtw_phy_pwrtrack_get_pwridx(): NO_EFFECT
Message-ID: <201910281605.E73D72D2F2@keescook>
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

c97ee3e0bea2 ("rtw88: add power tracking support")

Coverity reported the following:

*** CID 1487362:    (NO_EFFECT)
/drivers/net/wireless/realtek/rtw88/phy.c: 2074 in rtw_phy_pwrtrack_get_pwridx()
2068
2069     	if (delta >= RTW_PWR_TRK_TBL_SZ) {
2070     		rtw_warn(rtwdev, "power track table overflow\n");
2071     		return 0;
2072     	}
2073
vvv     CID 1487362:    (NO_EFFECT)
vvv     Comparing an array to null is not useful: "swing_table->p", since the test will always evaluate as true.
2074     	if (!swing_table || !swing_table->n || !swing_table->p) {
2075     		rtw_warn(rtwdev, "swing table not configured\n");
2076     		return 0;
2077     	}
2078
2079     	delta_swing_table_idx_pos = swing_table->p[tbl_path];
/drivers/net/wireless/realtek/rtw88/phy.c: 2074 in rtw_phy_pwrtrack_get_pwridx()
2068
2069     	if (delta >= RTW_PWR_TRK_TBL_SZ) {
2070     		rtw_warn(rtwdev, "power track table overflow\n");
2071     		return 0;
2072     	}
2073
vvv     CID 1487362:    (NO_EFFECT)
vvv     Comparing an array to null is not useful: "swing_table->n", since the test will always evaluate as true.
2074     	if (!swing_table || !swing_table->n || !swing_table->p) {
2075     		rtw_warn(rtwdev, "swing table not configured\n");
2076     		return 0;
2077     	}
2078
2079     	delta_swing_table_idx_pos = swing_table->p[tbl_path];

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487362 ("NO_EFFECT")
Fixes: c97ee3e0bea2 ("rtw88: add power tracking support")


Thanks for your attention!

-- 
Coverity-bot
