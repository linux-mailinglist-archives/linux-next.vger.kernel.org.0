Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACB02E0C38
	for <lists+linux-next@lfdr.de>; Tue, 22 Dec 2020 15:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgLVOzK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 09:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33466 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727903AbgLVOzI (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Dec 2020 09:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608648822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eqMIkvTz7uu9Y4W+7+KTuA9zT7kqeu1yghivuXElVxY=;
        b=AnTlJ8iLzKCArnKAfgleyfDTWcgMkgxTWz7Uf13C+mc/yRf0jMUnK28rcb6Tf145ZXNp0f
        +Ecp8CT7yJm7racLxuRoBKKWXgOfjxu9jm1BPPPhZmLrys2GLz529izkbHIMdpCVakdGyA
        ddwX4qoGdekAu6qe96AY+xd3XMjVmVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-fH06cAeYNqitoxiEO983TA-1; Tue, 22 Dec 2020 09:53:37 -0500
X-MC-Unique: fH06cAeYNqitoxiEO983TA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 666E5800D62;
        Tue, 22 Dec 2020 14:53:36 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C21AC5D9CC;
        Tue, 22 Dec 2020 14:53:27 +0000 (UTC)
Date:   Tue, 22 Dec 2020 09:53:27 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
        dm-devel@redhat.com
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: DM's filesystem lookup in dm_get_dev_t() [was: Re: linux-next:
 manual merge of the device-mapper tree with Linus' tree]
Message-ID: <20201222145327.GC12885@redhat.com>
References: <20201222095056.7a5ac0a0@canb.auug.org.au>
 <20201222131528.GA29822@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222131528.GA29822@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[added linux-block and dm-devel, if someone replies to this email to
continue "proper discussion" _please_ at least drop sfr and linux-next
from Cc]

On Tue, Dec 22 2020 at  8:15am -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Mike, Hannes,
> 
> I think this patch is rather harmful.  Why does device mapper even
> mix file system path with a dev_t and all the other weird forms
> parsed by name_to_dev_t, which was supposed to be be for the early
> init code where no file system is available.

OK, I'll need to revisit (unless someone beats me to it) because this
could've easily been a blind-spot for me when the dm-init code went in.
Any dm-init specific enabling interface shouldn't be used by more
traditional DM interfaces.  So Hannes' change might be treating symptom
rather than the core problem (which would be better treated by factoring
out dm-init requirements for a name_to_dev_t()-like interface?).

DM has supported passing maj:min and blockdev names on DM table lines
forever... so we'll need to be very specific about where/why things
regressed.

> Can we please kick off a proper discussion for this on the linux-block
> list?

Sure, done. But I won't drive that discussion in the near-term. I need
to take some time off for a few weeks.

In the meantime I'll drop Hannes' patch for 5.11; I'm open to an
alternative fix that I'd pickup during 5.11-rcX.

Thanks,
Mike

