Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5633EE63B
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfKDRje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:39:34 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:35965 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbfKDRje (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:39:34 -0500
Received: by mail-pl1-f175.google.com with SMTP id g9so7894328plp.3
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6n8zf+MHa9O08qnd0Av4LNAxi7cxEiWU9T8g1MwkZgc=;
        b=CbeyUtqiV0O5NCmsXsl2H4kIgSGwwigTmXyDeQozeNzG+w0jm+k81Qz5FQEWNMOB0n
         L6uqLU/TnkkvPnVec+p0GBUCWcJl+kpVV3qrhx0YDduGhl6EqCWwkykePivsGNcOKaSu
         f5zHGzBsYU7G3Ogw5HW++vmWxUvsXrUADfmhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6n8zf+MHa9O08qnd0Av4LNAxi7cxEiWU9T8g1MwkZgc=;
        b=fHlAS6zaidaborjDZzm+hINNUiFDEFP/1Sr7c2HrG2Q32bdRRVs5HHuN5XJlb2yhic
         o/6RmRRsAgw+pynCt0T53WV3PcTmsUEKQRCZjzACHFFnCVWoI4b8ZKykRO+XzFKodIUT
         f4O/GNCL/UEr7vidHiCjN45VLWRxL0QprOWt9WxNYC9zlkWGK7CmoeU69BMSvjfHVMTU
         ywbVVnSvAXTxaD/JVTNlagtx6LuG9rGBbTlLWs2oMKM6XRPhZrYLfaOAIjBumu403Eux
         EAuYP5gsT+UZ9XIC1Gm/iHpYjcZjXjN+9ECNDv/6Yr0jd6Intkww6sTWcMBpmlheC3DV
         22tg==
X-Gm-Message-State: APjAAAUvy0WvDfdkKVIlPlSQdXL9Kr/IORd3JVgeA5TH1p0mgEnfiyws
        hA4l9c9HEsWCgYyXQh8GaQtluQ==
X-Google-Smtp-Source: APXvYqxdgEB3HXATejBeESOM723KlSNKAqSt9/NLr0ZAL3kow/5UrbufIHi1Aany5jz0ZQxzAGnImQ==
X-Received: by 2002:a17:902:a584:: with SMTP id az4mr27871397plb.74.1572889173251;
        Mon, 04 Nov 2019 09:39:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gi2sm16404503pjb.29.2019.11.04.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:39:32 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:39:31 -0800
To:     Roman Li <Roman.Li@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dc_link_setup_psr(): Integer handling issues
Message-ID: <201911040939.007EA1E6@keescook>
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

e0d08a40a63b ("drm/amd/display: Add debugfs entry for reading psr state")

Coverity reported the following:

*** CID 1487399:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/gpu/drm/amd/display/dc/core/dc_link.c: 2559 in dc_link_setup_psr()
2553     	psr_context->phyType = PHY_TYPE_UNIPHY;
2554     	/*PhyId is associated with the transmitter id*/
2555     	psr_context->smuPhyId =
2556     		transmitter_to_phy_id(link->link_enc->transmitter);
2557
2558     	psr_context->crtcTimingVerticalTotal = stream->timing.v_total;
vvv     CID 1487399:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "stream->timing.pix_clk_100hz * 100U" with type "unsigned int" (32 bits, unsigned) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "u64" (64 bits, unsigned).
2559     	psr_context->vsyncRateHz = div64_u64(div64_u64((stream->
2560     					timing.pix_clk_100hz * 100),
2561     					stream->timing.v_total),
2562     					stream->timing.h_total);
2563
2564     	psr_context->psrSupportedDisplayConfig = true;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487399 ("Integer handling issues")
Fixes: e0d08a40a63b ("drm/amd/display: Add debugfs entry for reading psr state")


Thanks for your attention!

-- 
Coverity-bot
