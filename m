Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E221F8668
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKLBeh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:34:37 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180]:43305 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfKLBeh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:34:37 -0500
Received: by mail-pg1-f180.google.com with SMTP id l24so10690395pgh.10
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=A+WGquw9d287JbLFT+JQm6E0iccq0m1IdjnOWW9N8Vw=;
        b=mqesZQx1uXt+YRrMWn7pczh30OJHh9Y9taWsYrNg/44KJn7Bn3c73eWbIBMbQjHQDy
         j1hh+NJ0mgJidLz1L6xj2xShaMgdozVadwIkSlXF8nmTJ8J5AcdXNmqn4MTs0LWtupN/
         Vhefd4aJThd/g52lQHEg3BmturPBoF3n/DiKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=A+WGquw9d287JbLFT+JQm6E0iccq0m1IdjnOWW9N8Vw=;
        b=AFqm03J3HhaTdhSmOU383gI0wymwKBog4/jf4yOmlzu44M+D3AeZod/Xkr1XhdlNLl
         vFQ/sA3Ic2Rkztd2odffh6lqxCrEcIISV9w+A4Aynxxp+bVn9zg4MnTZ6BNvcrvXRmcT
         Ui2X3BqkdjPpmRg6GEVzvJaCUQMny/Brpklh/OmaC5SvwYna557KUZH///QSyYNjIKxl
         sp1+/3ku4qIeejJFVjFhWkGKwQ9WsRGlq8Jxsv9GwaYV/BtRth/8aUJjt3CMGFal6kJ0
         huKsXNemwOmQ38exLN4nL6pNMZPArDuMTCCzl/7iEN8E+sPTgbPtuFvTy/PDY9ktJMCc
         qgKw==
X-Gm-Message-State: APjAAAU3B2HX1njnGlyhMRPEBRdPhGsKqumEqy2La5KdiNa77hKa4Qdm
        B6cV1CLQJCBCcGS99gwhwuDBWQ==
X-Google-Smtp-Source: APXvYqxX4WlEYif6EYoldzX5jXRpYVWglzFEpobS823wjQg8hNmLGGnFnE5+VXxXJYMVSULsCOVF7w==
X-Received: by 2002:a63:da47:: with SMTP id l7mr5203369pgj.34.1573522476294;
        Mon, 11 Nov 2019 17:34:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k9sm17714036pfk.72.2019.11.11.17.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:34:35 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:34:34 -0800
To:     Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: submit_dmub_reg_wait(): Memory - corruptions
Message-ID: <201911111734.0D8F299725@keescook>
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

*** CID 1487852:  Memory - corruptions  (OVERRUN)
/drivers/gpu/drm/amd/display/dc/dc_helper.c: 95 in submit_dmub_reg_wait()
89     	struct dmub_rb_cmd_reg_wait *cmd_buf = &offload->cmd_data.reg_wait;
90     	bool gather = false;
91
92     	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
93     	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
94
vvv     CID 1487852:  Memory - corruptions  (OVERRUN)
vvv     Overrunning struct type dmub_cmd_header of 4 bytes by passing it to a function which accesses it at byte offset 63.
95     	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd_buf->header);
96
97     	memset(cmd_buf, 0, sizeof(*cmd_buf));
98     	offload->reg_seq_count = 0;
99
100     	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487852 ("Memory - corruptions")
Fixes: c264644545d2 ("drm/amd/display: Add DMUB support to DC")


Thanks for your attention!

-- 
Coverity-bot
