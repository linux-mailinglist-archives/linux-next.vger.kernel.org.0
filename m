Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26ABF6246E2
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbiKJQ1o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiKJQ1n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:27:43 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14961DF11
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:27:41 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 6so2309664pgm.6
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QDbTV0hvgJIMwlYM/H+CYfboYjCEAWjnTGIDpVXMU0=;
        b=oEog2Gj7capmtsmcj2GyJWN4VajuPy7IRXg+obDX370R+osb3Ra84m8163VuhYeMTU
         Pg6eL03U8tM7cqPFxGl0vAB5diLNsciymBeJ/Ga3tLVoTW4r54dhaRVbu82PIV2ewySi
         iW14hUEyaPifcnrO8kYPLWCKzloA/fMCmmz7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QDbTV0hvgJIMwlYM/H+CYfboYjCEAWjnTGIDpVXMU0=;
        b=xr/0kjiuDYj0xwVIT1iljeiJi5K2els5i5mxYaToqb3QEhUcf3Wj1h1mnDFOh6rc5+
         g/d2/NT8/RGVxZQrx57AKKsOP0gXr9kQSWhebLhmFqJ38HKKwclhC+muA8b0MaqbVHBL
         35aeESxvihtclRTSE1r9M7vUfW7qErUWvzWWCqt3sZ+3tuaIjWnbLwjhDLdNkmLQP0/z
         1ceMmYpL50iwykMpv7JnL4tV0vK2nZI+Hs5SfPqlP+jYny1Rkm0i3HumEe62Rbmtjwj5
         17x/liewUSiodteH973JtthqDTDn2+TsEWxf3oUuQxNt8k6Nr/RlykYN2WLW4MV++g6d
         LJ7A==
X-Gm-Message-State: ANoB5pk575+JQgWnn8K32Q+obfmGltlL2N9cXOC8DIKO/mFEAfDoJWpu
        EvcooZd2TffTpZSyX3uOm5wmpg==
X-Google-Smtp-Source: AA0mqf5XT2btL5Z35ZGarHtKgubWVQk8whdcAKB4borfUWw4sSl2bcSGjVY7xUytCpVuQrW0LtMo3g==
X-Received: by 2002:a63:42c5:0:b0:470:70d7:5a43 with SMTP id p188-20020a6342c5000000b0047070d75a43mr2240176pga.44.1668097661290;
        Thu, 10 Nov 2022 08:27:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id rm12-20020a17090b3ecc00b00213a9e1f863sm30467pjb.4.2022.11.10.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:27:40 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:27:39 -0800
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
Subject: Coverity: vgxy61_tx_from_ep(): Memory - corruptions
Message-ID: <202211100827.8A08F58A@keescook>
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

*** CID 1527258:  Memory - corruptions  (OVERRUN)
drivers/media/i2c/st-vgxy61.c:1528 in vgxy61_tx_from_ep()
1522     	 * valid for hardware stuff.
1523     	 */
1524     	for (p = 0; p < VGXY61_NB_POLARITIES; p++) {
1525     		if (phy2log[p] != ~0)
1526     			continue;
1527     		phy2log[p] = l;
vvv     CID 1527258:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "log2phy" of 5 4-byte elements at element index 5 (byte offset 23) using index "l" (which evaluates to 5).
1528     		log2phy[l] = p;
1529     		l++;
1530     	}
1531     	for (l = 0; l < l_nb + 1; l++)
1532     		polarities[l] = ep.bus.mipi_csi2.lane_polarities[l];
1533

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527258 ("Memory - corruptions")
Fixes: 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Note that l starts at 1, 2, or 4, so line 1529 could push it to 5, which
is out of bounds, etc...

Thanks for your attention!

-- 
Coverity-bot
