Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81493509DB
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 23:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhCaV6t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhCaV6Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:58:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61170C061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id g15so2330pfq.3
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3V4IuYm+18mRpDKyqOypzxwm6gYIMmAZdps6LTDPWNY=;
        b=gDfyiqY8kyysaRi8sR8zwjdWkLC86enC08Pj2ljV95+x0uqcDpyRgCrHInVH7tEk3d
         heb81vfzdYr53kVjR64h99i3mWdEQfwO8F3i/sDbc8bYpVf9nh40E+5+pnWx+21Gzb18
         iyS7NieQDRcr+0+6PhlUf3PCaXJMDQkWZvDSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3V4IuYm+18mRpDKyqOypzxwm6gYIMmAZdps6LTDPWNY=;
        b=I1kjc6P4SDHX1ydJDL4Hutymrj4DIc4KGpt0iCMzg+xn8KWb9wERyM1fF1DKeecBTL
         lFk+ykdbz3xYkxFMGsmWf6on9/4b+vKKKHl+esdbidkdXhPgWpAGVYUmCqHc26TpJn0Y
         5fb17wIO0kyxnklp5jZBtm8hwrElIbVPjjV7CLF78/QRgONMTvc0Jtf2CbQ7ER2lIVas
         IP7FOyQ61/rgDiuxy9I77JZdnzwWKl3LVu/9ur4P3i6zZbPRE93XufAzz2ymvIXovBm5
         SBPL7VuS9DxJGXjltO4cpTMnVNtkoXzLf2xUqLzGflZli3BwvHNIuVxapV+r3SrXFURw
         jAOA==
X-Gm-Message-State: AOAM533pgsD5yLTg6PcvUhJoFRSUahSfojDyXilHW8WOLq+ksrzoFn6W
        dsMbBND6g14wgPcHK+C3LPyVDA==
X-Google-Smtp-Source: ABdhPJzrSsS7IuUtkA9ImWfDfiLMPm4mQK924YzwRxq3oBX94G0JM+5y7QSecsBcmlaEz7BVWjDc8Q==
X-Received: by 2002:a62:7517:0:b029:21d:2eb4:ee5d with SMTP id q23-20020a6275170000b029021d2eb4ee5dmr4817532pfc.64.1617227895987;
        Wed, 31 Mar 2021 14:58:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b3sm3172712pjg.41.2021.03.31.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:58:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:58:15 -0700
To:     Namjae Jeon <namjae.jeon@samsung.com>
Cc:     Steve French <stfrench@microsoft.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: parse_veto_list(): Resource leaks
Message-ID: <202103311458.59A15D3@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    788b6f45c1d2 ("cifsd: add server-side procedures for SMB3")

Coverity reported the following:

*** CID 1503590:  Resource leaks  (RESOURCE_LEAK)
/fs/cifsd/mgmt/share_config.c: 101 in parse_veto_list()
95     		p = kzalloc(sizeof(struct ksmbd_veto_pattern), GFP_KERNEL);
96     		if (!p)
97     			return -ENOMEM;
98
99     		sz = strlen(veto_list);
100     		if (!sz)
vvv     CID 1503590:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "p" going out of scope leaks the storage it points to.
101     			break;
102
103     		p->pattern = kstrdup(veto_list, GFP_KERNEL);
104     		if (!p->pattern) {
105     			ksmbd_free(p);
106     			return -ENOMEM;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503590 ("Resource leaks")
Fixes: 788b6f45c1d2 ("cifsd: add server-side procedures for SMB3")

Thanks for your attention!

-- 
Coverity-bot
