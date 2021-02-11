Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D097318DAE
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 15:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBKOtZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 09:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25672 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230270AbhBKOjf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 09:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613054280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6igO6XgaSPtAkr1Q4t6ieb+tfoT4mSHvooUa+v1wqKg=;
        b=eOyWuurGXpPWTempsZsWekVeVtaUh6agWeOhvMOoIQyInvaqPbU51c/gbQZoGzxRtri2um
        H7MkWkwyFfw/L5W7D6ZgXsqVbecR29IqpMXiVtm7YWnXLwFLuzshxVp5zh7KmxMo2/3HL2
        LDYq9B4JCJ3tE37x5jZEi9JahCeuaxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-W3SDgpZXOpe9Qj4jqcG6KQ-1; Thu, 11 Feb 2021 09:37:58 -0500
X-MC-Unique: W3SDgpZXOpe9Qj4jqcG6KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A62B100A614;
        Thu, 11 Feb 2021 14:37:57 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E8BF160BF1;
        Thu, 11 Feb 2021 14:37:56 +0000 (UTC)
Date:   Thu, 11 Feb 2021 09:37:56 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alasdair G Kergon <agk@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Message-ID: <20210211143755.GA13067@redhat.com>
References: <20210211143655.5d736b71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211143655.5d736b71@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10 2021 at 10:36pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/dm-linear.c:234:3: error: 'struct target_type' has no member named 'report_zones'
>   234 |  .report_zones = linear_report_zones,
>       |   ^~~~~~~~~~~~
> drivers/md/dm-crypt.c:3585:3: error: 'struct target_type' has no member named 'report_zones'
>  3585 |  .report_zones = crypt_report_zones,
>       |   ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   7defd0da9dd2 ("dm: simplify target code conditional on CONFIG_BLK_DEV_ZONED")
> 
> The report_zones members existence is guarded by CONFIG_BLK_DEV_ZONED.
> 
> I have used the device-mapper tree from next-20210210 for today.

Sorry, I didn't test with CONFIG_BLK_DEV_ZONED disabled, now fixed.

Thanks,
Mike

