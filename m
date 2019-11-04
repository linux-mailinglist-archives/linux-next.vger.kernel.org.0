Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EFEEE647
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfKDRkn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:40:43 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:34624 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfKDRkl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:40:41 -0500
Received: by mail-pf1-f173.google.com with SMTP id n13so1032102pff.1
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LFJkAmghuleGDZk7r+40HlXu8n86PvgR2YqZPSNzvVY=;
        b=RamXEx9kwmg9t5Euy68XuBPIiso/q+N8kvOXNG7jc0u3SbF/fCfdNweNJSPw/xG4wv
         0UcHFwIonLumA9XLYWsggR/huQDdDGlCU3mw6BM77pBkaeZcxpigCrxr6mDlj+JuYER9
         DNeQJzxSN+42NYZSzDdWR90h+eWkgsryEtzN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LFJkAmghuleGDZk7r+40HlXu8n86PvgR2YqZPSNzvVY=;
        b=SyzdGjqpQHOtfIlAW+X6wqRSWWCdkEVGK1VJvU/9hsD3U4m/pZ75nzXQZe1wS5yo64
         oBdKvEIjZdMvwMU7hJAXThZ+n9jT/sjZSzgV6rATIki3IjfVckFIYhHNhCM01dr9fQup
         M05BuBUKKmc+wPBQuKvX6yJD1jNb0RRiEPpYQfbEACdIdxmDewX/ekKacLfSM3yMo4wp
         Zn0moS9dVmXou0CRne3uVmZ2G2aLAYIxCM8pd68yyO2Ypa1wx3pGaMSsvKPjgV1pYbmc
         Vgp7crh3cDibyU5x4yuqFBMjn5iqm5rUpgqAqg6IZLjE7AaZ23rwJcpR1bek1Zc7YNM7
         tUcg==
X-Gm-Message-State: APjAAAW6fspGDLr4spl4kd3TaIo//hr4T8LeFag4jqCgQp+N8dNQCz0a
        oK9icVfFRF3u/12UvDRndXfchQ==
X-Google-Smtp-Source: APXvYqxQ7/9LqQ2onWCo5w37wOzZATcI4B2314C063x6kHmcrKEa9a40V6XqcSEeMfAXFimugdUd/g==
X-Received: by 2002:a17:90a:5a84:: with SMTP id n4mr419871pji.72.1572889240200;
        Mon, 04 Nov 2019 09:40:40 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q1sm12151983pgr.92.2019.11.04.09.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:40:39 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:40:38 -0800
To:     Jun Lei <Jun.Lei@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tony Cheng <Tony.Cheng@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dcn20_update_bounding_box(): UNINTENDED_INTEGER_DIVISION
Message-ID: <201911040940.91FAE4C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

f18bc4e53ad6 ("drm/amd/display: update calculated bounding box logic for NV")

Coverity reported the following:

*** CID 1487397:    (UNINTENDED_INTEGER_DIVISION)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3142 in dcn20_update_bounding_box()
3136     		// FCLK:UCLK ratio is 1.08
3137     		min_fclk_required_by_uclk = mul_u64_u32_shr(BIT_ULL(32) * 1080 / 1000000, uclk_states[i], 32);
3138
3139     		calculated_states[i].fabricclk_mhz = (min_fclk_required_by_uclk < min_dcfclk) ?
3140     				min_dcfclk : min_fclk_required_by_uclk;
3141
vvv     CID 1487397:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks->socClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3142     		calculated_states[i].socclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->socClockInKhz / 1000) ?
3143     				max_clocks->socClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
3144
3145     		calculated_states[i].dcfclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
3146     				max_clocks->dcfClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
3147
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3145 in dcn20_update_bounding_box()
3139     		calculated_states[i].fabricclk_mhz = (min_fclk_required_by_uclk < min_dcfclk) ?
3140     				min_dcfclk : min_fclk_required_by_uclk;
3141
3142     		calculated_states[i].socclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->socClockInKhz / 1000) ?
3143     				max_clocks->socClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
3144
vvv     CID 1487397:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks->dcfClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3145     		calculated_states[i].dcfclk_mhz = (calculated_states[i].fabricclk_mhz > max_clocks->dcfClockInKhz / 1000) ?
3146     				max_clocks->dcfClockInKhz / 1000 : calculated_states[i].fabricclk_mhz;
3147
3148     		calculated_states[i].dispclk_mhz = max_clocks->displayClockInKhz / 1000;
3149     		calculated_states[i].dppclk_mhz = max_clocks->displayClockInKhz / 1000;
3150     		calculated_states[i].dscclk_mhz = max_clocks->displayClockInKhz / (1000 * 3);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487397 ("UNINTENDED_INTEGER_DIVISION")
Fixes: f18bc4e53ad6 ("drm/amd/display: update calculated bounding box logic for NV")


Thanks for your attention!

-- 
Coverity-bot
