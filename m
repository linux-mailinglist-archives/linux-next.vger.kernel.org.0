Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B45EE664
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbfKDRmn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:42:43 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33118 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbfKDRmm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:42:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id u23so11802866pgo.0
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=kPVtK+ZieOpe/odc0GktudStJouEReDUwBiehzcCJ/A=;
        b=c2gEoS1J0EcMLcn8YXklG1PsHxNGt6AKVVri0dy5Ri8AIUSwFv9T3Dypu8k/tCYMJF
         CjU3owtdyqPrgqIhAk2j0/NbdowKROyp8GoEdY6n0cR5TVYhmhc75/bs/f1QBEtv1/wN
         2J6c0uxtZhNgserlEneMPnkDDL9XAEPbAsJqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kPVtK+ZieOpe/odc0GktudStJouEReDUwBiehzcCJ/A=;
        b=D9RgRiF6lIuI7c9wtJWsX0o1q6jHGD0BGzmaPaxgaMWNdRPuQrqthLXYVQAwwn9Lmj
         afy5jeKEmTQ+H2f7EJeLHQ9Z8BfUQ4bCa21ZikHe4UJuz5z2tF83n44D7xI8PL9JC15O
         pWqJ5qlPF8Z0Jgj0rkAWnspZFDAxJEhIu4XfDGvu5e6BpkBzVKAph2x7ZXeaJatk0K8E
         4kd8VvKdfu/GfsdaVcmMJyRYI4O65J6YjXwyjtDzzX13rBDVLuTpaB9eaDYdAxjB8lhR
         xCKaY03QpcfTw1VdZBS18KsAut0C+l3F4yV1HTy1Qwsxlqd95wznPnnYXr+oe9kgbU8a
         /YKw==
X-Gm-Message-State: APjAAAVm4q4nAbDWZ9w4QXeygN8VV4efzs7ndfq7mVcBkzo3ZPw4I1EE
        soUjZNXd5VHhlbaCyg+BZrSIkA==
X-Google-Smtp-Source: APXvYqzknm8EiaE37Vrk+nXvOXY9FsCEJ5X/N77Pd+cMVNtWg12sZrBSHjDdskwFHmDRBpHKKpxfZA==
X-Received: by 2002:a63:4d61:: with SMTP id n33mr30921269pgl.158.1572889361745;
        Mon, 04 Nov 2019 09:42:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s23sm16742960pgh.21.2019.11.04.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:42:40 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:42:40 -0800
To:     Harry Wentland <harry.wentland@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dcn20_cap_soc_clocks(): UNINTENDED_INTEGER_DIVISION
Message-ID: <201911040942.5BA4CB48@keescook>
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

7ed4e6352c16 ("drm/amd/display: Add DCN2 HW Sequencer and Resource")

Coverity reported the following:

*** CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3048 in dcn20_cap_soc_clocks()
3042     		struct pp_smu_nv_clock_table max_clocks)
3043     {
3044     	int i;
3045
3046     	// First pass - cap all clocks higher than the reported max
3047     	for (i = 0; i < bb->num_states; i++) {
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.dcfClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3048     		if ((bb->clock_limits[i].dcfclk_mhz > (max_clocks.dcfClockInKhz / 1000))
3049     				&& max_clocks.dcfClockInKhz != 0)
3050     			bb->clock_limits[i].dcfclk_mhz = (max_clocks.dcfClockInKhz / 1000);
3051
3052     		if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uClockInKhz / 1000) * 16)
3053     						&& max_clocks.uClockInKhz != 0)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3056 in dcn20_cap_soc_clocks()
3050     			bb->clock_limits[i].dcfclk_mhz = (max_clocks.dcfClockInKhz / 1000);
3051
3052     		if ((bb->clock_limits[i].dram_speed_mts > (max_clocks.uClockInKhz / 1000) * 16)
3053     						&& max_clocks.uClockInKhz != 0)
3054     			bb->clock_limits[i].dram_speed_mts = (max_clocks.uClockInKhz / 1000) * 16;
3055
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.fabricClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3056     		if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabricClockInKhz / 1000))
3057     						&& max_clocks.fabricClockInKhz != 0)
3058     			bb->clock_limits[i].fabricclk_mhz = (max_clocks.fabricClockInKhz / 1000);
3059
3060     		if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayClockInKhz / 1000))
3061     						&& max_clocks.displayClockInKhz != 0)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3060 in dcn20_cap_soc_clocks()
3054     			bb->clock_limits[i].dram_speed_mts = (max_clocks.uClockInKhz / 1000) * 16;
3055
3056     		if ((bb->clock_limits[i].fabricclk_mhz > (max_clocks.fabricClockInKhz / 1000))
3057     						&& max_clocks.fabricClockInKhz != 0)
3058     			bb->clock_limits[i].fabricclk_mhz = (max_clocks.fabricClockInKhz / 1000);
3059
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.displayClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3060     		if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayClockInKhz / 1000))
3061     						&& max_clocks.displayClockInKhz != 0)
3062     			bb->clock_limits[i].dispclk_mhz = (max_clocks.displayClockInKhz / 1000);
3063
3064     		if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockInKhz / 1000))
3065     						&& max_clocks.dppClockInKhz != 0)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3068 in dcn20_cap_soc_clocks()
3062     			bb->clock_limits[i].dispclk_mhz = (max_clocks.displayClockInKhz / 1000);
3063
3064     		if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockInKhz / 1000))
3065     						&& max_clocks.dppClockInKhz != 0)
3066     			bb->clock_limits[i].dppclk_mhz = (max_clocks.dppClockInKhz / 1000);
3067
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.phyClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3068     		if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockInKhz / 1000))
3069     						&& max_clocks.phyClockInKhz != 0)
3070     			bb->clock_limits[i].phyclk_mhz = (max_clocks.phyClockInKhz / 1000);
3071
3072     		if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockInKhz / 1000))
3073     						&& max_clocks.socClockInKhz != 0)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3072 in dcn20_cap_soc_clocks()
3066     			bb->clock_limits[i].dppclk_mhz = (max_clocks.dppClockInKhz / 1000);
3067
3068     		if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockInKhz / 1000))
3069     						&& max_clocks.phyClockInKhz != 0)
3070     			bb->clock_limits[i].phyclk_mhz = (max_clocks.phyClockInKhz / 1000);
3071
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.socClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3072     		if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockInKhz / 1000))
3073     						&& max_clocks.socClockInKhz != 0)
3074     			bb->clock_limits[i].socclk_mhz = (max_clocks.socClockInKhz / 1000);
3075
3076     		if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockInKhz / 1000))
3077     						&& max_clocks.dscClockInKhz != 0)
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3076 in dcn20_cap_soc_clocks()
3070     			bb->clock_limits[i].phyclk_mhz = (max_clocks.phyClockInKhz / 1000);
3071
3072     		if ((bb->clock_limits[i].socclk_mhz > (max_clocks.socClockInKhz / 1000))
3073     						&& max_clocks.socClockInKhz != 0)
3074     			bb->clock_limits[i].socclk_mhz = (max_clocks.socClockInKhz / 1000);
3075
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.dscClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3076     		if ((bb->clock_limits[i].dscclk_mhz > (max_clocks.dscClockInKhz / 1000))
3077     						&& max_clocks.dscClockInKhz != 0)
3078     			bb->clock_limits[i].dscclk_mhz = (max_clocks.dscClockInKhz / 1000);
3079     	}
3080
3081     	// Second pass - remove all duplicate clock states
/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c: 3064 in dcn20_cap_soc_clocks()
3058     			bb->clock_limits[i].fabricclk_mhz = (max_clocks.fabricClockInKhz / 1000);
3059
3060     		if ((bb->clock_limits[i].dispclk_mhz > (max_clocks.displayClockInKhz / 1000))
3061     						&& max_clocks.displayClockInKhz != 0)
3062     			bb->clock_limits[i].dispclk_mhz = (max_clocks.displayClockInKhz / 1000);
3063
vvv     CID 1487393:    (UNINTENDED_INTEGER_DIVISION)
vvv     Dividing integer expressions "max_clocks.dppClockInKhz" and "1000U", and then converting the integer quotient to type "double". Any remainder, or fractional part of the quotient, is ignored.
3064     		if ((bb->clock_limits[i].dppclk_mhz > (max_clocks.dppClockInKhz / 1000))
3065     						&& max_clocks.dppClockInKhz != 0)
3066     			bb->clock_limits[i].dppclk_mhz = (max_clocks.dppClockInKhz / 1000);
3067
3068     		if ((bb->clock_limits[i].phyclk_mhz > (max_clocks.phyClockInKhz / 1000))
3069     						&& max_clocks.phyClockInKhz != 0)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487393 ("UNINTENDED_INTEGER_DIVISION")
Fixes: 7ed4e6352c16 ("drm/amd/display: Add DCN2 HW Sequencer and Resource")


Thanks for your attention!

-- 
Coverity-bot
