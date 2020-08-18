Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D536C248063
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 10:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRITa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 04:19:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29321 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726519AbgHRIT1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Aug 2020 04:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597738766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u5BW4sttAkWqGg8PlkiSb/wzvzki2Fh+MHof6eikw/c=;
        b=IflrO10lhZ64dzPVvN6Gg1KAlsPPxIhS2/bvBAuliWqHYGt0GRdVII28TGydxUCOUiB1NF
        txlcz0ouBGrFYAamMwa7706MRwzZNHM5BRe0CAuuJTiR9g/hAUUejAoZQ/+fudBUF+KEsi
        nsQWCTVA0bF2WXbY0GTmg4av7XqoxpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-9aejwH2JN_etFEeUIAm9LA-1; Tue, 18 Aug 2020 04:19:22 -0400
X-MC-Unique: 9aejwH2JN_etFEeUIAm9LA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D65E281F012;
        Tue, 18 Aug 2020 08:19:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-127.rdu2.redhat.com [10.10.120.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A810C7A1E6;
        Tue, 18 Aug 2020 08:19:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200817090523.68692855@canb.auug.org.au>
References: <20200817090523.68692855@canb.auug.org.au> <20200805163246.4df09c31@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Masahiro Yamada <masahiroy@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fsinfo tree with the kbuid tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2193239.1597738758.1@warthog.procyon.org.uk>
Date:   Tue, 18 Aug 2020 09:19:18 +0100
Message-ID: <2193240.1597738758@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> This is now a conflict between the fsinfo tree and Linus' tree.

Please drop the fsinfo branch for now, thanks.

David

