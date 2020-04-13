Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515051A6992
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731382AbgDMQP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbgDMQP1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2020 12:15:27 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024FFC0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:15:26 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id a13so4695313pfa.2
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uPLH4KMJxJ2ycTv4j4FqGbE+PV3jnZWWlpT0mW6i9SU=;
        b=QVx8a2qVe20k3SUDbwTiwiwonjn2JxqEPeQOjCkRwh+qswkwVeaKFfQQryD3S5baqc
         cc/UZTuIMk+IvQjzIbNXeyP7dxxJsYn9S1oknf/40Wiv7I9GLs+qS3TcxUvBYXv1DyvU
         pTei730IyFqx4M7RojnG8NllHmLstyY/86XyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uPLH4KMJxJ2ycTv4j4FqGbE+PV3jnZWWlpT0mW6i9SU=;
        b=TxKQVP4/rFAh9+jk/F/3ZIQXjDukI4hoPAm2G8Rf506ULqDdy+MQF2lWMonHHrHYy5
         DjNXnDLi5E/SlP+LjUlv2173M+tIhk7i/ZnycP31vix8WQl6isaT0+swPj4zHUehqK+u
         /tAp5ilVYyJbRVwdKMNEoup7jLUjMH9G6BZchqJ0GL7NvAjzJFuQuS59FbI7LGLKO1qM
         gIhLp/aGe7X1Sx2TD7NeGTOOlhMop2V33NS3I9eo7/NjWsagDbgO/pmUXJPhIYOEBuOO
         e+wyrPWaV7UnmMZD8V57ikE9AbfNYVFBVAQuYsW3UkHojHAHrVOiEneSxpxVZSL3OlBj
         tjNA==
X-Gm-Message-State: AGi0PuYL8vk1mkQBvAg0h16ljGiz77dPQHdUtdrfJt4FE12+1xa4yrXo
        pkVekRjSJKhntP5kSbX5qJL+uAaMWn8=
X-Google-Smtp-Source: APiQypKAP7/EHgA8Mzt5TIyeXLhNbycROvuNro2nUOq87cjBViwt8CCUz+RR6Q8NmaSVWYDiHFul+g==
X-Received: by 2002:a63:ec0b:: with SMTP id j11mr17406238pgh.376.1586794526351;
        Mon, 13 Apr 2020 09:15:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q8sm9758482pjq.28.2020.04.13.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:15:25 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:15:24 -0700
To:     Jyri Sarha <jsarha@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dispc_vp_mode_valid(): Integer handling issues
Message-ID: <202004130915.6EE0CBB6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Nov 8 09:45:28 2019 +0200
    32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")

Coverity reported the following:

*** CID 1461667:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/gpu/drm/tidss/tidss_dispc.c: 1175 in dispc_vp_mode_valid()
1169     		return MODE_BAD_VVALUE;
1170
1171     	if (dispc->memory_bandwidth_limit) {
1172     		const unsigned int bpp = 4;
1173     		u64 bandwidth;
1174
vvv     CID 1461667:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "1000 * mode->clock" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "u64" (64 bits, unsigned).
1175     		bandwidth = 1000 * mode->clock;
1176     		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
1177     		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
1178
1179     		if (dispc->memory_bandwidth_limit < bandwidth)
1180     			return MODE_BAD;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461667 ("Integer handling issues")
Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")

Thanks for your attention!

-- 
Coverity-bot
