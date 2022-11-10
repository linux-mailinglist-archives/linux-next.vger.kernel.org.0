Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CB1624790
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiKJQul (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbiKJQuM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:50:12 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377F3C740
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:49:49 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id gw22so1992913pjb.3
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyrWfcByjJXJ5u7emZGohwKYRcoGGODByISYDFHgldU=;
        b=SkZKW3Yo1le1fuMFEG+mH3AW0pGZzhfl1jquZr26xXoWgcpGUgwx/9i59trYLnbyNp
         0fECbdTZThXTLRMivyi83uOwpVX+PQtcAkIY/lpHnBGqzgJ8HE/JGcY/yGpDr/tts6s8
         fEUAZIy98nqHcvqsGCP73UaA5HAyPfN1MhCsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyrWfcByjJXJ5u7emZGohwKYRcoGGODByISYDFHgldU=;
        b=A+K0y9a3oZbKkjNQpFGnkME1zbAoxjNnx4MlweGTe5iNQnSuYiGZQiNMM158HAj5fU
         ozofIJb3WW2yikBavGZaHK1wzhFXPH2e2KQifWliqqQyYl5hqs+GKK+YHh9RMMjnH9nD
         PWt9aOc+T7FqoF41ISLnenCkxfWEfBkRuCDABumF1HwMhVPTIRpiPENCO40ybpoPmSPW
         6ma40twHDvSYVhwrk8HzvpqTSMa6dbHDUw/XFl0tn/QMqhEiOPYwYZfAAMUQ6LC+kzKd
         ATBdgkHk5/2YUWeV4uU0KgGLl1lkKbi3U5uxxkRn9vAqjqzPAxR0dwJ+YRA+pL+FYp4k
         Oixw==
X-Gm-Message-State: ACrzQf1ubvAE1BP3eiH5aqThRNNp/fKjbeEh+eEqE3fgk/oxeI2jL6gM
        RoaXsNbjyiBQTqc9cqA7iitG6A==
X-Google-Smtp-Source: AMsMyM4giYvP77sTPDWGk4iRexWkKdhko7Z9x8ZbVQ0+6fKkZQD8biAGSZtsNEYAUXSGiobU0OhdmQ==
X-Received: by 2002:a17:902:e803:b0:187:3a52:d262 with SMTP id u3-20020a170902e80300b001873a52d262mr47366180plg.85.1668098988693;
        Thu, 10 Nov 2022 08:49:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903120e00b0016be834d54asm11586089plh.306.2022.11.10.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:49:48 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:49:47 -0800
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Dave Airlie <airlied@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: nvkm_dp_train(): Integer handling issues
Message-ID: <202211100849.DDBADD2A6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 10:43:10 2022 +1000
    8bb30c882334 ("drm/nouveau/disp: add method to trigger DP link retrain")

Coverity reported the following:

*** CID 1527267:  Integer handling issues  (NEGATIVE_RETURNS)
drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:458 in nvkm_dp_train()
452     	u8  pwr;
453
454     	/* Retraining link?  Skip source configuration, it can mess up the active modeset. */
455     	if (atomic_read(&outp->dp.lt.done)) {
456     		for (rate = 0; rate < outp->dp.rates; rate++) {
457     			if (outp->dp.rate[rate].rate == ior->dp.bw * 27000)
vvv     CID 1527267:  Integer handling issues  (NEGATIVE_RETURNS)
vvv     "ret" is passed to a parameter that cannot be negative.
458     				return nvkm_dp_train_link(outp, ret);
459     		}
460     		WARN_ON(1);
461     		return -EINVAL;
462     	}
463

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527267 ("Integer handling issues")
Fixes: 8bb30c882334 ("drm/nouveau/disp: add method to trigger DP link retrain")

Thanks for your attention!

-- 
Coverity-bot
