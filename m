Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CB642A34F
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236268AbhJLLbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 07:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52584 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236265AbhJLLbj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Oct 2021 07:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634038177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+956HXQTjGs6a34u/u+/FjVYaM1e8zxxcd9Fx/dYps8=;
        b=S/dabcEG9ULECkofY7tOHVwcSkVlkRqm2uhSktU4itFX976xigSUvXK9QU0L4CGtdXbg1D
        AoOId0KxJrorPxCEEWmmCuS/sSrLQrPJ13QHRpA/wADi5KRqN67XcBlRoNzikQQoDVoaXz
        1QLOB8NYWrzS98aScxPO1pxf1bE5oH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-6ZyyM6cvMxWMn4E-AMMrDQ-1; Tue, 12 Oct 2021 07:29:36 -0400
X-MC-Unique: 6ZyyM6cvMxWMn4E-AMMrDQ-1
Received: by mail-wr1-f70.google.com with SMTP id r16-20020adfb1d0000000b00160bf8972ceso15501517wra.13
        for <linux-next@vger.kernel.org>; Tue, 12 Oct 2021 04:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+956HXQTjGs6a34u/u+/FjVYaM1e8zxxcd9Fx/dYps8=;
        b=2BSBJOaPhrGGDekRfdluPnw+n9IDRi+xwZRcw8UCNiKyBjZKJ5gAU02PhmVZh2D6Ht
         BwvIz7HogZfu1lslhvEzPuteLvA4T3QLcMuqX3du6l1Q0uRwXzhlJUaW+eVGoE8rW4Tr
         Vdy7UDNBasBxFTJTgJ2JZe52zV+2Kr44/YAR0j3f+8tIZXBm+/p4YxArSStccFf/Ssgs
         5p/cmSJl7D+mPi6bAMfVwumhsuKP5jmT9wPgNzgn1dIB2JOT/Av56Ircs4Ag8I+J20j/
         WEixaZsAwdpTsgF7xjdbZ82BtPSVym/3ppMu8ORXsT84AxXzLxVG3aS3lwcQCtukcWtu
         5ypg==
X-Gm-Message-State: AOAM533ZNIjXDkdziAEufScfNSt9MJYDEUs2n4MaIvIuIKRZn0z7gMXt
        AfWqtWSzx6JyInxp95VqtNoDCdZGdRIhnzQBYxo64T9URjm38QsFW6JiSEU+S3k2hj9alWolLe4
        BBdPByd2+uAvs1rHxGxFtigTH3uSSgWuZieOU6A==
X-Received: by 2002:a05:600c:284b:: with SMTP id r11mr4940982wmb.179.1634038174953;
        Tue, 12 Oct 2021 04:29:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSIW87MAnP/YGW/e3O+0hW0JLMaF3rLvNqNrNOXN3NYEhTe6teWlliWCUN6zZ66tm7KP2tKzRbb4aLIwOsxAQ=
X-Received: by 2002:a05:600c:284b:: with SMTP id r11mr4940959wmb.179.1634038174772;
 Tue, 12 Oct 2021 04:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211012131836.4e17a031@canb.auug.org.au>
In-Reply-To: <20211012131836.4e17a031@canb.auug.org.au>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Tue, 12 Oct 2021 13:29:24 +0200
Message-ID: <CACO55ttUA1nwFf0UP_+8q8f_baYey0+WwcwJvLMixFDv=RsncQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Luo penghao <luo.penghao@zte.com.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

uhh, that's on me. I will send out a patch today. I just noticed that
the config file I used for testing had WERROR disabled.

On Tue, Oct 12, 2021 at 4:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c: In function 'gp100_vmm_fault_cancel':
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:491:6: error: unused variable 'inst' [-Werror=unused-variable]
>   491 |  u32 inst, aper;
>       |      ^~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
>
> I have used the drm-misc tree from next-20211011 for today.
>
> --
> Cheers,
> Stephen Rothwell

