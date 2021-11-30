Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4E54631E2
	for <lists+linux-next@lfdr.de>; Tue, 30 Nov 2021 12:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbhK3LQj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Nov 2021 06:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43741 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232559AbhK3LQg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Nov 2021 06:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638270796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIyRTRMg45HHYybEiZyf82qXVtFuQ7XqWTL4S08Kt7w=;
        b=SoPH39l2Cx0X9zLSIpzlNImL09iE1VsB4zJk0uX9dWeJ+FJNxLPQalWf9/gFW0+7KBo3LX
        qQc22Gre0OKEH0VXYo+/byoYB4fFmJ2Qurc/PPTvPTTssO1sISnML587NYINE3QSqDPPOu
        HJl6/kcx3qUCt6lwweS+ihrQ40Vj47g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-jgfYVgWLN4KStYf-av9Yeg-1; Tue, 30 Nov 2021 06:13:15 -0500
X-MC-Unique: jgfYVgWLN4KStYf-av9Yeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FCBF83DD20;
        Tue, 30 Nov 2021 11:13:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 690BB60C13;
        Tue, 30 Nov 2021 11:13:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20211130162311.105fcfa5@canb.auug.org.au>
References: <20211130162311.105fcfa5@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <429231.1638270792.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 30 Nov 2021 11:13:12 +0000
Message-ID: <429232.1638270792@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Documentation/filesystems/caching/backend-api.rst:417: WARNING: undefine=
d label: documentation/filesystems/netfs_library.rst

That would be this line:

	See :ref:`Documentation/filesystems/netfs_library.rst` for a description.

I'm not sure what's supposed to be the right way to create an inter-doc
reference.  It does work, though - maybe the warning just needs to be remo=
ved?

David

