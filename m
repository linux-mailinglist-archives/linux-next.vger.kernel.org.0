Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266C01A69C6
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbgDMQW1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731410AbgDMQWZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:22:25 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4588CC0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:22:24 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x3so4436982pfp.7
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=W5fz/Tvy+LF6xdYn6DcJsRu8FnWcv3eQtYEvHqQCp0o=;
        b=PHbxMuBfKGjL77WwOC6BzfLBgzEpbEeZ6rghA+sY9JSFm0CksvhoRMh8i0l/zs+TPt
         Cq0pcpPCJ48BE34SRXOuVfDCOwBwuPJEI8t5Intrq+1pkdQuhHk1kVgcgq4b6Z2UKDNV
         K6yvjPkigz5FUxdwBiEf6eII65E/5bQ+jP9uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=W5fz/Tvy+LF6xdYn6DcJsRu8FnWcv3eQtYEvHqQCp0o=;
        b=Fu4Op5zbXSnV7OwarZQZDVR9UWHn1qmwR6ra9EJ99y21t4DH79NR26Sy+Jdt8KWJSC
         KiO3gBOZT9K+dmmgKR6hSqqZlH0bOYtUaL8Hc2R+eVfQMW9mTWMzmCjA1k8nqVR1mtxw
         s3/7hsPV/ajV1mK1UgmtgWC6u4zeAnzx4UUbfYq9EyjvAVvcyLs4jYAwwdjl9807kkmn
         tFQ/ZPbPbUUbrFCjrT/VvZYatb7GMBLvZkhRrBG7e/2w7s56pMfXicBiT/W3uSt+O3Pz
         Dao4WYxk31dJSzSfoWBNHaNcD5P6BSo5komkvxxjiBPBQDvkF5njG3VGpKC6xRa8desq
         wugg==
X-Gm-Message-State: AGi0PuaugOq95c2eLVZvLI2zCo1+gbrhCzuBUPHR6X44revQynyTdKAa
        81GBq4ycWcid363u4YoUGy3/+xvmoxQ=
X-Google-Smtp-Source: APiQypLhrjcEec25YocQ+Di/DGfrtqFGmxonmS657AWuiu0mYPo2yApeInt7hsazVwoS+sRLrQPpaQ==
X-Received: by 2002:a63:5413:: with SMTP id i19mr6987787pgb.213.1586794943812;
        Mon, 13 Apr 2020 09:22:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 18sm9129188pfv.118.2020.04.13.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:22:22 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:22:22 -0700
To:     Brad Love <brad@nextdimension.cc>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: m88ds3103_set_frontend(): Code maintainability issues
Message-ID: <202004130922.C3E42629@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sat Feb 1 22:48:24 2020 +0100
    e6089feca460 ("media: m88ds3103: Add support for ds3103b demod")

Coverity reported the following:

*** CID 1461655:  Code maintainability issues  (UNUSED_VALUE)
/drivers/media/dvb-frontends/m88ds3103.c: 982 in m88ds3103_set_frontend()
976     		/* enable/disable 192M LDPC clock */
977     		ret = m88ds3103_update_bits(dev, 0x29, 0x10,
978     				(c->delivery_system == SYS_DVBS) ? 0x10 : 0x0);
979     		if (ret)
980     			goto err;
981
vvv     CID 1461655:  Code maintainability issues  (UNUSED_VALUE)
vvv     Assigning value from "m88ds3103_update_bits(dev, 201, 8, 8)" to "ret" here, but that stored value is overwritten before it can be used.
982     		ret = m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
983     	}
984
985     	dev_dbg(&client->dev, "carrier offset=%d\n",
986     		(tuner_frequency_khz - c->frequency));
987

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461655 ("Code maintainability issues")
Fixes: e6089feca460 ("media: m88ds3103: Add support for ds3103b demod")

Thanks for your attention!

-- 
Coverity-bot
