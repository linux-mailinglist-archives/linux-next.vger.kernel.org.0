Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD7722ED82
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 15:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgG0NgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 09:36:07 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58372 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728995AbgG0NgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 09:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595856963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qUgEH1K320HFXVyeiPJVVXjlGNJKxoO09QtGKl4Q8tg=;
        b=XWqRgd1jVnGoZbh8aaq1Zv+7HNOPTqJZsU8rqW1NLY1Ym+r8LUX0eECnTBPritilK/JZc3
        HGJMvzam9Joqm+ufic369GsWJIcSol5f+5Vpoko/CsdtEZOf6VzEKhzi7S3SL9tDP4HYqz
        ZA/exE/FDe7VZt0lLBm4Km/tuix7WaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-5g5K5XbrPlGQU-D9eMtoZQ-1; Mon, 27 Jul 2020 09:36:01 -0400
X-MC-Unique: 5g5K5XbrPlGQU-D9eMtoZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03721932489;
        Mon, 27 Jul 2020 13:36:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C7CB219D82;
        Mon, 27 Jul 2020 13:35:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200727224343.5f86c3c8@canb.auug.org.au>
References: <20200727224343.5f86c3c8@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: problem in the fsinfo tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2814644.1595856959.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 27 Jul 2020 14:35:59 +0100
Message-ID: <2814645.1595856959@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In rebasing commit
> =

>   348b039216fb ("fsinfo: Add fsinfo() syscall to query filesystem inform=
ation")
> =

> you forgot to update
> =

> arch/arm64/include/asm/unistd.h
> include/uapi/asm-generic/unistd.h =


Sorry about that, but it's a pain to do this manually.

David

