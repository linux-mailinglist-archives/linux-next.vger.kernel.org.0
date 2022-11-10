Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D914C62470F
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbiKJQcC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbiKJQbu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:31:50 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4772E3C6C7
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:31:39 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id j12so1805419plj.5
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUAtzipMT9CJ97I7UTXEAkc3gMdCNHKnDSpE96C8MlU=;
        b=YfqB/W01G2YQNOotID47LmhV1fKHXkE5sJOkdpceIk5w8DTGaCfLdIe+sVpZqVL1cA
         M4EFLu+jZ06e7jSLfFhdHZgsktyXvjdL9RbPFogaB7GFcyJkEmItBpaKq1pbyMwYlb5S
         cFW98REZBmTm9YV/QlVS4plNATGqg22LyLP/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUAtzipMT9CJ97I7UTXEAkc3gMdCNHKnDSpE96C8MlU=;
        b=zfCtAbFsuBb+iGD4k1dz1CKQtiazNHdQKrj5chK31pkzR5jhslYNCSJr5fCPVRSVXE
         KVWO3Jfe+KP7oEled2Q96J9n1BKm5Whr1DOvdry9j6YcbV36mk9qT1+bBQ5lnYkpvBR9
         h9DQuRy4kotXFUrd2FICB5eX4bq6olw0KAgJNbIUu/X07eJTgWmjkVufTm8rfUP6wYFQ
         ge2BK/i0A4/kynwW3+yuSUIBBhHknXhOiV03Pp9RPnsIHifBcmE80vGrmqSyOCMYgYGK
         ka+pi+QyP//XtRBBRbb5sFY9IuJef/aaB8bwi4puTbLdnKkACSqG1y1WPkeJ2TvcU5m6
         EYtg==
X-Gm-Message-State: ACrzQf3rBMqukHt+R6uOs9TuBGgrlbN6cAg7ezGHyVPBrQzmxg7ezJrv
        VgnPo+nXR6XYg4wXq/WYqLUo8kFuk2rsqQ==
X-Google-Smtp-Source: AMsMyM4q0lr5QW4uT01XojI274hIU6SM8QThuo4QtFfn8vxazLsgnMat++r81ABFMvwTlGb4RIUNsg==
X-Received: by 2002:a17:90b:378a:b0:213:803d:3389 with SMTP id mz10-20020a17090b378a00b00213803d3389mr75822533pjb.115.1668097898630;
        Thu, 10 Nov 2022 08:31:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b00180daa59314sm11492261plg.125.2022.11.10.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:31:38 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:31:37 -0800
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
Subject: Coverity: vgxy61_detect_cut_version(): Control flow issues
Message-ID: <202211100831.9C578C6@keescook>
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

*** CID 1527248:  Control flow issues  (NO_EFFECT)
drivers/media/i2c/st-vgxy61.c:1651 in vgxy61_detect_cut_version()
1645     static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
1646     {
1647     	struct i2c_client *client = sensor->i2c_client;
1648     	u16 device_rev;
1649
1650     	device_rev = vgxy61_read_reg(sensor, VGXY61_REG_REVISION);
vvv     CID 1527248:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "device_rev < 0".
1651     	if (device_rev < 0)
1652     		return device_rev;
1653
1654     	switch (device_rev >> 8) {
1655     	case 0xA:
1656     		dev_dbg(&client->dev, "Cut1 detected\n");

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527248 ("Control flow issues")
Fixes: 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Thanks for your attention!

-- 
Coverity-bot
