Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6D432BB6C
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhCCMYz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23351 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1575634AbhCBWuW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 17:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614725332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0Jhx9CWMX6eV8IRnARb9NZKuvwk/xzmCaFzQ1tALA8U=;
        b=HDuYIE93v8xhFxEwhnb6P7hFF7NZRFH0ravI+mLvtbGM5CaQhOeItEzlBjLE/WudersXtW
        25/YBUhd8AKA/yiGWKJ6CVtRlnmeuRIEaIgHjzCqjXSvJT6SPYA/CKD1pJfw7MEr2LFwLO
        Z2GjoZsQG0YHMo5zGSsDcUa/tUIwayc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Af-lyMbUM7GNPxJvVLykTw-1; Tue, 02 Mar 2021 17:48:48 -0500
X-MC-Unique: Af-lyMbUM7GNPxJvVLykTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54B828030D4;
        Tue,  2 Mar 2021 22:48:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 67A156F7E5;
        Tue,  2 Mar 2021 22:48:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210303091608.0ad071f8@canb.auug.org.au>
References: <20210303091608.0ad071f8@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1979125.1614725323.1@warthog.procyon.org.uk>
Date:   Tue, 02 Mar 2021 22:48:43 +0000
Message-ID: <1979126.1614725323@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the fscache tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/afs/file.c: In function 'afs_req_issue_op':
> fs/afs/file.c:291:6: warning: unused variable 'ret' [-Wunused-variable]
>   291 |  int ret;
>       |      ^~~
> 
> Introduced by commit
> 
>   799fbdf96cd5 ("afs: Use new fscache read helper API")

I've updated my branch to remove the variable.

David

