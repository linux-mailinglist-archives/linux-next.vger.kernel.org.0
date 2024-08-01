Return-Path: <linux-next+bounces-3201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8E944D0E
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 15:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FCEB1C20883
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 13:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE919DF7D;
	Thu,  1 Aug 2024 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gQNsy5wB"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2F183CC5
	for <linux-next@vger.kernel.org>; Thu,  1 Aug 2024 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518507; cv=none; b=V7b53Tc7pdllS7MMwo2qVC2KSyrvwidGjpGDda3/0i1gTm2xZ2KMDonCvkrK632kSXdwMWuGz9lTCa686PkyqVszORcetPhKGxAb/BtoIjdTZWvSnLQ61hjR+G3BO5Jb+KHQ09fubIZhHo664q0qxo3SsCAD3NfBTADsGqUhss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518507; c=relaxed/simple;
	bh=NM2o54m6nuaZC/2nnIwnXBD87uvGvJL2CUXUEzKnSik=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=b7AlOHTkVUw8bDL3Lvhvpa0gqU8sNcmq/66P6Z+QvPybi3mvS7/5OfNermKzt7g8hOc81helP4nY5v62EDt5Bq424iEnYBFUYP0hPYjbkaf+qaQtBy/Vk25bKCcUSKJkVnGh6U8IyLUp/PcUMaAtZgDQLD5Ovb9XytW2XTmWMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gQNsy5wB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722518504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nf9lnO0AqJLkerk+hhR+NgdJ8Dfb0yzcWRBfTjntk7s=;
	b=gQNsy5wBBpZaUyLE3+qwWJXOiqNvonP8XRN+jSL6Ksttj7UvauqFDLIB8AoVRJZOypzIMb
	IdBcDMtiuTtgaOElnLaqlCgSBSvKa5OLVweQtghwxdh7MRnkYMiU7SsCXg2iyCdJiTBVWB
	Y0LCOXwxIM8vb2gaAp8VSOy3yNliMGo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444---0N1t3QMQO1_Z7U6pT-Dw-1; Thu,
 01 Aug 2024 09:21:40 -0400
X-MC-Unique: --0N1t3QMQO1_Z7U6pT-Dw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 286621955D53;
	Thu,  1 Aug 2024 13:21:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD7D71955E80;
	Thu,  1 Aug 2024 13:21:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240801150113.4826dc18@canb.auug.org.au>
References: <20240801150113.4826dc18@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Christian Brauner <brauner@kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4137943.1722518494.1@warthog.procyon.org.uk>
Date: Thu, 01 Aug 2024 14:21:34 +0100
Message-ID: <4137944.1722518494@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Error: Cannot open file fs/netfs/io.c
> 
> Introduced by commit
> 
>   af6519cfd7c2 ("netfs: Remove fs/netfs/io.c")

Ah.

Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io.c

That needs removing too.

David


