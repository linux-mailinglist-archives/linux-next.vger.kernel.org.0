Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3CE32A9A2
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1581079AbhCBSin (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36571 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380329AbhCBRBV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 12:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614704364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O0Rb2dq+GmuKFxNHq1hHY8zhkGxgUaPo+7+Ak9mlIWM=;
        b=FMb3QySlP2MpL52RwobMV3lsWy8b5p1mDxJOeRWYK9itDFns2CSRLh2W0QhMIALO2r8dtU
        M7N5AvR0w3oxFb1mECE2dHyQ2OB6kMr6XbivsUnwBFDv157CHztDv/x/rqby7ePtDeHGWP
        VhPJ24J2saKpxa7t2GASPtuRD3KnCvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-RMD8L96qNCuC00UAQqIwxg-1; Tue, 02 Mar 2021 11:59:22 -0500
X-MC-Unique: RMD8L96qNCuC00UAQqIwxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C607E80196E;
        Tue,  2 Mar 2021 16:59:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 672F510023AF;
        Tue,  2 Mar 2021 16:59:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210301092938.33116d24@canb.auug.org.au>
References: <20210301092938.33116d24@canb.auug.org.au> <20210211212437.6d3df60f@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1878040.1614704358.1@warthog.procyon.org.uk>
Date:   Tue, 02 Mar 2021 16:59:18 +0000
Message-ID: <1878041.1614704358@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> This is now a conflict between the fscache tree and Linus' tree.

I've rebased to -rc1 and repushed.

David

