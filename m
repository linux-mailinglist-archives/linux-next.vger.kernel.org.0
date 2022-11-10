Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B032F6246ED
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbiKJQ3X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbiKJQ3W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:29:22 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B584303EA
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:29:21 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso1981801pjc.2
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnovQdeIx+egc+wctWL+zO6cHJ44FnQ3qczpXh6b5Rc=;
        b=Gwp1kDX1FCipY1yoLpoRT+LKjTgivm7wfhgwGSd+RxZ9DNE5AG3m9vlIgq9mLbP0Mv
         nQbd8Jt8mHZgthGzGyDe8BU1HvPhBk04H663rBtsiO7WgszATd/0LdyYYXz/0Gpdb7it
         FEhrmO0m4dENT3TwGhnrL3hBp/C7TXrZIQVZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnovQdeIx+egc+wctWL+zO6cHJ44FnQ3qczpXh6b5Rc=;
        b=ATJBqf5iCC1B1EHJIGk/Kcsvzfwoltj9SKpcjurNZh40l9l3Mopyy77U4NW2UcArPo
         j60KzCB0rMXG/dTFHVhkEopFJoKfHaw+fzdkGQycdLcTt5TjHJQP8ZIXLwm3sweNN4oN
         8SahT05LVTgSuEISNnH7ZCSdaMGRGu7jhXUAM2mxEfnC2nC7ceY9IcxBUVF0fxKhiOMi
         E7eHxaDFEC7aKR1EJlaJWb2z8dF5N62MdHLCgbVvYMuChd2c/tBo2SxM1UW6uJt5qzfO
         nJ68O8XJv2lFzgoVW9TbKXqZHrxJ4PDHBbN8N/K5yCzduZ7yPYra2ZfLX7pF+vT1mtXT
         CnIA==
X-Gm-Message-State: ANoB5plkeDRFH+iOLdeSsmo803hqpw0ghdh0YQX9eUSXDZsIbEfepzyr
        SS+hAz2cX84dlXFyf2n5sA464w==
X-Google-Smtp-Source: AA0mqf4OAxg/aPEkLol3W9r99Ywjc2Hkx53s92PFLJXoZPdWyG8E6OPkaKwZNdmxaRGyPJxvqOAU9Q==
X-Received: by 2002:a17:902:ca0d:b0:188:9806:2e05 with SMTP id w13-20020a170902ca0d00b0018898062e05mr4228345pld.112.1668097760798;
        Thu, 10 Nov 2022 08:29:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id nn14-20020a17090b38ce00b00213d28a6dedsm3315459pjb.13.2022.11.10.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:29:20 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:29:19 -0800
To:     Daniel Drake <dsd@laptop.org>
Cc:     linux-kernel@vger.kernel.org,
        "John W. Linville" <linville@tuxdriver.com>,
        linux-wireless@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: if_sdio_reset_card_worker(): Error handling issues
Message-ID: <202211100829.34D7E6894@keescook>
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

  Fri Jun 10 14:57:47 2011 -0400
    9a821f5d0fc3 ("libertas: add sd8686 reset_card support")

Coverity reported the following:

*** CID 1527255:  Error handling issues  (CHECKED_RETURN)
drivers/net/wireless/marvell/libertas/if_sdio.c:1048 in if_sdio_reset_card_worker()
1042     	 * We run it in a workqueue totally independent from the if_sdio_card
1043     	 * instance for that reason.
1044     	 */
1045
1046     	pr_info("Resetting card...");
1047     	mmc_remove_host(reset_host);
vvv     CID 1527255:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "mmc_add_host" without checking return value (as is done elsewhere 27 out of 32 times).
1048     	mmc_add_host(reset_host);
1049     }
1050     static DECLARE_WORK(card_reset_work, if_sdio_reset_card_worker);
1051
1052     static void if_sdio_reset_card(struct lbs_private *priv)
1053     {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527255 ("Error handling issues")
Fixes: 9a821f5d0fc3 ("libertas: add sd8686 reset_card support")

Thanks for your attention!

-- 
Coverity-bot
