Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849C462474E
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbiKJQn5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiKJQnR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:43:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C2D45EF0
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:42:58 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso6070786pjn.0
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
        b=IruV/cOGCppTZMecE2WVY8zukl+kcYVeoo7vFWW6yGTBj+JNzqw7SwdygU11Ap5tXp
         +IWICnrL7OpPlowtcizxkZ8u7fNIf7VOdlhb+UCVVdiNOgc1eLngTeYpENadc4W7k2ql
         lwVFIi2Zm+49ixbK5qXD6pVFvTfaAaG7iPD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
        b=oMSdvzKw5w63p1wt6lHdsB6V1Tcmwd17mRausfvqwP3c3/M4rTG+zrezGbDBLpWGNd
         SIbIBbTGOCCeFXodWvG0SMPJLVf95a9E5FB+4d3Rlq34ZPu/dweTd7Nj9Px1c0vMboPf
         /25Syl7ouOsPikApbjNPOfwbe8h/uj/zeXXb6WfxmSWElb4YKf0TRPh5Qgt+szIXwtbc
         /g4voPp1tbiUJeWOciAqm4iRmLYunxhyQ3MiOWy3We9c3sRxOpzHc5U3oiL5k6zMGwns
         MLMLoJfdbhF/ZGkSdW3MJYAV4Mt6CITmfxs2SEZVloJunlrM6KTCI3OdJmYrPNGTFbiZ
         rvJw==
X-Gm-Message-State: ACrzQf3IzWECvI9u27QsXYeHEY1e5IHGNktIBxIz2a7XgB0FSwPuLNXD
        dtdM3Yu9t6uc8vzMkO+a4FWCTQ==
X-Google-Smtp-Source: AMsMyM4zFp+Wrf9N4R4CuG0pbWGCwDSSClCq2oRdgHwJJKI1w+NXOW7FDTxl0KXE16WpLHC9sb8z8g==
X-Received: by 2002:a17:902:82c2:b0:188:5581:c8de with SMTP id u2-20020a17090282c200b001885581c8demr1293917plz.140.1668098578376;
        Thu, 10 Nov 2022 08:42:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t4-20020a1709027fc400b00186f0f59d1esm11373906plb.192.2022.11.10.08.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:42:58 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:42:57 -0800
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>,
        Dave Airlie <airlied@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: nv50_hdmi_enable(): OVERRUN
Message-ID: <202211100842.076585A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

  Wed Nov 9 08:22:02 2022 +1000
    f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

Coverity reported the following:

*** CID 1527272:    (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:801 in nv50_hdmi_enable()
795
796     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
797     	} else {
798     		size = 0;
799     	}
800
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
801     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, &args.infoframe, size);
802
803     	/* Vendor InfoFrame. */
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
drivers/gpu/drm/nouveau/dispnv50/disp.c:810 in nv50_hdmi_enable()
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
807     	else
808     		size = 0;
809
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
810     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
811
812     	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
813     }
814
815     /******************************************************************************

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527272 ("OVERRUN")
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

It looks like this should address &args not &args.infoframe, if the
intention is to include the "data" member.

Thanks for your attention!

-- 
Coverity-bot
