Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E31641088
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 23:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbiLBWXu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Dec 2022 17:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbiLBWXt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 17:23:49 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8106EAB78
        for <linux-next@vger.kernel.org>; Fri,  2 Dec 2022 14:23:48 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 6so5478521pgm.6
        for <linux-next@vger.kernel.org>; Fri, 02 Dec 2022 14:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jTCIikbeptzJXD47+EMyi5YDiLQQfJyhpLRVU8dNm0=;
        b=ToGWGrmjiT0lMJNU69+4IxRqSU2UDAoa5JWa/ImgVTqrDAPvBqFY71W+U+knKfDsLp
         6Gp/nSFOHt5+m0Q8yU1d8m1dfHrWQXxgZNXt9VC72vFrlEPN84l0JJ90OquEZXSkYb2a
         KYELpNU7HZ5x23pyFU+/OVsWhbIWwGK6BLjjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jTCIikbeptzJXD47+EMyi5YDiLQQfJyhpLRVU8dNm0=;
        b=WdiDsWPCWEDpPZRM7af3iKafO0r/YF+zZJxCfhTEOkwuCzQ25oMXB9kd1NsTh8X+R5
         Y2VDD3xmRjRWNxF4G7+c0DP32brTMj917FyXsctTQv5lDBHlpzHwl6Sle/D2hFPdxHaK
         wPIpRw2N0l7nRrcQhwjnSKEoRINCC31AU5NC5qOAfNiuUL8MsFqGdD352nEuaupOVrh7
         BeXWM/Akw4FVPD74kdpRKXy+n1ZAyDkntSv7t3WQCPDlZfemQA+XMJT1V2CeR1HON/pQ
         t5JvBs+t42m7H+bUw6nndQbTt7BYDUDj7XW/NUxW+f7Q8lH1SgzW12bknJ5c+Pmr0Wa3
         vrLA==
X-Gm-Message-State: ANoB5pnSZ/Pg1U++zQAvH+jx9Py54mnuXqxmoPTMxQ/cYc7rm4GbbZwO
        Hrp5IENQLPhlshTl/aPfMvK0wQ==
X-Google-Smtp-Source: AA0mqf5GQF0f6fi1jAPdLnQFOWtH9RQ4f6566bGOi++EJw411Ux5M2z0l8uDW3zkf0KDGJveJ54bGQ==
X-Received: by 2002:a63:d117:0:b0:476:c781:d3ae with SMTP id k23-20020a63d117000000b00476c781d3aemr47136160pgg.183.1670019828150;
        Fri, 02 Dec 2022 14:23:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00186a437f4d7sm5926117plh.147.2022.12.02.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:23:47 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 2 Dec 2022 14:23:47 -0800
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Lorenzo Bianconi <lorenzo@kernel.org>,
        linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        Ryder Lee <ryder.lee@mediatek.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: mt76x0_phy_get_target_power(): Memory - illegal accesses
Message-ID: <202212021423.5D5F1FD@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221202 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Dec 1 17:29:12 2022 +0100
    b376d96362d8 ("wifi: mt76: move mt76_rate_power from core to mt76x02 driver code")

Coverity reported the following:

*** CID 1527804:  Memory - illegal accesses  (OVERRUN)
drivers/net/wireless/mediatek/mt76/mt76x0/phy.c:645 in mt76x0_phy_get_target_power()
639     	case 4:
640     		/* vht rates */
641     		tx_rate = info[1] & 0xf;
642     		if (tx_rate > 9)
643     			return -EINVAL;
644
vvv     CID 1527804:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array "dev->rate_power.vht" of 2 bytes at byte offset 9 using index "tx_rate" (which evaluates to 9).
645     		*target_power = cur_power + dev->rate_power.vht[tx_rate];
646     		*target_pa_power = mt76x0_phy_get_rf_pa_mode(dev, 1, tx_rate);
647     		break;
648     	default:
649     		/* ht rates */
650     		tx_rate = info[1] & 0x7f;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527804 ("Memory - illegal accesses")
Fixes: b376d96362d8 ("wifi: mt76: move mt76_rate_power from core to mt76x02 driver code")

Thanks for your attention!

-- 
Coverity-bot
