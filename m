Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 855A67BD05A
	for <lists+linux-next@lfdr.de>; Sun,  8 Oct 2023 23:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbjJHVos (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Oct 2023 17:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjJHVos (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Oct 2023 17:44:48 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF119D
        for <linux-next@vger.kernel.org>; Sun,  8 Oct 2023 14:44:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d90da64499cso4266666276.0
        for <linux-next@vger.kernel.org>; Sun, 08 Oct 2023 14:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696801486; x=1697406286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tav2mFCm6+fFh5IlnHwXitUhkN2/8ML3TFXpJteSTF4=;
        b=VvIjCH7Qd3+BMMVspALe5WsLiRM6y4fkqtq2QbEyrebKSzpFnPzj4572LeA6lt67ZL
         97FLS5enAaUnifERBE/V5O+KjCsdcQEdFJHfTLcAwAn+bqBcAPWGilpDT2w78tBj7iY6
         U0pavb7CFuFMAFUYtN4MS8oyUisxnb1D1Zb+JMqan06f5Gkj/roI2y149/fQc/HJkt/4
         pm/M9I/ROdZuNju7UnWemAyYkXcziChDYniE1P3R1Bl5/e0+mKbaALOe5hSDEbS7It3k
         6KrIVTBqGTcoX+z0c6IhbFVaOcxEssJgDiFqssPVLbv7Ks33Qka/duYW36BbBDWbDKLT
         zHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696801486; x=1697406286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tav2mFCm6+fFh5IlnHwXitUhkN2/8ML3TFXpJteSTF4=;
        b=QFD0jpJ63hJ5rtlTFJNuaHGOdN2VoVgorm+4EFLttwAL/ND9HDCHhPqHt9mGIfgs2y
         zJxN6wKJcHzE+oHJ0YOJvZhI+HTyYnrlchFo32/PxbEwohy1emWebZdLpgw/MGbfFvJH
         TcPWeoSbEzYkXhFDOhm5g1cDhWp/lKuvf+R9+G46rQv3jXw2B1k/mbL02AaRwfCamJ+6
         CioH4QtYhTOc67lcRgKk2jfrvXIcLUsX5goE1RQPedqP4307BeznzRawDZgaMIQzQNHL
         AZ9El3sROIEQZPyx+kaxzdLTQ9I2FyqcltgR1IFs2gT96ztlB324REgoeCAAdMOYwnLU
         orow==
X-Gm-Message-State: AOJu0YyDPoWYB7dCpmL3X29dAerAUr4urLIWFCcEjNXKPMX3552NkKF/
        HDgkLbdrbc+gF3jQ5IPz34Mgl3ogsZ8KO2JoeYv8k1MJlY+1i0WYEUuiUg==
X-Google-Smtp-Source: AGHT+IEAM6O0TlykgyP+J08vOM5D6zxZySrQXehp0viB6eFie/27eGUrDQLZmHJfd0CzoMwPB/VPsjUsQU03Qnpy1nU=
X-Received: by 2002:a25:6941:0:b0:d81:61c8:aef5 with SMTP id
 e62-20020a256941000000b00d8161c8aef5mr13260275ybc.40.1696801486489; Sun, 08
 Oct 2023 14:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083027.6af62f8a@canb.auug.org.au>
In-Reply-To: <20231009083027.6af62f8a@canb.auug.org.au>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 9 Oct 2023 00:44:35 +0300
Message-ID: <CAA8EJprvi2DojgWCfheu_v6PfEMn0eNPUj3mpWPK-=kbZi57yg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-msm-lumag tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 9 Oct 2023 at 00:30, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   55bbcadccdec ("dt-bindings: display: msm: Make "additionalProperties: true" explicit")
>   08bf97ab16f3 ("dt-bindings: display: msm: Add missing unevaluatedProperties on child node schemas")
>   e117fd68f973 ("drm/msm/dp: Remove error message when downstream port not connected")
>   fb48250ca919 ("drm/msm/dp: Inline dp_display_is_sink_count_zero()")
>   22e96e73182c ("drm/msm/dp: skip validity check for DP CTS EDID checksum")
>   b41c5ca70684 ("drm/msm/dp: Remove dp_display_is_ds_bridge()")
>   d89ce4cdb7a6 ("drm/msm/dp: Inline dp_link_parse_sink_count()")
>   a9905b469931 ("drm/msm/dp: Simplify with drm_dp_{max_link_rate, max_lane_count}()")
>   62ebb19fb32d ("drm/msm/dp: Remove aux_cfg_update_done and related code")
>   8bddc2d12e9c ("drm/msm/dp: Remove dead code related to downstream cap info")
>   284a245d8bdc ("drm/msm/dp: Use drm_dp_read_sink_count() helper")
>   f906b95755f7 ("drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()")
>   4b90679c6864 ("drm/msm/dsi: Enable widebus for DSI")
>   5467774e55fb ("drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit")
>   c9b7bae463bb ("drm/msm/dpu: Enable widebus for DSI INTF")
>   97aab03bb3fa ("drm/msm/dpu: Move setting of dpu_enc::wide_bus_en to atomic enable()")
>   92a48b6ed510 ("drm/msm: Remove unnecessary NULL values")
>
> are missing a Signed-off-by from their authors.

Should be fixed now. Excuse me for the trouble.

-- 
With best wishes
Dmitry
