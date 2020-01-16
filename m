Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBFC13FACF
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 21:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387778AbgAPUrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 15:47:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34198 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729240AbgAPUrI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 15:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579207627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PYXAtEJYOQtjkDnF5DkvoZSl7mVZTmGYpTDJ/nVXngQ=;
        b=SWe8xpLhSsAs7kptnz8icxIs2bBLOx9GWgQkIEv7q2kUtEhjFge7XI/iOajv6CNAYsdkzB
        AOVxmISFJ7iCcbnTTXjmJAhhpphM8fo9xVpywjD/1gCQqzdd0Mo+pkc3UCvQM98CAFSrg1
        RddNJzm9SCsQ1J6tSJ7/Z+4qCFQIBZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-eQq9ErkMMim9P1MnvsC_Ag-1; Thu, 16 Jan 2020 15:47:04 -0500
X-MC-Unique: eQq9ErkMMim9P1MnvsC_Ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83357DB22;
        Thu, 16 Jan 2020 20:47:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com [10.10.120.52])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 583625C3F8;
        Thu, 16 Jan 2020 20:47:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200109132240.264728ef@canb.auug.org.au>
References: <20200109132240.264728ef@canb.auug.org.au> <20191212115901.221d8ba1@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failures after merge of the keys tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <20139.1579207619.1@warthog.procyon.org.uk>
Date:   Thu, 16 Jan 2020 20:47:00 +0000
Message-ID: <20140.1579207620@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Any ETA on when this tree will be updated?

That should be fixed now.

David

