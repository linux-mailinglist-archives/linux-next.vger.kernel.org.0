Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33601AE7EE
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgDQV6l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 17:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbgDQV6k (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 17:58:40 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD297C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:58:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id b8so1676029pfp.8
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=KOHJeLMzGYnFvO9npwYGPcxWBtVuk5lW6gG3H3AvRUU=;
        b=UrwNJk2CfMWd+iZk0qkUvs9A4RSpqzOF6AzDvJ0v2dzL3rpDwqGEmpWniqMPeT3wEQ
         8SJDrPOWk9AtHj3IT542y9pg5UaFMIFH/9A+OyQnIYJH/0yn/6N5sgB5+aFKy+GZINE0
         zQC/CqMIx+04qD32yILtkInYBbX8xDCFTXWog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=KOHJeLMzGYnFvO9npwYGPcxWBtVuk5lW6gG3H3AvRUU=;
        b=l2PYwTA54iXAF56MbgNizzrI3FAkj7abG+mKvoDo2sxYQUL9vw6/JRVGvpEh1fpXlL
         HwPPk6R3BDv/KsNT2zcxlhGljO/IBalCgojUL80hJleep/VbH5mO8cy7p2bjNQJJ3jj8
         XCazrayPL4Cxs8d5RdIozAVGrssx5mbRy1baQOCFzRVjFJzyzupA6cbT+aBWJHbGNinC
         g9w4jLeLkNOIq5B0ELdf5JWKKCRMEe+62xDMWk/eTe+vIT+0Uym7hy1ikxU9szZuUFsP
         +E8GWdcDTsoxr11mzQg8YYaDO6YDQQb5MUg6pivAZ3UJH07L21mpeQouGyzsutCMAAde
         6J5A==
X-Gm-Message-State: AGi0PuZvUgdX+W/6rW3g4uOo+ikrqPeKypK+rowLpkRi9i8iTVneF8rV
        3Tm2g6PTb+ZBfSUPTdllkBhD/g==
X-Google-Smtp-Source: APiQypKLdvu9QlQKusEGDDIf1Bxnky7OFN4J5Rpn5C5OeljvnpwUPwKJU5TQzNVSz2k1fNMFjIrgug==
X-Received: by 2002:a63:e206:: with SMTP id q6mr5089289pgh.69.1587160720323;
        Fri, 17 Apr 2020 14:58:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o63sm6818972pjb.40.2020.04.17.14.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:58:39 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 17 Apr 2020 14:58:38 -0700
To:     Shukun Tan <tanshukun1@huawei.com>
Cc:     Zaibo Xu <xuzaibo@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: qm_vf_q_assign(): Error handling issues
Message-ID: <202004171458.44E8EB82@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200417 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Apr 2 14:53:02 2020 +0800
    cd1b7ae3435c ("crypto: hisilicon - unify SR-IOV related codes into QM")

Coverity reported the following:

*** CID 1492651:  Error handling issues  (CHECKED_RETURN)
/drivers/crypto/hisilicon/qm.c: 2317 in qm_vf_q_assign()
2311     	for (i = 1; i <= num_vfs; i++) {
2312     		if (i == num_vfs)
2313     			q_num += remain_q_num % num_vfs;
2314     		ret = hisi_qm_set_vft(qm, i, q_base, q_num);
2315     		if (ret) {
2316     			for (j = i; j > 0; j--)
vvv     CID 1492651:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "hisi_qm_set_vft" without checking return value (as is done elsewhere 4 out of 5 times).
2317     				hisi_qm_set_vft(qm, j, 0, 0);
2318     			return ret;
2319     		}
2320     		q_base += q_num;
2321     	}
2322

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492651 ("Error handling issues")
Fixes: cd1b7ae3435c ("crypto: hisilicon - unify SR-IOV related codes into QM")

Thanks for your attention!

-- 
Coverity-bot
