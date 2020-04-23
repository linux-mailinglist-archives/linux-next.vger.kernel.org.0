Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853861B6455
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 21:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgDWTP4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 15:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgDWTP4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 15:15:56 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82052C09B042
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:15:56 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 18so2230310pfv.8
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=N6CvVTqjKGJMMicI4uE8jt7dJIV/XoRQcPbO1bWHEWY=;
        b=C/c2pXyIA3VLzY6V/HAbfqJlX8eaDJ6jMZS3XjhnAG3ZaPha9N0Bi9rHZL/eOoZFe2
         lgwcxJ6wq/NQYOJWAi+KAPbY42lADMXcBQZKPo8OwlHvm27Dkhvb4VOLrhzuhSPtut10
         TcFy4w4WPkM+3nnvCmcsfHdO+ke8lzmxQTU+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=N6CvVTqjKGJMMicI4uE8jt7dJIV/XoRQcPbO1bWHEWY=;
        b=Jp+9PvqYuk6Bka2Q7XPWj3A8N6+LrN03Uj4FI1j/yUn1E/jX3lHNjhcIO2H/ZSfVnh
         MVpkdBQJ0if6qT3vwsPs+wj0tcH6XYPLwUCNmbTzcETYGyIcarC8HD8ZKmP3Nu3TIEFk
         viVexwnoJ7dkv/zRIyb4s+m3uTKkS3ks197vn69IsrOmS2Qgbb/UfS6KQNZQydXM7PO8
         3kx8+XdzbegD7oVrj25ub5rjkc2nv9hgt/COuwJKqm9AI9vqo+b8Q5TBaXwKj2DHM8RX
         anwRnV78HEPjgqQzvR2wDP41dzFpu33f1d53G+6VwffmPSauZOSDnfQSlzPQnDL0H6Ka
         NjvA==
X-Gm-Message-State: AGi0Pualtzq24TgEsFGI8dYn4ibPWZhTjsyHvcIu2WMBGoS3W+K5nbab
        gyug2tX0nLSFnztIT9O4pU4j2w==
X-Google-Smtp-Source: APiQypLej+asUdPD+S5a4T5M9AJ9+ziWct5gH3UYi5eOSDCY01mx3CGBcdvDZE9OcK6qJI/SBhXGYQ==
X-Received: by 2002:a62:b611:: with SMTP id j17mr5261417pff.214.1587669356013;
        Thu, 23 Apr 2020 12:15:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f99sm3148082pjg.22.2020.04.23.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 12:15:55 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 23 Apr 2020 12:15:54 -0700
To:     Michael Walle <michael@walle.cc>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: bcm54140_hwmon_read_in(): Control flow issues
Message-ID: <202004231215.83D617E9C4@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200423 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Apr 20 20:21:13 2020 +0200
    4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")

Coverity reported the following:

*** CID 1492709:  Control flow issues  (NO_EFFECT)
/drivers/net/phy/bcm54140.c: 247 in bcm54140_hwmon_read_in()
241     		return bcm54140_hwmon_read_alarm(dev, bit, val);
242     	default:
243     		return -EOPNOTSUPP;
244     	}
245
246     	tmp = bcm_phy_read_rdb(phydev, reg);
vvv     CID 1492709:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "tmp < 0".
247     	if (tmp < 0)
248     		return tmp;
249
250     	tmp &= BCM54140_HWMON_IN_MASK(channel);
251     	*val = BCM54140_HWMON_TO_IN(channel, tmp);
252

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Human edit:
This is present on line 214 as well. (bcm_phy_read_rdb() returns int,
but tmp is u16.)

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492709 ("Control flow issues")
Fixes: 4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")

Thanks for your attention!

-- 
Coverity-bot
