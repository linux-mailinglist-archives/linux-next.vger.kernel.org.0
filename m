Return-Path: <linux-next+bounces-2018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE168AE10C
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 11:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE91B1F2118F
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B1959151;
	Tue, 23 Apr 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="COdmVUcr"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315658AA1
	for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713864731; cv=none; b=Vgdp+YIlpqfCR2T1taEoe6g/fCXN41BwLQGWrcxxNJKWW7R359t3iN+1kESRU2qbYIEn+elZXCN9/bqal3LUEx6XwI3/zisCOydd+azP3/3RbAEuyxr4eatp+w9nHrhhGAOi29X2Y3KcLwZn8q/YpHX7chlnAp2ILkfKshJ6aLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713864731; c=relaxed/simple;
	bh=LdO/nreoe2L4sevFypjtMadn+EKT8D2kRiKGDBbpSy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tV5s0aYLZ8cipoH2uNDPDmZyASQXu7+NRVMJNV92B7pRHepDnmntI3KCmZtPzkCPZ0Wt/ZNt6zxLrvfVxU+oDo3NFqhkOvY1HNgWxIIPtlZijOTSyUypcFMuVrj+cynVsIH0ppMQNHbFZxfut+ZjHPpEE0Qd0sZiRIV4AZb7b/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=COdmVUcr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713864729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrBGJotUcgHqpi6O/DfS++qUvwL5rymvBmbeSDD6nCk=;
	b=COdmVUcrxUst9sifEt0mJmOe/pC/RNOYKg0094r57lg9FRyAwT+Hip4Ir3rqIIZFdiGXlu
	c+gLGvKoaSevxe24gwYebH6G4X6CPR2Wdfxnzcx7vuExIKv0FxZRxZcF7baDAJQmxiNd8B
	ba09OFcBsx/RUqGTA9Cxr+fXNts9cME=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-FjvAt7IwPYucAnBh8Hc79A-1; Tue, 23 Apr 2024 05:32:07 -0400
X-MC-Unique: FjvAt7IwPYucAnBh8Hc79A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-346b8ef7e10so3444614f8f.3
        for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 02:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713864726; x=1714469526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrBGJotUcgHqpi6O/DfS++qUvwL5rymvBmbeSDD6nCk=;
        b=prbrm0a9RESkPEWVG5ci46ZqyjJOnLy8Fsg14YuueG56ECu7JpUOwMHzPEjhbBGIWt
         Z6xpuza+nmhcE7+c83L9LkfupVJmOuO2HnIheWTK6sVPAIkFiXG58TRT6t2o0bPz3IQv
         pfqzONX5w0Mk8N6Koho/bJSU/AqK0spPlo+QJHCmCUtFUo6Q7yh7relhUDDx4rVbd9lf
         egJd9Uy8LoGokVc9rmoFQgPusgLFrh2UwyKUH74auLfo/6RwZwiMGd7lgyAzz/bRM7LF
         pRo3pSUc/1WialPs7IGOe3XEKgh28HtMpbF/laPhVwDU16aataPQ6+Gn7TftGTYMq/of
         Mc1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvBnsx+pEt3VWL3uqMPaG5jSWob8HLTQGrFAAZt98K758r7d0s7rEQEv9K5L9NsjD8O2mGo6bMIbyxjwFIXPfPLKE4UJ8t3/P0Gg==
X-Gm-Message-State: AOJu0YxXsZO+B/kr3YQD748u0Kz3LiJ2mEx6g2BjepBD5VAu+/p6a9za
	fbrChwNVPmBz5gggTrQ513LZs7NWwlTUJJrOwL6sj4wuMIroKLjqF/Kh5orUW5ht2/2JpMLzZLf
	X91Po12JzXeIGlRm1+VXehoNumMP9IUtzpsnvAIbpR+qCGQFzXsLP6WfZvm/hw3gNrQI=
X-Received: by 2002:a05:6000:1291:b0:34b:4afc:5d52 with SMTP id f17-20020a056000129100b0034b4afc5d52mr2733448wrx.9.1713864725718;
        Tue, 23 Apr 2024 02:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8P3x/S8bRNyl81Q2vOnuSsr15f1ZuacBaA2F08NubH2sSjaSh2fGkeB9/2DMmz8GUM0JX7Q==
X-Received: by 2002:a05:6000:1291:b0:34b:4afc:5d52 with SMTP id f17-20020a056000129100b0034b4afc5d52mr2733411wrx.9.1713864724960;
        Tue, 23 Apr 2024 02:32:04 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7429:3c00:dc4a:cd5:7b1c:f7c2])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00344a8f9cf18sm14193711wrm.7.2024.04.23.02.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 02:32:04 -0700 (PDT)
Date: Tue, 23 Apr 2024 05:32:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the vhost tree with the mm tree
Message-ID: <20240423053045-mutt-send-email-mst@kernel.org>
References: <20240423145947.142171f6@canb.auug.org.au>
 <e07add5b-e772-4a8c-b71f-79f1fe74580a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e07add5b-e772-4a8c-b71f-79f1fe74580a@redhat.com>

On Tue, Apr 23, 2024 at 10:21:55AM +0200, David Hildenbrand wrote:
> On 23.04.24 06:59, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the vhost tree got a conflict in:
> > 
> >    drivers/virtio/virtio_mem.c
> > 
> > between commit:
> > 
> >    c22e503ced5b ("fix missing vmalloc.h includes")
> > 
> > from the mm-unstable branch of the mm tree and commit:
> > 
> >    4ba509048975 ("virtio-mem: support suspend+resume")
> > 
> > from the vhost tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> Easy header conflict. @MST, @Andrew, do we simply want to take that
> virtio-mem patch via the MM tree to get rid of the conflict completely?

ok by me:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Andrew if you pick this let me know pls and I will drop it.

> -- 
> Cheers,
> 
> David / dhildenb


