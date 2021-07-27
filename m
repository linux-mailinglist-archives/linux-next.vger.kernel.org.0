Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1FB3D7262
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 11:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbhG0JyT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 05:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235990AbhG0JyS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jul 2021 05:54:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B63C061764
        for <linux-next@vger.kernel.org>; Tue, 27 Jul 2021 02:54:18 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m38-20020a05600c3b26b02902161fccabf1so1420561wms.2
        for <linux-next@vger.kernel.org>; Tue, 27 Jul 2021 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=beCJH86xLgh+PWnNDTz2W15pZAK6+7n66A1y132I0nI=;
        b=f7AFRSWhC09PBHv+qyLOMMDLZJ13+hH2by60JWMPPbV4z75ecfV1M6W1xDNrqmryQ1
         LjwmGYl9ZsrNuM5gb+ejAkOGbLCjv7NL2n4A7ecfBHkMu0P7unNSSQWnZUU3gL+7OKMP
         aNdN3zGa/6KNJYnA5+0uBll9QAHvb9wviXzcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=beCJH86xLgh+PWnNDTz2W15pZAK6+7n66A1y132I0nI=;
        b=KtGH5Rawqj0leQJgKdni2ha1uH7CjIGpjpKlZfLbOuuQyV25RAnoJern3CQXYu6O8A
         hRYSZoUJJSo3/VOkr9rQSaaGuFxvyFVDQJGpQbfZ0aw7rMbS+YJVG/lj/okXjuLiwIhV
         o5aciDMCpIfJ5TrZjslotTRMCBALINzKOPYd85osJRDM+Ej9IoJAW4ESqifZid8oG8ox
         9DK+skyNzaLzmqEkMX2pZY8+WsUPcTvdxDUKJ39o7ZBjCBEs3WIY+KPrk++6JZ+Y6V+8
         KEHj+IzvrDGfxjmcF6HyIjoNmXp8+26F2zfGS9VIVTKWke9zDO8rfdwDJqdnII12/Atf
         Ss/A==
X-Gm-Message-State: AOAM5300D//Z1frRXlXfN5XtzLTX4d6I8LPD5B8MktEArQvAy3epx+GU
        HntMh9eu6wYe2NPihqpKlveQLg==
X-Google-Smtp-Source: ABdhPJzEnmDDN+fwKw7zeJfkVh9bazThBixQhbCRCRYnNIf9WLciebF4U1y3nRTy0MnKsR1OZ/a2kA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr20626894wmj.80.1627379656560;
        Tue, 27 Jul 2021 02:54:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r18sm2664196wrt.96.2021.07.27.02.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 02:54:16 -0700 (PDT)
Date:   Tue, 27 Jul 2021 11:54:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] efi: sysfb_efi: fix build when EFI is not set
Message-ID: <YP/XxqHz83qBU4Sv@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
References: <20210727050447.7339-1-rdunlap@infradead.org>
 <aefba212-1e08-9994-6d6e-6db292bf9db6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aefba212-1e08-9994-6d6e-6db292bf9db6@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 27, 2021 at 11:15:36AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.07.21 um 07:04 schrieb Randy Dunlap:
> > When # CONFIG_EFI is not set, there are 2 definitions of
> > sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
> > and the __init function from sysfb_efi.c should not be used.
> > 
> > ../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of ‘sysfb_apply_efi_quirks’
> >   __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> >               ^~~~~~~~~~~~~~~~~~~~~~
> > In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
> > ../include/linux/sysfb.h:65:20: note: previous definition of ‘sysfb_apply_efi_quirks’ was here
> >   static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
> >                      ^~~~~~~~~~~~~~~~~~~~~~
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: linux-efi@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: linux-next@vger.kernel.org
> 
> Thanks for the patch. It should have a fixes line
> 
> > dim fixes 8633ef82f101c040427b57d4df7b706261420b94
> 
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup
> for all arches")

Added this and pushed to drm-next (because atm drm-next isn't in
linux-next because of this).

drm-next also has -rc3 backmerge for the nouveau fix, so I think a good
time to backmerge the entire pile into drm-misc-next?
-Daniel

> 
> 
> ... and maybe a few more of the CCs below
> 
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> 
> Cc: Borislav Petkov <bp@suse.de>
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> 
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Cc: John Stultz <john.stultz@linaro.org>
> 
> Cc: Colin Ian King <colin.king@canonical.com>
> 
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> 
> Cc: Maxime Ripard <maxime@cerno.tech>
> 
> Cc: linux-efi@vger.kernel.org
> 
> Cc: linux-riscv@lists.infradead.org
> 
> 
> Best regards
> Thomas
> 
> > ---
> >   drivers/firmware/efi/sysfb_efi.c |    2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > --- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
> > +++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
> > @@ -332,6 +332,7 @@ static const struct fwnode_operations ef
> >   	.add_links = efifb_add_links,
> >   };
> > +#ifdef CONFIG_EFI
> >   static struct fwnode_handle efifb_fwnode;
> >   __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> > @@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
> >   		pd->dev.fwnode = &efifb_fwnode;
> >   	}
> >   }
> > +#endif
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
