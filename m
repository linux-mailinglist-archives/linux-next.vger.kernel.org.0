Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A16196246F1
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiKJQ3l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiKJQ3l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:29:41 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B6331211
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:29:40 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p21so1792451plr.7
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p69BmXsrcWg/AzWNjyneaVi3RC0xN6d46X3rBdkjEas=;
        b=RIIdTaRLJ4myYuVCFN493P4QMvBKfU1UZzeNk8H62PwZ0tpzOBy1xKWDWcKJBeEZ6Y
         65fUOJQMIl/yOykTZd6ANRQ/WKPqe4DW1B+Q8YzVQFUzennraovICu65Py2enLE8+smK
         lpHEk1lsEW35fhaBqhL+xmuF23Q7GLl1ahpFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p69BmXsrcWg/AzWNjyneaVi3RC0xN6d46X3rBdkjEas=;
        b=WWIjcz3YWGvgZ/39yVvhNF+qB/U9wj8Ybxc7SMVqHh+zBF7cCI9hDJQJc4riI/p8la
         4yAcDk8TEkB6bEcjAjgx3TuLtRQpAgVXjL4xHBh3NoyTGrgE0iY3b/fNqgalOrqGam23
         HdZhOyYgy26PHrrNpXWen0cMqa0E9otzMoSs30p0UQgD/oYKOEP/VS1c7uQo9n8Woubm
         0qIUBVXMCQn3Ezb4I330ipX9R59LKxkXyK9s3vmdcEeudwaCUNRBLpHEKyTlXsiyubDb
         ViKE55DeGI3CjcxzJxSObBmhMN1y+zXSV9dU+5WGa1KxcNALNoLAfz150wxslNFM/YhC
         NakA==
X-Gm-Message-State: ACrzQf2ez9rfqW5GVcerYKunGDhwHn3BHjIsVJexyl58oEknSzAxwMTH
        NKVsktOT7XFfrA2tdy0liPamXA==
X-Google-Smtp-Source: AMsMyM7TO7eGHeFeneQtU/cxkE5lpW5+G4R6pi9U6CwPb1b3VFqCVQD2LWaqEaoSGdyvJ0wZfSrMfA==
X-Received: by 2002:a17:90b:e0e:b0:213:2a98:6486 with SMTP id ge14-20020a17090b0e0e00b002132a986486mr65134012pjb.96.1668097779885;
        Thu, 10 Nov 2022 08:29:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b0017a032d7ae4sm11569791plg.104.2022.11.10.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:29:39 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:29:38 -0800
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: tc358746_g_register(): Error handling issues
Message-ID: <202211100829.085BC218E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

  Thu Oct 27 14:48:40 2022 +0300
    80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")

Coverity reported the following:

*** CID 1527254:  Error handling issues  (CHECKED_RETURN)
drivers/media/i2c/tc358746.c:998 in tc358746_g_register()
992     	/* 32-bit registers starting from CLW_DPHYCONTTX */
993     	reg->size = reg->reg < CLW_DPHYCONTTX_REG ? 2 : 4;
994
995     	if (!pm_runtime_get_if_in_use(sd->dev))
996     		return 0;
997
vvv     CID 1527254:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "tc358746_read" without checking return value (as is done elsewhere 5 out of 6 times).
998     	tc358746_read(tc358746, reg->reg, (u32 *)&reg->val);
999
1000     	pm_runtime_mark_last_busy(sd->dev);
1001     	pm_runtime_put_sync_autosuspend(sd->dev);
1002
1003     	return 0;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527254 ("Error handling issues")
Fixes: 80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")

Thanks for your attention!

-- 
Coverity-bot
