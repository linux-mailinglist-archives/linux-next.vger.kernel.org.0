Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C98D1276C4
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 08:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLTHwS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 02:52:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43388 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725965AbfLTHwR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 02:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576828337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wLKXRULGZH0sb/CS1V/kZKKW3HDViEfspAbqsz1qu2E=;
        b=Kx7p+FA9WZH6578MmM6xbxPj0PQCNJVMtzIYtqB24x4uDN34LBGjVz9fMrI0+xG5H2Wc2k
        awTsRYbydFW9HoGC3+mQYIJfLsTYWVk/PqGgym19mqOJ1EU+pKQ2VuM/kAGtb/xef9Sq8M
        dIyosmqPS8UcFAcyUqsFFBO+I6LSrPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-1Zz298u1P3CricHjwXe8SQ-1; Fri, 20 Dec 2019 02:52:13 -0500
X-MC-Unique: 1Zz298u1P3CricHjwXe8SQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9B8107ACC5;
        Fri, 20 Dec 2019 07:52:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com [10.10.120.52])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0EFD60BF3;
        Fri, 20 Dec 2019 07:52:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20191220134539.38872256@canb.auug.org.au>
References: <20191220134539.38872256@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the keys tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17143.1576828329.1@warthog.procyon.org.uk>
Date:   Fri, 20 Dec 2019 07:52:09 +0000
Message-ID: <17144.1576828329@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I fixed it up (see below) and can carry the fix as necessary.

Um.  I don't see anything below.

David

