Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B6B44276A
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 08:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKBHGs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 03:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28342 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230015AbhKBHGr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 03:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635836653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uwe6Im3+/C2CeP/app36OOxG3mb9S7+W5YEuat7D8xk=;
        b=cglS8PpTskdF/aab4IQjIGKkQkzexL/631XOao3LC0EtRchoeczof1hegG/SAGod3XNwXV
        I17siWx+WU/LFNNlEIr0g6xjah6WIPXknYdLXSX2s13Ndkk7np0vX2r01tkwg7eFOisGB9
        bizfmmszMObGfJNldytEQg+6/OWwesw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-Uflqv8ODMQCSZp2YZnz36Q-1; Tue, 02 Nov 2021 03:04:10 -0400
X-MC-Unique: Uflqv8ODMQCSZp2YZnz36Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05185802682;
        Tue,  2 Nov 2021 07:04:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E312860C05;
        Tue,  2 Nov 2021 07:04:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20211102090749.009f42b3@canb.auug.org.au>
References: <20211102090749.009f42b3@canb.auug.org.au> <20210921135421.13eac778@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Matthew Wilcox <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the folio tree with the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4010601.1635836645.1@warthog.procyon.org.uk>
Date:   Tue, 02 Nov 2021 07:04:05 +0000
Message-ID: <4010602.1635836645@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> >   405f4ff7f8a3 ("fscache: Remove the old I/O API")

This branch is now obsolete.  I'm testing a replacement branch and will
hopefully push that to fscache-next this morning.

David

