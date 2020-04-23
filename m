Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0611B645A
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 21:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgDWTRO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 15:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDWTRO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 15:17:14 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59ACC09B042
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:17:12 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id ay1so2749020plb.0
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fJVFGZMINEFdS3yoY5dqU+V5frPGqM9+loZ+Cv3junU=;
        b=J6rzl8wqMAXg8htPwD8zKCeCd8x7VA7flit9utuAlw9Kj2Qkn1FmUeRZbIbgEvRPPz
         Q4svM87h4t8HmgHe6cLdpUfJL71df/Oormfus6GqOm4XXTT/0UqBu66TtOVD2AI9BzqJ
         /3N+sXPbauGJK4nI4ziKWIrrfqSP6fDCBtlng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fJVFGZMINEFdS3yoY5dqU+V5frPGqM9+loZ+Cv3junU=;
        b=CmSOcqsn9dj09C2tgiV+WxXe9YjO6SeiV0a7yK+YXMplf1G6FmmHyM9ortAQyi8I0q
         Z4Ur90F7iukt+RfrOgUrOPlZSYf7smXV2EngOkAcfbw3z8zzvz8rHBAaZU670custjRa
         jLoz8OR9suf1wbwSn4PM8MpgwSvxOLU6hib/dmM+47y1FlGyVGUBT3+w8qsO7+P77m+0
         W4P0mWZZSSY5OFp8dNgJ3SWYNB6cFEePEflQjdJVa18SGZyvduC9T9Npgp2+PkwSa5GT
         rJgYmUkTxjNU0e98OSfI4YGHv5uItagEemPj7DwfCEtBMsfrW/f5ZwbvTaGuO3LDJ4n1
         7I7w==
X-Gm-Message-State: AGi0Pub6yQl1514nPadaEuhf6fHxwjkAWD6YDdFoke4aD7EeJyd4LuEJ
        q1x6H4vcfD6dQMEog0FNANbvrg==
X-Google-Smtp-Source: APiQypLnakDP7sOvF60w+wdC4vn6N2vVyNEyLZe4yNOOjBhBsczBmj7KkxtwXKlvtVYF2GUDielMZw==
X-Received: by 2002:a17:902:b945:: with SMTP id h5mr5277203pls.224.1587669432192;
        Thu, 23 Apr 2020 12:17:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j186sm3352316pfb.220.2020.04.23.12.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 12:17:11 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 23 Apr 2020 12:17:10 -0700
To:     Haiyi Zhou <haiyi.zhou@amd.com>
Cc:     Anthony Koo <Anthony.Koo@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: build_vrr_infopacket_data_v3(): Incorrect expression
Message-ID: <202004231216.E46C13E8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200423 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Apr 3 10:00:58 2020 -0400
    d2bacc38f6ca ("drm/amd/display: Change infopacket type programming")

Coverity reported the following:

*** CID 1492712:  Incorrect expression  (COPY_PASTE_ERROR)
/drivers/gpu/drm/amd/display/modules/freesync/freesync.c: 586 in build_vrr_infopacket_data_v3()
580     		/* PB8 = FreeSync Maximum refresh rate (Hz) */
581     		infopacket->sb[8] = (unsigned char)((vrr->fixed_refresh_in_uhz + 500000) / 1000000);
582     	} else if (vrr->state == VRR_STATE_ACTIVE_VARIABLE) {
583     		/* PB7 = FreeSync Minimum refresh rate (Hz) */
584     		infopacket->sb[7] = (unsigned char)((vrr->min_refresh_in_uhz + 500000) / 1000000);
585     		/* PB8 = FreeSync Maximum refresh rate (Hz) */
vvv     CID 1492712:  Incorrect expression  (COPY_PASTE_ERROR)
vvv     "max_refresh_in_uhz" in "vrr->max_refresh_in_uhz" looks like a copy-paste error.
VVV     Should it be "min_refresh_in_uhz" instead?
586     		infopacket->sb[8] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
587     	} else {
588     		// Non-fs case, program nominal range
589     		/* PB7 = FreeSync Minimum refresh rate (Hz) */
590     		infopacket->sb[7] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
591     		/* PB8 = FreeSync Maximum refresh rate (Hz) */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Human edit:
Given how the pattern is fixed/fixed, max/max, it seems likely the
middle would be min/min, but is max/min. No clue what's actually correct
here, though.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492712 ("Incorrect expression")
Fixes: d2bacc38f6ca ("drm/amd/display: Change infopacket type programming")

Thanks for your attention!

-- 
Coverity-bot
