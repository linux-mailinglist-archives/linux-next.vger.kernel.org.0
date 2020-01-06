Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7341310D4
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 11:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgAFKup (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 05:50:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44624 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725787AbgAFKup (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 05:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578307842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qU0SboNEBDWBERvxqixCdqMTzHYQoyobKNvA/+6rjvk=;
        b=SHQAbBXjwM9JpzhLgaGwt7StvCGtb/Rm+1oaOxa4JXOo8dEXm/WRKCY5HYlRP2nnKxyVkz
        cZ4ZyYCx84zX8dGGM7c8604NmvN4mLbDn50ymsWLu8xfj6Lw61pXh2N21aRiA59eM5SE9i
        tUR8wkFDlWYundZcKHygvz0DP6R7Ft4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-POsXLtTRMU-4yN9YQpoiiA-1; Mon, 06 Jan 2020 05:50:41 -0500
X-MC-Unique: POsXLtTRMU-4yN9YQpoiiA-1
Received: by mail-qv1-f70.google.com with SMTP id z12so16086335qvk.14
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2020 02:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qU0SboNEBDWBERvxqixCdqMTzHYQoyobKNvA/+6rjvk=;
        b=r1fvNOCNGW8cPjPw37FwCGmxAkxWPQTpNMsf+RUKfsNlm88XOlQS8CIp5MXGZ/AB07
         /2iLaCN05sN9wryv1l0Y8G8Z8en4ta0Ri9oZPUlrm6z1FSUeYBwEFR7HhlZZKkDIGBHx
         /OHwopMe/u/4JyDEs67JcRZNbgKV3f39D/7hDzaX1+4g9Jp/XQ+3CpPf4CpDaJaynO/e
         xFQmtkVPVVwp/MbmSrlVsB6gQ1qYLY7cToa8EbWWuPkBsF3OsZo8nGdyWbbqVZ8x76pZ
         Ocb13C9LXtgP2U+XvdYUpeinF+pqQJuMymm/gf29UkPlFhqtAjWYnKRtNyBKXiPo5wKE
         XcBw==
X-Gm-Message-State: APjAAAVFgSZp2erJdOaYiMWLqCCIPR2hOUMVp5F+qzQXxwURfMc+Uqpw
        sEgHglBozHj3SjkCYmbInRWvLSE8arMFebjZNRw5jeMhNIEktuMk1JeZ/mlVb8BXIHAYpZBHgdQ
        AW5xhd3P8ag3ftsDTEaMTCw==
X-Received: by 2002:a37:65c7:: with SMTP id z190mr77575625qkb.261.1578307841387;
        Mon, 06 Jan 2020 02:50:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBMNWp3jpUCJz4gy7m1LfPpAYW3QX/zbzMI48HgZMdTtTpUk7nhqdKrFjR8fz3UtWCh133Iw==
X-Received: by 2002:a37:65c7:: with SMTP id z190mr77575606qkb.261.1578307841125;
        Mon, 06 Jan 2020 02:50:41 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
        by smtp.gmail.com with ESMTPSA id e2sm20313422qkb.112.2020.01.06.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 02:50:40 -0800 (PST)
Date:   Mon, 6 Jan 2020 05:50:34 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200106054041-mutt-send-email-mst@kernel.org>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 18, 2019 at 04:59:02PM +0100, Christian Borntraeger wrote:
> On 18.12.19 16:10, Michael S. Tsirkin wrote:
> > On Wed, Dec 18, 2019 at 03:43:43PM +0100, Christian Borntraeger wrote:
> >> Michael,
> >>
> >> with 
> >> commit db7286b100b503ef80612884453bed53d74c9a16 (refs/bisect/skip-db7286b100b503ef80612884453bed53d74c9a16)
> >>     vhost: use batched version by default
> >> plus
> >> commit 6bd262d5eafcdf8cdfae491e2e748e4e434dcda6 (HEAD, refs/bisect/bad)
> >>     Revert "vhost/net: add an option to test new code"
> >> to make things compile (your next tree is not easily bisectable, can you fix that as well?).
> > 
> > I'll try.
> > 
> >>
> >> I get random crashes in my s390 KVM guests after reboot.
> >> Reverting both patches together with commit decd9b8 "vhost: use vhost_desc instead of vhost_log" to
> >> make it compile again) on top of linux-next-1218 makes the problem go away.
> >>
> >> Looks like the batched version is not yet ready for prime time. Can you drop these patches until
> >> we have fixed the issues?
> >>
> >> Christian
> >>
> > 
> > Will do, thanks for letting me know.
> 
> I have confirmed with the initial reporter (internal test team) that <driver name='qemu'/> 
> with a known to be broken linux next kernel also fixes the problem, so it is really the
> vhost changes.

OK I'm back and trying to make it more bisectable.

I pushed a new tag "batch-v2".
It's same code but with this bisect should get more information.


I suspect one of the following:

commit 1414d7ee3d10d2ec2bc4ee652d1d90ec91da1c79
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Mon Oct 7 06:11:18 2019 -0400

    vhost: batching fetches
    
    With this patch applied, new and old code perform identically.
    
    Lots of extra optimizations are now possible, e.g.
    we can fetch multiple heads with copy_from/to_user now.
    We can get rid of maintaining the log array.  Etc etc.
    
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

commit 50297a8480b439efc5f3f23088cb2d90b799acef
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Wed Dec 11 12:19:26 2019 -0500

    vhost: use batched version by default
    
    As testing shows no performance change, switch to that now.
    
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


and would like to know which.

Thanks!


