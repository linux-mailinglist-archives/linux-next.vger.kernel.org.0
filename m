Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895AE30CD3C
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhBBUoa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44304 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231508AbhBBUo3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 15:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612298583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jwJ+IqANNuP7grTt6JHdS5L4cfohUmrDDibLdFhD7tA=;
        b=K3F9BzzBP/g2DFc2jv6HwGOVuiCD4keUmxGkjaB0265YGyB5JC2IRgTIhaI0DO7/ZZslO7
        CWYXNM7+lZbIKjtjHD+/RMyc+fWAesg2GmX6sifs+KfOTLTCBlRLSgs1LwCGBpdoPLRZ/x
        PpeF5hzOcaN3jkRymF/50Wqvg1Ma9CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-wevFCdoVMHmMRlmQBE9YWQ-1; Tue, 02 Feb 2021 15:43:00 -0500
X-MC-Unique: wevFCdoVMHmMRlmQBE9YWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E59C0107ACE3;
        Tue,  2 Feb 2021 20:42:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EE35F6EF57;
        Tue,  2 Feb 2021 20:42:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210203070915.06a1a574@canb.auug.org.au>
References: <20210203070915.06a1a574@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the fscache tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <600006.1612298577.1@warthog.procyon.org.uk>
Date:   Tue, 02 Feb 2021 20:42:57 +0000
Message-ID: <600007.1612298577@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
> 
>   51721d69bb95 ("afs: Fix error handling in afs_req_issue_op()")
> 
> Fixes tag
> 
>   Fixes: 0dd1a43b5d74 ("afs: Fix error handling in afs_req_issue_op()")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> I have no idea which commit you meant :-(

Oops...  I made the Fixes tag refer to the patch I was adding it to.  Fixed
and repushed.

David

