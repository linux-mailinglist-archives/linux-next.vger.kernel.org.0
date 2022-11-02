Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F996616E15
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 20:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiKBT5K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 15:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiKBT5J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 15:57:09 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260111036
        for <linux-next@vger.kernel.org>; Wed,  2 Nov 2022 12:57:07 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y203so3226175pfb.4
        for <linux-next@vger.kernel.org>; Wed, 02 Nov 2022 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhfCRvSTXBtz/vDK//XVIJ5L6CYMoQLlwnTJQfWHDTc=;
        b=J2j04uzYjFvAkEAJcxtHlzouxTzwQP1GU8xQDInhMtd6I+L6h8KZvR8IZqNO5p58B/
         BCjJawNQBM40sLvBemw8GDnnDOOEiCH6ZL9er1KD03xF7Tj/x7xu1rtjVCWMoBeJzpcv
         S5RxwPL7+wfld9PsBprJgmhuh6f1XQrcc14Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhfCRvSTXBtz/vDK//XVIJ5L6CYMoQLlwnTJQfWHDTc=;
        b=0tfUzAzFABAeoLVJqlXThC2aBv192x7F0saPvobpmwEJGvFqiJVZh72SLypUB9qlIg
         AP/NOPkjLLiLJ5Bo3cT8s9c2FZH1VL7GS1siKkgYusvQmPBbNTZjX0rPxpdMvoI17JjD
         Oa1I1TK9pREQPdDbw/vQ9kPPggixFo/Pn8DIhrWPU+KmEBQs3igYXO/njFTsxs+6tT84
         ldzoiUSEZ8ETZZzkMXv+RDttSa39Izqo2RHgnKljZR1OWS51vf8u4keqyb0P+aPGIfaH
         XrOwWY1TKwkreduG0Ug4LpQoRUOFSnIinW8y2C04MEQ5u2vUwJxIeaYuXAIFEfrYQYre
         Np9w==
X-Gm-Message-State: ACrzQf2ApBnwC4PAfXTCDxnHipEC4LMqjJWGSAuaU4w0skFQSGtbZQDe
        2dzFIdJ4psqixKRJDuGDvqAp5Q==
X-Google-Smtp-Source: AMsMyM70YUcgfPHoQ6myIfUrDbXicCoezde8NvNejsH2fodFQYEAC5bbuvSQhE7lKJUPbmHf8T9xNQ==
X-Received: by 2002:a63:5761:0:b0:43c:5940:9176 with SMTP id h33-20020a635761000000b0043c59409176mr22661724pgm.65.1667419026584;
        Wed, 02 Nov 2022 12:57:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b0018685257c0dsm8772235pla.58.2022.11.02.12.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:57:06 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 2 Nov 2022 12:57:05 -0700
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Yi Liu <yi.l.liu@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: iopt_map_user_pages(): Null pointer dereferences
Message-ID: <202211021256.2F571DFD@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221102 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Oct 31 13:37:57 2022 -0300
    91b4be750274 ("iommufd: Data structure to provide IOVA to PFN mapping")

Coverity reported the following:

*** CID 1527090:  Null pointer dereferences  (REVERSE_INULL)
/drivers/iommu/iommufd/io_pagetable.c: 417 in iopt_map_user_pages()
411     	list_add(&elm.next, &pages_list);
412
413     	rc = iopt_map_pages(iopt, &pages_list, length, iova, iommu_prot, flags);
414     	if (rc) {
415     		if (elm.area)
416     			iopt_abort_area(elm.area);
vvv     CID 1527090:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "elm.pages" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
417     		if (elm.pages)
418     			iopt_put_pages(elm.pages);
419     		return rc;
420     	}
421     	return 0;
422     }

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527090 ("Null pointer dereferences")
Fixes: 91b4be750274 ("iommufd: Data structure to provide IOVA to PFN mapping")

This looks like the earlier "if (IS_ERR(elm.pages))" should use
IS_ERR_OR_NULL() ?

Thanks for your attention!

-- 
Coverity-bot
