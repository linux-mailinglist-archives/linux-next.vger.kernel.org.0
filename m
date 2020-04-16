Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E781AC148
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 14:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635615AbgDPMch (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 08:32:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20381 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635605AbgDPMcc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 08:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587040350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0VyMwAzowexFZjgtgFRovq2sXpLz94EE6LhxQbSKU6M=;
        b=IaBPxtqJ4C1CzKSwVa0zZdUBWZSN5kHjlwu5CadcFacKuPa/kpHceIygcH2S4ombn+o6CF
        Q19omQ/PYVtKY5l07PfBsbuYRFneUnmKP25AtxPRgKbdJIF432KylwGayVDTu6+vg8pDXn
        ijNRJiVt+Yd5Av8yY+c9vxq0bwXDgaU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-ldXRPMbQPnK60V9ve7TTiw-1; Thu, 16 Apr 2020 08:32:29 -0400
X-MC-Unique: ldXRPMbQPnK60V9ve7TTiw-1
Received: by mail-wr1-f72.google.com with SMTP id v14so1632093wrq.13
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0VyMwAzowexFZjgtgFRovq2sXpLz94EE6LhxQbSKU6M=;
        b=nlDkwG+XClndxquWJkwpdqAbtl9BVLRGOMaEKdYzycZ5u6chMMDl4uIcN0Iq7L4RpC
         qDxniSw10WyQL/0o5hU2p9NtCcFBIKCDp/hR3d9tWCJsGW1w/7q08uDrUra4bKQl5y1x
         M5hlMcH8PLi3Hk1m4MdsFBA0FIdwq7mJdM8acCO5goQYYISwzqusu91aYloHUvSqoX38
         v0UiZqY+M/ghobKbgqrsFKk035X6P/2+Eq9ykJ84RWWGOmLk5S5fHXFT7XkGhxXFd9dx
         YaGS4mPXvHkFhUah0RROkqOfKmUt5RukMHHZifNMiRWzA17K92bS3asU8dzD5wYsbJs3
         /P2w==
X-Gm-Message-State: AGi0PuauTVOkAZQIrpzZlZpYuBUyc14IuaLe1hsRjh5jRGjn53GAHqAK
        B4JpnAqyMoyO8QuCeevPp8BP/0mK2NadfbSjlDXwPXXtlRusnVr1dMDmD8yUQGxqU6sNkjdSEA6
        FM4v4i4ejKIivFoeJQfwgGA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr30558900wri.385.1587040348033;
        Thu, 16 Apr 2020 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfoJajvWS7IEEc1sc0ClwIXFD0DzNYfYWsVh5RONPu0C09BwqAJcBPfglPDU6iaP06YIqewA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr30558886wri.385.1587040347864;
        Thu, 16 Apr 2020 05:32:27 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id p10sm26656903wrm.6.2020.04.16.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:32:27 -0700 (PDT)
Date:   Thu, 16 Apr 2020 08:32:24 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: linux-next: Tree for Apr 15 (vdpa)
Message-ID: <20200416082248-mutt-send-email-mst@kernel.org>
References: <20200415152240.2422e06c@canb.auug.org.au>
 <620e1646-5899-a077-b9de-95443887364d@infradead.org>
 <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 16, 2020 at 12:07:06PM +0800, Jason Wang wrote:
> 
> On 2020/4/16 上午12:16, Randy Dunlap wrote:
> > On 4/14/20 10:22 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200414:
> > > 
> > on x86_64:
> > 
> > ERROR: modpost: "vringh_set_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > ERROR: modpost: "vringh_init_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > ERROR: modpost: "vringh_iov_push_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > ERROR: modpost: "vringh_iov_pull_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > ERROR: modpost: "vringh_complete_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > ERROR: modpost: "vringh_getdesc_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
> > 
> > 
> > Full randconfig file is attached.
> > 
> 
> The config has
> 
> CONFIG_VHOST_IOTLB=m
> CONFIG_VHOST_RING=y
> 
> But we don't select VHOST_IOTLB in VHOST_RING after commit
> e6faeaa128417("vhost: drop vring dependency on iotlb"). Which seems wrong.
> 
> Thanks

Well selecting IOTLB from ring breaks configs which don't need IOTLB.

Legal configurations are:

CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=n

CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=n

CONFIG_VHOST_IOTLB=n
CONFIG_VHOST_RING=n

CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y

CONFIG_VHOST_IOTLB=n
CONFIG_VHOST_RING=y

CONFIG_VHOST_IOTLB=n
CONFIG_VHOST_RING=m

CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=m

CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=m


So VHOST_RING=y and VHOST_IOTLB=m is the only illegal one.


-- 
MST

