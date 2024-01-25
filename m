Return-Path: <linux-next+bounces-849-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A283B741
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 03:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552B12840A9
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 02:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD266882D;
	Thu, 25 Jan 2024 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjMWnRBF"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46979F1
	for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706150436; cv=none; b=uZF3pAbXpwK4s3BJltsckQHfG2CDQM9RDo2SeFOOLDwyha0a+5vxL7o7JV4oeZIN7R/9Ef8k22evVpZWm29GnIUvYCazhVpSSO5Ah0Ya2WIvuYgurQah4HCM3FwCfj9HYoVcN0b2C4yFGEKkj3LyVL6Eq6XRYIBNQUvh8w6CFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706150436; c=relaxed/simple;
	bh=wPcuYZSJ0QphQZzs3m5GU2Qnxq3Wvke1LT50McCvckQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTjyqNYHq4FXPMy6H/fyWlhHQS2BO3IduOLSG1P7qG5GlNmPDSU5uG3o1jZfqgI2F2fSHAzwwoYO7Avf9L7khuMFeWFEolkZMwYCAwCGzd16N1QY58cyEM5L6L7I5AcyalUuCW+LklQNeM7Bq7foGrBFz1yKjIyv1CsKvyisodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fjMWnRBF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706150433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KnEJU8pLQPVQ9UeCpSGWTiDfm3jivdZsACBZWicB2xo=;
	b=fjMWnRBFD2L3VOzS8J5zsvbofURefFgdcKAuPBxJel/gJ2sHww0ZmErgaqTxT6JeD1rUnP
	0B692QAW1BVJEvR7HR3YPG+ZvgHv5Uc7/zTSzj/bOxEmpaPRhFDVuMKnvgxTqEqpuIc4op
	soImP3dxp3R8RJ3rhMU2Mm1GCpRX7js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-2OzoEwXHMUWJSzr6Q7ekGg-1; Wed, 24 Jan 2024 21:40:27 -0500
X-MC-Unique: 2OzoEwXHMUWJSzr6Q7ekGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA2F81013660;
	Thu, 25 Jan 2024 02:40:26 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1321BDDF;
	Thu, 25 Jan 2024 02:40:25 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:40:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZbHKFS05kMMqJK/N@MiWiFi-R3L-srv>
References: <20240125102333.6701aa08@canb.auug.org.au>
 <CAJuCfpEyOd2Y-5gMGPhWDDKe+fEdFOGRCw8CnFkk8Si=1hOo=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEyOd2Y-5gMGPhWDDKe+fEdFOGRCw8CnFkk8Si=1hOo=A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On 01/24/24 at 03:52pm, Suren Baghdasaryan wrote:
> On Wed, Jan 24, 2024 at 3:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the mm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.  Stop.
> >
> > Presumably caused by commit
> >
> >   1777bfb42f56 ("crash: remove dependency of FA_DUMP on CRASH_DUMP")
> >
> > from the mm-unstable branch of the mm tree.  It looks like the expected
> > file rename did not happen.
> >
> > I have applied the following (git) patch for today.
> 
> I've got the same error in mm-unstable and your patch below fixed it. Thanks!

This happened in v2 merging. I doubt there's something wrong with Andrew's
patch merging script regarding this kind of patch renaming.

> 
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 25 Jan 2024 09:58:54 +1100
> > Subject: [PATCH] fix up for "crash: remove dependency of FA_DUMP on
> >  CRASH_DUMP"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  kernel/{crash_dump.c => elfcorehdr.c} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename kernel/{crash_dump.c => elfcorehdr.c} (100%)
> >
> > diff --git a/kernel/crash_dump.c b/kernel/elfcorehdr.c
> > similarity index 100%
> > rename from kernel/crash_dump.c
> > rename to kernel/elfcorehdr.c
> > --
> > 2.43.0
> >
> > --
> > Cheers,
> > Stephen Rothwell
> 


