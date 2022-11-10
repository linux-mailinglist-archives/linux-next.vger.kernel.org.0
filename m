Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD3B6246E6
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbiKJQ2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiKJQ2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:28:08 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D528F20F5A
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:28:07 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id j12so1796391plj.5
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYhq/mBEGTZpGCDyMim5fTg3vaVPNZnQvgxcn4u7bSI=;
        b=Prhwc6DCeW+0r6L7UoZ+ItiN/aHRF2e9MAvxqsVz4KA4QswyP7GwKrb6HYRa60cfp0
         +b0MxtYATc5xgmr9p37QbuXf1l1p32jRAdP2hwXG5wR3VotgwUNvgeLJODH08x8Nwtk9
         B/D1bmU0y/wRl84XUzPlfkZqAIIHJTyieTUA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYhq/mBEGTZpGCDyMim5fTg3vaVPNZnQvgxcn4u7bSI=;
        b=KY6rjOSVJMnLVqaaQ4zV0+u8RzVKt0GCCjaUKccidFoSR7oZ5x9MRgp7mP5mceJrKu
         kgbgFSL+42CDzDTTnSUJcCnl6pHnakjgROFyr/GRF6g3K6jnkWrahN3tZBRWPLv6T1ws
         hmkrHuJLvCInrcV3xDRa6hFoL3lL/CFrXLkwy/k5XukK7DkpLIE48C8kzKkAQEgDZkdg
         yv8lkwxke8htf6easmH5VoMASX2MS0ATIqKOhBYif4nLyeezA30lKRT1OV5EI5gZ560S
         ALP4M5OclsZoQeZguOS1J8P/fwpP/L1z4wHU8f6xJfTk9TOgZot/+Z8pEP6IqNPvMsoU
         w1/Q==
X-Gm-Message-State: ANoB5pnbo8lvrQqLsy7Z0W2WZnXzbkBcOl9L/fFpF5StbEma2Ylvi5kd
        Sn44M+6/JPLwKEkxESgH2WKdDA==
X-Google-Smtp-Source: AA0mqf7tUEF/WoEOICY6ADSUX7ZpJwwgEFjpqYiLgDAN5IOXY5cUTd9B85ka0aCFSHNlY4ParE5N5w==
X-Received: by 2002:a17:902:728b:b0:188:6baf:1fe7 with SMTP id d11-20020a170902728b00b001886baf1fe7mr29852161pll.123.1668097687326;
        Thu, 10 Nov 2022 08:28:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b00200a85fa777sm3323273pjy.1.2022.11.10.08.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:28:07 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:28:06 -0800
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: vgxy61_detect(): Control flow issues
Message-ID: <202211100828.FEDCDE7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Oct 27 14:37:38 2022 +0300
    153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Coverity reported the following:

*** CID 1527257:  Control flow issues  (NO_EFFECT)
drivers/media/i2c/st-vgxy61.c:1679 in vgxy61_detect()
1673     	struct i2c_client *client = sensor->i2c_client;
1674     	u16 id = 0;
1675     	int ret;
1676     	u8 st;
1677
1678     	id = vgxy61_read_reg(sensor, VGXY61_REG_MODEL_ID);
vvv     CID 1527257:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "id < 0".
1679     	if (id < 0)
1680     		return id;
1681     	if (id != VG5661_MODEL_ID && id != VG5761_MODEL_ID) {
1682     		dev_warn(&client->dev, "Unsupported sensor id %x\n", id);
1683     		return -ENODEV;
1684     	}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527257 ("Control flow issues")
Fixes: 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Thanks for your attention!

-- 
Coverity-bot
