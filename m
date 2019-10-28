Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB63DE7CB1
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbfJ1XFo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:05:44 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:37577 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XFo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:05:44 -0400
Received: by mail-pg1-f173.google.com with SMTP id p1so8049176pgi.4
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=26Ax7q4nBo+9VwdgYwJaa63/aMJ+sIR3FftsIQLhllQ=;
        b=O9TIKJkWECHMIX9lLRK8M+gPE0STK493sc4034fjQXCncYBw4cfgth77b2EoevMYmn
         JoyWlbGl98W6Sgci6nXLuPRPvK3dqPabJwqLoWnecPHXmmbZtfevtx78r228QfjyXMHD
         D4YryoBwYBFil8qzkjeRaM24l0cR3iO9EzgCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=26Ax7q4nBo+9VwdgYwJaa63/aMJ+sIR3FftsIQLhllQ=;
        b=oferkA/0u4JauImaVa7DkIami5CFwQNo8E2we8a9cYWD5Kz1WG1ls/a7+TZzqp+dIA
         8OKB94tOYEc65BjmKooSTGq4KMQaguadz+wxJlOYPufwKXjCPFfm68dlIYShDM2UNJrp
         sgwGu+NEAOBGU+QeFhBdbecNU2tKlubc6L3OqSFYC3PGCGs5LPqzYCHlCN+M0G2Sfj70
         jVQ2OYNPRiBZLd/MfNVJQW2jVPmhP29J1hahgTlzuZa9Wdc1fSvzw2Y5JOSbEbvtMx/w
         T7vyRg6jn4gDL1c2I8ZYk118nA6FzcqhEuijUoGDOoZQIa608vCdqiihal5/lAW13Idf
         ki2Q==
X-Gm-Message-State: APjAAAXwSPTqANxKIttpe5s4kdav8UTR9wI/yuwCCFkPlFPBuS/zmrfs
        Bq5H1+ZrdmkAot7N7CTfutLDcA==
X-Google-Smtp-Source: APXvYqzQytD8vWZZbxwAizbiJV190h6qIx76iRXcRfonaCwDidvZjo/xsITJAossjb4W1BzZOh/aYw==
X-Received: by 2002:aa7:90da:: with SMTP id k26mr23045734pfk.145.1572303942284;
        Mon, 28 Oct 2019 16:05:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b9sm12502067pfp.77.2019.10.28.16.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:05:41 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:05:40 -0700
To:     Manasi Navare <manasi.d.navare@intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: intel_set_dp_tp_ctl_normal(): Memory - illegal accesses
Message-ID: <201910281605.5595C8C@keescook>
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

eadf6f9170d5 ("drm/i915/display/icl: Enable master-slaves in trans port sync")

Coverity reported the following:

*** CID 1487364:  Memory - illegal accesses  (UNINIT)
/drivers/gpu/drm/i915/display/intel_display.c: 14249 in intel_set_dp_tp_ctl_normal()
14243     	int i;
14244
14245     	for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
14246     		if (conn_state->crtc == &crtc->base)
14247     			break;
14248     	}
vvv     CID 1487364:  Memory - illegal accesses  (UNINIT)
vvv     Using uninitialized value "conn" when calling "intel_attached_encoder".
14249     	intel_dp = enc_to_intel_dp(&intel_attached_encoder(conn)->base);
14250     	intel_dp_stop_link_train(intel_dp);
14251     }
14252
14253     static void intel_post_crtc_enable_updates(struct intel_crtc *crtc,
14254     					   struct intel_atomic_state *state)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487364 ("Memory - illegal accesses")
Fixes: eadf6f9170d5 ("drm/i915/display/icl: Enable master-slaves in trans port sync")


Thanks for your attention!

-- 
Coverity-bot
