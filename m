Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31324E7C9D
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbfJ1XCR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:02:17 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:39589 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XCR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:02:17 -0400
Received: by mail-pg1-f181.google.com with SMTP id p12so8035778pgn.6
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=K+U6dHODP/rJO1tYeMSognbryBBxUVfIqZfEwfhkJyM=;
        b=j4C7wijIJKcRwRo7JJ73V+VSJa5s8rrZnTGGqRFUpn9iDZ6kmclB1ZFKKTyXMsS2HF
         1ZuwRsViIa1AXVqRqObEiTOvyTUQD1kdnZ1viDQ9SGuFEJ1HIPi3Ob0WYDhx3XMbc+68
         ZsNoil5nzuvGa+/XK3fibw15sZVYlHZdKMWn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=K+U6dHODP/rJO1tYeMSognbryBBxUVfIqZfEwfhkJyM=;
        b=h5Ch2yvUyCNUUiavg/s8yJXCxbS1FmkToXG4XXAtlSFaSK3onXep/0jfVnzsUp1LB9
         5YFUbTo88Ea5nmLr169snbgQUN5QQSgELvym61sZ9T6+n6o+PYPPLQE48+AdQZY1Wn5k
         kiMdz6IPBTdTil8rDR6+guS3hZrHhiF9UbHdUVWiW6iGdD1qgupzPhCk+pS79+SUJKa9
         yRLrk7YHQ7VHDuzhkNzvPQQdCHm7/xe5c+mBVmRjBq8CH0CbE04VBOA6r0fcGG5c9Wc+
         q9i2UtRbx5tv4sewhln3T3IvsamVxKEMsW+5A5dSrYcaKDhQUkZ8xq35Y8tcnZaSvJ8T
         01Dg==
X-Gm-Message-State: APjAAAU420KVyemFmziOtvxFUU/Q3c/RxJf7rF2jOq1D0Tx0zyxE7E8f
        jfjgXO5rkpMQY3qVtSULpEwiuQ==
X-Google-Smtp-Source: APXvYqyg9bJIqjSV6dwFqNq+lVq9NhUIAuPlvuWZK3L7yGmseXJDjm3OD3Cg0yzMWhsJLP79USxdDQ==
X-Received: by 2002:a63:5847:: with SMTP id i7mr22706024pgm.387.1572303736656;
        Mon, 28 Oct 2019 16:02:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z2sm13753893pgo.13.2019.10.28.16.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:02:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:02:15 -0700
To:     Dmitry Bezrukov <dmitry.bezrukov@aquantia.com>
Cc:     Igor Russkikh <igor.russkikh@aquantia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Nikita Danilov <nikita.danilov@aquantia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: aq_nic_init(): Code maintainability issues
Message-ID: <201910281602.79939E6B@keescook>
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

dbcd6806af42 ("net: aquantia: add support for Phy access")

Coverity reported the following:

*** CID 1487376:  Code maintainability issues  (UNUSED_VALUE)
/drivers/net/ethernet/aquantia/atlantic/aq_nic.c: 344 in aq_nic_init()
338     				       aq_nic_get_ndev(self)->dev_addr);
339     	if (err < 0)
340     		goto err_exit;
341
342     	if (self->aq_nic_cfg.aq_hw_caps->media_type == AQ_HW_MEDIA_TYPE_TP) {
343     		self->aq_hw->phy_id = HW_ATL_PHY_ID_MAX;
vvv     CID 1487376:  Code maintainability issues  (UNUSED_VALUE)
vvv     Assigning value from "aq_phy_init(self->aq_hw)" to "err" here, but that stored value is overwritten before it can be used.
344     		err = aq_phy_init(self->aq_hw);
345     	}
346
347     	for (i = 0U, aq_vec = self->aq_vec[0];
348     		self->aq_vecs > i; ++i, aq_vec = self->aq_vec[i])
349     		aq_vec_init(aq_vec, self->aq_hw_ops, self->aq_hw);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487376 ("Code maintainability issues")
Fixes: dbcd6806af42 ("net: aquantia: add support for Phy access")


Thanks for your attention!

-- 
Coverity-bot
