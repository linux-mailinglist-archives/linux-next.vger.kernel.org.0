Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9EF28CC53
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbgJMLMt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 13 Oct 2020 07:12:49 -0400
Received: from aposti.net ([89.234.176.197]:58732 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729233AbgJMLMt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 07:12:49 -0400
Date:   Tue, 13 Oct 2020 13:12:32 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next@vger.kernel.org, Dave Airlie <airlied@linux.ie>
Message-Id: <WG05IQ.DABE5ILJAA631@crapouillou.net>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
        <20201008154202.175fbec7@canb.auug.org.au>
        <20201012152452.432c4867@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Le lun. 12 oct. 2020 à 15:24, Stephen Rothwell <sfr@canb.auug.org.au> 
a écrit :
> Hi all,
> 
> On Thu, 8 Oct 2020 15:42:02 +1100 Stephen Rothwell 
> <sfr@canb.auug.org.au> wrote:
>> 
>>  On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell 
>> <sfr@canb.auug.org.au> wrote:
>>  >
>>  > After merging the drm-misc tree, today's linux-next build (x86_64
>>  > allmodconfig) failed like this:
>> 
>>  In file included from include/linux/clk.h:13,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 
>> 'ingenic_drm_update_palette':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct 
>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean 
>> 'dma_hwdesc_f0'?
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:33: note: in definition of macro 
>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
>> __must_be_array(arr))
>>        |                                 ^~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct 
>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean 
>> 'dma_hwdesc_f0'?
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:48: note: in definition of macro 
>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
>> __must_be_array(arr))
>>        |                                                ^~~
>>  In file included from include/linux/bits.h:22,
>>                   from include/linux/bitops.h:5,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct 
>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean 
>> 'dma_hwdesc_f0'?
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro 
>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
>> int:(-!!(e)); })))
>>        |                                                             
>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro 
>> '__same_type'
>>    224 | #define __must_be_array(a) 
>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro 
>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
>> __must_be_array(arr))
>>        |                                                           
>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in 
>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct 
>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean 
>> 'dma_hwdesc_f0'?
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro 
>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
>> int:(-!!(e)); })))
>>        |                                                             
>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro 
>> '__same_type'
>>    224 | #define __must_be_array(a) 
>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro 
>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
>> __must_be_array(arr))
>>        |                                                           
>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in 
>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                  ^~~~~~~~~~
>>  include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' 
>> width not an integer constant
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
>> int:(-!!(e)); })))
>>        |                                                   ^
>>  include/linux/compiler.h:224:28: note: in expansion of macro 
>> 'BUILD_BUG_ON_ZERO'
>>    224 | #define __must_be_array(a) 
>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                            ^~~~~~~~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro 
>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
>> __must_be_array(arr))
>>        |                                                           
>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in 
>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); 
>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct 
>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean 
>> 'dma_hwdesc_f0'?
>>    453 |   priv->dma_hwdescs->palette[i] = color;
>>        |         ^~~~~~~~~~~
>>        |         dma_hwdesc_f0
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 
>> 'ingenic_drm_plane_atomic_update':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: 
>> 'crtc_state' undeclared (first use in this function); did you mean 
>> 'ctx_state'?
>>    467 |   crtc_state = state->crtc->state;
>>        |   ^~~~~~~~~~
>>        |   ctx_state
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each 
>> undeclared identifier is reported only once for each function it 
>> appears in
>>  At top level:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: 
>> 'ingenic_drm_update_palette' defined but not used [-Wunused-function]
>>    443 | static void ingenic_drm_update_palette(struct ingenic_drm 
>> *priv,
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>>  > I noticed that the ingenic driver revert I had been waiting for 
>> appeared
>>  > in hte drm-misc tree, so I removed the BROKEN dependency for it, 
>> but it
>>  > produced the above errors, so I have marked it BROKEN again.
> 
> Any progress on this?  I am still marking CONFIG_DRM_INGENIC as BROKEN
> in the drm and drm-misc trees.

It should be good now.

Cheers,
-Paul


