Return-Path: <linux-next+bounces-1803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9A898272
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 09:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE53287EA2
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 07:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DD75C61D;
	Thu,  4 Apr 2024 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FE2swIEj"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210E63C7
	for <linux-next@vger.kernel.org>; Thu,  4 Apr 2024 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712217016; cv=none; b=gJbfsqyWXUkhOuUz84oE3qtlltjuRuzr28Jr2veHb8/E4qz14+tXsDzfmohJyitCSJ2V6e6SkGgZAKp8aAMNorDIXb2wcGI/hnKeOIcfbZeBH36+5EalIrejEDWjFfFhCBEMP/P5qooPVmXbZ/MRaKGicRT1HHoqxcGr6W6iKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712217016; c=relaxed/simple;
	bh=PDF8rAKtnoPQ5NeHKnC7IYfiaYEQ3BItds/rRYPd950=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=P1Rc8TYJ+4QuRQgnyXeOZCEVYGjr1x6HA7fcnYUgB3nM1gw3kn5EJAclXLM3Ot68rFfxzj/9daCUwXcRia4q06rOFXg+WJ+x8uZ4QNWGepenEFIyAzNZgnaSYDt2Agld/uu19lmrczzoYcbUWzybrGsFojkB9jBb+/nPqKEqy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FE2swIEj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712217013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvAHaZMN971uikkj/WIR5kxgCR1HxCvO96dpGZLwAzw=;
	b=FE2swIEjrFgaRrLkG04fLmWXN4UmKxZQgOiLMIzOgH3e+5qBRX0Gi1pOP6psLgQRYv7k48
	WgZcK9gcxgU1XI7SYeRdFfyvJBVh/7Se730h9TASN7OUp6TdGr/7Ht+i0VGx/djG2FaQNG
	fALNLGHKidwcYgNjqF/v50wKxk4TCVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-ko-0_dPIO36rm-uMOucm5A-1; Thu, 04 Apr 2024 03:50:11 -0400
X-MC-Unique: ko-0_dPIO36rm-uMOucm5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5453A87984B;
	Thu,  4 Apr 2024 07:50:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A11C6200A386;
	Thu,  4 Apr 2024 07:50:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240404132456.579b8ae9@canb.auug.org.au>
References: <20240404132456.579b8ae9@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Christian Brauner <brauner@kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3655431.1712217006.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Apr 2024 08:50:06 +0100
Message-ID: <3655432.1712217006@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> diff --git a/net/9p/client.c b/net/9p/client.c
> index dada0033d71e..d4b88b7ff5ef 100644
> --- a/net/9p/client.c
> +++ b/net/9p/client.c
> @@ -1699,7 +1699,7 @@ p9_client_write_subreq(struct netfs_io_subrequest =
*subreq)
>  	}
>  =

>  	if (written > len) {
> -		pr_err("bogus RWRITE count (%d > %lu)\n", written, len);
> +		pr_err("bogus RWRITE count (%d > %zu)\n", written, len);
>  		written =3D len;
>  	}

Actually, that's the wrong fix.  'len' needs to be int not size_t because =
of
the varargs packet formatter.

David


