Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED69F8671
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKLBfe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:34 -0500
Received: from mail-pg1-f179.google.com ([209.85.215.179]:45601 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfKLBfd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:33 -0500
Received: by mail-pg1-f179.google.com with SMTP id w11so10676997pga.12
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=gBuWuttP8uBSc8whKpNJ1r0ojKOEIuJlFvDm/+PaTN4=;
        b=TzzMAAkv6U4aQ27hfbY70/rjoHaTUlCkSIaUIqCaSTgRI3/hqdxhY+9KsEsob4E4gP
         MYE0RX0J2XA9YjOkPTz8x0ggpLsQBuvTFUaWVNWfZcLtbbRVfDGx5MhrEjpmS4/L3GF8
         S2uAK4LjwRsDKzqOZ7F571/BhTYfUn+0bimUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=gBuWuttP8uBSc8whKpNJ1r0ojKOEIuJlFvDm/+PaTN4=;
        b=i35SLC/4xMkFgMq1WJ/hJlePM/aQv6QKr2rZPjCEK1wtXae9v6IhWYAN4bKQd4sxKv
         meqPXlTySjB1vEEzOxiDryf99/fbO/u569IrgGCgavlWiMRdvbtoxsK3/MSV2Of7I5C4
         Cui0B8nlKhBNBIWXjiivXvqT+n3SJ3dc5AkH4f3JwDKDTrXuLuUGdZYjODa/hIKkCWpw
         IT+AUXr9tfN3NQ7rs7lQD6Ue5XA9VGYEEKfyiKJ/sWFXbgJkWu3tstef36NxkhGwnE2V
         +4MwAws84BVHYmi5kSN6r3c8kWxekWmipHRZji1hkPqk+AaGCNzGkbMsFmjamuBxwlW3
         oiiw==
X-Gm-Message-State: APjAAAXD6939SP6AQombO6QQUFOAlYuHZvEF0s/yXbq6hcyGscZ5fic0
        q3I/durC8g6WFFNWfL+9H/oz7Q==
X-Google-Smtp-Source: APXvYqyNt9xmgWfVjBfNNQ5uvS6x8XHJ8e12bnZg1ng7UmbjVTdmIMGZdO6RqcAs2pezRdQNArB/Bg==
X-Received: by 2002:a17:90a:9a9:: with SMTP id 38mr2850308pjo.45.1573522533030;
        Mon, 11 Nov 2019 17:35:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v15sm17071094pfc.85.2019.11.11.17.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:32 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:31 -0800
To:     Charles McLachlan <cmclachlan@solarflare.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: efx_probe_interrupts(): OVERRUN
Message-ID: <201911111735.76A768883@keescook>
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

3990a8fffbda ("sfc: allocate channels for XDP tx queues")

Coverity reported the following:

*** CID 1487845:    (OVERRUN)
/drivers/net/ethernet/sfc/efx.c: 1570 in efx_probe_interrupts()
1564
1565     		rc = efx_allocate_msix_channels(efx, efx->max_channels,
1566     						extra_channels, parallelism);
1567     		if (rc >= 0) {
1568     			n_channels = rc;
1569     			for (i = 0; i < n_channels; i++)
vvv     CID 1487845:    (OVERRUN)
vvv     Overrunning array "xentries" of 32 8-byte elements at element index 2047 (byte offset 16383) using index "i" (which evaluates to 2047).
1570     				xentries[i].entry = i;
1571     			rc = pci_enable_msix_range(efx->pci_dev, xentries, 1,
1572     						   n_channels);
1573     		}
1574     		if (rc < 0) {
1575     			/* Fall back to single channel MSI */
/drivers/net/ethernet/sfc/efx.c: 1571 in efx_probe_interrupts()
1565     		rc = efx_allocate_msix_channels(efx, efx->max_channels,
1566     						extra_channels, parallelism);
1567     		if (rc >= 0) {
1568     			n_channels = rc;
1569     			for (i = 0; i < n_channels; i++)
1570     				xentries[i].entry = i;
vvv     CID 1487845:    (OVERRUN)
vvv     Overrunning array "xentries" of 32 8-byte elements by passing it to a function which accesses it at element index 2047 (byte offset 16383) using argument "n_channels" (which evaluates to 2048).
1571     			rc = pci_enable_msix_range(efx->pci_dev, xentries, 1,
1572     						   n_channels);
1573     		}
1574     		if (rc < 0) {
1575     			/* Fall back to single channel MSI */
1576     			netif_err(efx, drv, efx->net_dev,

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487845 ("OVERRUN")
Fixes: 3990a8fffbda ("sfc: allocate channels for XDP tx queues")


Thanks for your attention!

-- 
Coverity-bot
