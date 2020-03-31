Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE169199E73
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 20:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgCaS5v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 14:57:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45846 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726548AbgCaS5v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 14:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585681070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bjuPWfP4XM6yz96SvNfUrwVZXF7xkmhK3kaB303goaM=;
        b=Xz2IgbEeXhSId1NulgD4VHEdab+EjMgB9W/XiJ7ezJEkU/P2BdWlKgDHxWNxCcFc0mCWiI
        PMJIKKjdEx8bL4lKmvb9v+ymYVdWkX4GtklSbgywPGu3gdxMWGcoqV0ioFeFq616CKnZXB
        Zhfo2WjmA8Zq+5AA7IY/Bdz21awJql8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-5xkZZtfUPtSNSHKh6sooiw-1; Tue, 31 Mar 2020 14:57:49 -0400
X-MC-Unique: 5xkZZtfUPtSNSHKh6sooiw-1
Received: by mail-wm1-f70.google.com with SMTP id c21so1059042wmb.3
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bjuPWfP4XM6yz96SvNfUrwVZXF7xkmhK3kaB303goaM=;
        b=CcJHSJB5VM175fdxpBqg4fv+wiyecTye5jcWmHoMm0+ZpI9HK/msMT0Zhvp4gdKxjM
         O4Ra9mhH6zoi6mR2Jq93t2R20bh2Xk5pzmANXqsAbtNKTMBw7i0/OjsJBQB3xCsGRHPa
         IEGr8RY0BaYZPKUSboAYHRj5JAoQJwr3gnayo0Y0S64OyTX0S9Q6QzTELGB/7E8OO09r
         gcCEgoYx0unJlp2fcEqOsUXpVgvPMT9jAtv742Y/Ebtq0LD5Y0heZs6VwKzpsr4B0IF4
         2qsIYLSDuSd0FpGtnsJ5ThJacM6CXKPDmcdljjNxCZUC9BGz+nKlAijSUSR3SkHRm9fQ
         UIFg==
X-Gm-Message-State: ANhLgQ2JXf48KV8Es9Pe4lN9a4eETvApKcAMuG9RuICEGQfn4tGBysJz
        fSva6X7Ngf1gwQZpVglu+ZGnXkknL7lDwnDdiP9fgTnQQKlHSXI7t1quwlYr26umu1hoO8g+Cy7
        NJ3s3eX49ZfWs3h0IJQglBA==
X-Received: by 2002:adf:a549:: with SMTP id j9mr20849170wrb.183.1585681067704;
        Tue, 31 Mar 2020 11:57:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vumkiVUnoTFzxgxNV8v2tnIE0AdT7rk4DqQxWt81v0qN5/05onGh4L9duOpOsKKqaOy2HvO9w==
X-Received: by 2002:adf:a549:: with SMTP id j9mr20849150wrb.183.1585681067499;
        Tue, 31 Mar 2020 11:57:47 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id f13sm586160wrx.56.2020.03.31.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:57:46 -0700 (PDT)
Date:   Tue, 31 Mar 2020 14:57:43 -0400
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
Message-ID: <20200331145630-mutt-send-email-mst@kernel.org>
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


Oh wait a second:

obj-$(CONFIG_VIRTIO)            += virtio/

So CONFIG_VIRTIO=m and build does not even interate into drivers/virtio.





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

