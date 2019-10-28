Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91639E7CAE
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbfJ1XFC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:05:02 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:43868 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XFB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:05:01 -0400
Received: by mail-pf1-f178.google.com with SMTP id 3so8011352pfb.10
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1Y28ogVqA3jjO2taWVXrvGRpCiLRdjw0zYDctpxIkkU=;
        b=UbIhR6Ime0+7jjw/zkrDxxUYqhZxzl2QYMSmWlWhmqOyn2L+06xNFSal/ArKUWdlYm
         I5TMzBe7d0ZSbB0+HnXF8wYL9467qggTzqWJuCYJAboxWDq7PJqL8a/0TEWou7fHppk7
         pWqSIzXo428tnKaOxGK/YRDJJ1z0xpMM7BuXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1Y28ogVqA3jjO2taWVXrvGRpCiLRdjw0zYDctpxIkkU=;
        b=S/ebNZ5r4Es1+HIHPh9tc470KOq9tbY/uz3/P7IZcS+SDmkCKbPy7l4rvnICZ6Z2ZO
         1nl5R8fSUt/R6d6RU09Y5U7E+LF2tzh/WclcvJFZfJk8Tq4hnCI7KyWEzVjXxlhjGU1+
         xYjcs+qpYcs5U/LKY8gRqm9osTgi1Uv527B3N+cVfBMqLQLqJPRpcGsL8tma52/EOvk9
         Pl087EDb5v/PmKPuztAOoFTKqsXglxU1MbMCBgDCw5A5OXHQHOlqPje+m++S15+a1iCr
         oQwSAiSdW9uu/99LvGZOQPHu9/U22TOQUL7/okTrV4W0vkjhDmiaMhBcB6NX7eAs3nPQ
         7pGQ==
X-Gm-Message-State: APjAAAWwEwIKM6I6zpcWG5pE5Ar3tjrxdx3T/Jpf04IZQ5Cf89t91Zaq
        Qb6ioIeMOVcZlhzCvypQ4QU6y5IFZ/c=
X-Google-Smtp-Source: APXvYqxzZ1ipdNY1KSe1WJgrYFbyzBe0zC2STh3OfTjdRp6oa35vJITJezJVVP783TegWCn5Ouyt/w==
X-Received: by 2002:a65:5503:: with SMTP id f3mr23637186pgr.351.1572303901201;
        Mon, 28 Oct 2019 16:05:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j7sm193619pgl.38.2019.10.28.16.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:05:00 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:04:59 -0700
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: tsens_set_trips(): UNINIT
Message-ID: <201910281604.B32865F50@keescook>
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

fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")

Coverity reported the following:

*** CID 1487367:    (UNINIT)
/drivers/thermal/qcom/tsens-common.c: 427 in tsens_set_trips()
421
422     	high_val = tsens_mC_to_hw(s, cl_high);
423     	low_val  = tsens_mC_to_hw(s, cl_low);
424
425     	spin_lock_irqsave(&priv->ul_lock, flags);
426
vvv     CID 1487367:    (UNINIT)
vvv     Using uninitialized value "d.up_viol" when calling "tsens_read_irq_state".
427     	tsens_read_irq_state(priv, hw_id, s, &d);
428
429     	/* Write the new thresholds and clear the status */
430     	regmap_field_write(priv->rf[LOW_THRESH_0 + hw_id], low_val);
431     	regmap_field_write(priv->rf[UP_THRESH_0 + hw_id], high_val);
432     	tsens_set_interrupt(priv, hw_id, LOWER, true);
/drivers/thermal/qcom/tsens-common.c: 427 in tsens_set_trips()
421
422     	high_val = tsens_mC_to_hw(s, cl_high);
423     	low_val  = tsens_mC_to_hw(s, cl_low);
424
425     	spin_lock_irqsave(&priv->ul_lock, flags);
426
vvv     CID 1487367:    (UNINIT)
vvv     Using uninitialized value "d.low_viol" when calling "tsens_read_irq_state".
427     	tsens_read_irq_state(priv, hw_id, s, &d);
428
429     	/* Write the new thresholds and clear the status */
430     	regmap_field_write(priv->rf[LOW_THRESH_0 + hw_id], low_val);
431     	regmap_field_write(priv->rf[UP_THRESH_0 + hw_id], high_val);
432     	tsens_set_interrupt(priv, hw_id, LOWER, true);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487367 ("UNINIT")
Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")


Thanks for your attention!

-- 
Coverity-bot
