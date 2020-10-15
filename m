Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6786628EB18
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 04:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgJOCWH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 22:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47545 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728783AbgJOCWH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 22:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602728526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J/rdXiVwQj4qh66dMeXPVt6rZ8o/93caEQWqzhTliRc=;
        b=L9B9pgUAqfdsN3DjwPiDJSNjoWY8ktB6A51j1oZ8FMcoF7UMRNmhoOlTwHzl9VjqdF43Ys
        cQywqCsitBDhniUEkxvnJ38stR1N11od67xEjLZ6RGcJMtSq3wFKNiV7GHsodp40ew/IIR
        Z6Iw3cKyuWN1Q8xV4pC3TEMm++o8Pl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-eP8fC6a9OduXYYDsMD9O6g-1; Wed, 14 Oct 2020 22:22:01 -0400
X-MC-Unique: eP8fC6a9OduXYYDsMD9O6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8F0856BF2;
        Thu, 15 Oct 2020 02:21:59 +0000 (UTC)
Received: from x1.home (ovpn-113-35.phx2.redhat.com [10.3.113.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A84C5C1BD;
        Thu, 15 Oct 2020 02:21:59 +0000 (UTC)
Date:   Wed, 14 Oct 2020 20:21:58 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Diana Craciun OSS <diana.craciun@oss.nxp.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <20201014202158.4d1725dc@x1.home>
In-Reply-To: <20201015115903.3399b116@canb.auug.org.au>
References: <20201013140744.64937ecd@canb.auug.org.au>
        <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
        <20201013132016.44af05f1@w520.home>
        <20201015115903.3399b116@canb.auug.org.au>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 15 Oct 2020 11:59:03 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alex,
> 
> On Tue, 13 Oct 2020 13:20:16 -0600 Alex Williamson <alex.williamson@redhat.com> wrote:
> >
> > Thanks, Stephen.  Diana has posted a 32bit build fix which I've merged,
> > maybe that was the error.  Also Diana's series in my branch is currently
> > dependent on fsl-bus support in GregKH's char-misc-next branch.  Looking
> > at the log from the successful build, I wonder if our branches are just
> > in the wrong order (vfio/next processed on line 341, char-misc-next
> > processed on 387).  I don't know if you regularly re-order for this
> > sort of thing, otherwise it should work out when Greg's branch gets
> > merged, but testing sooner in next would be preferred.  
> 
> I have put the vfio tree after the char-misc tree today (so hopefully
> it will build).  The proper way to do this is for you and Greg to have
> a shared branch with the commits you both depend on and bot merge that
> branch.  That way, it doesn't matter what order the tress are merged
> (by me or Linus).

Hi Stephen,

Well that seems like the obviously correct solution in retrospect ;)
thanks for the explanation.  I'll check-in with Greg to see if his pull
request is imminent or we can share a branch.  Thanks,

Alex

