Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28753199E6C
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 20:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgCaSzt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 14:55:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39932 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726411AbgCaSzt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 14:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585680948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9N83ulIWUt944dVDEJ06AJzgWaetQqP5tl+Ibkm3ba4=;
        b=QAAKQtjvDh3RTnZKIPN02GKooMfetfZjO9Qa/Qbv6585QDsT2hNPch28vQn7t1DpeV5sz7
        Ws/T2i9shB983RK9ItLlSL6YeGsQXkVEtSUO5ezqhRiT1EHYXKPUEnNQlDG+rvQyr01bZJ
        0kWOWf2+1lKVd/4Fy/H0N97Nx6nG9PY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-q-QPj7McNfKmttNPbykDpg-1; Tue, 31 Mar 2020 14:55:46 -0400
X-MC-Unique: q-QPj7McNfKmttNPbykDpg-1
Received: by mail-wr1-f71.google.com with SMTP id f15so13453227wrt.4
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 11:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9N83ulIWUt944dVDEJ06AJzgWaetQqP5tl+Ibkm3ba4=;
        b=XHRFn+QFA+Jg6yjswY5Us03vp4/DqgXcJUAHKjxRIXGyjUgL9pfT3CWAobhCP5wtCn
         owRjjs8oM9Op8w5jpcvsMz8AjLA+M5gNOiyn2NwRUywIvqphN1Wu4O1kYqaselO7jFd7
         UTOjtF44hOltX5mG7MwPUD0TDSRQaV+1GJV21wytetMycep+CHixAZlWBhV3cgqKptNs
         +tq/nqigBmPTrXV1SJLDpJf3AhgTEo2d549dwOzILMsrn68xp1gwvoJIsFgb14tJy4WY
         MG0OeskSjDZPGm62yB4rmAbM1RAWQgAGBlZiRA77ws2VqEBjnmpvK5kRd7lUShii6uoy
         x4bw==
X-Gm-Message-State: AGi0PuYfPNeUdav8gvuCe75RooaNl7E+YQph7nP2Eoai2UetMG3Q9zKj
        tfS/mXR9ceULUxDDAjK2Ft0TpYiRRIZlCwCZim1dX341tjAAu72mxQm91SNgh/VvcgThxRi53Sm
        knG/atWP37oGK+WVqGrV2Vw==
X-Received: by 2002:a1c:82:: with SMTP id 124mr257858wma.63.1585680945318;
        Tue, 31 Mar 2020 11:55:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypIItSTAIpN2eJyUg/bKQdlRjERgE+twajxI2WUL+EtqTwGmwdqtCNM2ixY8sVPtXuyHJWpU4g==
X-Received: by 2002:a1c:82:: with SMTP id 124mr257825wma.63.1585680944950;
        Tue, 31 Mar 2020 11:55:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id y7sm30626556wrq.54.2020.03.31.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:55:44 -0700 (PDT)
Date:   Tue, 31 Mar 2020 14:55:41 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     akpm@linux-foundation.org, broonie@kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        virtualization@lists.linux-foundation.org,
        Jason Wang <jasowang@redhat.com>
Subject: Re: mmotm 2020-03-30-18-46 uploaded (VDPA + vhost)
Message-ID: <20200331144650-mutt-send-email-mst@kernel.org>
References: <20200331014748.ajL0G62jF%akpm@linux-foundation.org>
 <969cacf1-d420-223d-7cc7-5b1b2405ec2a@infradead.org>
 <20200331143437-mutt-send-email-mst@kernel.org>
 <9c03fee8-af1a-2035-b903-611a631094b0@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c03fee8-af1a-2035-b903-611a631094b0@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 31, 2020 at 11:42:47AM -0700, Randy Dunlap wrote:
> On 3/31/20 11:37 AM, Michael S. Tsirkin wrote:
> > On Tue, Mar 31, 2020 at 11:27:54AM -0700, Randy Dunlap wrote:
> >> On 3/30/20 6:47 PM, akpm@linux-foundation.org wrote:
> >>> The mm-of-the-moment snapshot 2020-03-30-18-46 has been uploaded to
> >>>
> >>>    http://www.ozlabs.org/~akpm/mmotm/
> >>>
> >>> mmotm-readme.txt says
> >>>
> >>> README for mm-of-the-moment:
> >>>
> >>> http://www.ozlabs.org/~akpm/mmotm/
> >>>
> >>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> >>> more than once a week.
> >>>
> >>> You will need quilt to apply these patches to the latest Linus release (5.x
> >>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> >>> http://ozlabs.org/~akpm/mmotm/series
> >>>
> >>> The file broken-out.tar.gz contains two datestamp files: .DATE and
> >>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> >>> followed by the base kernel version against which this patch series is to
> >>> be applied.
> >>>
> >>> This tree is partially included in linux-next.  To see which patches are
> >>> included in linux-next, consult the `series' file.  Only the patches
> >>> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
> >>> linux-next.
> >>>
> >>>
> >>> A full copy of the full kernel tree with the linux-next and mmotm patches
> >>> already applied is available through git within an hour of the mmotm
> >>> release.  Individual mmotm releases are tagged.  The master branch always
> >>> points to the latest release, so it's constantly rebasing.
> >>>
> >>> 	https://github.com/hnaz/linux-mm
> >>
> >> on i386:
> >>
> >> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_init':
> >> vdpa.c:(.init.text+0x52): undefined reference to `__vdpa_register_driver'
> >> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_exit':
> >> vdpa.c:(.exit.text+0x14): undefined reference to `vdpa_unregister_driver'
> >>
> >>
> >>
> >> drivers/virtio/vdpa/ is not being built. (confusing!)
> >>
> >> CONFIG_VIRTIO=m
> >> # CONFIG_VIRTIO_MENU is not set
> >> CONFIG_VDPA=y
> > 
> > Hmm. OK. Can't figure it out. CONFIG_VDPA is set why isn't
> > drivers/virtio/vdpa/ built?
> > we have:
> > 
> 
> Ack.  Hopefully Yamada-san can tell us what is happening here.


I reproduced this without difficulty btw, thanks for the report!


> > 
> > obj-$(CONFIG_VDPA) += vdpa/
> > 
> > and under that:
> > 
> > obj-$(CONFIG_VDPA) += vdpa.o
> > 
> > 
> >> CONFIG_VDPA_MENU=y
> >> # CONFIG_VDPA_SIM is not set
> >> CONFIG_VHOST_IOTLB=y
> >> CONFIG_VHOST_RING=m
> >> CONFIG_VHOST=y
> >> CONFIG_VHOST_SCSI=m
> >> CONFIG_VHOST_VDPA=y
> >>
> >> Full randconfig file is attached.
> >>
> >> (This same build failure happens with today's linux-next, Mar. 31.)
> >>
> >> @Yamada-san:  Is this a kbuild problem (or feature)?
> >>
> >> -- 
> >> ~Randy
> >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> 
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

