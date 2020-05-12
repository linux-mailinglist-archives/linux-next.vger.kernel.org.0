Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19D41D0307
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 01:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731639AbgELX1K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 19:27:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25255 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731638AbgELX1J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 19:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589326029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Jwf0m9BnuMuvkNFa9SkVWDit6CWYIgzZPGr3kQ5l/8=;
        b=I0T5EIB2cCxJNu2lwcr9USqL3P44uvn7NhGFKzRzYSQROBDl+171gBVyVfKhaOeBlr5eQ8
        MAaP1gFEC7MOJV00hTMzNpWprgpci9WMuuIKNgwEodefFfHKgGvri1yjxnKmmI4yJqF/o+
        0hThdLssRR0jk15xI4s/prguAk3ru8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-ScHSHAxdNSKtM63HvqTH5w-1; Tue, 12 May 2020 19:27:07 -0400
X-MC-Unique: ScHSHAxdNSKtM63HvqTH5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DEF0800687;
        Tue, 12 May 2020 23:27:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 88A5D610AF;
        Tue, 12 May 2020 23:27:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200512202226.79191a47@canb.auug.org.au>
References: <20200512202226.79191a47@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fsinfo tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2961055.1589326024.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 13 May 2020 00:27:04 +0100
Message-ID: <2961056.1589326024@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> samples/watch_queue/watch_test.c:107:21: warning: format '%llx' expects =
argument of type 'long long unsigned int', but argument 2 has type '__u64'=
 {aka 'long unsigned int'} [-Wformat=3D]

I wish we'd been consistent on how we'd defined __u64.  It needs a cast.

David

