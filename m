Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DFF414B05
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 15:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhIVNuo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Sep 2021 09:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhIVNun (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Sep 2021 09:50:43 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D531C061574
        for <linux-next@vger.kernel.org>; Wed, 22 Sep 2021 06:49:13 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso3625636otu.0
        for <linux-next@vger.kernel.org>; Wed, 22 Sep 2021 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ED/VYArWk+tFyr/VrOfeccky6C6F3tOGHMzTDTf1Io=;
        b=RPx1BdcdOLL3JI275MTV3hsOkcqlu12MCUa1UXyP2/q5lsLfpmeV8JmEb0Po6EXYtQ
         oKnvMniC6z5ckIU4YOVqW+IyJxxn0EdNEN/PRbDHa1Mf+ZnjK/6J7MVknquX54C7SKlq
         UxVPDkN4uSUHJJgveTj6xKGQ+P6m5Va6GV29pgKV24jz6PHGwGIEwWA+HAVAVtsWCzJ7
         YUmocd3o9qCx/RiPT/XH/8vHUGa6ovisHdIy6Nr8s5du1SoxCjSpIW5xcfmiWByOF7M5
         P9bhv+R+IQDu/jyBFjT/bg7VMohaVAC1iFjfyO0bTRnwqWm+cq+LgGHkdRTRlYXVEyiE
         DGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ED/VYArWk+tFyr/VrOfeccky6C6F3tOGHMzTDTf1Io=;
        b=y20mDL0NuZ+VBRPef6NYI1FpO8TwomSyjXzblG4PyyqIMot6iUqBK7QDhi4X5/ci7g
         cKnDVzwPmY7cIlceMwUHRZ8XAXctSlR2AqTaGx+DHds9iEt3idGdwhCo/9NCoSXDlyrx
         eQPJrqwU47hRHFCmsKdjZYlWSrmr5Y8zL/6eCmZtDWLu74eFtcYK1FXBELb1Zuwblahw
         LrkmVfi2zP3kHbcurIrbCFG9/es/14zut3t+xMvNPzp1XUtUsSTZPijxiYyX8REg2qvB
         BFZt8snWRfUpfgC7TLuaVXRWPKbmFlMnQkRPyGFHbdQd62NRHGxyc/ycmOG5fYDmRTEH
         R46w==
X-Gm-Message-State: AOAM5320iTAPXB/wepzQ1k1CYkswUHry8xbBdS7gjuV2Lc7weSKS8unJ
        sJWLCjzsJSyuh8gT5/7cbiCXGoIE3X0uZ+3LuZw=
X-Google-Smtp-Source: ABdhPJym8KBy2bO4o2Jw59ayfh7QPyCfs4aYGmUyiTH/1VkUDqqSc2RKjPE6CnATM6PlBSeurdUo7meYcRtaFktvyGE=
X-Received: by 2002:a05:6830:25d3:: with SMTP id d19mr31718804otu.357.1632318551756;
 Wed, 22 Sep 2021 06:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631191763.git.jani.nikula@intel.com> <def17e2329722f22c35807be26b35590ccb93bfd.1631191763.git.jani.nikula@intel.com>
 <YUpjj7IwBqMYSR7z@archlinux-ax161> <87a6k4n9wg.fsf@intel.com>
In-Reply-To: <87a6k4n9wg.fsf@intel.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 22 Sep 2021 09:49:00 -0400
Message-ID: <CADnq5_OCbZ8Y299ZcC+7ZwhfgqN+TRM+TWPZtkvFGvvNguvuzA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 03/13] drm/dp: add LTTPR DP 2.0 DPCD addresses
To:     Jani Nikula <jani.nikula@intel.com>,
        Harry Wentland <hwentlan@amd.com>,
        "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ Harry, Leo

Can you guys get someone to clean this up?

Alex

On Wed, Sep 22, 2021 at 7:10 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 21 Sep 2021, Nathan Chancellor <nathan@kernel.org> wrote:
> > On Thu, Sep 09, 2021 at 03:51:55PM +0300, Jani Nikula wrote:
> >> DP 2.0 brings some new DPCD addresses for PHY repeaters.
> >>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  include/drm/drm_dp_helper.h | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> >> index 1d5b3dbb6e56..f3a61341011d 100644
> >> --- a/include/drm/drm_dp_helper.h
> >> +++ b/include/drm/drm_dp_helper.h
> >> @@ -1319,6 +1319,10 @@ struct drm_panel;
> >>  #define DP_MAX_LANE_COUNT_PHY_REPEATER                          0xf0004 /* 1.4a */
> >>  #define DP_Repeater_FEC_CAPABILITY                      0xf0004 /* 1.4 */
> >>  #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT                   0xf0005 /* 1.4a */
> >> +#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER        0xf0006 /* 2.0 */
> >> +# define DP_PHY_REPEATER_128B132B_SUPPORTED             (1 << 0)
> >> +/* See DP_128B132B_SUPPORTED_LINK_RATES for values */
> >> +#define DP_PHY_REPEATER_128B132B_RATES                          0xf0007 /* 2.0 */
> >>
> >>  enum drm_dp_phy {
> >>      DP_PHY_DPRX,
> >> --
> >> 2.30.2
> >>
> >>
> >
> > This patch causes a build failure in -next when combined with the AMD
> > tree:
> >
> > In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
> > In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
> > In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
> > ./include/drm/drm_dp_helper.h:1322:9: error: 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-Werror,-Wmacro-redefined]
> > #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER            0xf0006 /* 2.0 */
> >         ^
> > ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note: previous definition is here
> > #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER        0xF0006
> >         ^
> > 1 error generated.
> >
> > Perhaps something like this should be applied during the merge of the
> > second tree or maybe this patch should be in a branch that could be
> > shared between the Intel and AMD trees so that this diff could be
> > applied to the AMD tree directly? Not sure what the standard procedure
> > for this is.
>
> What's in the drm-intel-next branch is changing DRM DP helpers in
> include/drm/drm_dp_helper.h with acks from a drm-misc maintainer. That's
> where this stuff is supposed to land, not in a driver specific file, and
> especially not if added with just a DP_ prefix.
>
>
> BR,
> Jani.
>
> >
> > Cheers,
> > Nathan
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index 234dfbea926a..279863b5c650 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -4590,7 +4590,7 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
> >                                                               DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
> >
> >               link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
> > -                             lttpr_dpcd_data[DP_PHY_REPEATER_128b_132b_RATES -
> > +                             lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
> >                                                               DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
> >  #endif
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> > index a5e798b5da79..8caf9af5ffa2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> > @@ -878,8 +878,6 @@ struct psr_caps {
> >  # define DP_DSC_DECODER_COUNT_MASK                   (0b111 << 5)
> >  # define DP_DSC_DECODER_COUNT_SHIFT                  5
> >  #define DP_MAIN_LINK_CHANNEL_CODING_SET                      0x108
> > -#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER     0xF0006
> > -#define DP_PHY_REPEATER_128b_132b_RATES                      0xF0007
> >  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1  0xF0022
> >  #define DP_INTRA_HOP_AUX_REPLY_INDICATION            (1 << 3)
> >  /* TODO - Use DRM header to replace above once available */
>
> --
> Jani Nikula, Intel Open Source Graphics Center
