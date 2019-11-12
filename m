Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAB7AF8673
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKLBfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:41 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180]:38649 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfKLBfl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:41 -0500
Received: by mail-pg1-f180.google.com with SMTP id 15so10712430pgh.5
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=A31f0Yd//uBVvR3Y7s7vTYGtvpPi8D02MdP/IusT9Ag=;
        b=MOoQ38HZqycnVx5LTmudmlDCKSyriqLnECKJiEgMGZP9Y++Ppyil//u2gO6ZtSZzpk
         qS05N1zgNUx7BZOe2LJsRDnRsrMofUwZarzPhPXv7S1KBT9jRBFOO5F03Ckwrq7m5ReS
         DlQwYD9wRjVWczuSeL/7ssSP6lT5TjehBFDLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=A31f0Yd//uBVvR3Y7s7vTYGtvpPi8D02MdP/IusT9Ag=;
        b=P9WjluoX8owyXOqlFhWP/BNTBvaOoUmtdelPzizW9DhFm5w6cgaE5Lfi4Zn6LuTbjG
         KyXmX7USCaR0qnV2c9SfkIum2FVgHxE2TbYAQ2EUxrPJOuzsvrdxIiE12B8esHA2RQgT
         xbuedncziaG0hoj0BX0j/qRnDCEjTHsogH0kDHLLXpb9GbB3Blb18+zpO90/Wc3AFmOV
         WcASNdZTPDNNXHjhWp5r7pwtJoG/OpWZT+Uj0l6suEFYhY74lPIcqlBNOs4OipOLIoTg
         +L/JCF77XeDaXkyTT8V9ifNK9OVHYJLlrX8LM8UMpWUThDTjGMkBZYiO3acGg/afIAtB
         ldew==
X-Gm-Message-State: APjAAAUiiiz+KfPI0ZtZQCBjG+743MkAOZBXcSlSBlyVc5hOfag5usOS
        WmPawNxmK0pR8wVjsq5bmFJaTg==
X-Google-Smtp-Source: APXvYqycG8LpSnk2z71Khj3rjsRKY7+9YE18BCaJXLEMzmZARkOP7yrAXNfKijsWSR7H96VVYTNvfg==
X-Received: by 2002:a63:c55:: with SMTP id 21mr32685576pgm.282.1573522538697;
        Mon, 11 Nov 2019 17:35:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o15sm619005pjs.24.2019.11.11.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:37 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:37 -0800
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: shrink_node_memcgs(): Null pointer dereferences
Message-ID: <201911111735.8DBFBDF0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")

Coverity reported the following:

*** CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
/mm/vmscan.c: 2695 in shrink_node_memcgs()
2689     	memcg = mem_cgroup_iter(target_memcg, NULL, NULL);
2690     	do {
2691     		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
2692     		unsigned long reclaimed;
2693     		unsigned long scanned;
2694
vvv     CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
vvv     Dereferencing a pointer that might be "NULL" "memcg" when calling "mem_cgroup_protected".
2695     		switch (mem_cgroup_protected(target_memcg, memcg)) {
2696     		case MEMCG_PROT_MIN:
2697     			/*
2698     			 * Hard protection.
2699     			 * If there is no reclaimable memory, OOM.
2700     			 */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487844 ("Null pointer dereferences")
Fixes: c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")


Thanks for your attention!

-- 
Coverity-bot
