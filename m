Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B1339FE53
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhFHSDT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhFHSDQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:03:16 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460F3C061574
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 11:01:10 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t9so17146607pgn.4
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0KbjTwSCxWEBuG9gM6SHbEOCqslKBP4JS1n96nKhXmU=;
        b=h38eQnSI2/zzpw7+GH+F7gVzy8HqBqZzc+5x6vdPlHXdMSUR6kIrCSGCwQiUmJ96CV
         KB4qfqQvBa0gw99KXQ062bPFhNHe30WMV5CXh7egLt9f0e5YQLsPJ3IS3nPt2/TZ1nP1
         CUrC4qkG8h9jFkXZ3japcBXnXi7/tqAPSV5Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0KbjTwSCxWEBuG9gM6SHbEOCqslKBP4JS1n96nKhXmU=;
        b=OD2/8uexNJbTYJRUqjYSvN4ZzD5MAKSB4ReG+ecQihq7FBYJ5ohGmXCW7F7Aai7hqu
         wvL3d+SwxHTlkmoyL8+sMgHPhNnjpZXokUxNkukPhrP7sJhzroK1EwLKlMGOFUKe4OYB
         RNAIvVxja/K/FHAdnwY/ngut96mNtRA1d9PYIHoE5t5RYbmxRvHcCfvJVuxNtYVA8FLf
         KXhWNVyoyYf5zTAWU+vhSZmvZY5E2O3MEC54k//ZXrfPRa/MbG3kJ3cHtBVrRyF8wNMO
         BTZixyqQnZXqapH75stL42kIBnh3ktHShVOpu5XD9vC4v7L5FH2gvKrAbWTDzJPZL5l9
         qzhA==
X-Gm-Message-State: AOAM532CnLajkcXGIR32IfK5pGDcDLFWtuswoaj7AmP+gLQnvPvrrmIF
        iUl75m/3kwuSUblgXjN5CxxkPw==
X-Google-Smtp-Source: ABdhPJzqydojINYzfkdXhHC8STz+Fq0/3YzFmUxajZzDH9edVv8inPpDa9Otjq7OBa9NODFM9ETDIA==
X-Received: by 2002:aa7:8244:0:b029:2ec:968d:c1b4 with SMTP id e4-20020aa782440000b02902ec968dc1b4mr1146349pfn.32.1623175266125;
        Tue, 08 Jun 2021 11:01:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l70sm12608519pgd.20.2021.06.08.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:01:05 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:01:04 -0700
To:     Mustafa Ismail <mustafa.ismail@intel.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: irdma_prm_get_pbles(): Integer handling issues
Message-ID: <202106081101.0D7C450C@keescook>
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

  Wed Jun 2 19:55:19 2021 -0300
    915cc7ac0f8e ("RDMA/irdma: Add miscellaneous utility definitions")

Coverity reported the following:

*** CID 1505157:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/infiniband/hw/irdma/utils.c: 2329 in irdma_prm_get_pbles()
2323     	struct list_head *chunk_entry = pprm->clist.next;
2324     	u32 offset;
2325     	unsigned long flags;
2326     	*vaddr = 0;
2327     	*fpm_addr = 0;
2328
vvv     CID 1505157:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "1 << pprm->pble_shift" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "u64" (64 bits, unsigned).
2329     	bits_needed = (mem_size + (1 << pprm->pble_shift) - 1) >> pprm->pble_shift;
2330
2331     	spin_lock_irqsave(&pprm->prm_lock, flags);
2332     	while (chunk_entry != &pprm->clist) {
2333     		pchunk = (struct irdma_chunk *)chunk_entry;
2334     		bit_idx = bitmap_find_next_zero_area(pchunk->bitmapbuf,

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505157 ("Integer handling issues")
Fixes: 915cc7ac0f8e ("RDMA/irdma: Add miscellaneous utility definitions")

Thanks for your attention!

-- 
Coverity-bot
