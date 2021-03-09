Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640F6332387
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 12:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhCILB7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 06:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38336 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229764AbhCILBo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2021 06:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615287703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bXofV3jLziu+Wp1oGfyC1i5xxFnpdDDe+U78h4D8xPA=;
        b=hDIMJz15sTZPXi3AdM8wUJEsLo8PQVvulxkGOVpl7XhnW2RyIbtjrn7om04waa7Zf/9V0U
        UdM6s5ObPpfXVHmPk4QBR50CbTjdBgU71OaikO131xrFXg+fvgN46ut9B4XnvJsNhwUfnl
        dwe+5HSKT8eYS/+i7MfGCajvaYuT0II=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-tDk8Vz-SOA-KA-YNG1dPpA-1; Tue, 09 Mar 2021 06:01:42 -0500
X-MC-Unique: tDk8Vz-SOA-KA-YNG1dPpA-1
Received: by mail-wr1-f72.google.com with SMTP id h21so6203992wrc.19
        for <linux-next@vger.kernel.org>; Tue, 09 Mar 2021 03:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bXofV3jLziu+Wp1oGfyC1i5xxFnpdDDe+U78h4D8xPA=;
        b=D+gg74Y0fkwFYL6fC8+E1lC/8MmXthkLaNUebsmsdPNSTAiwClUduUhTy5kR5ny1YU
         es+s+5w9O6PK1EgAUIoyZpqkolOd4dg+ovyBM9oFsICeD878vtje2ZX10LbqVR4TqNCc
         GFoov88NiF158NEhuBaE+1+/0wI5G6nnwigehYfrc9h+lnI0ogjV3+SBXnrCUmWqymRM
         bQSojPl/46WkLwR/eC+jbJSnvDHKgMPbpVFEU/Bs39vMm+E5XhjQ8JdQj/wxzz/NvoRy
         o7Gj+tOY79ldJhnfmtwOXzOPkQYOmzDzvRrtLaZ8/cIP9Yy03R7l5w9A0nk+9C4hVISX
         GqIA==
X-Gm-Message-State: AOAM532/MQATCS5d7GX/gUIlTJ/5dxqiKS1ywcvujj3P/ohXCZqlMyTY
        4/cdtnPXRNTy7Yaxi9Uyw/ZA1xNKpStP/bgxqYrh3ing5tC2ydSRVv37j7uoDD7Gn0778rj3sCO
        Zns0bxlN7GQF4OhoO3PhsnQ==
X-Received: by 2002:adf:b345:: with SMTP id k5mr28070298wrd.14.1615287700889;
        Tue, 09 Mar 2021 03:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzetu7r61ByxvgJmvUI/EaGQVn0vPKFr+ABH3NaEeH1/nQMdL0KzNm9JnWnn/K//S0NuROwHQ==
X-Received: by 2002:adf:b345:: with SMTP id k5mr28070175wrd.14.1615287699719;
        Tue, 09 Mar 2021 03:01:39 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
        by smtp.gmail.com with ESMTPSA id o188sm3661057wme.7.2021.03.09.03.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:01:38 -0800 (PST)
Date:   Tue, 9 Mar 2021 06:01:35 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Anton Yakovlev <anton.yakovlev@opensynergy.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vhost tree with the sound tree
Message-ID: <20210309060118-mutt-send-email-mst@kernel.org>
References: <20210309125833.0355a754@canb.auug.org.au>
 <s5heego3juz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5heego3juz.wl-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 09, 2021 at 07:46:12AM +0100, Takashi Iwai wrote:
> On Tue, 09 Mar 2021 02:58:33 +0100,
> Stephen Rothwell wrote:
> > 
> > Hi all,
> > 
> > Today's linux-next merge of the vhost tree got conflicts in:
> > 
> >   sound/virtio/virtio_card.c
> >   sound/virtio/virtio_card.h
> >   sound/virtio/virtio_ctl_msg.c
> >   sound/virtio/virtio_pcm.c
> >   sound/virtio/virtio_pcm.h
> >   sound/virtio/virtio_pcm_msg.c
> >   sound/virtio/virtio_pcm_ops.c
> > 
> > between commits:
> > 
> >   de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")
> >   9d45e514da88 ("ALSA: virtio: handling control messages")
> >   29b96bf50ba9 ("ALSA: virtio: build PCM devices and substream hardware descriptors")
> >   f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
> >   da76e9f3e43a ("ALSA: virtio: PCM substream operators")
> >   ca61a41f389c ("ALSA: virtio: introduce jack support")
> >   19325fedf245 ("ALSA: virtio: introduce PCM channel map support")
> >   575483e90a32 ("ALSA: virtio: introduce device suspend/resume support")
> > 
> > from the sound tree and commits:
> > 
> >   1e2fb08629e5 ("ALSA: virtio: add virtio sound driver")
> >   3fb7ce161568 ("ALSA: virtio: handling control messages")
> >   83ec5db56076 ("ALSA: virtio: build PCM devices and substream hardware descriptors")
> >   68742d8557b8 ("ALSA: virtio: handling control and I/O messages for the PCM device")
> >   def2208d373b ("ALSA: virtio: PCM substream operators")
> >   613515055d34 ("ALSA: virtio: introduce jack support")
> >   96db428c31f1 ("ALSA: virtio: introduce PCM channel map support")
> >   1f77f124f2f2 ("ALSA: virtio: introduce device suspend/resume support")
> > 
> > from the vhost tree.
> > 
> > I fixed it up (the sound tree commits have newer author dates, so I just
> > used them) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentioned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> 
> Michael, could you drop those?  These must be the old versions that
> contained lots of bugs.  As already announced, you can pull from my
> immutable branch, tagged virtio_snd-5.12-rc2, too.
> 
> Sorry for the mess!
> 
> 
> Takashi

Sorry I just didn't push to the next branch. Will do!

