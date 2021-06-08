Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6449E39FE8C
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhFHSH2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:07:28 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:43559 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbhFHSHH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:07:07 -0400
Received: by mail-pg1-f182.google.com with SMTP id e22so17127507pgv.10
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=C2vmyN1S74qJuZPnfikVJMNf5gqmeaeoBpXk6pjoFtU=;
        b=eZUVOTwCdZ32jD4tJ+guh2E/l0SksTAzey67dGHbN072eP1ARkZZj1sSY8FlIzQbtb
         iRRHr1nzUuGnhWCy5hwrYGPmx8dfXf6nfD2Swfo/4B+kj2h7LOSVvPTDKGqjkV4KKd/D
         LrqxY7Ttjx1cL8SiQImYOoEUbowHzIBjNV3ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=C2vmyN1S74qJuZPnfikVJMNf5gqmeaeoBpXk6pjoFtU=;
        b=jH0otEVUtXK3dCE2U4W8gORlMD2fR/qM3BBcHO8Bok5oPiYJrDmxQttUiIFZWITYsR
         awa8wcynHxr0X6EMtqR9rNY6Wp5D/mUfzaeoIzuuKYi3dPf2vKT6qhMOKpGytXJrct5b
         RXNk8nbAQBPUCypYlezi9Fs0N/F/86Pw/r19FjtMSbw9kNHUX96Jh3YW3IBkxnoe4Y+U
         SATLAGtVFJP/d5XU8bRxF3d34UFAPWN+eB9zhYMiNgXlfn5eMmbPOb1oHp7psS+tH3sT
         B8Mb7IIjQGX1r4j7NjKQ+ffg8ZoCwmWl0etfVynE7pfuTLnmKNglR0oLIx3ONh8XwOnO
         GeRg==
X-Gm-Message-State: AOAM53174rHnN3ckgxZr3QU9PRrU64POoOqYJ25Tthy9Quav2Lu9MHzM
        TJeUYaixQrpa7cwnK0kECDnxWiFvGf2mTA==
X-Google-Smtp-Source: ABdhPJxOn3hwS/OlKKbyeI/tW4TO9caQe1tEKI7Qf1vaOs4ApwzxctrQstw1HsxETVM0I7LQJFWKFQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr24241996pgv.297.1623175441379;
        Tue, 08 Jun 2021 11:04:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mi10sm2831133pjb.10.2021.06.08.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:04:00 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:03:59 -0700
To:     Mustafa Ismail <mustafa.ismail@intel.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: irdma_reg_user_mr(): Integer handling issues
Message-ID: <202106081103.83B36CB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210608 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Jun 2 19:55:18 2021 -0300
    b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")

Coverity reported the following:

*** CID 1505149:  Integer handling issues  (DIVIDE_BY_ZERO)
/drivers/infiniband/hw/irdma/verbs.c: 2794 in irdma_reg_user_mr()
2788     							 SZ_4K | SZ_2M | SZ_1G,
2789     							 virt);
2790     	iwmr->len = region->length;
2791     	iwpbl->user_base = virt;
2792     	palloc = &iwpbl->pble_alloc;
2793     	iwmr->type = req.reg_type;
vvv     CID 1505149:  Integer handling issues  (DIVIDE_BY_ZERO)
vvv     In function call "ib_umem_num_dma_blocks", division by expression "iwmr->page_size" which may be zero has undefined behavior.
2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr->page_size);
2795
2796     	switch (req.reg_type) {
2797     	case IRDMA_MEMREG_TYPE_QP:
2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505149 ("Integer handling issues")
Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")

Thanks for your attention!

-- 
Coverity-bot
