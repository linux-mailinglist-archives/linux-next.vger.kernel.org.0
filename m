Return-Path: <linux-next+bounces-8119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68536B37FD1
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 12:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E7AC1BA5331
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 10:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D51D34A338;
	Wed, 27 Aug 2025 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6dPKSCE"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3E341ABD
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290243; cv=none; b=A1ca9rhsAoD8VLQH6xztQ5XayUdJGdW7kYpKsV3WCm4Dcduw8dEq9XBUysKRHIHWD927LX0ikGST+ut+xYiukKpZWefgxvZX4AO0ioLC9Sf+NFPrW83VQX97+zVM/HfypdcBGanvhPpMUj09N4UbptcYh+GXA+vL29c/upiHR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290243; c=relaxed/simple;
	bh=fhHeQECtsMPogCHlxKASHLbxYpLR81Rjlh4nHtxZrIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1hfT/BeWyKwLnnDdN/uaCxVgrT5Ve1JEWIbWT15bZEY4NSCY8DRcCPPpqSkm7K5mS0eIA3W2hRMSJU2s50LC0AJB4BV3iTP7VeH/mEUpVF83EwK7ViE/utPhmdNOftWzSM4YzvBTXvSrixkt6qWOitx0alUKptVQuRuUB7D4sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6dPKSCE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756290239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5mmeUW6MPoGpFuDnaAdEqf7QqySNZXWiteR+71+RR74=;
	b=N6dPKSCE93f3zv6TMkh9gnBbAl2EkHvoax/aeB1S71WJ3F76WqBVCHl3kw+CtCvq+Rqo5M
	fZOnx+GH+6gafym6+LENT/1kzxJvXPc2J6XzFzQqhxAb+YMGaUciP8jqV4pANr6FVXsj4M
	qZ0QFSuENd7M4ubSZk5DgaCHamRPhzg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-LVAJwCvcMba588x8nF5jEg-1; Wed, 27 Aug 2025 06:23:57 -0400
X-MC-Unique: LVAJwCvcMba588x8nF5jEg-1
X-Mimecast-MFC-AGG-ID: LVAJwCvcMba588x8nF5jEg_1756290236
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0b2b5cso47742505e9.2
        for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290236; x=1756895036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mmeUW6MPoGpFuDnaAdEqf7QqySNZXWiteR+71+RR74=;
        b=U15RyUgwRYStRZYgE03cm2KVNTmFeRtZLRrvaA42BPg9qLoPyg39uxAQut2w3pSS2w
         0ytf7yk+Zez6IOQHpFiDjcXbBiUuzAH1Pfj816WrofXefTjU9DbaGIG9TKonyh41To0b
         /cGbPJBuu6CMCvG3AOTmxlIyOxt9JVjP1seA4dd+Je+Z4YmP0f7BiYGVV7H/QPOmoqsY
         GMveCUGT3lzo4ibwU/whK1/HgmoilrBxJbB3PV5Tttkt77PG96SC4LpP5u8GpncUdfyD
         DHWL2PZHzNmBkN6FhDn43g6yghSR4ChHrJRFLSANx4PWEuRsU0TcLWsaCWuE2z21ldMZ
         Cd9A==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ6XhfonZeEFmR2aXVZedJBHkN4Z7AyH23vwHZe4JgoK/mBb+ytbZymrGilfd5Ynzdzugk+3+HtvI@vger.kernel.org
X-Gm-Message-State: AOJu0YyvC6kBwZ+M4pbIdkFG3LanpRKfjbBNIF55T6/LJ6m0Co7zqM2f
	bdHzMw1CmlSpHt6f/Z3pyI7t2YZa5PDQdcHi/bSrSgPsPyzvKmnRMg1OZqMOopBCkzNZ1ZU5Vj3
	kIPncw6Q/LwKcqh5nkBhl3WHJ11AucEA2vqeEtQuiIFd3ZSpV997baaJEW/Szrts=
X-Gm-Gg: ASbGncvMSnj/0ZWM62Rdb6zR0a3hTEyJwAvQevWeHxFnNXVU28MPj3FSeMy4dskRTV4
	0OjHeUPiwD2HKz3DoyFCpmH+KUC33W0+IClh9bP30ewjF8SJOqL6rnqh1cnqWPjRK7ZdtUW+i2F
	JgTd6arQ0v5V86jjhfCdk8MhYt7+GWf88M2ptqvkvzShQ7UeR/k7EyiHWCQtq+uasrK3ZYu9uyy
	ZY4XHSPoYspiO9eZwL68ZCbbOl0HNU0P5LpUoOiU/GCRQyb+xOj3YkBTGerMQfi8d7kMq8oIcHE
	RkBqMoQfxVjvkQbqFjs81B/tcaqXIuc=
X-Received: by 2002:a05:6000:430b:b0:3c6:df53:6971 with SMTP id ffacd0b85a97d-3c6df536ad8mr15063652f8f.35.1756290235902;
        Wed, 27 Aug 2025 03:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Nf+4Mo9HTabLnQaq/cSzHPY5dDuVqIH0WRyNbqohTKTkgiA74asOOu5SZuhO41pKebR7Kw==
X-Received: by 2002:a05:6000:430b:b0:3c6:df53:6971 with SMTP id ffacd0b85a97d-3c6df536ad8mr15063633f8f.35.1756290235529;
        Wed, 27 Aug 2025 03:23:55 -0700 (PDT)
Received: from redhat.com ([185.137.39.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211bd7sm20480046f8f.38.2025.08.27.03.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:23:55 -0700 (PDT)
Date: Wed, 27 Aug 2025 06:23:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vhost tree
Message-ID: <20250827062218-mutt-send-email-mst@kernel.org>
References: <20250827124654.78881028@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827124654.78881028@canb.auug.org.au>

On Wed, Aug 27, 2025 at 12:46:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the perf-current tree as a different
> commit (but the same patch):
> 
>   c67e16d30dca ("tools headers: Sync uapi/linux/vhost.h with the kernel source"
> )
> 
> This is commit
> 
>   f79a62f4b3c7 ("tools headers: Sync uapi/linux/vhost.h with the kernel source")
> 
> in the perf-current tree.


Hmm.  I could drop mine I guess, but it only really makes sense after:

    vhost: Fix ioctl # for VHOST_[GS]ET_FORK_FROM_OWNER
    

which is not in the perf tree.


> -- 
> Cheers,
> Stephen Rothwell



