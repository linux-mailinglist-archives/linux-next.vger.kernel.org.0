Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428B6E7CA6
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbfJ1XDY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:03:24 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:33373 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729692AbfJ1XDY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:03:24 -0400
Received: by mail-pl1-f172.google.com with SMTP id y8so6501468plk.0
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tH8VNJpegMMHFpPK5ERygMGuZsjeVmt2DRXwBzjU8CU=;
        b=n2890mEoxP4wE+wKjaKMja67UhF5/BcGO4aWJca2R2wMPwO6AoZo/FyPzqQ9sbHvge
         2Y4uU6Qa/hVzaGilmvs2pxQumNANqGJnEwi4NZEoIsr8qoKfR8+/v8y9uojuk54m41hd
         INXuz1E8Oj47sGJlX64XPnf1jwRi1shG1Bo+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tH8VNJpegMMHFpPK5ERygMGuZsjeVmt2DRXwBzjU8CU=;
        b=SUu5BU1oWKXOAR/CXtKDhNQX1+ZppZb7F6gM5qgWDe9xfyL3qYVoLKKJD2lAKf9TMS
         edvekjzxqgw3xgsl3PEM1Oq/CC1kU8Cb0G/y5Oi55FcB4FqqOgJLEqZopaGEma0WZJz+
         pUAG3dAOGIhRCkcR8z96fH5V0EmndPtayZ7GqNjLT4+k6s8T5i8x17b4AiNepisxwAnx
         JWzrz1NKMYovNrIwwLzHcfiZpyGjGGtXsLVvX3gQZOa16J3iaXDy+e4zaFfqTNTjyR58
         dyDksLEVECue7w3QJh/wU2gaKuDXvZdmltq5XHDEd8jUt2ibyffgXm1+VvbG+X+4sKlS
         P84Q==
X-Gm-Message-State: APjAAAXhTiQShLNjlWtgZwhkuazUwiZnPC1xx67Lq88IncqU9oh15XfD
        muVBSg+J0WnUXzLUTbK5qZWJo1Anmk4=
X-Google-Smtp-Source: APXvYqxL7Psy9uMkQDVuEjArVn2PhRYezPB6zVITatewCjedmnJ8RPUwipsdA/cQ3QmzGNXv/TFE6A==
X-Received: by 2002:a17:902:b947:: with SMTP id h7mr608262pls.12.1572303802159;
        Mon, 28 Oct 2019 16:03:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k9sm11272378pfk.72.2019.10.28.16.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:03:21 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:03:20 -0700
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: find_idlest_group(): Null pointer dereferences
Message-ID: <201910281603.4378C08@keescook>
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

57abff067a08 ("sched/fair: Rework find_idlest_group()")

Coverity reported the following:

*** CID 1487371:  Null pointer dereferences  (FORWARD_NULL)
/kernel/sched/fair.c: 8319 in find_idlest_group()
8313     	case group_asym_packing:
8314     		/* Those type are not used in the slow wakeup path */
8315     		return NULL;
8316
8317     	case group_misfit_task:
8318     		/* Select group with the highest max capacity */
vvv     CID 1487371:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "local".
8319     		if (local->sgc->max_capacity >= idlest->sgc->max_capacity)
8320     			return NULL;
8321     		break;
8322
8323     	case group_has_spare:
8324     		if (sd->flags & SD_NUMA) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487371 ("Null pointer dereferences")
Fixes: 57abff067a08 ("sched/fair: Rework find_idlest_group()")


Thanks for your attention!

-- 
Coverity-bot
