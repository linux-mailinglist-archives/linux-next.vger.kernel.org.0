Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344AEE7CA7
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbfJ1XDa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:03:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40922 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729692AbfJ1XDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:03:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id r4so2351812pfl.7
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YpnmTiQh5ea+cH+a1LGu7OZPtNNtiy1P8KPo2+zDiC0=;
        b=X1L30OC29o3x6ZDDqbe0GFPVCP4HPECNFEVQ009jjddsseRfSfZXYu1lH8sFnyRsDr
         7sa92o1W0dGqlpLGXU7LAT6ZY4UzsbGD/hkdkNE5+hQrv9s3Ha16jKykk4F5l+cUbVFY
         ekr6NtDXvM/vcj9rgqhNTDhPQlel7/JgGFtmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YpnmTiQh5ea+cH+a1LGu7OZPtNNtiy1P8KPo2+zDiC0=;
        b=uYxX90q24ceL1SlVKR7o3q9DFKDhMi2+CTPYAnyeMtyy5FzuYd+ivCLHtVVEPY+nAF
         0TmK4JOvJH5vvotb+5FJGyK0YvCcdIyNs7u9m67DTRZ3VBnSp5BbSEfH8Gwcf5xesQij
         iuju3z4HZXlmWJFkhhZSpHD6qBe3MVXG5tiXHOIuuS3ZlyWw24gRBxz292iMJbfbpeE2
         81G53MBALKfpwKw5EmatU16CUjvwMXzA+VUtNYFXsweJIzslcVbiqh6X6FaTJ1SRAQ5T
         slbA3Nu+4Gu2gv6dlrylSYBTJLZWLGJ+4q8bzii7MmLqJbb5xukvAr/YHV+ZrLHjrkRI
         Y1TA==
X-Gm-Message-State: APjAAAUV/82DeVzpa1EN/gClKSw2AIgG6mkPVvKL2qKk1to4Fac+nxT/
        Z4P5Hf5oDAnRy+K3fbfwkG10PcpYs3c=
X-Google-Smtp-Source: APXvYqzyV2vNXiq94/Kq4ZDYEQINs+PQxWczO2X5hQMg197JR55w5ZPeU4wHxZQmdL3eAA1if4vdEg==
X-Received: by 2002:a17:90a:1782:: with SMTP id q2mr2228382pja.57.1572303810002;
        Mon, 28 Oct 2019 16:03:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z11sm11009942pfg.117.2019.10.28.16.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:03:29 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:03:28 -0700
To:     Anshuman Gupta <anshuman.gupta@intel.com>
Cc:     Imre Deak <imre.deak@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: intel_get_frame_time_us(): Integer handling issues
Message-ID: <201910281603.B144A608@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

1c4d821db919 ("drm/i915/tgl: Switch between dc3co and dc5 based on display idleness")

Coverity reported the following:

*** CID 1487370:  Integer handling issues  (DIVIDE_BY_ZERO)
/drivers/gpu/drm/i915/display/intel_psr.c: 542 in intel_get_frame_time_us()
536
537     static u32 intel_get_frame_time_us(const struct intel_crtc_state *cstate)
538     {
539     	if (!cstate || !cstate->base.active)
540     		return 0;
541
vvv     CID 1487370:  Integer handling issues  (DIVIDE_BY_ZERO)
vvv     In expression "(1000000 + drm_mode_vrefresh(&cstate->base.adjusted_mode) - 1) / drm_mode_vrefresh(&cstate->base.adjusted_mode)", division by expression "drm_mode_vrefresh(&cstate->base.adjusted_mode)" which may be zero has undefined behavior.
542     	return DIV_ROUND_UP(1000 * 1000,
543     			    drm_mode_vrefresh(&cstate->base.adjusted_mode));
544     }
545
546     static void psr2_program_idle_frames(struct drm_i915_private *dev_priv,
547     				     u32 idle_frames)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487370 ("Integer handling issues")
Fixes: 1c4d821db919 ("drm/i915/tgl: Switch between dc3co and dc5 based on display idleness")


Thanks for your attention!

-- 
Coverity-bot
