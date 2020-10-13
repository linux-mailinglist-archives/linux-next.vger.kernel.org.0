Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F129928D451
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 21:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732409AbgJMTU0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 15:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726987AbgJMTUZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 15:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602616823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qfa7lTzv6HC1EJIEQgqPGNiVrmVRQHZtPinf12Efayg=;
        b=CpsI3JLonTyJ22NCClwkR3j883O105X6Esau2qiXcLuwyyQxsL+W8WL0AEZniSR7d2QFtn
        VJTDliwHFg6xfMexSvZCpyns9bOkFf1MiieTMoM5kK6tPGcmWh3KNII6jJB3pqrRwz/yhf
        +t24PCZQOisa9nZPh2MIacMi5IyVq2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-RA8MA6fNPdS-h5kW_l4Kqg-1; Tue, 13 Oct 2020 15:20:20 -0400
X-MC-Unique: RA8MA6fNPdS-h5kW_l4Kqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7B81020901;
        Tue, 13 Oct 2020 19:20:17 +0000 (UTC)
Received: from w520.home (ovpn-113-35.phx2.redhat.com [10.3.113.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C960C76663;
        Tue, 13 Oct 2020 19:20:16 +0000 (UTC)
Date:   Tue, 13 Oct 2020 13:20:16 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Diana Craciun OSS <diana.craciun@oss.nxp.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <20201013132016.44af05f1@w520.home>
In-Reply-To: <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
References: <20201013140744.64937ecd@canb.auug.org.au>
        <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 13 Oct 2020 18:56:07 +0300
Diana Craciun OSS <diana.craciun@oss.nxp.com> wrote:

> Hi,
> 
> How does it fail? What's the error?
> 
> Thanks,
> Diana
> 
> 
> On 10/13/2020 6:07 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the vfio tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > 
> > Caused by commit
> > 
> >    cc0ee20bd969 ("vfio/fsl-mc: trigger an interrupt via eventfd")
> >    ac93ab2bf69a ("vfio/fsl-mc: Add support for device reset")
> > 
> > I have used the vfio tree from next-20201012 for today.

Thanks, Stephen.  Diana has posted a 32bit build fix which I've merged,
maybe that was the error.  Also Diana's series in my branch is currently
dependent on fsl-bus support in GregKH's char-misc-next branch.  Looking
at the log from the successful build, I wonder if our branches are just
in the wrong order (vfio/next processed on line 341, char-misc-next
processed on 387).  I don't know if you regularly re-order for this
sort of thing, otherwise it should work out when Greg's branch gets
merged, but testing sooner in next would be preferred.  Thanks,

Alex

