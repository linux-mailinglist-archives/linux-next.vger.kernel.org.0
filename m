Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE92837006F
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 20:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhD3S1D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 14:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3S1C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2021 14:27:02 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9024CC06174A
        for <linux-next@vger.kernel.org>; Fri, 30 Apr 2021 11:26:14 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id i190so9476847pfc.12
        for <linux-next@vger.kernel.org>; Fri, 30 Apr 2021 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=VtVbq9Y/9aykYbhSClBOHQmH3Q4nKJEI8toBCSk1+hE=;
        b=XWC8iv4/aMCsCOYjkbXKTarizKmADQkkj8GCAKXsZU4VhLMwcWIy8r+muoY/5zPowd
         xHWUrWZ9DEL3TT7EQTQ1poa+BwxnV1fBLL9FDHfs3PsxtosD+6TIdJPUMZr7YH1mCatA
         2UoquH6YFpHfw6aXXFCo03D9m+gm+vDgfnCGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=VtVbq9Y/9aykYbhSClBOHQmH3Q4nKJEI8toBCSk1+hE=;
        b=F9Sec8sIs4hpo9IsisGCRYs/z9d2kFk0p+k4fspTQxCtu2waFzLyoPfqA2rJfDBhFS
         eRvK3LHimp/fqWJaf+xKs6n1N4hAAaQTEMpUJN53Sq9nukEmVmXtpNL3yd30FL4DeZU7
         o084wMgsFcbR4yaPfdY/7X4WRRj8rygbun+E6AY2MIf0rSfVkyN9E/+YJuNQNPe3P2Wv
         HB9slZHHLBdseONQSxxYMh3UkOStDis+EyHB09gRAjw7RGcDe5ToQfVJhe3fo5GrlADR
         mh5/IUTTrbLnwV5xLyVkZjWegx2h08yUyBNNCjDxEsi5i40nA5TGe0lyb3ccS5lijAVv
         FRxw==
X-Gm-Message-State: AOAM530gQxD66clvojtoj7BB2mv4Gmdyk2x0sg0tHlrCWa1/Dw9Qxbw+
        7F3J62/v9ELAHl6gkOD1HFtMJg==
X-Google-Smtp-Source: ABdhPJww5Hs35h5IM6O17v/mZY2ocF4YmWSw+HiX4oq2PyUKAZdtMYo9SueVxQTMJa54H5JtirD2oQ==
X-Received: by 2002:a63:135d:: with SMTP id 29mr5713509pgt.83.1619807174045;
        Fri, 30 Apr 2021 11:26:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o4sm125636pjs.38.2021.04.30.11.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 11:26:13 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 30 Apr 2021 11:26:12 -0700
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Trond Myklebust <trond.myklebust@hammerspace.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: frwr_unmap_sync(): Null pointer dereferences
Message-ID: <202104301126.5A1D9706E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210430 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Apr 26 09:27:06 2021 -0400
    9a301cafc861 ("xprtrdma: Move fr_linv_done field to struct rpcrdma_mr")

Coverity reported the following:

*** CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
/net/sunrpc/xprtrdma/frwr_ops.c: 539 in frwr_unmap_sync()
533
534     	/* Strong send queue ordering guarantees that when the
535     	 * last WR in the chain completes, all WRs in the chain
536     	 * are complete.
537     	 */
538     	last->wr_cqe->done = frwr_wc_localinv_wake;
vvv     CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing null pointer "&mr->mr_linv_done" to "reinit_completion", which dereferences it.
539     	reinit_completion(&mr->mr_linv_done);
540
541     	/* Transport disconnect drains the receive CQ before it
542     	 * replaces the QP. The RPC reply handler won't call us
543     	 * unless re_id->qp is a valid pointer.
544     	 */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1504556 ("Null pointer dereferences")
Fixes: 9a301cafc861 ("xprtrdma: Move fr_linv_done field to struct rpcrdma_mr")

Thanks for your attention!

-- 
Coverity-bot
