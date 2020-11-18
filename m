Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3552B8678
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 22:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgKRVUG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 16:20:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57789 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbgKRVUD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 16:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605734402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hPDK1qDHk8vljOAuMZiYLsolHOK0umGXtBlKfodHMLs=;
        b=c7+ZLFjy4evyrZpfqQqYfiE8xZ78hvQriqw39lRqLsqc3R763tduMr3Yuhl2/NjA8Rg9Kh
        bN1+h/3j3OOiZDIvSikCZQzSK0iW0OlNpRAFYO0ntJ3OypP9U5wW806AnoV29RHupw8cKS
        EA9jvFJGH/qU6vxJxbCvgb8hXXzGIJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-2mxtWGWANNq2FZaXljj6oQ-1; Wed, 18 Nov 2020 16:19:59 -0500
X-MC-Unique: 2mxtWGWANNq2FZaXljj6oQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E3A8143EB;
        Wed, 18 Nov 2020 21:19:58 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 548ED5C1A3;
        Wed, 18 Nov 2020 21:19:58 +0000 (UTC)
Date:   Wed, 18 Nov 2020 16:19:57 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alasdair G Kergon <agk@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 device-mapper tree
Message-ID: <20201118211957.GA2203@redhat.com>
References: <20201119074717.79d94aba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119074717.79d94aba@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18 2020 at  3:47pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   a1e4865b4dda ("dm writecache: remove BUG() and fail gracefully instead")
> 
> is missing a Signed-off-by from its author.

Thanks, because I went in a different direction on the code changes I
adjusted author via rebase in my local branch to be me.. but when I
pushed it, it reverted back to being Randy as author on the remote
branch. Turns out the rebase needed to be --continue'd.

Anyway, it should be all set now.

Thanks,
Mike

