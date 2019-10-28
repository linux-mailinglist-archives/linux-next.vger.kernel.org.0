Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1F4E7C9E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730640AbfJ1XC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:02:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33612 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XC1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:02:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id u23so8057690pgo.0
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=y35rD6DhXk6S7zpycUyP0pCUUDNYly4Da6Mc1rBVHHk=;
        b=APjzKhGSrozn1ZTSRDfuKh7AVJsSZXNnHwPWO6bWywAg6kAxt+5SEPw2ZnKSSYEl9K
         NzGuLGKmVGDD/evArtczQH2r85yyA35hZMH6T+sqhyz1jqbL4WtqRgmkCZsv4jd7X5kW
         yzVVwMM2tyLA379OCNpyHJxnShsONaXs9g+NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=y35rD6DhXk6S7zpycUyP0pCUUDNYly4Da6Mc1rBVHHk=;
        b=YOVUvcV5Bp/HJTLC/dqs+FTmH633NGFzJUXmwJrrTvGxfoIC07tsNJDw/doChj/Aqn
         lDxk+0QlNH/IZReebUfGRX8p32clPhuvhmdY9Fp7qbPEnx2ZuLd8pgU4ns1CSnMLacSe
         k1hoE3VT2WBJLuxEvGybA7cyy5zboDuz/wBJO4Kh0Ws7jIJEPT4xr27GowiZSo+uNIf8
         qWN5aAwksxG5eXVFzm5ejP5gBvax4WAWgwyaSENZp/TTY/2kjPVv170Sxn5S4dDaBeeC
         fGkdVwXAuCNoglnDC0rZ1SFo+r5GJW7zrsAyiO1e+U3wD+tewncvKRXSvwibZGbmTRnb
         1rOg==
X-Gm-Message-State: APjAAAVUgIEERuEmumrrhvSuKlrGJmRkt8q4nQW5vmI9mf8bVgpeQQZW
        SU5Bp16tvuCRu3j44vOWSPNxWA==
X-Google-Smtp-Source: APXvYqwBOtPjcEsu22RBUftvcahsXKGKGQYWlMSbhQKDxsrxfzzDUj9RUz/A1HH49FL2OGEf8QhmdQ==
X-Received: by 2002:a63:c911:: with SMTP id o17mr12817938pgg.150.1572303746650;
        Mon, 28 Oct 2019 16:02:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 30sm537141pjk.25.2019.10.28.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:02:25 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:02:24 -0700
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ov5640_calc_pixel_rate(): Integer handling issues
Message-ID: <201910281602.6DD70165@keescook>
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

cc196e48e517 ("media: ov5640: add PIXEL_RATE control")

Coverity reported the following:

*** CID 1487375:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/media/i2c/ov5640.c: 1626 in ov5640_calc_pixel_rate()
1620     }
1621
1622     static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
1623     {
1624     	u64 rate;
1625
vvv     CID 1487375:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "sensor->current_mode->vtot * sensor->current_mode->htot" with type "unsigned int" (32 bits, unsigned) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "u64" (64 bits, unsigned).
1626     	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
1627     	rate *= ov5640_framerates[sensor->current_fr];
1628
1629     	return rate;
1630     }
1631

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487375 ("Integer handling issues")
Fixes: cc196e48e517 ("media: ov5640: add PIXEL_RATE control")


Thanks for your attention!

-- 
Coverity-bot
