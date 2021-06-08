Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3B639FE54
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbhFHSDa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:03:30 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:39795 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhFHSDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:03:30 -0400
Received: by mail-pg1-f181.google.com with SMTP id y12so5304912pgk.6
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NjtyfMDgd+rnknroEztQP5rU8QI9dCS085QaDI8wQPg=;
        b=ht+yXJoFZWGp8FbFzW33L5cYCm2h+VsB338FHH+/bciU1iJ43mVGKPWau5mF27I4DQ
         iUkoKDWMxbMD0eyrHAZ3kCBq8DqxDqWY3kGbTgiL6Tf+7Mo1YBkCYywXHXgD7o5BJ5L0
         movAamIpGM9zC05kO4b7765QJHEHjrSQJvQZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NjtyfMDgd+rnknroEztQP5rU8QI9dCS085QaDI8wQPg=;
        b=EL6n8cA8/2pcfWWv71/XP64l8Yx2Fi3NWi2Iozwr0E9sAdPgDGUTze2TAyEY1D7FxG
         d3DdQmUQd1nXUlMrI+Gd/PYU777TFz/1rz8Fs1yHDufRN7NISTmxAQ5nyYaNKuUZmEpk
         5G5D2vs+Wcu0NoYMIfkunF0j/5KezTOayNiS0w2qnQn0dfa52PK1Ubo4amrkLnN004hG
         I8vYNougpD3NQ4RmH/OzLtDKRUwzJqGh92W10y8MXAmKLlHRTkmHq15vwc4Uxbgz+pau
         Pl+2Uxy5eCDyysuO2n/083RlmPuaQbQh0v3XzaDHwpSIyS8JaYKdlfcevADUizSqGRj1
         +7+g==
X-Gm-Message-State: AOAM530gVivrnw+AHgkoE3E9CKHnl1UP3KFWI5s+Y4ajKLQpUACGj16Z
        6x7uE1PE8Lqv0WbJHy0cHde2zw==
X-Google-Smtp-Source: ABdhPJy6S9sr1VhJ+/18s45vxmEIerf5eYzR6wc+vMYFptG24ctQuNhDqhFo+IkqisSKM2UU4ORwuQ==
X-Received: by 2002:a63:b40d:: with SMTP id s13mr23745047pgf.271.1623175236933;
        Tue, 08 Jun 2021 11:00:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b2sm2932433pfv.106.2021.06.08.11.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:00:36 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:00:35 -0700
To:     Mustafa Ismail <mustafa.ismail@intel.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: irdma_reg_user_mr(): TAINTED_SCALAR
Message-ID: <202106081059.A515282@keescook>
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

(Editor's note: I believe the issues below are basically summarized as
"the contents of req came from userspace and did not get validated before
being used for things like array indexing, etc")

Coverity reported the following:

*** CID 1505160:    (TAINTED_SCALAR)
/drivers/infiniband/hw/irdma/verbs.c: 2812 in irdma_reg_user_mr()
2806     		list_add_tail(&iwpbl->list, &ucontext->qp_reg_mem_list);
2807     		iwpbl->on_list = true;
2808     		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
2809     		break;
2810     	case IRDMA_MEMREG_TYPE_CQ:
2811     		use_pbles = (req.cq_pages > 1);
vvv     CID 1505160:    (TAINTED_SCALAR)
vvv     Passing tainted variable "req.rq_pages" to a tainted sink.
2812     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);
2813     		if (err)
2814     			goto error;
2815
2816     		ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
2817     						     ibucontext);
/drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
2793     	iwmr->type = req.reg_type;
2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr->page_size);
2795
2796     	switch (req.reg_type) {
2797     	case IRDMA_MEMREG_TYPE_QP:
2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
vvv     CID 1505160:    (TAINTED_SCALAR)
vvv     Passing tainted variable "req.cq_pages" to a tainted sink.
2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);
2800     		if (err)
2801     			goto error;
2802
2803     		ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
2804     						     ibucontext);
/drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
2793     	iwmr->type = req.reg_type;
2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr->page_size);
2795
2796     	switch (req.reg_type) {
2797     	case IRDMA_MEMREG_TYPE_QP:
2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
vvv     CID 1505160:    (TAINTED_SCALAR)
vvv     Passing tainted variable "req.sq_pages" to a tainted sink.
2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);
2800     		if (err)
2801     			goto error;
2802
2803     		ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
2804     						     ibucontext);
/drivers/infiniband/hw/irdma/verbs.c: 2799 in irdma_reg_user_mr()
2793     	iwmr->type = req.reg_type;
2794     	iwmr->page_cnt = ib_umem_num_dma_blocks(region, iwmr->page_size);
2795
2796     	switch (req.reg_type) {
2797     	case IRDMA_MEMREG_TYPE_QP:
2798     		use_pbles = ((req.sq_pages + req.rq_pages) > 2);
vvv     CID 1505160:    (TAINTED_SCALAR)
vvv     Passing tainted variable "req.rq_pages" to a tainted sink.
2799     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);
2800     		if (err)
2801     			goto error;
2802
2803     		ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
2804     						     ibucontext);
/drivers/infiniband/hw/irdma/verbs.c: 2812 in irdma_reg_user_mr()
2806     		list_add_tail(&iwpbl->list, &ucontext->qp_reg_mem_list);
2807     		iwpbl->on_list = true;
2808     		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
2809     		break;
2810     	case IRDMA_MEMREG_TYPE_CQ:
2811     		use_pbles = (req.cq_pages > 1);
vvv     CID 1505160:    (TAINTED_SCALAR)
vvv     Passing tainted variable "req.sq_pages" to a tainted sink.
2812     		err = irdma_handle_q_mem(iwdev, &req, iwpbl, use_pbles);
2813     		if (err)
2814     			goto error;
2815
2816     		ucontext = rdma_udata_to_drv_context(udata, struct irdma_ucontext,
2817     						     ibucontext);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505160 ("TAINTED_SCALAR")
Fixes: b48c24c2d710 ("RDMA/irdma: Implement device supported verb APIs")

Thanks for your attention!

-- 
Coverity-bot
