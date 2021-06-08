Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02C739FE27
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 19:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhFHRvR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 13:51:17 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:46007 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhFHRvP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 13:51:15 -0400
Received: by mail-pg1-f170.google.com with SMTP id q15so17099708pgg.12
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1n1ELbapmqeF84b7cq8uGFE7H1BAW8JTaVlPz4i2uwM=;
        b=oYNmbXaLNMdM81Nip6er5x/f2+AHwXEwq2xYc9HQEoN1UmxfyZG0hwCcz0x+ao8o65
         8kLVBecpThy4CevTkd9h/LMmB/aRGbDx1p9dXHszAiu0Vl/Ma/ymBuJquNTN2emN1j1z
         GdDH2Sbkro45J1GGGkisdjKxVN66lNb9k6iI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1n1ELbapmqeF84b7cq8uGFE7H1BAW8JTaVlPz4i2uwM=;
        b=G1rvA0rWRgjokK85HrmsGhsv9MjiMnHKzotkgfV0MKilwOriNIspVPRRbKX5Q7j94u
         WPQzCoF4zuBG06U2xV4YnLo+LM3pq0Nc0ctk+i80lLxWkjRXQQoyoiofzDrPBOIZlzr9
         E2ORfbzviBZFKNwTQVRPqVNKuRxGe5SbUakMq7nMB2SPLnTzw4ztkDyOSC6O8rdaRZXH
         Ycuf3P5T8uvb31+B5nDdYONJl/TF/XOj/j22z+E05nU2x7fTfiEngom/JYZKm5tVrLYT
         iCjc6sjENiq7M60ExF70TXE65Ljwz9Ncj6nTOiKbjt/ezNlIIHQTTc62HyM3nbs3rA0Z
         01cg==
X-Gm-Message-State: AOAM531Dvs2m+g5Jt9nmDLMCsforxyTfZ4gWzrd1EnTGg/TTIxfIoSlN
        Oex8fvSF3bcGWHK36iGOfO0Xlg==
X-Google-Smtp-Source: ABdhPJwR7565MemZuRNpNKmou9b9l8ytW6sPySnibRHQjV/+3TYTefwycB3z9xF+9wd6k9JoNd7EIw==
X-Received: by 2002:a62:92cc:0:b029:2ec:9b7b:6c3b with SMTP id o195-20020a6292cc0000b02902ec9b7b6c3bmr899749pfd.3.1623174489270;
        Tue, 08 Jun 2021 10:48:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x33sm10577042pfh.108.2021.06.08.10.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:48:08 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 10:48:07 -0700
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ax88772_init_phy(): Control flow issues
Message-ID: <202106081048.8F67037@keescook>
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

  Mon Jun 7 13:23:02 2021 -0700
    e532a096be0e ("net: usb: asix: ax88772: add phylib support")

Coverity reported the following:

*** CID 1505172:  Control flow issues  (NO_EFFECT)
/drivers/net/usb/asix_devices.c: 708 in ax88772_init_phy()
702     static int ax88772_init_phy(struct usbnet *dev)
703     {
704     	struct asix_common_private *priv = dev->driver_priv;
705     	int ret;
706
707     	priv->phy_addr = asix_read_phy_addr(dev, true);
vvv     CID 1505172:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "priv->phy_addr < 0".
708     	if (priv->phy_addr < 0)
709     		return priv->phy_addr;
710
711     	snprintf(priv->phy_name, sizeof(priv->phy_name), PHY_ID_FMT,
712     		 priv->mdio->id, priv->phy_addr);
713

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505172 ("Control flow issues")
Fixes: e532a096be0e ("net: usb: asix: ax88772: add phylib support")

Thanks for your attention!

-- 
Coverity-bot
