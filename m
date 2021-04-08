Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7A7359060
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 01:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbhDHXlM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 19:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhDHXlL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 19:41:11 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA97C061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 16:40:59 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id d10so2492456pgf.12
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DjBWPbxxDWgPpFXCPBqc99x4zUZMq0yTdQWaCr8ackM=;
        b=RPf6W513uJ9oWv2j6E62yO4tWoS8BM6BpnfJzVDzScRUAWwzmzulj4pPkPXh03/BcR
         4mqFlzv8VJpblvm3BRoxU55h9WsnwbZFqEPko3wzJ6DbMH2Sh0nqVvRRwMHYo/y0vDhZ
         ka+iN/Rwq9JshU5YoNBBmh2Ihro3B+rMyepL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DjBWPbxxDWgPpFXCPBqc99x4zUZMq0yTdQWaCr8ackM=;
        b=oQhVWT8oYYz9vKsluyeUvB9UqtbEBgmrwuz4Z9SCdbErrj0aQ56Cjks6+vlnupbYcy
         Uy9a5Z/vm6erp/BU8z1DAzJZlwW1hS9egjpk9ADhEhg0xIHkuaWo+liKjgQO+5ezXxHa
         JZWlLoOC7rMdPqScMwgl7gH2O2xoBjKdGNHluO/aRRyoBb0gQTR3Ya0cxauoqqS1EKpd
         VLaEecA8HdtI822T2W9NWLcyWlT0oAc/MfNDlAmeWek2u2HZp21Q7D258bfQ87U50D4m
         UcJ+I3kfcmCS7zgJkEWW27DlOY8fFhd0SnojMLWlLLIOUW3hjTddDQAd11ODuyJtc7D5
         1aRQ==
X-Gm-Message-State: AOAM533s9OBmp4ySOkdK9noS3v9mU07NuA13spMSOBFsDLurIcNS8Lyv
        V1B0MSazZzeLRIvGowUKMOpJSQ==
X-Google-Smtp-Source: ABdhPJyyx14gztm5Pm5tgTveJhJg1F/A2fdxsIdD6Fo+3xenoNp5Q1f2fZUupzynv1oTE5HqeGoq1g==
X-Received: by 2002:a63:1c54:: with SMTP id c20mr2590455pgm.210.1617925259390;
        Thu, 08 Apr 2021 16:40:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w124sm454820pfb.73.2021.04.08.16.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 16:40:58 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 16:40:58 -0700
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rtw_ieee802_11_parse_elems(): Incorrect expression
Message-ID: <202104081640.BBEF957A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210408 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sat Apr 8 12:52:39 2017 +0200
    554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Coverity reported the following:

*** CID 1503715:  Incorrect expression  (IDENTICAL_BRANCHES)
/drivers/staging/rtl8723bs/core/rtw_ieee80211.c: 1003 in rtw_ieee802_11_parse_elems()
997     		case WLAN_EID_OPMODE_NOTIF:
998     			elems->vht_op_mode_notify = pos;
999     			elems->vht_op_mode_notify_len = elen;
1000     			break;
1001     		default:
1002     			unknown++;
vvv     CID 1503715:  Incorrect expression  (IDENTICAL_BRANCHES)
vvv     The same code is executed when the condition "!show_errors" is true or false, because the code in the if-then branch and after the if statement is identical. Should the if statement be removed?
1003     			if (!show_errors)
1004     				break;
1005     			break;
1006     		}
1007
1008     		left -= elen;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503715 ("Incorrect expression")
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Thanks for your attention!

-- 
Coverity-bot
