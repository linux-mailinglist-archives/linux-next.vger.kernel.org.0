Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D142CEB9E
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 11:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729673AbgLDKC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 05:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22451 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727096AbgLDKCz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 05:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607076089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XlvcJUka0tYhtcNhhsL+bNUMPIgts9pFj1H8hxUelvI=;
        b=ihVYhE8s09EB3m6V91ITxM62T/CQkcTfRS7oAszihlQ9w+jXxloHObdU7dJj2E+SL5Ww9p
        +OwC0ZqfKLpfLVOP1Dhk3jWod5O7SNfOujEzlgDfly8Pb8OVF9uwfhxHBiqeeAnSy6dLjr
        v8x182NqyMie+/9c7s/jSLWurqPZC4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-08q1DeYmMMWwk6PPLGRg6Q-1; Fri, 04 Dec 2020 05:01:27 -0500
X-MC-Unique: 08q1DeYmMMWwk6PPLGRg6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAE1180A086;
        Fri,  4 Dec 2020 10:01:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8ADA310021AA;
        Fri,  4 Dec 2020 10:01:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20201111172439.60d5a8f0@canb.auug.org.au>
References: <20201111172439.60d5a8f0@canb.auug.org.au> <20201021124733.344e5107@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus' tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93331.1607076081.1@warthog.procyon.org.uk>
Date:   Fri, 04 Dec 2020 10:01:21 +0000
Message-ID: <93332.1607076081@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Do you intend to keep this change?  If so, will you rebase it?

At the moment, I don't know.  It needs something like fsinfo() so that you can
retrieve the mount change counter in the event of an overrun - but adding it
to /proc/self/mountinfo is too heavy and too slow.

David

