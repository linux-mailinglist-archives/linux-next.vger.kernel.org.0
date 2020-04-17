Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8750F1AE7ED
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 23:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgDQV6W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 17:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbgDQV6W (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 17:58:22 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E984C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:58:22 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id hi11so959927pjb.3
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dHQofQu2tlP4OgDQJQaR8StS6B+ubxBiY31sy+8V5Eg=;
        b=CYa9ZeAQyC+2uKPqb0L05rP4i/yidLa2E//PbgSACVP56QXBgW/Rk89v405ecsykHr
         UEdBXAEa1d0mYJ+mU0EAuRhdbQ4Czlt1lnCm1U5jDztq2TEr1RSO7Hd4uJugLTDjdgMZ
         /gvWrUGCRcLLR0V/yjw+N+pI66BK7yG2a8uzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dHQofQu2tlP4OgDQJQaR8StS6B+ubxBiY31sy+8V5Eg=;
        b=DJpuSidGZK+mwwe4CWZuLm/MUSNQspuEVFYV06cVyz+MteJOUjeK3cOHuHi3hiC7co
         zgGRp5ucZfMyCfzPJcGd5IrUF5p4wdX5UiamP3gJLa49E6e1EZ3q24bhQU2mLsOhNOWl
         X+LSwhEj/rjQIFH8y8eP63DNtn1qLi+Mjz/YIThxN6J8mw1dAa2axLTTU8RNHHH1fERK
         7IAL8eMRK24l3GSKoWuPrucxfNbOTfWHTjqsYH8j7jpszJ940ER6XLJBl4JRCwgA72UV
         zwsjl/UQBMyxWz2MDWDcovFXgy1csnICe7TdH4mefky/yAebC7WnWxjZOWeJvQpLWx0t
         TNyA==
X-Gm-Message-State: AGi0PuZetZvivLUWCF7Dnr0oCS69xTV3C8Dcbac7Hr8KBUeZGpyYoKIs
        H3SGCTptBo2lkNxjBJaRRS7NDA==
X-Google-Smtp-Source: APiQypIwOT3eX5JVEne/hIgOACApFW7Zqve/bCiMabJBGrWAQ9C3+N7OPBQJXDWLWxcprJlhNf6Wiw==
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr5770186plt.82.1587160701882;
        Fri, 17 Apr 2020 14:58:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k12sm20242844pfk.46.2020.04.17.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:58:21 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 17 Apr 2020 14:58:20 -0700
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: pca953x_gpio_get_multiple(): Uninitialized variables
Message-ID: <202004171458.BEA64B0CF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200417 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Apr 14 11:28:42 2020 -0400
    96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")

Coverity reported the following:

*** CID 1492652:  Uninitialized variables  (UNINIT)
/drivers/gpio/gpio-pca953x.c: 499 in pca953x_gpio_get_multiple()
493     			if (ret < 0)
494     				return ret;
495     		}
496     		/* reg_val is relative to the last read byte,
497     		 * so only shift the relative bits
498     		 */
vvv     CID 1492652:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "reg_val".
499     		value = (reg_val >> (i % 8)) & 0x01;
500     		__assign_bit(i, bits, value);
501     	}
502     	return ret;
503     }
504

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492652 ("Uninitialized variables")
Fixes: 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")

Thanks for your attention!

-- 
Coverity-bot
