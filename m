Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B82EE633
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDRiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:38:51 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:39617 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfKDRiv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:38:51 -0500
Received: by mail-pf1-f177.google.com with SMTP id x28so9518355pfo.6
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=skTQ/Ow6kKlSIDT7ksT48roeWn0HcwjVIqserZjjZYE=;
        b=B5yBjbM71ec/8gchKsEwqBJfZHWki/DEIzpWChKyVbStKlMBuHqA2fm36KyXloHBqP
         Lrs2FoBecTWrqqks1fCeIXBT/lnYIUJPXdngBSHsFxEaKvuYTmgMEdB8P3MksFlHkiBY
         WJrAGKHSB9KbvAl6cqgMMlvLoNS3AJs8MygMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=skTQ/Ow6kKlSIDT7ksT48roeWn0HcwjVIqserZjjZYE=;
        b=bELglXjsWf2Urw62qAtbJNWDt4dkIm4Ma8jtd/iVZ+LKc5PTB8h5m8Q/yrzlbX/jAi
         DZCxWQCmY4jIYFZYtBcviDpFBIci0Mg7ZdfOGAMBVBV2iBA5Zi3/JhnWoVgFuBIkrFe5
         oc0TfUAZ3BGraV2mB09En2gognE4vPWkDWn2wVTJU0BTPWbsdq0dZIGZ/sNTEqoBzuMs
         UhZ9EzWGEzhS8ytsiEPHwrolj/zk/UE4NJGQ1++cSHdL3TMFwUrjb6YASc25hW08X+JC
         ZJ0tsbHU40cQx92XEXYC1PtENwQChIxcfOukKNSaROo3LrGAhIxTjxUt0EE0NWLyil5w
         DT+w==
X-Gm-Message-State: APjAAAXo7YQjSTfFjU4EqArGvclEpxQHEjyM8ipQnYjj30A2wF9ynWGx
        VvcNhgHWvErmXRCnsAdPwYcMheUeYOQ=
X-Google-Smtp-Source: APXvYqw1cFXaBng945ztUfjuHbesJTyoTFjETSJvMIMQrdDI0y6hYHT+/BpaT+fdqJ5y9oNZxJUorA==
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr332379pje.117.1572889130522;
        Mon, 04 Nov 2019 09:38:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m68sm16252888pfb.122.2019.11.04.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:38:49 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:38:48 -0800
To:     Ajay Singh <ajay.kathat@microchip.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Message-ID: <201911040938.57CCE1B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

4e0b0f42c9c7 ("staging: wilc1000: use struct to pack join parameters for FW")

Coverity reported the following:

*** CID 1487400:  Memory - illegal accesses  (OVERRUN)
/drivers/staging/wilc1000/wilc_hif.c: 496 in wilc_parse_join_bss_param()
490     	if (supp_rates_ie) {
491     		if (supp_rates_ie[1] > (WILC_MAX_RATES_SUPPORTED - rates_len))
492     			param->supp_rates[0] = WILC_MAX_RATES_SUPPORTED;
493     		else
494     			param->supp_rates[0] += supp_rates_ie[1];
495
vvv     CID 1487400:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array of 13 bytes at byte offset 13 by dereferencing pointer "&param->supp_rates[rates_len + 1]". [Note: The source code implementation of the function has been overridden by a builtin model.]
496     		memcpy(&param->supp_rates[rates_len + 1], supp_rates_ie + 2,
497     		       (param->supp_rates[0] - rates_len));
498     	}
499
500     	ht_ie = cfg80211_find_ie(WLAN_EID_HT_CAPABILITY, ies->data, ies->len);
501     	if (ht_ie)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487400 ("Memory - illegal accesses")
Fixes: 4e0b0f42c9c7 ("staging: wilc1000: use struct to pack join parameters for FW")


Thanks for your attention!

-- 
Coverity-bot
