Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED1C616E17
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 20:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiKBT5h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 15:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBT5g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 15:57:36 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4F5304
        for <linux-next@vger.kernel.org>; Wed,  2 Nov 2022 12:57:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h14so17240439pjv.4
        for <linux-next@vger.kernel.org>; Wed, 02 Nov 2022 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+V0AinMmS/zEuWIsHfTSwkj1iCSEeE44VXmGSJertJg=;
        b=W4eqskq8d9dEP4IHmgL0WT6F+ay4ng89tuSyNPOkuTUlB1RehkT5zbAErjVODJwVJT
         VFvD4JeLNljSi+ot2orMuL1IbakIaut1n6p9xEkASOcKC+9uvfKnA8EGQwBHyPMex68Y
         gAMGbtem2gpdrrSTNIax/6ZY7ErFLjdVZR/Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+V0AinMmS/zEuWIsHfTSwkj1iCSEeE44VXmGSJertJg=;
        b=cWh5xKmngb/ChGRBYqTVDhrlp5PCQqFXzhFkBhWcRpYbUN/MKXVmMGf3DJZM9Ukp7I
         dTB4EoqoOY6GLc9aKPUJr9x5xZNgAOc/lhzkbY2Ifbnk/KB99Beve8vTJIius/xh5Dpa
         mSrWQoClezZRdRRDx9E8VnIJ/EOWEhbn6M0gsUu/aFMgx0kZs4ztzKv40t4LcgEaZ+01
         QLKGdM1EaHBJaWTgFCIkRWQrh5h/OivWZJy9WckmkbPRSO/L8PMBO7Imf44ecOE+euNN
         g6jlA3se1vCVjuj2MOD2CggZai8C8lKk3HxemYGq9u1oIWVFmuS5E5a3ojPy1cxiosWT
         qbxA==
X-Gm-Message-State: ACrzQf38JUhB12Z4pjK58kbgwRIcnOcgphDPGmEfq9Tfh1WVkU9uqzk5
        AwN6xOBF7ywx6FJkycVtZg/nWg==
X-Google-Smtp-Source: AMsMyM7/sNMGvkHBejeZAbUq3oNEFq/2akpFQn6l9IKNgCBpNw62wIBnjCuiscks2T0FSDUz8tTBcg==
X-Received: by 2002:a17:903:1105:b0:178:ae31:aad with SMTP id n5-20020a170903110500b00178ae310aadmr26774756plh.3.1667419054939;
        Wed, 02 Nov 2022 12:57:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o24-20020aa79798000000b0056b8b17f914sm8805176pfp.216.2022.11.02.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:57:34 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 2 Nov 2022 12:57:33 -0700
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Yi Liu <yi.l.liu@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: get_md_pagetable(): Control flow issues
Message-ID: <202211021257.AF0B3BA7F@keescook>
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

  Mon Oct 31 20:18:38 2022 -0300
    147393321d65 ("iommufd: Add a selftest")

Coverity reported the following:

*** CID 1527089:  Control flow issues  (UNREACHABLE)
/drivers/iommu/iommufd/selftest.c: 248 in get_md_pagetable()
242     				 IOMMUFD_OBJ_HW_PAGETABLE);
243     	if (IS_ERR(obj))
244     		return ERR_CAST(obj);
245     	hwpt = container_of(obj, struct iommufd_hw_pagetable, obj);
246     	if (hwpt->domain->ops != mock_ops.default_domain_ops) {
247     		return ERR_PTR(-EINVAL);
vvv     CID 1527089:  Control flow issues  (UNREACHABLE)
vvv     This code cannot be reached: "iommufd_put_object(&hwpt->o...".
248     		iommufd_put_object(&hwpt->obj);
249     	}
250     	*mock = container_of(hwpt->domain, struct mock_iommu_domain, domain);
251     	return hwpt;
252     }
253

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527089 ("Control flow issues")
Fixes: 147393321d65 ("iommufd: Add a selftest")

Thanks for your attention!

-- 
Coverity-bot
