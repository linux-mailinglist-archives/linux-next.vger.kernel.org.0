Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2332D43C34A
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 08:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240236AbhJ0Gxf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 02:53:35 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36333 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbhJ0GxY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 02:53:24 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MStGi-1mEZiQ1TSw-00UIcP; Wed, 27 Oct 2021 08:50:56 +0200
Received: by mail-wm1-f41.google.com with SMTP id g141so1576033wmg.4;
        Tue, 26 Oct 2021 23:50:56 -0700 (PDT)
X-Gm-Message-State: AOAM5315sX8q8D0bHqOZ8lCutvb8TNIda2OzDQfEskx5d8/aXt0wav5N
        2NdCEKSPKBfzjJ0JoOunFucPI6xp3FogYTXyw0g=
X-Google-Smtp-Source: ABdhPJwQCZU65OJ5le40ErfDG3lMpipzGPEQQiKR+5p4NqDSNXnQjgYl35DAhfFkrtD8UsNvlTNRmWPFObv6j8fyG5M=
X-Received: by 2002:a1c:4489:: with SMTP id r131mr3881742wma.1.1635317455940;
 Tue, 26 Oct 2021 23:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de> <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
 <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com> <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
In-Reply-To: <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Oct 2021 08:50:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
Message-ID: <CAK8P3a3v9mb8RH7ER=iF2SAizv-Sb=hTWzpuQzL050ToR02h+Q@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to `drm_gem_fb_get_obj'
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/wdbqaMbaUcedLStwdVAa3E1EvLdti19efzyYeksAGXDzXnervI
 skvUWmQlv01v7AWJ/l7LpaBUgnJEX94qNebKoEjA1LB6KySFhq8ScnGFy5X8mIJpepfWr3K
 mTBRO/RXdkmhiJC6EjUnkam6E58YDw/UJ2miS8t9EMMnQyUZ7wVTSOW8GRcwoq2qnSkkQVp
 Q9IVvmvqvric2g3FMzhpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:30n36qi69is=:uk8MoqmQEakoULKV6TvFWu
 K5HVJa8Ppyse5qrhXEQLxzwFxFLR4qFSj32sD2+L9alRfKKQvFk2Nw8pF8gTtFKEpScqBuUEi
 agnPHD/Lhgc7cNXcKxbFlBcSFExPUgx6rMaxbFi1loiKl68Z/Nc6wirPxopeKkRaqPA2qmOik
 Tj+ChavjDS/fma42zak1quzKmyTiaRFylfY0yWBBrHciwJT7vuHIf0LNPYR2gKvIdTfk8zRNz
 Sp5/ZuoY4DNLPDfwBQVEH9LN0L9ggeE0pzpTG4kKSqozC13jaUgQ9kKKrT/hyR9wSoYite4Kc
 gM36kE/Nwl6PfRejqAp3lNyvp4RgEmZDa9VJjTZLPgJM/Qw2PvDE83w3IF4JfbPlEqpuyPEFX
 EXnTBTgYtJuNMAUGrTfVg0SAaJaEF9JH26/HTtwSjwLLy3qD33BcmOAy7CXMhgFkjwnX+VqXf
 EdQHMsimgKGeSRDP1fBrB1vZz+86s0ZRTjngJsaYSdm/U925tuNVZJ8cWjo9gYqO3sQ2I1o49
 6b+l8suqIcpOUS+MRHgYWQHFPXp+njJukzI/EkpayB/lJ1vqOK1nxQb0VFWbFN8/urvC8KM7L
 f5/Kvy0GMPS3/tSgJ5MOG5S0eIYrZRWV4PxYvwrdLG1Fqml6kHU/zU9EuVFhGfYmogLe889Ki
 Aq+fpjyDHpnmbgDIllGCW385zusiwww3JDeRe8WfbnYXLjSw8MtwMpUX+8+35iS90EeRCJa+j
 gDGIuXj/JjjAPXQE27lA7mmgdly/cvkzOEt0ely4ow7L2SbhcCqoA98Lt1/7jKE2JmL0ntHFo
 uyS7dQqUHCNriTEbydbPU+nD1AUXNZq9I/sJJTgRACgzsNstOU=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 8:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/26/21 11:19 PM, Arnd Bergmann wrote:
> > On Wed, Oct 27, 2021 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> > This trivial change makes it all build:
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index c08860db2520..699f434ce813 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -218,7 +218,7 @@ config DRM_GEM_CMA_HELPER
> >            Choose this if you need the GEM CMA helper functions
> >
> >   config

> > -       bool
> > +       tristate
> >          depends on DRM
> >          select DRM_GEM_CMA_HELPER
> >          help
> >
> > but this needs some more testing to make sure it doesn't add
> > any other regressions.
> >
> > Interestingly, I never hit the problem in randconfig testing since
> > there is always some '=y' driver that selects DRM_KMS_HELPER.
>
> Thomas had posted a patch that also fixes the problem.
> Somehow I missed seeing that the first time around.

Ah right, I missed that as well. That patch seems reasonable
to me, but I think we may want both of them in this case, as
it does not address DRM_GEM_CMA_HELPER being set to =y
when it is only used from modules.

       Arnd
