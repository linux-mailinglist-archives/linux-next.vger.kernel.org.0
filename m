Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFBE5F8674
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKLBfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:42 -0500
Received: from mail-pl1-f177.google.com ([209.85.214.177]:36344 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfKLBfm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:42 -0500
Received: by mail-pl1-f177.google.com with SMTP id d7so6760707pls.3
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=jnPBpQqxPiuYd+3Vq+MvRN2c1kwWCUbtp0GX2hnwvyc=;
        b=K/EaG7apvzpG6ykpLlUtxePk0D7a3QIGvf8EtWXCsqr705uQtHRQCkb8rQhLdxSnzf
         AXIjjRc43Mp0VYNVCAnz8ENQ12zyi6YssRQIcySKVHOqSoQjZQ46Hhg3lN7GBYgsNmUB
         Ws/s2qGCCfB5g1HF28VgMavVGRj34Kf5IzqUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=jnPBpQqxPiuYd+3Vq+MvRN2c1kwWCUbtp0GX2hnwvyc=;
        b=k/Yl2xhh8jIr6CEcg7I479zYyK864otBwZDteYnT0W97qdMlvubNOEsDfhe+gyjBpl
         Os0tQk0eV6lWjcNVqXaKAl2OSxWCW+EqkQwhKlK9eD5A9l33ixHkqL9DoZ64uD+RdJK8
         /fLp92ep95Wg9l1RqtGpqyu1pT3h9VJ3TqNMygYS3QCy42NkVnyQhud7DdS/JVRnPrQ0
         lTHXT8CFKZHsRi9TsdEELFyM8JZQIebJhUVzSYck2EWxs+lOLIjyfe+jjJmZCNowdQC8
         0rU5GjCQIqab86phXtXnxTVS+b+t9yhIQ3jqipMTBMjb49LeeT4II9fd8Z73rrAQ5AQ/
         aIzg==
X-Gm-Message-State: APjAAAXk/cqs8vNNR8uYy6EAzSv+hGG33+wdp25bGYD4Uzp+XVHp/WX5
        EKqiSUhTEbUq/fgUdW8SeRqvfQ==
X-Google-Smtp-Source: APXvYqya5lmBKUpxtWddwtpXjNQ2+bh5aoNYCxL+sdtdr0DCIXxmcAoEMql0VbHygPyL+mHabaUBkA==
X-Received: by 2002:a17:902:a508:: with SMTP id s8mr28643463plq.26.1573522541697;
        Mon, 11 Nov 2019 17:35:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c84sm9657976pfc.112.2019.11.11.17.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:40 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:40 -0800
To:     Saeed Mahameed <saeedm@mellanox.com>
Cc:     Tariq Toukan <tariqt@mellanox.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: mlx5_wq_cyc_wqe_dump(): Integer handling issues
Message-ID: <201911111735.F3A800773@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

130c7b46c93d ("net/mlx5e: TX, Dump WQs wqe descriptors on CQE with error events")

Coverity reported the following:

*** CID 1487843:  Integer handling issues  (SIGN_EXTENSION)
/drivers/net/ethernet/mellanox/mlx5/core/wq.c: 89 in mlx5_wq_cyc_wqe_dump()
83
84     	if (!net_ratelimit())
85     		return;
86
87     	nstrides = max_t(u8, nstrides, 1);
88
vvv     CID 1487843:  Integer handling issues  (SIGN_EXTENSION)
vvv     Suspicious implicit sign extension: "nstrides" with type "u8" (8 bits, unsigned) is promoted in "nstrides << wq->fbc.log_stride" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "nstrides << wq->fbc.log_stride" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
89     	len = nstrides << wq->fbc.log_stride;
90     	wqe = mlx5_wq_cyc_get_wqe(wq, ix);
91
92     	pr_info("WQE DUMP: WQ size %d WQ cur size %d, WQE index 0x%x, len: %ld\n",
93     		mlx5_wq_cyc_get_size(wq), wq->cur_sz, ix, len);
94     	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1, wqe, len, false);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487843 ("Integer handling issues")
Fixes: 130c7b46c93d ("net/mlx5e: TX, Dump WQs wqe descriptors on CQE with error events")


Thanks for your attention!

-- 
Coverity-bot
