Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F11AF8670
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKLBf2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:28 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:33581 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLBf2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:28 -0500
Received: by mail-pl1-f170.google.com with SMTP id ay6so8666923plb.0
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6ZaIz7BdAJSMiH4t/Duzt5A//JYGCy0esJTl3hBN8Yk=;
        b=U6CJAWN6DRIUsBLdtp64AiIJE/hXonSiEnp0gThTTuyNlcKCAq7QNQ8lFG2yOA1HmX
         4n2wUMM+4JAhQrUPMD9DCpQXXN8NCFRcdSQXHHTDshHWQamU35ci11XeQLMKzIbwyPVC
         DkDwULGSxIjEYfDU4rnojJBb+frkwCIBzQHfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6ZaIz7BdAJSMiH4t/Duzt5A//JYGCy0esJTl3hBN8Yk=;
        b=GU+Ccj58X9omACWs8pBKO27SMlPKBvI7UUrwRwkz3ar+FmrdQPqN7loBK8a2x8xf+Q
         de1xouOxNPGEscb3tU/Tkm21Taq5ZbQg+oDE/AGlfQ6p657o8UD4WwAPK/y78L+FHid/
         Mo4kef8NQJDmQgRuQGF2s13QvbCu1JuJW+4bApOSC9DMn6NuxscHrSfXZGsNGAwRvrO3
         XBtH1Cu4+CnuDZsh3fst1WKpvC9R9SwK8yMez8Jv8sFXYuW1WYa+DvZ2T1GEG7vd2Lv6
         yC9S9OdETRIKjDcQSy38b4PoTQ9jqDuUeUF/XxXyMlPwtAKboXsWhLXG+4ktS+xb8WKy
         pgLg==
X-Gm-Message-State: APjAAAVsuUm5Sz+5dCLDJ2cWuFMtipZv4f5RPhLG659xa2J73qWJ9ov1
        Qjc5bGMlg3qw8CpYjUy5KKKL1A==
X-Google-Smtp-Source: APXvYqwDIIno3IEd+TtxcQWLYTMHQND+PBT9+jR9I8J6Xj1737afcjU5BEk/RYnyAVngq+kq0rWwxA==
X-Received: by 2002:a17:902:9046:: with SMTP id w6mr8453002plz.323.1573522526902;
        Mon, 11 Nov 2019 17:35:26 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w15sm15280445pfn.13.2019.11.11.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:26 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:25 -0800
To:     Jeroen Hofstee <jhofstee@victronenergy.com>
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: can_rx_offload_irq_offload_timestamp(): Resource leaks
Message-ID: <201911111735.C0D6AFBDB@keescook>
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

c2a9f74c9d18 ("can: rx-offload: can_rx_offload_irq_offload_timestamp(): continue on error")

Coverity reported the following:

*** CID 1487846:  Resource leaks  (RESOURCE_LEAK)
/drivers/net/can/rx-offload.c: 219 in can_rx_offload_irq_offload_timestamp()
213
214     		if (!(pending & BIT_ULL(i)))
215     			continue;
216
217     		skb = can_rx_offload_offload_one(offload, i);
218     		if (IS_ERR_OR_NULL(skb))
vvv     CID 1487846:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "skb" going out of scope leaks the storage it points to.
219     			continue;
220
221     		__skb_queue_add_sort(&skb_queue, skb, can_rx_offload_compare);
222     	}
223
224     	if (!skb_queue_empty(&skb_queue)) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487846 ("Resource leaks")
Fixes: c2a9f74c9d18 ("can: rx-offload: can_rx_offload_irq_offload_timestamp(): continue on error")


Thanks for your attention!

-- 
Coverity-bot
