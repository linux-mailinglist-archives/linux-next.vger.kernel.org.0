Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC0235467E
	for <lists+linux-next@lfdr.de>; Mon,  5 Apr 2021 20:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhDESC0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 14:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhDESCY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Apr 2021 14:02:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91186C061756
        for <linux-next@vger.kernel.org>; Mon,  5 Apr 2021 11:02:18 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso1351468pje.0
        for <linux-next@vger.kernel.org>; Mon, 05 Apr 2021 11:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=96ugIRQURbwMoEN3qHdW4/l82oY+YEr2l6cI66l/51s=;
        b=Bco1K6ATW1Dlo9XD0gcqd03WjnMG6zgzfjXJZM2sn72/0miPX+8b62SU9f12brh/qh
         o4dSXEQPtQZySQ3/nMoHpGY/BWyP4uZzyCurGk455c+LApdmzOCw+6bj9/v6hP32X7cZ
         yTh/D2ub+TfxZO2ugQ5Wx0GcdinJcWHN3x/qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=96ugIRQURbwMoEN3qHdW4/l82oY+YEr2l6cI66l/51s=;
        b=irHyUOcVkGhdS2WPlghR1rRjOYRxIuHf+YmKCVQ9h27oOAKzt7+VxBCtTNCMw4diFm
         hU7tTTcoDRblaN1BoB3Gp+MlIbWsO6Epx71e0sRfwdc42mcYz9swpZSDRKaD7IJJdknE
         2iLT12UWKa6xt9fzM5sFSaYH+J8E9owFv4bfrISASNmFN6p3Wd0i8D9fksUvRv2QE8tD
         P6fnfiefg/Er0lSd6zlKJ3Im1RFyRRZ6z5FDfAQP8r7BmjthuxgywbNPPbYDFB85jHr9
         +K0hnr49Iav3IhvgbFoEV58q8AYqKsY1zqkBjt7YccrJFN6ytC7rf2g2Rlsydk7fSuR3
         fjUg==
X-Gm-Message-State: AOAM5310j5h/0K77IuSlBBaKEXQ/peU06eKnN+OIGYwrcJEUADmQOzKa
        T0jWZ2Yj/QdEnHP5BeHU16+cqw==
X-Google-Smtp-Source: ABdhPJyBgaB2nWryoVT6mznKeMi850pXRcSyoC7TIMNbSFLbfvY20Jiji0lBioYJkO/ZYIYiqUZqNw==
X-Received: by 2002:a17:902:d346:b029:e4:c35b:dc0a with SMTP id l6-20020a170902d346b02900e4c35bdc0amr25031768plk.75.1617645738090;
        Mon, 05 Apr 2021 11:02:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b126sm16235882pga.91.2021.04.05.11.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 11:02:17 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 5 Apr 2021 11:02:16 -0700
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Daniel Mack <daniel@caiaq.de>,
        Clemens Ladisch <clemens@ladisch.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ALSA: usb-audio: Error handling issues
Message-ID: <202104051059.FB7F3016@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210401 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Mar 5 08:17:14 2010 +0100
    e5779998bf8b ("ALSA: usb-audio: refactor code")
  Thu Jun 27 21:59:49 2013 +0200
    b1ce7ba619d9 ("ALSA: usb-audio: claim autodetected PCM interfaces all at once")

Coverity reported the following:

*** CID 1475943:  Error handling issues  (CHECKED_RETURN)
/sound/usb/quirks.c: 430 in create_autodetect_quirks()
424     		    get_iface_desc(iface->altsetting)->bInterfaceClass !=
425     							USB_CLASS_VENDOR_SPEC)
426     			continue;
427
428     		err = create_autodetect_quirk(chip, iface, driver);
429     		if (err >= 0)
vvv     CID 1475943:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "usb_driver_claim_interface" without checking return value (as is done elsewhere 16 out of 20 times).
430     			usb_driver_claim_interface(driver, iface, (void *)-1L);
431     	}
432
433     	return 0;
434     }
435

*** CID 1475944:  Error handling issues  (CHECKED_RETURN)
/sound/usb/card.c: 206 in snd_usb_create_stream()
200     		dev_err(&dev->dev, "low speed audio streaming not supported\n");
201     		return -EINVAL;
202     	}
203
204     	if (! snd_usb_parse_audio_interface(chip, interface)) {
205     		usb_set_interface(dev, interface, 0); /* reset the current interface */
vvv     CID 1475944:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "usb_driver_claim_interface" without checking return value (as is done elsewhere 16 out of 20 times).
206     		usb_driver_claim_interface(&usb_audio_driver, iface, (void *)-1L);
207     	}
208
209     	return 0;
210     }
211

*** CID 1475945:  Error handling issues  (CHECKED_RETURN)
/sound/usb/quirks.c: 59 in create_composite_quirk()
53     	for (quirk = quirk_comp->data; quirk->ifnum >= 0; ++quirk) {
54     		iface = usb_ifnum_to_if(chip->dev, quirk->ifnum);
55     		if (!iface)
56     			continue;
57     		if (quirk->ifnum != probed_ifnum &&
58     		    !usb_interface_claimed(iface))
vvv     CID 1475945:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "usb_driver_claim_interface" without checking return value (as is done elsewhere 16 out of 20 times).
59     			usb_driver_claim_interface(driver, iface, (void *)-1L);
60     	}
61
62     	return 0;
63     }
64

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1475943 ("Error handling issues")
Addresses-Coverity-ID: 1475944 ("Error handling issues")
Addresses-Coverity-ID: 1475945 ("Error handling issues")
Fixes: b1ce7ba619d9 ("ALSA: usb-audio: claim autodetected PCM interfaces all at once")
Fixes: e5779998bf8b ("ALSA: usb-audio: refactor code")

Thanks for your attention!

-- 
Coverity-bot
