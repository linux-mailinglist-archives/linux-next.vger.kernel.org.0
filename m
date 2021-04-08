Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B625735905F
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 01:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhDHXk5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 19:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhDHXk4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 19:40:56 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F468C061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 16:40:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id n38so3013289pfv.2
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wb0nked1xDlpjiQJf+RDs9/dSar8rpCZVdTJufj5kug=;
        b=Qa05YoUcczvtwnu4MTVqL1yUAYAhg22pTkmuUl+dd8N6nummHtmhzjixDlhUz46lne
         XduHPMduE2fXsE1p4IYyy4zFu9X4zh9qd75Dy8+O9jbapAMQ0ec4460Gqczlv9AsPQge
         wMusBXrs8liYwKhr82LA0d529Z+DQ0jVW/qhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wb0nked1xDlpjiQJf+RDs9/dSar8rpCZVdTJufj5kug=;
        b=UWHx2SJfIihQRxBjY8tVr2/BtZpIFywBGNDTAoXkaWBk4uB/NnKVJAi+DJmdp3jPbj
         z6kf+3dYjdk1gxa2JWdzo5sKasnKEhWu2250q05RBVDRfjxPetBawanBC+STbOzNRwT9
         cSfjO+VllUkE+tGWrAB4Bd1B57mNxJMfMHfAms2jKMxgQqMpO7gqNb15Rfhy0H8KcCjo
         PjQc35ZK0aA4y77GSE0t7Wt0cs5Np8AkPgOKFzNc1Ne+D276m9e/z+um1L6+Fyplv0Lv
         nNxr7FMUjt4/eUghF4bs00vHQeZ23tm/pO7kbHqnvjQ/wn2H1M97oP8vZUvj1MHxqK2L
         +6ug==
X-Gm-Message-State: AOAM531hyRNt/bbynqCE3Gbs1lwLC5RCVV01QHQSgy9n+63g468oz5om
        /+vw68LJcnNjYqbeuE9GbpzFRMtPFS82Bg==
X-Google-Smtp-Source: ABdhPJx9N/64fekiyhcyMYutdN8UegK/SVdNKUahLpQZ8J2U9SVCoEMrtT9vh5BDnoiYMH7p+fa50w==
X-Received: by 2002:a62:cfc1:0:b029:200:1eed:462 with SMTP id b184-20020a62cfc10000b02902001eed0462mr9714564pfg.55.1617925244166;
        Thu, 08 Apr 2021 16:40:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x18sm467397pfu.32.2021.04.08.16.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 16:40:43 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 16:40:39 -0700
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rds_send_remove_from_sock(): Null pointer dereferences
Message-ID: <202104081640.1A09A99900@keescook>
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

  Wed Apr 7 14:01:24 2021 -0700
    0c85a7e87465 ("net/rds: Avoid potential use after free in rds_send_remove_from_sock")

Coverity reported the following:

*** CID 1503716:  Null pointer dereferences  (REVERSE_INULL)
/net/rds/send.c: 668 in rds_send_remove_from_sock()
662     		}
663     		spin_unlock(&rs->rs_lock);
664
665     unlock_and_drop:
666     		spin_unlock_irqrestore(&rm->m_rs_lock, flags);
667     		rds_message_put(rm);
vvv     CID 1503716:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "rm" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
668     		if (was_on_sock && rm)
669     			rds_message_put(rm);
670     	}
671
672     	if (rs) {
673     		rds_wake_sk_sleep(rs);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503716 ("Null pointer dereferences")
Fixes: 0c85a7e87465 ("net/rds: Avoid potential use after free in rds_send_remove_from_sock")

Thanks for your attention!

-- 
Coverity-bot
