Return-Path: <linux-next+bounces-5264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E739A16935
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 10:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4DC1884DCA
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 09:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C2D1B0435;
	Mon, 20 Jan 2025 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y2xxnlqB"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3C1AE003
	for <linux-next@vger.kernel.org>; Mon, 20 Jan 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364916; cv=none; b=XUuCbajVJfCWT3ikhR3+h1+hnX4oVmVcCBFFU0nfSoZIHI4t2aWgrHCga9ziIQ3uRRjdsAX2rsqNxj4kIqLaOpSuvoKNW9vujJOCVJJFimavKuxUmgj5X10fEZ+ZAiZAPn6cK5+wIUWdlfSlDwPJzYlxsXJml83lYctyurgxp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364916; c=relaxed/simple;
	bh=K7xaP7/Z1Rrjgau26HDVl0zKRAk5Xb0/BLsEkVapv4M=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=de5MCjsb4TZoy0qNwjOMu7TIVREIS5/462AwRUxHmbWFpp93AYCAxcJsrc9wr6QJMDMRNLY0yAjAbbLQCu1ZSatfKWfG+CCZQtqyzHG1/DbyJu6Ex6B16jdiSUuNhs7gJSVIu6IbjaxSMuuwq+6fCcz5JQiPy016qUgd/W3SyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y2xxnlqB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737364913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54WBOqgR+1q5QDw7ZxG7CizHZoVFfUMEH3/WtC5lWXY=;
	b=Y2xxnlqBDIgsz/lWN2H7pQ+ehMvzxBck2NABO1xxALV6sGJ79JuSrRxbClPlN6fAOgoa0w
	4+Lca4GvpmVMAnEiVl1Ak0kd5CUKWgBeL8e+o3VUStV7p6bPjx8UA6dy/N9jDEjOq0pPw+
	EyQiRZcKtXuxrA/bl0/J/HSyZC30TL8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-H8cS4vTTNVexTkDjc8lWWw-1; Mon,
 20 Jan 2025 04:21:51 -0500
X-MC-Unique: H8cS4vTTNVexTkDjc8lWWw-1
X-Mimecast-MFC-AGG-ID: H8cS4vTTNVexTkDjc8lWWw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E46CC1955F1C;
	Mon, 20 Jan 2025 09:21:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C831D19560BF;
	Mon, 20 Jan 2025 09:21:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250120104106.0d3e036a@canb.auug.org.au>
References: <20250120104106.0d3e036a@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <987480.1737364906.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jan 2025 09:21:46 +0000
Message-ID: <987481.1737364906@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the vfs tree got a conflict in:
> =

>   fs/afs/dir.c
> =

> between commit:
> =

>   6dd80936618c ("afs: Use netfslib for directories")
> =

> from the vfs-brauner tree and commit:
> =

>   8281b27ee7ec ("afs_d_revalidate(): use stable name and parent inode pa=
ssed by caller")
> =

> from the vfs tree.
> =

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That looks correct.

Acked-by: David Howells <dhowells@redhat.com>


