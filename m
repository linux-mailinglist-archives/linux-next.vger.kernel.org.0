Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942C0195DE6
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 19:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0SvB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 14:51:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40314 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgC0SvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 14:51:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id r19so4999015otn.7;
        Fri, 27 Mar 2020 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=wDI9SfzV2R8hyVfBWBp+68ChjK6A5bogDpMizFkhzeM=;
        b=bhDkyxLxUVigjSTEIIzP1F4GbQDrLmGX2OdMX4YPUWRLfB0UdzopRsiocfCDBjnTCH
         RccowB5sFrNiabPaBIkjd/u+7m5DcIO3wWRu5cdGJEWvvU+sCpTrpCGlbUyOTmaQJrZv
         TVwQMh+CAx+tdev7JmWIoOnfVWJlBLYVq1XN6s3aWbrjD+5LhxukuUToVOhKjm0DZLvx
         mo13kaE8Cb+i7Y5F8zyztPC2i1jBQBLPRcCfEyLorw5+87z/zdJokNhbZmY6fsoqA4GV
         I0YC047l11ATgh0c9RELO5YkFJThfMeM2ktp+ELv4uL2jhUFUchxOqvYOOmvo+mYi9Ym
         9ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=wDI9SfzV2R8hyVfBWBp+68ChjK6A5bogDpMizFkhzeM=;
        b=hSByXtBdZXW9JJLFBumEtpyCRTjsGP41PWq0BnSVDTxXL4UqUv8L4pwebwqv5vrtRR
         QGvuiDKTx6pbiv67iaAiv32y04gzZ3A86jSYFUQC2Y16XpSa1BuSPob7z7Ff7yMedHnw
         /3pJwCk6Z1REP1Qad4vVUcpFGzniYSh2ibbZCYsYoUk4NExBP9eGDXk+vN/kIxy9MB28
         jJlbeRuVlxXvHoGbXInPDKV6Dry26k8KDMhac3luBHOt2rdCLJBnqxtDAUWqTqemI73b
         brFsPWd5KNTDj4EOt4/AhC18Xbb9wf1a+1sQ7V+GafrUEMzBU8gWUCRnzLYV+PEs8p3t
         c6Pw==
X-Gm-Message-State: ANhLgQ0nggW+Y/f8CnTrllASbDT7oMjfUHksVe9ySUEdaK6a8Zga6soL
        pzN/4ZaZxhr+sllWG/58yy7yUZFttKk=
X-Google-Smtp-Source: ADFU+vvuomHQOVxr5SPCDj1qBovJy4K7MFoYLPRUKu5zLKZaz14xBFFY2iM8Xphy/2s6CDhFP/+1MQ==
X-Received: by 2002:a9d:3ea4:: with SMTP id b33mr89534otc.136.1585335059680;
        Fri, 27 Mar 2020 11:50:59 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id h29sm1696493ooe.33.2020.03.27.11.50.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 11:50:59 -0700 (PDT)
Date:   Fri, 27 Mar 2020 11:50:55 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Build failure in omap_remoteproc due to 02e6d546e3bd
Message-ID: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Apologies if this has already been reported, I did not see anything in
the archives. On next-20200327, I see the following build error:

drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
to function call, expected 2, have 3
        timer->timer_ops->set_load(timer->odt, 0, 0);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
1 error generated.

This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
Enable autoreload in set_pwm") in the clockevents tree interacting with
commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
usage") from the rpmsg tree.

Something like the diff below should resolve it but it cannot be applied
to the rpmsg tree because it does not have the clockevents change. It
will have to be applied by Linus as a merge fixup.

Stephen, would you mind applying this to whichever merge happens second?

Cheers,
Nathan

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index cdb546f7232e..6955fab0a78b 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -171,7 +171,7 @@ static int omap_rproc_request_timer(struct device *dev, struct device_node *np,
 	}
 
 	/* clean counter, remoteproc code will set the value */
-	timer->timer_ops->set_load(timer->odt, 0, 0);
+	timer->timer_ops->set_load(timer->odt, 0);
 
 	return 0;
 }
