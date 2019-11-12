Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 473D6F8679
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfKLBgF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:36:05 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:45618 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKLBgF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:36:05 -0500
Received: by mail-pg1-f170.google.com with SMTP id w11so10677929pga.12
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=OerozQHuuQKpVWVydhk+CbZWh3FcqLxZY3rqa8jJZzs=;
        b=hIdYEjqrLNnYPxzbrsagYnTIa7ZxAQz2RbUlqAKAVtrnLF9hHKqTVjCjP2RfpL7F8J
         N4vITKPnA7OdYpratNNJ4xXdNVFxM6DQElb0hpbxlPSfaPjuif7GDyrAwjCNHoEiuWO1
         ojxIwea6Ajde9lIOAE2cEd2bAVL65j9EPGzT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=OerozQHuuQKpVWVydhk+CbZWh3FcqLxZY3rqa8jJZzs=;
        b=IWt4w3ObA2qRzLo8Rolrc4o8wu3dbsVKltDXqNPubBgrzHJimcFqi0khjAqLDF3iP2
         3uixLv7+RqL03zpL1IbtoEFtS2y/afNyH1AIWnfSkTuhWXsf0ur9daAvkKNYaluSKQ+k
         EqjxyR+gOKZKWl9k8yx8GpCoTWgUWA/Y2xPUi2d8kEZJiMc5VcroQuQTdAJ0VEkzjvfU
         9OmR8+GEzljpz3J3mtu1NwbeFVNHT1OplFLJBP3oRdJNja3AQFI3DospVXeCTVJP005s
         oTgHxRnrMuCh5FT7q+jusokVpFsfw57Erikg+/NDkuSkxN//QyIA7568n591q6dmuncV
         BCZA==
X-Gm-Message-State: APjAAAUanIYbxRQ+AtcovtsAcJp4wq0o5T8a3HHMghVoE3kUqH7wHu1s
        4BCc4fosissBaisiV6VOfi/g1w==
X-Google-Smtp-Source: APXvYqwHDC4YZfTI7OND/A4sJ4hVeLKTUYTQvS/m933Rjci9t9W0gVaHGpU4WWWhTKYpoMpHm0ivDg==
X-Received: by 2002:a17:90a:bb94:: with SMTP id v20mr2896220pjr.62.1573522564959;
        Mon, 11 Nov 2019 17:36:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t13sm16868327pfh.12.2019.11.11.17.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:36:04 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:36:03 -0800
To:     Mikita Lipski <mikita.lipski@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Lyude Paul <lyude@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dm_encoder_helper_atomic_check(): Control flow issues
Message-ID: <201911111736.DC6A6DA8E8@keescook>
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

5133c6241d9c ("drm/amd/display: Add MST atomic routines")

Coverity reported the following:

*** CID 1487838:  Control flow issues  (NO_EFFECT)
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 4869 in dm_encoder_helper_atomic_check()
4863     		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp);
4864     	}
4865     	dm_new_connector_state->vcpi_slots = drm_dp_atomic_find_vcpi_slots(state,
4866     									   mst_mgr,
4867     									   mst_port,
4868     									   dm_new_connector_state->pbn);
vvv     CID 1487838:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "dm_new_connector_state->vcpi_slots < 0ULL".
4869     	if (dm_new_connector_state->vcpi_slots < 0) {
4870     		DRM_DEBUG_ATOMIC("failed finding vcpi slots: %d\n", (int)dm_new_connector_state->vcpi_slots);
4871     		return dm_new_connector_state->vcpi_slots;
4872     	}
4873     	return 0;
4874     }

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487838 ("Control flow issues")
Fixes: 5133c6241d9c ("drm/amd/display: Add MST atomic routines")


Thanks for your attention!

-- 
Coverity-bot
