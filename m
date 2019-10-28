Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC8EE7CB6
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfJ1XG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:06:26 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:42527 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbfJ1XG0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:06:26 -0400
Received: by mail-pl1-f176.google.com with SMTP id c16so6486370plz.9
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/1EWj5CwwO2tA+gQ3hR+10X+nsgIUcOaYvdvJ5m2MLM=;
        b=k4LEbN8SvmpVxqkk9mFFc0DWmgnk51GJKopy8RejemBMSNEZDhTDY/eWJiGvLMSRUj
         jf9bZrR3tu9aJ3zSgMiF8ZGsgg0uVW8oQ9zzBvG7j9GtTzZa37kokJc3tpju7iL0rNjq
         ywCOFLRO2ieQ+uqD8KH0VekaBQUf6sPXzTRaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/1EWj5CwwO2tA+gQ3hR+10X+nsgIUcOaYvdvJ5m2MLM=;
        b=Ojk6KL0u2goPAQ/shs/2s30wwO3mUfKzALMTpUeJQ14CDF7RZI3DUeF8TC3IINmHpj
         ipB793PAJCPs/I9TpPNfmp1w3qXAWOoyti1VP4g5a+s36JLbWoUbTWhWttmoG9tSIWc1
         woMJ01iyDWH25LeYZgzEwnV6IhGnOoyQiJM4U2yp8B5dujqOr/rvT4qoq4QRZINqVHFD
         vt9+tOJWAiaHjLmBnb2uW7SRUmAMYnRlV2WOyne1zoVUl7uU8P2wcUbuMBQ+HSUmkYLa
         K8m1dCskLAE3LS7eNuZOAEY73kY85jh9HqrcSeiCBPmPjuoW8CIFAjkYGMiZ/toHh4GG
         VwVg==
X-Gm-Message-State: APjAAAWryHxiikaZ4H66VxPAwfNM3BnHF4wjMjSkwUbu0Rh5Z7SFEQNn
        6LYFUcpBcpuKWvg4rrtgWT7dtA==
X-Google-Smtp-Source: APXvYqzpgKHpRgRsIASE8qbzAioTePeWfc/UN2McNlqfRvOvaHtlOKer89XqplpfChcwGj86i49QjQ==
X-Received: by 2002:a17:902:8a96:: with SMTP id p22mr570810plo.272.1572303985332;
        Mon, 28 Oct 2019 16:06:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w8sm1424488pfn.175.2019.10.28.16.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:06:24 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:06:23 -0700
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: degc_to_code(): Integer handling issues
Message-ID: <201910281606.F95870B3@keescook>
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

*** CID 1487360:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/thermal/qcom/tsens-common.c: 95 in degc_to_code()
89     		dev_dbg(priv->dev, "%s: offset:%d\n", __func__, priv->sensor[i].offset);
90     	}
91     }
92
93     static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
94     {
vvv     CID 1487360:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "degc * s->slope" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "u64" (64 bits, unsigned).
95     	u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
96
97     	pr_debug("%s: raw_code: 0x%llx, degc:%d\n", __func__, code, degc);
98     	return clamp_val(code, THRESHOLD_MIN_ADC_CODE, THRESHOLD_MAX_ADC_CODE);
99     }
100

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487360 ("Integer handling issues")
Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")


Thanks for your attention!

-- 
Coverity-bot
