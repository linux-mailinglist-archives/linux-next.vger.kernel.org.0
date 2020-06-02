Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F541EC345
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgFBT4O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:56:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30215 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726267AbgFBT4O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 15:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591127772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ijUjB3nDcPzTThlkDRf6Xnf6Xz6m2xseyhEfJ9BQYz8=;
        b=VPVZvMBDsHaHiSsxvwOhkHh5V30ecXWcycZDWMCYOS3wpijg43xGFxjjxVDhefXusBUcFe
        ppb0VB/U+xe0aHAuasVXwNMI8eT8gLQN69AD6SH59+CXMLWzCYP1caR/+/lGR0XqscU2xg
        6flGJvPZwZU0bcQKShyAQndwmBCILYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Vj0tOdP-OnWViWrY5MWubg-1; Tue, 02 Jun 2020 15:56:10 -0400
X-MC-Unique: Vj0tOdP-OnWViWrY5MWubg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66A3E461;
        Tue,  2 Jun 2020 19:56:09 +0000 (UTC)
Received: from x1.home (ovpn-112-195.phx2.redhat.com [10.3.112.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E06DB78EFE;
        Tue,  2 Jun 2020 19:56:04 +0000 (UTC)
Date:   Tue, 2 Jun 2020 13:56:04 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Kirti Wankhede <kwankhede@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cornelia Huck <cohuck@redhat.com>, KVM <kvm@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 2 (vfio)
Message-ID: <20200602135604.21081784@x1.home>
In-Reply-To: <20200602091615.145e6f09@x1.home>
References: <20200602203737.6eec243f@canb.auug.org.au>
        <96573328-d6d6-8da2-e388-f448d461abb3@infradead.org>
        <20200602091615.145e6f09@x1.home>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2 Jun 2020 09:16:15 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue, 2 Jun 2020 07:36:45 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > On 6/2/20 3:37 AM, Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > News: The merge window has opened, so please do *not* add v5.9 material
> > > to your linux-next included branches until after v5.8-rc1 has been
> > > released.
> > > 
> > > Changes since 20200529:
> > >     
> > 
> > on i386:
> > 
> > ld: drivers/vfio/vfio_iommu_type1.o: in function `vfio_dma_populate_bitmap':
> > vfio_iommu_type1.c:(.text.unlikely+0x41): undefined reference to `__udivdi3'  
> 
> I think Kirti received a 0-day report on this.  Kirti, could you please
> post the fix you identified?  Thanks,

This should be resolved in the next refresh.  Thanks,

Alex

