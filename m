Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C032B634FAF
	for <lists+linux-next@lfdr.de>; Wed, 23 Nov 2022 06:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiKWFhB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Nov 2022 00:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFhB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Nov 2022 00:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B2A82233
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 21:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669181765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fm2z95zFBkrJo+OG+cEbfJqfzc4sPwppotEwP4eeDhQ=;
        b=N7kLE4VeS8QFm7mjblaBNzsXSLk1iVJZDGGN8cJC9GArIkWEmUpSJYGrvUhru3qAPPwynI
        Bb/R1S5m4rXoKeoJ+aLt7R5u8qNYFzV2k1JeFXoSqZ7bZGyfnr+Z+dx/qC3s7O2RPKzyq9
        j/QegTqWk1F/qw0PMFxRdv/TK4/hpCU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-2w3uVp7oOmmJJjNOEJ5CMw-1; Wed, 23 Nov 2022 00:36:03 -0500
X-MC-Unique: 2w3uVp7oOmmJJjNOEJ5CMw-1
Received: by mail-lj1-f199.google.com with SMTP id bn17-20020a05651c179100b0027905fa8e48so5041593ljb.15
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 21:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm2z95zFBkrJo+OG+cEbfJqfzc4sPwppotEwP4eeDhQ=;
        b=jSxEzTLmuXka1O70hJeV7EDnyUexn2Zm87lfByRO8I7bAsSrZtLmKChkfW8CdlfqyE
         X533trffU8wKKaWm5fZE70dykE2i0dRVsAQuDMVDkuJtUrlKsdYOXVuAkOzUKkJ185VU
         37vlOaPy3B2sZ6FJjVMq7ko187mAeWC9nFa/rDtCYwWm5J9FAZgCdvWZ1v8ezC9W7boj
         v5mwuEprmZNhmzOo+zm9l8NUMc9N25yZmKfteboHUbWHUgQY6+4AYH6fckbRbvhsp4To
         ddgUTggR/ydecOiEZwNI03sN7Lv6tk/Kr8KexjO46RMZZMMfKAN+SBVJrFwrjzZZ8WRq
         gsFg==
X-Gm-Message-State: ANoB5plujyJPZe6qbPRsXRjWEKheyiUp1kO7xCDSnCcqUCEXQDCci7xI
        GnfC8BUyIajR5PYjfXKNTkRG5v1q1diiHDe1gxD58kgHwHqQJZWXE8frrFHRrJDyhZ9T2fBvKvP
        Mio1do4w2hCeVvljz9FI6zmXQHzr6IrG+xAq6HA==
X-Received: by 2002:ac2:5921:0:b0:4b3:cdf5:93f3 with SMTP id v1-20020ac25921000000b004b3cdf593f3mr8507175lfi.99.1669181762528;
        Tue, 22 Nov 2022 21:36:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7EmAdgaB8z6/XlFfL3GYcrmaPlXFkV2QFwJYrqaxkfAnHDIeaFh8pRTCR3xvg4c2PyDsw5HZNh73j3bDrQq70=
X-Received: by 2002:ac2:5921:0:b0:4b3:cdf5:93f3 with SMTP id
 v1-20020ac25921000000b004b3cdf593f3mr8507165lfi.99.1669181762300; Tue, 22 Nov
 2022 21:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20221117183214.2473e745@canb.auug.org.au> <20221123162033.02910a5a@canb.auug.org.au>
In-Reply-To: <20221123162033.02910a5a@canb.auug.org.au>
From:   David Airlie <airlied@redhat.com>
Date:   Wed, 23 Nov 2022 15:35:50 +1000
Message-ID: <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 23, 2022 at 3:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 17 Nov 2022 18:32:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >
> > ld: drivers/video/fbdev/core/fbmon.o: in function `fb_modesetting_disabled':
> > fbmon.c:(.text+0x1e4): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbcmap.o: in function `fb_modesetting_disabled':
> > fbcmap.c:(.text+0x478): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbsysfs.o: in function `fb_modesetting_disabled':
> > fbsysfs.c:(.text+0xb64): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/modedb.o: in function `fb_modesetting_disabled':
> > modedb.c:(.text+0x129c): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbcvt.o: in function `fb_modesetting_disabled':
> > fbcvt.c:(.text+0x0): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> >
> > Caused by commit
> >
> >   0ba2fa8cbd29 ("fbdev: Add support for the nomodeset kernel parameter")
> >
> > This build does not have CONFIG_VIDEO_NOMODESET set.
> >
> > I applied the following patch for today.
> >
> > From 63f957a050c62478ed1348c5b204bc65c68df4d7 Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 17 Nov 2022 18:19:22 +1100
> > Subject: [PATCH] fix up for "fbdev: Add support for the nomodeset kernel parameter"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  include/linux/fb.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 3a822e4357b1..ea421724f733 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -807,7 +807,7 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
> >  #if defined(CONFIG_VIDEO_NOMODESET)
> >  bool fb_modesetting_disabled(const char *drvname);
> >  #else
> > -bool fb_modesetting_disabled(const char *drvname)
> > +static inline bool fb_modesetting_disabled(const char *drvname)
> >  {
> >       return false;
> >  }
> > --
> > 2.35.1
>
> This commit went away for a couple of linux-next releases, but now has
> reappeared in the drm tree :-(  What went wrong?

Nothing gone wrong as such, just the drm-misc-next pull request was
sent on a regular weekly cadence, then I merged it a few days later.
The fix for this is still in the drm-misc-next queue for the next PR
which I will get this week.

Dave.

