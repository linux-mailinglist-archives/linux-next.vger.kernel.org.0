Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077923590CC
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 02:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhDIAJ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 20:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIAJ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 20:09:28 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B720C061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 17:09:16 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y2so1870930plg.5
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 17:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oxRSfKmginTwV3nWSWbQoxqwzJv74CXAt8xD4GXbVm8=;
        b=YFFjXWMXc9E3sGhxdYGChJhvwvhoE2nPNp9kDHe/6fRczJn1NBGzFDeqkdlc/KMy4g
         7f2tTMsY14JYTxLP9cLOpiXtd9aYFDIBw2YOln17zN+pVmE1iCjgQh9fTcrpxJWqNylH
         8JcqzsrCaaOk9Upv3W868P3Jf2+bxP84HqZpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oxRSfKmginTwV3nWSWbQoxqwzJv74CXAt8xD4GXbVm8=;
        b=hwYwyZ4yfcIpcOPho7F7sd4JpQFBTwsXChTcBSOKeE07EhOhuQaaMqDEWygJ/vKZjA
         9MbTdUTg6exzkyCkM9DaKIhEgRNNskryy855i00GIKscNI0mqJNvQIR8p/pWgs149c+f
         NuZ7nZBCoX/HltQQ9J9JIhSATilDcR2AlKleVO8HgYE9xPwxZYh8GxMtM0da9dag261A
         +0W9pu30eA3bBd4DTcpDmhF94vP2Gbr2qxSWIkzBm05TKdwvTtNPqQIA//qKiiF7UHOW
         zXR97sFShAETogJektPy5dD17HxM7to9AMiHXE84LnKhc+nr9qDiAcmFcoe4zQ8wG0Jd
         PtHA==
X-Gm-Message-State: AOAM5305+1Z2i83KzaU9SzizgS4h6ckf2Y5qSAf7ttXcYbk6M3So4TMv
        VVRAFeSMgU6uKvd+W5+/cx7nGg==
X-Google-Smtp-Source: ABdhPJynJ3gxXgq4mOs2ulkDral32G1KL8CwDWgeQVs/APyMdNEgvd99YKoYenLyUPFCb5kYtVEo6Q==
X-Received: by 2002:a17:902:9f94:b029:e9:68a3:8551 with SMTP id g20-20020a1709029f94b02900e968a38551mr9053066plq.35.1617926956078;
        Thu, 08 Apr 2021 17:09:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k127sm497585pfd.63.2021.04.08.17.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 17:09:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 17:09:14 -0700
To:     Gao Xiang <hsiangkao@redhat.com>
Cc:     Chao Yu <yuchao0@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: z_erofs_handle_inplace_io(): Uninitialized variables
Message-ID: <202104081709.43BC2DB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210408 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Apr 7 13:17:55 2021 +0800
    c660a3a86e7e ("erofs: support decompress big pcluster for lz4 backend")

Coverity reported the following:

*** CID 1503704:  Uninitialized variables  (UNINIT)
/fs/erofs/decompressor.c: 160 in z_erofs_handle_inplace_io()
154     	}
155     	kunmap_atomic(inpage);
156     	might_sleep();
157     	while (1) {
158     		src = vm_map_ram(rq->in, nrpages_in, -1);
159     		/* retry two more times (totally 3 times) */
vvv     CID 1503704:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "i".
160     		if (src || ++i >= 3)
161     			break;
162     		vm_unmap_aliases();
163     	}
164     	*maptype = 1;
165     	return src;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503704 ("Uninitialized variables")
Fixes: c660a3a86e7e ("erofs: support decompress big pcluster for lz4 backend")

Thanks for your attention!

-- 
Coverity-bot
