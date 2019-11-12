Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBCCF8675
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfKLBfp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:45 -0500
Received: from mail-pl1-f182.google.com ([209.85.214.182]:39509 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKLBfp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:45 -0500
Received: by mail-pl1-f182.google.com with SMTP id o9so8641947plk.6
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tKm4mrOF5duHNsonssVpLF1WhKFW5cJyOSKv9WavioY=;
        b=cfbj+ZtKv6Ex1vPG3MUu1rzsg/DiFpNwfY09CWI/btOuH4p7jLi4pdC58GEIBFiEhH
         nBbN9wmsNHyYYCvI8Q6+YGELXLmBTy8n1S6ZKUNS/5Sj7IAULU6IQAz317rpM+a15+Be
         ac1Zg1742ZpS9Cp495cOw22jA+qnCamDlloNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tKm4mrOF5duHNsonssVpLF1WhKFW5cJyOSKv9WavioY=;
        b=sVaNPf+z6vqWMobwL6yf1ZM0zhx+Jx+GbyEpnA6mQCdnrjDSMMHeC2CFWQtBfsLfFO
         60syxF+SIn+vzX9RoBaUn65XD0/v/pSsSmp4qM50ZnU4ndOUwn2bpM5jSR9+S93/4Oto
         Ft15a2ehwSSxaMxoLC7aR0XrraTiuFRHG3ldw7AnyV3VvryCzKkMBQa2LZGPRyDgEzg6
         4oeex8sMuSEIfaJgE3xZkC8tHRexkTmO5fURfZ3+SjbYOkMvDx7aE1XaFGHXBima2iRB
         xg0i6vB1Tyi62cLbOF1J99Z8FbpRPjJP2ETcBcF4Svy/lRo3gPUjoE7mAtBWlpaqPDcX
         QaSA==
X-Gm-Message-State: APjAAAXBxAHPNbW7mHrmDzDkjTBT4ONM4NR/yE58n2TOtaTKRpzZ/7I5
        xPQRlYDkDrxycAdU380pnT5KzA==
X-Google-Smtp-Source: APXvYqzFt0x0rWFJS3O0Aw9AgUeEA9PIGhBsu7tkt6p1fIyobm2nnFarjL1oi0DagFxcawCFUP4AFg==
X-Received: by 2002:a17:902:8692:: with SMTP id g18mr6458747plo.39.1573522544805;
        Mon, 11 Nov 2019 17:35:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z14sm20211809pfq.66.2019.11.11.17.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:44 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:43 -0800
To:     Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: transmitter_control_dmcub(): Memory - corruptions
Message-ID: <201911111735.323A3C22CE@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

c264644545d2 ("drm/amd/display: Add DMUB support to DC")

Coverity reported the following:

*** CID 1487842:  Memory - corruptions  (OVERRUN)
/drivers/gpu/drm/amd/display/dc/bios/command_table2.c: 225 in transmitter_control_dmcub()
219     {
220     	struct dmub_rb_cmd_dig1_transmitter_control transmitter_control;
221
222     	transmitter_control.header.type = DMUB_CMD__DIG1_TRANSMITTER_CONTROL;
223     	transmitter_control.transmitter_control.dig = *dig;
224
vvv     CID 1487842:  Memory - corruptions  (OVERRUN)
vvv     Overrunning struct type dmub_cmd_header of 4 bytes by passing it to a function which accesses it at byte offset 63.
225     	dc_dmub_srv_cmd_queue(dmcub, &transmitter_control.header);
226     	dc_dmub_srv_cmd_execute(dmcub);
227     	dc_dmub_srv_wait_idle(dmcub);
228     }
229
230     static enum bp_result transmitter_control_v1_6(

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487842 ("Memory - corruptions")
Fixes: c264644545d2 ("drm/amd/display: Add DMUB support to DC")


Thanks for your attention!

-- 
Coverity-bot
