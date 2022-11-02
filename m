Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8BF5616E12
	for <lists+linux-next@lfdr.de>; Wed,  2 Nov 2022 20:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiKBTz0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Nov 2022 15:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbiKBTzY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 15:55:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874261124
        for <linux-next@vger.kernel.org>; Wed,  2 Nov 2022 12:55:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id b5so17164245pgb.6
        for <linux-next@vger.kernel.org>; Wed, 02 Nov 2022 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtMQXPgrWOukZqyAP1kxumYf1ZC0hhulI5JDNR4TM9I=;
        b=CeXs9Yuft6T5WcGWhkFAytS7pKidLsDMOPslhSQ/ud0evcRy5VeafkA7/pc5LQNfcV
         bvnqQTs9sOzFYm2k7WLMnx9FOD24pgq7otkGSvI9GZbRY+ATgVgxOc8oBluKLrJxSXV3
         omrLJkCArlapyU4uHt4oehNssP2Rrp8+M7Zz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtMQXPgrWOukZqyAP1kxumYf1ZC0hhulI5JDNR4TM9I=;
        b=gjzj0SvfK37fHwIKoQKzIlgqYGMWn5DfCa6LxW2EfZwygaTyXNe5YTXPYZ2JGYI6IT
         XiWhnyAMbwGvsi+40mBKEV1yMFxopGiIORnjOQBUzpoxr2nYPJL0uXalj6m8c4g/erE+
         caJrjcc/5M4gWZL6oNFqxlrWsbwj9A2iNHfhZ79QeU3JjipvWq95ttBMUPf5lG8nHjPU
         bNg8fHDvp9stuSbB2jQcv/ltj9JfuIoHqYJx0xxPcxBqrKAjgV65ap7XOybNjPWdT1Wp
         Tf7Flo+RQ24+H9X/+w3wJQ8Sq9w0jeBVpk+55xkOT820Lw/8l6ISmUVPhnz3IMNJzPU1
         jhqA==
X-Gm-Message-State: ACrzQf0d9aEY09uColZWTUdtzE+01Up0KrHqfg1YKb5IlE7YhQEvGdVD
        TM6q8ARAuRI2LJzBW2z43jE5tw==
X-Google-Smtp-Source: AMsMyM4JaCytexz8Rhn4Ot5Ktz5D72I7VAySoQw7QhZl4IJHK8hBc0Ej0/1GEN98mh4QtJhrKVHjWQ==
X-Received: by 2002:a05:6a00:1394:b0:56d:2237:c1b0 with SMTP id t20-20020a056a00139400b0056d2237c1b0mr24252026pfg.5.1667418923015;
        Wed, 02 Nov 2022 12:55:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z2-20020a626502000000b0056e0ff577edsm1886189pfb.43.2022.11.02.12.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:55:22 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 2 Nov 2022 12:55:21 -0700
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: iommufd_vfio_iommu_get_info(): Code maintainability issues
Message-ID: <202211021255.505A44F5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

  Mon Oct 31 13:37:58 2022 -0300
    32c328dc9b73 ("iommufd: vfio container FD ioctl compatibility")

Coverity reported the following:

*** CID 1527093:  Code maintainability issues  (UNUSED_VALUE)
/drivers/iommu/iommufd/vfio_compat.c: 411 in iommufd_vfio_iommu_get_info()
405     	 */
406     	if (info.argsz >= total_cap_size)
407     		info.cap_offset = sizeof(info);
408     	info.argsz = total_cap_size;
409     	info.flags |= VFIO_IOMMU_INFO_CAPS;
410     	if (copy_to_user(arg, &info, minsz))
vvv     CID 1527093:  Code maintainability issues  (UNUSED_VALUE)
vvv     Assigning value "-14" to "rc" here, but that stored value is overwritten before it can be used.
411     		rc = -EFAULT;
412     	rc = 0;
413
414     out_put:
415     	up_read(&ioas->iopt.iova_rwsem);
416     	iommufd_put_object(&ioas->obj);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527093 ("Code maintainability issues")
Fixes: 32c328dc9b73 ("iommufd: vfio container FD ioctl compatibility")

This looks more like a "goto" is missing after the -EFAULT assignment?

Thanks for your attention!

-- 
Coverity-bot
