Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 221681A0A80
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 11:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgDGJy4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 05:54:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50102 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728093AbgDGJy4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 05:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586253295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=el11Oz/pQuOVMF2uMBXTZlpAn+Yh+0JzX31amVwM/8s=;
        b=Jtp/Mwll/Gsl1jMoZG5jyCTS3jOHIdx3zsvd3Bo39OTTiyLz37Sz2Ki6Ugg7xeDyaBtlz8
        s4QCzWwAwlQW5rpqjG4wi9BTK9Ly7tgY4yUAf9yaBB+IkspLqEUQXxzb4+0Sf+W6sDePap
        a6j6pmow4BNjYU8uUcZJpQjspcx4So8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-ywAMdtiQMyKl0RNWlU9LgA-1; Tue, 07 Apr 2020 05:54:54 -0400
X-MC-Unique: ywAMdtiQMyKl0RNWlU9LgA-1
Received: by mail-wm1-f71.google.com with SMTP id a4so494828wmb.3
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2020 02:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=el11Oz/pQuOVMF2uMBXTZlpAn+Yh+0JzX31amVwM/8s=;
        b=IA4O6PWwEuYqAay0X6t4FxPAhRZzfe64iVNH8j2DhgYHMK84B+UtS4p0fa6X2Bf4So
         BTjMXFuHiWT1g//A7mebaSAIMTHV+Chlfhn1DNef7eYkjhRAtGRFqZvISRS8CTvfM23s
         KCEToFcguIEVs2tHQ9ducvj1xBNhVav5FPtL+16aSXY93vV8FGdI47xw97gK9tDF9KMT
         17skRWq1iYPcm0K8rcn4KWcPGCaVV26S76loQkKwoqIaYM7Klze1u7uDAKHtpCJ4FLQM
         tAe114G63k4dHu9fkMYe6g1o5WMyt0n/b0/aMIOA2ZZxgc8xur/Pa0m2GWJtpwKPEZK1
         abjw==
X-Gm-Message-State: AGi0PuZeL3qKDrs0Kk/hiR3Hs5DxVJucrBY8nIhPBpEO4u6JFODY5F/X
        o0l1kpmhy5z+vG4uP7veNLf74oZneAGMKrNRiCBxjrmzMiQsjlfkSvn6xS9EmcYopyqS2lnlDko
        JBeWkc+D/OcweDdn1jXg5qA==
X-Received: by 2002:adf:b6a9:: with SMTP id j41mr1857790wre.70.1586253292984;
        Tue, 07 Apr 2020 02:54:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypL4AzzGuCb+/SPuBeTLQChENkJSntsNvAOSf15+PWge49hAPyo9lPsh2y5yXRV3JLlzDNv2+g==
X-Received: by 2002:adf:b6a9:: with SMTP id j41mr1857768wre.70.1586253292819;
        Tue, 07 Apr 2020 02:54:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id t81sm1629697wmb.15.2020.04.07.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 02:54:52 -0700 (PDT)
Date:   Tue, 7 Apr 2020 05:54:49 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Message-ID: <20200407055243-mutt-send-email-mst@kernel.org>
References: <20200330193137.44fd70c9@canb.auug.org.au>
 <20200407132521.656db6fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407132521.656db6fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 07, 2020 at 01:25:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 30 Mar 2020 19:31:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   drivers/virtio/virtio_balloon.c
> > 
> > between commit:
> > 
> >   5a6b4cc5b7a1 ("virtio-balloon: Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM")
> > 
> > from the vhost tree and commits:
> > 
> >   5193acb63eef ("virtio-balloon: pull page poisoning config out of free page hinting")o
> >   226d0484a676 ("virtio-balloon: add support for providing free page reports to host")
> >   49006aae9e94 ("virtio-balloon: switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM")
> > 
> > from the akpm-current tree.
> > 
> > OK, this is such a mess that all I could do was to revert commit
> > 5a6b4cc5b7a1 from the vhost tree and keep all the akpm-current tree
> > patches. Please sort this out before Linus gets to see it.
> 
> I am still reverting that commit ...

Oh. Thanks for reminding me. And I sent a pull with this :(
Sorry.  I pushed the revert now and sent PULL request v2.
Hope I did it in time ...

> -- 
> Cheers,
> Stephen Rothwell


