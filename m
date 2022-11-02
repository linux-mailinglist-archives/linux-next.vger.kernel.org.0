Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FDA616E08
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 20:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiKBTxf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 15:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiKBTxb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 15:53:31 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B4D249
        for <linux-next@vger.kernel.org>; Wed,  2 Nov 2022 12:53:28 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 78so17130141pgb.13
        for <linux-next@vger.kernel.org>; Wed, 02 Nov 2022 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zliXqk3NnikGJmdpNS8lUAHhq/1FjgM31IWjMGL7E+o=;
        b=l9IIkU0iUckfERVl0682RllGbv0IkkX4+/1SL2rfTU+EJ/wUssSTo/RxBFwH2A+kH3
         N8rcNNAPNjfncC5TZUGZq4UOuGsIuRRhrYCz9m85GIOeXfjAGT8e355CeWRk9bulhCLy
         omse5ZW57SLzmxLFG3B5EzySLzwpf+PMSCF18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zliXqk3NnikGJmdpNS8lUAHhq/1FjgM31IWjMGL7E+o=;
        b=1MRzZVtWuL598s9yPZL38Nw/0KR6qd973bl0fmw2oWJcRWpnwLzs/z1ohezD8rVpmH
         wCQdJ8bELOxf6dCiIrWkqxpG971rVS94wMcfWKUGAbGeNRb6nWzq5j9nGka2nm3JBkDa
         VpQzLDrFNFNDfNiYk64zh5S9tDBgQkMB3o/96E9Tt4e17kxOg0WgmJL9wkiGgD8WiTgS
         +Es+z/s4ab4FByA9lslFcNSarafFpJhFDQCd0ALp5SW5YfWf95eccyxzGr4ChPGs04/s
         TvCIEIHIWCHOutMupH7DuTNDg9aGAPdlbO6ff5iOOTAsBOmpyklLbOdT9POmWQ57piYP
         YG3A==
X-Gm-Message-State: ACrzQf1XuQkgjsWeY3xnhHUvhU2XANH1f1dLmDxcRB7RtktRv2o9owYL
        Bq9pBrpakv6mYODm9yG+Oly0WA==
X-Google-Smtp-Source: AMsMyM7vB+9+Bcq1D1yIcDFdmiakafFjzxYPSXMNcwUAplsshbL1NLegPvCiN0xg46X1YYh7AUV8ZQ==
X-Received: by 2002:aa7:81cf:0:b0:561:7d72:73ef with SMTP id c15-20020aa781cf000000b005617d7273efmr26760194pfn.16.1667418807581;
        Wed, 02 Nov 2022 12:53:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g206-20020a6252d7000000b0056232682a7esm8877786pfb.2.2022.11.02.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:53:27 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 2 Nov 2022 12:53:26 -0700
To:     Chih-Kang Chang <gary.chang@realtek.com>
Cc:     Chin-Yen Lee <timlee@realtek.com>, Kalle Valo <kvalo@kernel.org>,
        Ping-Ke Shih <pkshih@realtek.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: rtw89_mac_resize_ple_rx_quota(): Integer handling issues
Message-ID: <202211021253.44E254479@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Coverity from a scan of next-20221102 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Nov 1 11:26:13 2022 +0200
    7a68ec3da79e ("wifi: rtw89: add function to adjust and restore PLE quota")

Coverity reported the following:

*** CID 1527095:  Integer handling issues  (SIGN_EXTENSION)
/drivers/net/wireless/realtek/rtw89/mac.c: 1562 in rtw89_mac_resize_ple_rx_quota()
1556     		rtw89_err(rtwdev, "[ERR]get_dle_mem_cfg\n");
1557     		return -EINVAL;
1558     	}
1559
1560     	min_cfg = cfg->ple_min_qt;
1561     	max_cfg = cfg->ple_max_qt;
vvv     CID 1527095:  Integer handling issues  (SIGN_EXTENSION)
vvv     Suspicious implicit sign extension: "max_cfg->cma0_dma" with type "u16" (16 bits, unsigned) is promoted in "max_cfg->cma0_dma << 16" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "max_cfg->cma0_dma << 16" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
1562     	SET_QUOTA(cma0_dma, PLE, 6);
1563     	SET_QUOTA(cma1_dma, PLE, 7);
1564
1565     	return 0;
1566     }
1567     #undef SET_QUOTA

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527095 ("Integer handling issues")
Fixes: 7a68ec3da79e ("wifi: rtw89: add function to adjust and restore PLE quota")

Thanks for your attention!

-- 
Coverity-bot
