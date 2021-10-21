Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83B436452
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 16:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhJUOfQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 10:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40813 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231182AbhJUOfP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Oct 2021 10:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634826779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7rR8a0k9p61N4cuN7JVGTN8csiyPr0i0gucFkqyfojU=;
        b=b/WI1lsCD5h7Q6FB6dhncUKosEr4jk0KW1iHRMoCkckoEzBEGFif1DdOBg8DkHUanKhTcj
        TpPmUfALMwVVl7CRuydq9qWttgszAKxt/SuPiM4krje0EUtGH9mCPoVW3bxqRwuFlXTXL+
        HFXY9MAcp+BJKMEvTm7t3OB7gteavdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-C0yCVtnjMnSHz3acnN5NxQ-1; Thu, 21 Oct 2021 10:32:57 -0400
X-MC-Unique: C0yCVtnjMnSHz3acnN5NxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 942441006AA3;
        Thu, 21 Oct 2021 14:32:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 89F2A5DEFB;
        Thu, 21 Oct 2021 14:32:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20211021122909.0346c093@canb.auug.org.au>
References: <20211021122909.0346c093@canb.auug.org.au> <20211005204613.53cbdfb9@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <738108.1634826774.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 21 Oct 2021 15:32:54 +0100
Message-ID: <738109.1634826774@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Documentation/filesystems/caching/backend-api.rst:402: WARNING: Inline=
 emphasis start-string without end-string.

I'm not sure what that even means.

David

