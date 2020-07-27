Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B5E22ED85
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 15:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgG0Ngp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 09:36:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38793 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726298AbgG0Ngp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 09:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595857004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8D67ol3aJBpMshrqkN6iSV7ca0jH4mAuZgj7ZHwQHi4=;
        b=DjUMmeNFd4r0vXcloI+g01WyrZoFNMU0YZ3Xu6uKkCuzUq3E+6/Xe6bZxS8rJ8bsZtzNpu
        kE8zXcsoeocNpd5XUIVW/6wmRvNOn32Vv7GJaVTsRgN+1SN4FSPDVUXCT1p/7L4h5yIO/F
        07i7awKSO7cHGGGOze1dXxH2rY8IhCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-sUa4tk6JNR63pW1PtrxTuw-1; Mon, 27 Jul 2020 09:36:41 -0400
X-MC-Unique: sUa4tk6JNR63pW1PtrxTuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53EA91932482;
        Mon, 27 Jul 2020 13:36:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E97B5C1B2;
        Mon, 27 Jul 2020 13:36:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200727224626.463ffeaf@canb.auug.org.au>
References: <20200727224626.463ffeaf@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the fsinfo tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2814723.1595856998.1@warthog.procyon.org.uk>
Date:   Mon, 27 Jul 2020 14:36:38 +0100
Message-ID: <2814724.1595856998@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> The notificiations tree has been rebased to remove a new syscall and
> the fsinfo tree rebased on top of that, so the syscall numbers have all
> changed again :-(

Would it make it easier it if I just left a hole for the syscall I dropped for
the moment?

David

