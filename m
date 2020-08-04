Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31FF23B683
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 10:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgHDIK0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 04:10:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45017 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726090AbgHDIK0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 04:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596528624;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VsjEcZFY41HjIzug4Auk9yvODlAjSkAecOahal1f2M0=;
        b=WmvoMseiajnOm/8Wtjb5WTDg48WOktZEvDtQWuEeCIT1ChWmx+qZj2xF34We18504syd/+
        PTzyx2bhrSDGsJBNsx7JFMF0iPbE+iq01+ziTXYshVmaRrgwDEL8N6T5cpbALTnUpsf9mG
        zcusLQrI5tPshYGySAN7aGQdwwSMDJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-dJ03uWRUM32rQeTI_pE7rw-1; Tue, 04 Aug 2020 04:10:22 -0400
X-MC-Unique: dJ03uWRUM32rQeTI_pE7rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C560102C802;
        Tue,  4 Aug 2020 08:10:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 29B5560CC0;
        Tue,  4 Aug 2020 08:10:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200804173456.01c819ea@canb.auug.org.au>
References: <20200804173456.01c819ea@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the fsinfo tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2010724.1596528619.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 04 Aug 2020 09:10:19 +0100
Message-ID: <2010725.1596528619@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the fsinfo tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
> =

> samples/vfs/test-mntinfo.c: In function 'display_mount':
> samples/vfs/test-mntinfo.c:146:19: warning: format '%llx' expects argume=
nt of type 'long long unsigned int', but argument 3 has type '__u64' {aka =
'long unsigned int'} [-Wformat=3D]
...

I've appended a patch for that.

David

