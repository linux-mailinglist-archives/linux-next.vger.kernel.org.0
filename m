Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335D339FE46
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 19:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhFHR7S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 13:59:18 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:54986 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbhFHR7O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 13:59:14 -0400
Received: by mail-pj1-f53.google.com with SMTP id g24so12372937pji.4
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=W8eE0io0N47QnjzmdS1FQ9aaCUs508BMkHVqnuEIoOM=;
        b=IBCxyCYUqnPyLdpc8EcO+LpZDG5YPn5fWyjMjeRjPTbwX1kjyIR3+bNF5cAJBstGoG
         I0GBDWd8CSnWZ2BYjhTaF/+1IBIlaJEwYiA9Asxc9VYC+d7Z0TvbmXxugcI07dYtGD6O
         tnKtVScJXyAuiYSZDf81GRTiZ4N7tKy3s3AUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=W8eE0io0N47QnjzmdS1FQ9aaCUs508BMkHVqnuEIoOM=;
        b=jQKvsYr/Beo/B0WgdF4coKAzFb/1c3jcdFZoV4jQXYGmtnX7kSUOQaH2HSxMOTdzZi
         Tguci66c3Td5ElnwEPTm04tpSs3aYqERdOtarLLNy2UJLGe+BHZG6qvA33zPhroAMvK4
         yr42iBda3oc23nDovR5AUs32JshHMeW8zSl3979srdW7oC4DEDdLdJzatmu5kbaKerdJ
         VcGPG8/poKBXz6McLAWuMJ8w68FokIR06I/OE0Bqw2GtQy0TJft9HJkYAyEqiPVUidRD
         ZgAXOi2Jblm19v0zc0t90GW+KTLSbBj7pwahdboqt0Djac1Uucsh9AA1nd6PMH/bqdVx
         hQKw==
X-Gm-Message-State: AOAM530K84haM5XPHick8MapRRjCSM2ha0TL9OFI6utkjxOCdHp3xNxO
        KPJmZ80YF76FjZ5ei6qE1aXAAw==
X-Google-Smtp-Source: ABdhPJxRkX/1vg0lvd7MoxQZ4P4G/7SEs+H/2rVwz/N3Y+b1D5/C7o8Qx8JmDxuoFtRk/qYd190dJQ==
X-Received: by 2002:a17:90a:5998:: with SMTP id l24mr7734272pji.169.1623174966921;
        Tue, 08 Jun 2021 10:56:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r11sm12247871pgl.34.2021.06.08.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:56:06 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 10:56:05 -0700
To:     Mustafa Ismail <mustafa.ismail@intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: irdma_fill_device_info(): Null pointer dereferences
Message-ID: <202106081056.E270F59@keescook>
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

  Wed Jun 2 19:55:16 2021 -0300
    8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and implement private channel OPs")

Coverity reported the following:

*** CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
/drivers/infiniband/hw/irdma/main.c: 230 in irdma_fill_device_info()
224     	rf->gen_ops.register_qset = irdma_lan_register_qset;
225     	rf->gen_ops.unregister_qset = irdma_lan_unregister_qset;
226     	rf->hw.hw_addr = pf->hw.hw_addr;
227     	rf->pcidev = pf->pdev;
228     	rf->msix_count =  pf->num_rdma_msix;
229     	rf->msix_entries = &pf->msix_entries[pf->rdma_base_vector];
vvv     CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
vvv     Dereferencing "vsi", which is known to be "NULL".
230     	rf->default_vsi.vsi_idx = vsi->vsi_num;
231     	rf->protocol_used = IRDMA_ROCE_PROTOCOL_ONLY;
232     	rf->rdma_ver = IRDMA_GEN_2;
233     	rf->rsrc_profile = IRDMA_HMC_PROFILE_DEFAULT;
234     	rf->rst_to = IRDMA_RST_TIMEOUT_HZ;
235     	rf->gen_ops.request_reset = irdma_request_reset;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505164 ("Null pointer dereferences")
Fixes: 8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and implement private channel OPs")

Thanks for your attention!

-- 
Coverity-bot
