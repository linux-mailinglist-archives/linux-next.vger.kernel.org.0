Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797A739FE55
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhFHSDm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbhFHSDm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:03:42 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D13FC061574
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 11:01:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so14553995pjz.3
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jo8D2n23hM+knqAh8Y6p5wJjz4mPjnO6o3a6tM++si8=;
        b=jwO5/vJz6uVw0D/zE7HqZFMDHaUYP2t4vWW/A3nWnzyBYhERNTUEDlUXaG/3RL7AJB
         TqEY5Vd3lNeu+7dlvkEDX83c4J27kLflu1ZdvTg5cldSTWJaHVPOlu+b8HalkICsRNhP
         +PqpzUuaPP55g/rGjX2Xa+SXu9tUuSjSeBhzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jo8D2n23hM+knqAh8Y6p5wJjz4mPjnO6o3a6tM++si8=;
        b=P7qlwqlrqMW1T5SJY+BKY2UrFL8WxBvzS3/dRi/sMzp77iaR8CGsk3CPPnh4vFchPE
         3BA7QL4twhMhxsnNt0S4VnleHrnJH34kxrxwc3iIvCfJZu2sYCjoiX2+ubMenIl572CM
         BjMAl2lUtVvi40dxsMpmouMELJWqtQyyDGrquAXU/AZOHcwv+J94Dbnf3Ukxh7EDo9Me
         hI4LrGI8sByhwEtGzfqtmy20bfuzrp2wfyrVnnCzC8j7OfL95dINwZYg5coF568ztbFs
         ubdv9vu0w3AFhvwPn8RL7776+/nnQCa8McMZ+roUuincfYM23yjMandtANMr/t09I/jh
         iPJg==
X-Gm-Message-State: AOAM530utbTAG5J+VhdrfxBnkdsnMirL6Opj6BKLGte2Gzyd/FdYq5F/
        Yc+V2QXALvpv7oVJlim032zpkw==
X-Google-Smtp-Source: ABdhPJwjWwiD/mH+2c5X25EqBu17fYvpbkb0X/LC9/+B8CFtnRv3iNOWz5TXhehqd4TJjjWAQRjS0A==
X-Received: by 2002:a17:902:9b8a:b029:10e:a83d:7dcf with SMTP id y10-20020a1709029b8ab029010ea83d7dcfmr1224556plp.7.1623175291791;
        Tue, 08 Jun 2021 11:01:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 21sm10944892pfh.103.2021.06.08.11.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:01:31 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:01:30 -0700
To:     Mustafa Ismail <mustafa.ismail@intel.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: irdma_clr_wqes(): BUFFER_SIZE
Message-ID: <202106081101.37506CC0CD@keescook>
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
    551c46edc769 ("RDMA/irdma: Add user/kernel shared libraries")

Coverity reported the following:

*** CID 1505156:    (BUFFER_SIZE)
/drivers/infiniband/hw/irdma/uk.c: 104 in irdma_clr_wqes()
98     	u32 wqe_idx;
99
100     	if (!(qp_wqe_idx & 0x7F)) {
101     		wqe_idx = (qp_wqe_idx + 128) % qp->sq_ring.size;
102     		wqe = qp->sq_base[wqe_idx].elem;
103     		if (wqe_idx)
vvv     CID 1505156:    (BUFFER_SIZE)
vvv     You might overrun the 32 byte destination string "wqe" by writing the maximum 4096 bytes from "qp->swqe_polarity ? 0 : 255".
104     			memset(wqe, qp->swqe_polarity ? 0 : 0xFF, 0x1000);
105     		else
106     			memset(wqe, qp->swqe_polarity ? 0xFF : 0, 0x1000);
107     	}
108     }
109
/drivers/infiniband/hw/irdma/uk.c: 106 in irdma_clr_wqes()
100     	if (!(qp_wqe_idx & 0x7F)) {
101     		wqe_idx = (qp_wqe_idx + 128) % qp->sq_ring.size;
102     		wqe = qp->sq_base[wqe_idx].elem;
103     		if (wqe_idx)
104     			memset(wqe, qp->swqe_polarity ? 0 : 0xFF, 0x1000);
105     		else
vvv     CID 1505156:    (BUFFER_SIZE)
vvv     You might overrun the 32 byte destination string "wqe" by writing the maximum 4096 bytes from "qp->swqe_polarity ? 255 : 0".
106     			memset(wqe, qp->swqe_polarity ? 0xFF : 0, 0x1000);
107     	}
108     }
109
110     /**
111      * irdma_uk_qp_post_wr - ring doorbell

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505156 ("BUFFER_SIZE")
Fixes: 551c46edc769 ("RDMA/irdma: Add user/kernel shared libraries")

Thanks for your attention!

-- 
Coverity-bot
