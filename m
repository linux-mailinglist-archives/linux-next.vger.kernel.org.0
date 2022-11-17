Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1AB62E80B
	for <lists+linux-next@lfdr.de>; Thu, 17 Nov 2022 23:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240226AbiKQWR0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Nov 2022 17:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbiKQWRR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2022 17:17:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0F71759A
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 14:17:17 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b11so2883719pjp.2
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 14:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJFXSIQ783ozGJIEcq7M0/X5+WZmAwzKbqXzhdiC6Ac=;
        b=K0Bjuug0PMBmGyIJKJh38l6aGh9Uv5KTby8hRtEeGfVVQ1uk8H1iE3Jy3X9g3QumnZ
         m2UP0vy7n4K5mWAusXU9baE2QnR29kZ4q50wmoljG4b2D2eX+mVF6sHH4MHZ7t18A4bO
         LdNjNf/Fkk/7a/wD3qmB8jz3Qcgz8Rz2OAuHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJFXSIQ783ozGJIEcq7M0/X5+WZmAwzKbqXzhdiC6Ac=;
        b=qV18w713Pl+uub6yNluhK7ohOcIeJz88CWYg0V6eYI4HDvCmajmNti/VZrLul0sHpp
         ZuGd2mIKj6YJhtMJSUg0oEEZyV05Bykqy1Q9NHRO0I8npPhR6S3Su0QmZFrfRGzZWgMT
         2TOwLqu8polT71MfxRfQzDvb7L1ZfAuaYOxVbxqIIVmbf2vdPjiILLTjVQjk5n+/FpoL
         7A2Of7l8cT/q4x+qTqWmcz+07ivkvgKKxH/P1i3nb8qwKyOWrp1DLzonG2JSEUG0eoAz
         EQTNtdGkMd6KCh7tqOPBHFdKMUUlWFiAIbBoCQy9QuAlzX9pJtzVNJmCgfSmdf2yLH0N
         4/Zg==
X-Gm-Message-State: ANoB5pn/d/nxWJ25McI+FsCNBHVoc2ZlVyccM1FXf+AZfYdKkGQUaaro
        BG1Upoxrw7Iysws+q0a1hULdbQ==
X-Google-Smtp-Source: AA0mqf41Wqejx3gjkqAto1lEjNVUWFDLIcHhPUNfGeI3XvM/RrkDVObROJw0YVQF/ox1gXuNsYVNtA==
X-Received: by 2002:a17:90b:3d7:b0:200:2538:1ca8 with SMTP id go23-20020a17090b03d700b0020025381ca8mr10837807pjb.79.1668723436518;
        Thu, 17 Nov 2022 14:17:16 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t3-20020a625f03000000b0056da2ad6503sm1684293pfb.39.2022.11.17.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:17:16 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 17 Nov 2022 14:17:15 -0800
To:     Edward Cree <ecree.xilinx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Martin Habets <habetsm.xilinx@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: efx_tc_rx(): Memory - illegal accesses
Message-ID: <202211171416.0BC0EDDA36@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221117 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 16 09:07:02 2022 +0000
    25730d8be5d8 ("sfc: add extra RX channel to receive MAE counter updates on ef100")

Coverity reported the following:

*** CID 1527356:  Memory - illegal accesses  (OVERRUN)
drivers/net/ethernet/sfc/tc_counters.c:483 in efx_tc_rx()
477     	}
478
479     	/* Update seen_gen unconditionally, to avoid a missed wakeup if
480     	 * we race with efx_mae_stop_counters().
481     	 */
482     	efx->tc->seen_gen[type] = mark;
vvv     CID 1527356:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array "efx->tc->flush_gen" of 3 4-byte elements at element index 3 (byte offset 15) using index "type" (which evaluates to 3).
483     	if (efx->tc->flush_counters &&
484     	    (s32)(efx->tc->flush_gen[type] - mark) <= 0)
485     		wake_up(&efx->tc->flush_wq);
486     out:
487     	efx_free_rx_buffers(rx_queue, rx_buf, 1);
488     	channel->rx_pkt_n_frags = 0;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527356 ("Memory - illegal accesses")
Fixes: 25730d8be5d8 ("sfc: add extra RX channel to receive MAE counter updates on ef100")

AFAICT, efx_tc_rx_version_2() may return EFX_TC_COUNTER_TYPE_MAX.

Thanks for your attention!

-- 
Coverity-bot
