Return-Path: <linux-next+bounces-5311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36106A1A67A
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 16:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43BA163491
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 15:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D1A212F86;
	Thu, 23 Jan 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0QZJTGq"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1C211706
	for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737644553; cv=none; b=bPta+JOE68xlTQTrufiHBv9W2jOb77lPycSLyy50IkxioBqOhCcKd7yxEzxMmgMXsT/Kk4qjCd/sYiwrv95ll0aUdKyYPKm0xfGU3Hr7BS1DYIEhwWjC/1UgJluKGEk2xj+FlZqrRduNylNqIvQ00RGlM5eqcOJ6B23gXQToWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737644553; c=relaxed/simple;
	bh=n0bwgPaWRrbHjZeItfR1A5cw1pvEt8ep406suEzUxcM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=e0UFpIqZZbDoYAPTD9Rq79eNkoL8phGhhqrLomlVa1Z00q5BUhU8z/SO6cp+RJJ9ssa1xIpGxk1iDTHgGw9F8P6FQ1GehG99ouTiSQHIj4NMS9YWPUGXAbdLpMNqO/hVcbyr4tSMCje6BhwyQTDWaxPOGWs1BD4xxHc12Z7iLoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y0QZJTGq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737644550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qYnwQOBBZVU8Wg278ORS4OsK0ZJ+3tnRgZ/Sh63uOAI=;
	b=Y0QZJTGqUUPSaejGJKR9Y/b+he3i1oTBvDOFEwUi2RgEdf09X2pr/Uu6LyMpQnjJQ3xawW
	ltInOXdOY9nT2PtyZXbAhLm9GWZJxFAREf+NU93c1rGZS8ehQo6UyRH58ib1TOShcP8uEa
	7bqRNADWLTLga2mm/AWHXi4gO67sBA8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-GM-7UH1yPjm2McgKlBsdMg-1; Thu,
 23 Jan 2025 10:02:25 -0500
X-MC-Unique: GM-7UH1yPjm2McgKlBsdMg-1
X-Mimecast-MFC-AGG-ID: GM-7UH1yPjm2McgKlBsdMg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D63119560A3;
	Thu, 23 Jan 2025 15:02:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D77A619560AD;
	Thu, 23 Jan 2025 15:02:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250121091525.6ff05253@canb.auug.org.au>
References: <20250121091525.6ff05253@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the afs tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2190349.1737644541.1@warthog.procyon.org.uk>
Date: Thu, 23 Jan 2025 15:02:21 +0000
Message-ID: <2190350.1737644541@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   3c9ca856fd12 ("afs: Make /afs/@cell and /afs/.@cell symlinks")
>   bcc4d777ff8d ("afs: Add rootcell checks")
>   31ad47d22fac ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")

Did you drop my afs-next branch from linux-next in favour of Christian's tree?

David


