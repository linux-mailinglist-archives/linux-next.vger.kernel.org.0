Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D6639FE21
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 19:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhFHRuO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 13:50:14 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:45814 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbhFHRuO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 13:50:14 -0400
Received: by mail-pl1-f169.google.com with SMTP id 11so11051477plk.12
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Pdxs9gaqpiiTg+HJ0WSDtDbTLtaShvLKIo8SEvrNZSM=;
        b=ZaINzxow4SDmYRkck1a5kn8WJYoOeg7aMq1ahzW6gs0L8dA6112G47JmJ5Or850bDw
         21aefKcsN5i+sb1tCJYlEnuEKd0yaOcC1wvnUbVmTVH/a2GpLTq6CJZLs9Q0DQq5FbT4
         6dLmXfKuySCoDQtdhXpp64UWXunVEQPvczQwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Pdxs9gaqpiiTg+HJ0WSDtDbTLtaShvLKIo8SEvrNZSM=;
        b=AKxXRoiH8onnFcQY6B+twcR0Z1RkJyicvEPMHSPaQtiwmTVitg5fG5c/CW1RIyYRzW
         JCQBNtFp3RKUsit6mRqhSXVBUHnuch810ULG51LTgyYH4q6W6ut0HB1bBgQXqT6yLdYJ
         sFAYgz3h1PX4P2sF0/F5bbTlBt5zM3mCBaWNjg76jY/3v1n/9erogtSOdirNIEVVgK4r
         maRW2fp4/jaba3mWQg0jAQQT4fjwsYCBP2NC42oxMJoGUHVSWDlFtstC9La2tc13sp7V
         iMPhDkQOhBqYH+6oVG9FGfUkBFEhy1kFKUeRXd/nflhaCd8Q4VNQx8tiW0lOt309Rdy1
         LxcA==
X-Gm-Message-State: AOAM5327PTjkQf8+Qz0MDoiHDT2uzx/wV0hs3VihSlFYyCVRnOHhU7xd
        vCPfjIxNJGYqTuFsTcOXC2gHgQ==
X-Google-Smtp-Source: ABdhPJyaJlZ5Inb3Vpn8zCYf2gxeKowGxvEnNx0T4YRMsCg4klEzYevqXFgMqeRQ3hRyP98ByN8dnQ==
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id o8-20020a170902d4c8b0290102715be3a5mr1133540plg.83.1623174432919;
        Tue, 08 Jun 2021 10:47:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 92sm8309pjv.29.2021.06.08.10.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:47:12 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 10:47:11 -0700
To:     Florian Westphal <fw@strlen.de>
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nfnl_hook_dump_start(): Memory - corruptions
Message-ID: <202106081047.6B49EA0EC@keescook>
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

  Mon Jun 7 12:41:10 2021 +0200
    e2cf17d3774c ("netfilter: add new hook nfnl subsystem")

Coverity reported the following:

*** CID 1505167:  Memory - corruptions  (OVERRUN)
/net/netfilter/nfnetlink_hook.c: 294 in nfnl_hook_dump_start()
288
289     		nla_strscpy(name, nla[NFNLA_HOOK_DEV], sizeof(name));
290     	}
291
292     	rcu_read_lock();
293     	/* Not dereferenced; for consistency check only */
vvv     CID 1505167:  Memory - corruptions  (OVERRUN)
vvv     Overrunning callee's array of size 5 by passing argument "hooknum" (which evaluates to 255) in call to "nfnl_hook_entries_head".
294     	head = nfnl_hook_entries_head(family, hooknum, net, name);
295     	rcu_read_unlock();
296
297     	if (head && IS_ERR(head))
298     		return PTR_ERR(head);
299

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505167 ("Memory - corruptions")
Fixes: e2cf17d3774c ("netfilter: add new hook nfnl subsystem")

Thanks for your attention!

-- 
Coverity-bot
