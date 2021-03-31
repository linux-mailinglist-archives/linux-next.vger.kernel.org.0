Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D563509DD
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 23:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhCaV7V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhCaV6t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:58:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C06EC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v23so8616614ple.9
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=aLvbbSg+nxeDRUMldq1Wx2IqBsTOFpHEEazFsFmVoe8=;
        b=b67VgFU5TQTWoFWE6XmF1o9Ffe1xnxHE8wvW/Ezr7/gvw8W/WWWdbtRSsEzt6LVMme
         5AdHujfamXYRbVgh5SgA7II95s2ML2nlosopO72+VCeTD8mxRWdUGqevn5e+QAq/ShBh
         ChfDpBiOJ8kIVS19W+0YutSFP8TqhyIYwc0i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aLvbbSg+nxeDRUMldq1Wx2IqBsTOFpHEEazFsFmVoe8=;
        b=BKnF6msQ2Pd3Zu+fFK9fN3C6lagjZTg3jaFlIJSRXy48qadyz6R3yL7Nk1kPf2J9aX
         iHAqnrCsskVvyH+sP3aCVlxvjQV5+bwE90Mr0JtUIuCbVUAt3zEh8CGnfbb8UBmtSIWz
         WHeon4xop5Ayq3C8EqSmbpUBkbRIEDzkMrUKHR1qxkj5xStfeE2ZwF2Bi/WU88lwY1Ys
         JAxFn8iGKHneSU9MsaBITdIrPfVFvevxaQu75MknEmLSKA8ev1Uzd9vBTxhr/rFwnJRW
         L/5V0zPbIJ1DwHppxFq0lOvoDR+FhNPy9UclTjErfpcAyO//sB1Lq+19vnKpicsAzoEu
         EDyw==
X-Gm-Message-State: AOAM532WBV90dapKsLTIx6R9uzo7dFpGRcflqmCDg5d+MVOHMWNPoiki
        F1sSKeQjP4NdRjndsTmroRcD+A==
X-Google-Smtp-Source: ABdhPJyoXMC3JhjZld3WnxUIRPIMeyG86q9+fgPkb+r1gwMvyGk6zA/vqs2pgA1xNwU9qhO1aMCE1A==
X-Received: by 2002:a17:902:b7c9:b029:e6:3d74:5dc5 with SMTP id v9-20020a170902b7c9b02900e63d745dc5mr5087652plz.16.1617227928854;
        Wed, 31 Mar 2021 14:58:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y8sm3536427pge.56.2021.03.31.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:58:48 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:58:47 -0700
To:     Huy Nguyen <huyn@mellanox.com>
Cc:     Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Boris Pismenny <borisp@mellanox.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rx_ft_put(): Error handling issues
Message-ID: <202103311458.E693CAAD@keescook>
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
    5e466345291a ("net/mlx5e: IPsec: Add IPsec steering in local NIC RX")

Coverity reported the following:

*** CID 1503588:  Error handling issues  (CHECKED_RETURN)
/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c: 323 in rx_ft_put()
317     	fs_prot = &accel_esp->fs_prot[type];
318     	mutex_lock(&fs_prot->prot_mutex);
319     	if (--fs_prot->refcnt)
320     		goto out;
321
322     	/* disconnect */
vvv     CID 1503588:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "mlx5e_ttc_fwd_default_dest" without checking return value (as is done elsewhere 4 out of 5 times).
323     	mlx5e_ttc_fwd_default_dest(priv, fs_esp2tt(type));
324
325     	/* remove FT */
326     	rx_destroy(priv, type);
327
328     out:

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503588 ("Error handling issues")
Fixes: 5e466345291a ("net/mlx5e: IPsec: Add IPsec steering in local NIC RX")

Thanks for your attention!

-- 
Coverity-bot
