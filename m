Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16CB624777
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 17:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiKJQtm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 11:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiKJQtS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 11:49:18 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A2C1F2C2
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:48:50 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so2052495pjk.1
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 08:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9kSxsO17Q+SGuhgv7bQJn3B89MxfwFUgXJQwdBXWxc=;
        b=np5+c7/D+/Pe+ETkZmBCcBkcIkF9rWztcNUNpZ8fjJM55FzJgNq4nkQ3nqPKjpN1y4
         +Vz42qN8iUh+CDPgfd4HJ+e7+YwQlV2RCywPsaAB8YsN7K22LSZWTzUSOkIgU8aIF4vU
         Sg6WhOoBQQUUrmLT0u0VujZkRgeFf/Mp4HGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9kSxsO17Q+SGuhgv7bQJn3B89MxfwFUgXJQwdBXWxc=;
        b=si3gY2h7k4vr0/xvVhXSHJsW8VOFuHvr0oHuJk7qAfVamZGhnrGX0lgQcfkpdg5OAF
         J5c20I3BPLHIZ7T+6NmNq9WZIG9XEzPE+mdj9PZuZjzKMoSkuWbSLF8XugMtE/0kC3Sm
         O7X3AEbxMZ9t09gbOucgTqGURp1QxcNh0fadFjzvcFUELryYLKkaR+8xlcBqwQYdYb8y
         MDn+tkqemqBSgq2O57s3ag8fxbBk8JFBq/IZn3lHxn++Agg3ztPo595/0cN4LHExOcI9
         xUH+x5fh67wnh6cwSgmZ39FxeevcLupi3pT0wjEqnVbDHhZt94kCcbS2Co6z3dtnNxsJ
         bM/A==
X-Gm-Message-State: ACrzQf0mxeHwCw5iWXU0LYyUSAtkeczr5Q3hITMlmWeGKeLykl6Pz9Ab
        cWjY//ShnGfHle54Hiqe04vFVA==
X-Google-Smtp-Source: AMsMyM46trOzdUYGkS4TOBz+lvhrf5w6Z58imMinDBIdbLY+Ryt5gQlR73fs5ggqqfV6HJyw6Yc/cw==
X-Received: by 2002:a17:902:8d8d:b0:17d:b9c:cd64 with SMTP id v13-20020a1709028d8d00b0017d0b9ccd64mr1509659plo.40.1668098929893;
        Thu, 10 Nov 2022 08:48:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s9-20020a63e809000000b00473c36ea150sm3597920pgh.92.2022.11.10.08.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:48:49 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:48:48 -0800
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
Subject: Coverity: nv50_pior_atomic_enable(): Memory - corruptions
Message-ID: <202211100848.F4C2819BB@keescook>
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
    813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Coverity reported the following:

*** CID 1527268:  Memory - corruptions  (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:1817 in nv50_pior_atomic_enable()
1811     	case DCB_OUTPUT_TMDS:
1812     		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
1813     		nvif_outp_acquire_tmds(&nv_encoder->outp, false, false, 0, 0, 0, false);
1814     		break;
1815     	case DCB_OUTPUT_DP:
1816     		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
vvv     CID 1527268:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "(*nv_encoder).dp.dpcd" of 15 bytes by passing it to a function which accesses it at byte offset 15.
1817     		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
1818     		break;
1819     	default:
1820     		BUG();
1821     		break;
1822     	}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Thanks for your attention!

-- 
Coverity-bot
