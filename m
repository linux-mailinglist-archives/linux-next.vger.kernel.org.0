Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CD13612DB
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 21:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234764AbhDOTVB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 15:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21260 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234505AbhDOTVB (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 15:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618514437;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0CvpRqi5jGMrmijnPGQZkntMS3EsXhFky90lDqKKQCU=;
        b=KsLsZzP8HJyIS88lT05ybKpCXsOhrISqeqGlNCQpbB/2I/h31Mrzu45W8SQXrobA5ClHZv
        0mGFV2eMdO0fFhYCDa0V3ymBGM/l2QCFtTd83f++1o/f756zCGvJc1HdZ1TIYiWM1Rv4pa
        VFnJ/K+PEjqPQRCII4tPHiI8ujkqdE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-6p05y1-QOHG4jhT6-4vN-A-1; Thu, 15 Apr 2021 15:20:35 -0400
X-MC-Unique: 6p05y1-QOHG4jhT6-4vN-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24F3E195D563;
        Thu, 15 Apr 2021 19:20:33 +0000 (UTC)
Received: from redhat.com (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 269B510013C1;
        Thu, 15 Apr 2021 19:20:29 +0000 (UTC)
Date:   Thu, 15 Apr 2021 13:20:29 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210415132029.3055578b@redhat.com>
In-Reply-To: <20210415130855.GR227011@ziepe.ca>
References: <20210415164734.1143f20d@canb.auug.org.au>
        <20210415130855.GR227011@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 15 Apr 2021 10:08:55 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Apr 15, 2021 at 04:47:34PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the vfio tree got a conflict in:
> > 
> >   drivers/gpu/drm/i915/gvt/gvt.c
> > 
> > between commit:
> > 
> >   9ff06c385300 ("drm/i915/gvt: Remove references to struct drm_device.pdev")
> > 
> > from the drm tree and commit:
> > 
> >   383987fd15ba ("vfio/gvt: Use mdev_get_type_group_id()")
> > 
> > from the vfio tree.
> > 
> > I fixed it up (I used the latter version) and can carry the fix as
> > necessary.  
> 
> Yes that is right, thank you

Yep, thanks!

Alex

