Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71EC54D311
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 22:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347483AbiFOUwi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 16:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344323AbiFOUwi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 16:52:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564C76410;
        Wed, 15 Jun 2022 13:52:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4456600BE;
        Wed, 15 Jun 2022 20:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAABC3411A;
        Wed, 15 Jun 2022 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655326356;
        bh=ZGcb3PGvlAe9puTJZg4fg6hIdYh2HuJAfIX8EE3UMf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cUqBYHjzDCCLDQo5p26m8y0p9kaave6tro87nDQfMKZUV7fkSZIrVKY4O+C59CHpZ
         ghWZbhomF5Kg15o5VcTSZ/TTru4Ct4VCihKw5XwYOlz6b8/QRY5mXK9GFZ254wvYYb
         NeUP9NcXkpxlo/wZQu08QOadA5Ro/RPwVG/Iu2drGkNr45tFhvCvoKoauwnhWFA4Nh
         e0R3YkYd3213mtYsPVkM7Ynoa3f2FZLlrrgK1Z6TtUrP4j7hByeC1Ei5DG31FkIm2+
         MgGJ2UguqqMwBRmnNmFv9/Ae71VDH7q2qN6mK52Qv3wApBWVKCwgtbJs35cAWk4rY6
         jXHJ4duDvUgzQ==
Date:   Wed, 15 Jun 2022 13:52:34 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
Message-ID: <YqpGknQvigfwZU6b@dev-arch.thelio-3990X>
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
 <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
 <CADnq5_OnrxUiM+aTWRLjixp=vY6adV3w4p2cfTkdS32uq_UsiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OnrxUiM+aTWRLjixp=vY6adV3w4p2cfTkdS32uq_UsiQ@mail.gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 15, 2022 at 04:45:16PM -0400, Alex Deucher wrote:
> On Wed, Jun 15, 2022 at 4:24 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Jun 15, 2022 at 03:28:52PM -0400, Alex Deucher wrote:
> > > On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > >
> > > >
> > > >
> > > > On 6/14/22 23:01, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20220614:
> > > > >
> > > >
> > > > on i386:
> > > > # CONFIG_DEBUG_FS is not set
> > > >
> > > >
> > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
> > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
> > > >   crtc_debugfs_init(crtc);
> > > >   ^~~~~~~~~~~~~~~~~
> > > >   amdgpu_debugfs_init
> > > >
> > > >
> > > > Full randconfig file is attached.
> > >
> > > I tried building with your config and I can't repro this.  As Harry
> > > noted, that function and the whole secure display feature depend on
> > > debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> > > drivers/gpu/drm/amd/display/Kconfig:
> > >
> > > > config DRM_AMD_SECURE_DISPLAY
> > > >         bool "Enable secure display support"
> > > >         default n
> > > >         depends on DEBUG_FS
> > > >         depends on DRM_AMD_DC_DCN
> > > >         help
> > > >             Choose this option if you want to
> > > >             support secure display
> > > >
> > > >             This option enables the calculation
> > > >             of crc of specific region via debugfs.
> > > >             Cooperate with specific DMCU FW.
> > >
> > > amdgpu_dm_crtc_late_register is guarded by
> > > CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> > > this.
> >
> > I think the problem is that you are not looking at the right tree.
> >
> > The kernel test robot reported [1] [2] this error is caused by commit
> > 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"), which
> > is in the drm-misc tree on the drm-misc-next branch. That change removes
> > the #ifdef around amdgpu_dm_crtc_late_register(), meaning that
> > crtc_debugfs_init() can be called without CONFIG_DRM_AMD_SECURE_DISPLAY
> > and CONFIG_DEBUG_FS.
> >
> >   $ git show -s --format='%h ("%s")'
> >   abf0ba5a34ea ("drm/bridge: it6505: Add missing CRYPTO_HASH dependency")
> >
> >   $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig
> >
> >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> >
> >   $ make -skj"$(nproc)" ARCH=x86_64 olddefconfig drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
> >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:9: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
> >    6622 |         crtc_debugfs_init(crtc);
> >         |         ^~~~~~~~~~~~~~~~~
> >         |         amdgpu_debugfs_init
> >   cc1: all warnings being treated as errors
> >
> > Contrast that with the current top of your tree:
> >
> >   $ git show -s --format='%h ("%s")'
> >   c435f61d0eb3 ("drm/amd/display: Drop unnecessary guard from DC resource")
> >
> >   $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig
> >
> >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> >
> >   $ make -skj"$(nproc)" ARCH=x86_64 olddefconfig drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> >
> >   $ echo $?
> >   0
> >
> > Randy's patch [3] seems like it should resolve the issue just fine but
> > it needs to be applied to drm-misc-next, not the amdgpu tree.
> 
> Thanks for tracking this down.  I think something like the attached
> patch is cleaner since the whole thing is only valid for debugfs.

Makes sense! I tested the below patch with and without DEBUG_FS and saw
no errors.

> From b0bcacd86344998e0ca757f89c6c4cd3b6298999 Mon Sep 17 00:00:00 2001
> From: Alex Deucher <alexander.deucher@amd.com>
> Date: Wed, 15 Jun 2022 16:40:39 -0400
> Subject: [PATCH] drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is not set
> 
> amdgpu_dm_crtc_late_register is only used when CONFIG_DEBUG_FS
> so make it dependent on that.
> 
> Fixes: 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c9004f7e700d..33cd7a3d4ecb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6594,12 +6594,14 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	return &state->base;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  {
>  	crtc_debugfs_init(crtc);
>  
>  	return 0;
>  }
> +#endif
>  
>  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>  {
> @@ -6693,7 +6695,9 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.enable_vblank = dm_enable_vblank,
>  	.disable_vblank = dm_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +#if defined(CONFIG_DEBUG_FS)
>  	.late_register = amdgpu_dm_crtc_late_register,
> +#endif
>  };
>  
>  static enum drm_connector_status
> -- 
> 2.35.3
> 

