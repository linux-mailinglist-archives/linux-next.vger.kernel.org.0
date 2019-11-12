Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502D8F8678
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfKLBf7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:59 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:32769 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKLBf6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:58 -0500
Received: by mail-pg1-f177.google.com with SMTP id h27so10733734pgn.0
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fSCQB3VLeR7iNQWaf/qhzNH92HFJlwc3Hwi+UN4HUno=;
        b=fgJYcS6TutxnNT17YCnrmBl7PYeWaaT8IUrKjvxA/kY8MXeUSLzfXkcKm6/qRDXTqv
         42ply5Gj2kzQDtpCj9qzFYCAs18OnESRdnJN5DjkvPc4WPh54qfYxRuZJZiHmepCyGgK
         CZKsoJM6ifuoGTovvWwxJbxo9C4OHcffj5a3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fSCQB3VLeR7iNQWaf/qhzNH92HFJlwc3Hwi+UN4HUno=;
        b=pe5AVQftLeNaL+9/ygRm6XwopkqS++iz+PWWC4F78lZV3KRuUBhzLONRgm2bsK1KB3
         jkUvfsHYfj4hUZ5BeBepf48GOMwznP7BGNrBa1mzP6HQ969YbAO/A5jTp331X680oBmh
         wnqEwdTIc8QT/GzttpdbRB0przTBC5220z1qKirG/sg3KDyxdezv5e+21EJDpCYIqbdf
         xWL/VJzogxyjsJgONWy5RW65athnpH2XGxkpFOpRSXEHGSvwGuRIwOueNHk1aPsjq9fY
         ZNv2QSQS5WP2gZ7h10tWSZoBa5+2+M1Ho9WjS1fnuqXCVJNkj3HhYg0AM+5pq0iHTn4q
         z42w==
X-Gm-Message-State: APjAAAVhjxUR3pETG8GlG8rVJS7oHMcJfuoQYlQglpwEzvAzRGhj7jXN
        VusSgkAlzFgCtSPK7Yn4IAtfWw==
X-Google-Smtp-Source: APXvYqxwMv9scM41Qkd3AKSka8LFD+3N6zWVVwuz3T5b1bZC3zV3BWAE1wYDxbh+DLNcM5F9VF6uPw==
X-Received: by 2002:a17:90a:8d0d:: with SMTP id c13mr2814318pjo.68.1573522558007;
        Mon, 11 Nov 2019 17:35:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k103sm681238pje.16.2019.11.11.17.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:57 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:56 -0800
To:     Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: submit_dmub_burst_write(): Memory - corruptions
Message-ID: <201911111735.4AE7B8FF@keescook>
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

*** CID 1487839:  Memory - corruptions  (OVERRUN)
/drivers/gpu/drm/amd/display/dc/dc_helper.c: 76 in submit_dmub_burst_write()
70     	cmd_buf->header.payload_bytes =
71     			sizeof(uint32_t) * offload->reg_seq_count;
72
73     	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
74     	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
75
vvv     CID 1487839:  Memory - corruptions  (OVERRUN)
vvv     Overrunning struct type dmub_cmd_header of 4 bytes by passing it to a function which accesses it at byte offset 63.
76     	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd_buf->header);
77
78     	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
79
80     	memset(cmd_buf, 0, sizeof(*cmd_buf));
81

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487839 ("Memory - corruptions")
Fixes: c264644545d2 ("drm/amd/display: Add DMUB support to DC")


Thanks for your attention!

-- 
Coverity-bot
