Return-Path: <linux-next+bounces-7442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9AFAFF33B
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 22:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A551BC729E
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 20:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC4923A9B4;
	Wed,  9 Jul 2025 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVgA/eHx"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE76226CFC
	for <linux-next@vger.kernel.org>; Wed,  9 Jul 2025 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094231; cv=none; b=gEcFHKLBPPYce677Z/rUsmCayHgZB1w2IXbwkQoi57tz5TCJuQv0OWGY0k+/Yt6+UMNqHDj388OfxKzYpbftMNVatzmIvfVoBz7+ru73UEviQXknUC15XqywfBRKw47xynkU/k7ubefqFnnuRF/8kdSBE+Dejk4xtmI0xE5+O38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094231; c=relaxed/simple;
	bh=dXsy1nwJMil3V5ibAunbBr3IEBBjhhxGSOUdoapYhO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQ8HmGLBtVKXb6jorGV1E0DrVD1a2ryIlbTWTE9pMbDQlYTOzAoxB8Hh0KByPkHy1qnojGMiMZinzxeZgv/f2hrlw8yqzZTLtnMR73h6AoKoXYK6auJpzR45zm6kfftrTkYgm07m93iRYIC5oo/3yVMeXxbIRfehhtQ6fepSi8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fVgA/eHx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752094228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GYRHoCEf/DQzfmb/qJcWsLMdU5DARjayganG71lR7g=;
	b=fVgA/eHx8GB6ZsMpET4ToeeI8eFDLiqgSTcREBx40rbLkGvhg9tMGP0mx2yXKmO/kRhDc1
	c43gx4qorD/6ut/VoEi5h2v++SaLyQxotF8dxtqPVBWQ+QYuAPCIJTx6pbBieAtbchjKj+
	1C5WJY07BfsWOZBg1t+3/pZlX708b5k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-NmzggtNHOaeZ8bl2ZoIYTg-1; Wed, 09 Jul 2025 16:50:25 -0400
X-MC-Unique: NmzggtNHOaeZ8bl2ZoIYTg-1
X-Mimecast-MFC-AGG-ID: NmzggtNHOaeZ8bl2ZoIYTg_1752094224
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so132936f8f.2
        for <linux-next@vger.kernel.org>; Wed, 09 Jul 2025 13:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752094224; x=1752699024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GYRHoCEf/DQzfmb/qJcWsLMdU5DARjayganG71lR7g=;
        b=jEEOTIMhcLW50w2NvSjOM/NPr1ZTYUdwyAsBct11hZ6KEBGn02+DTwZsLfDO0atsyE
         TvbyxV1oW8v7E5kFuviLLVSVjHFfFGyYqiZ0jReIMNsneQc6xhQ9EVK+xEaxetE/jxz/
         gTocjNcy8bQfPsJLkeubDXesDCXzbnXYVT+QnmrTNEe5gqtAHC5XVNlf6z9g8HplwYDZ
         fWVJw2S2JOwY66CjTsdfCK9qeRk8YVEnx9GB4HJWwUGwYTnyEZya+3zt6nvUzzDApW7J
         0yHlrsqLNv9q0BS6GxpiJalU+okxvZPTdkfsKlSMkauGcDcso/irAK+LmMdKkuk9hWwc
         wUFg==
X-Forwarded-Encrypted: i=1; AJvYcCVXEDqAy149sIF/T8eb4qSZ3s2TQtxNeRpxZ0lVninwRReA2z6evagumGNHYGB7BUFjHlmU/bbKmvBt@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFZA0QVILNSbwkeeSSC9EKcN20CLq/Xv+YNMK9fxJX6fx6Dqe
	gtqMKYwb0nEJ1k2S27aVYIxyAQRJmLQvNMAFkO0rcTDiTX8IVUfZV6JnAhPUpV2OErLGxQl0l05
	yBcY0VrOMlhF4bSZe7cVK3q9ti1Gz2Jwgs7VMwtZ0ysXAt2BG4C/8700QV6EMcZk=
X-Gm-Gg: ASbGncvzNjWoJeY7xDuHr8V4cWltOqNkyYbP2JeqYwkwwPvt/xY+56fNRa15KpSgZR7
	Ol0/hZEpzyr6WjfC4VE9xu6xF5p0PPVsl67tqRSqG2Nz0cJRDiD29kt2/Z/cJy3N79sEDSaubw9
	vb+/FfscxE30pIy78dD5vErBIfKI/I9lb4tKo7c8z5NvqTFCTqrTvyutF7/6SqpHLsRorM9zOeK
	UOGRjVr3oz5vwhVKUIlGFgACAO9hr0yAFoFVMhXjXOCYRSEbG2eAg5lae9R+9AGDsa9zHQXNx2x
	cEhnnX2rOsMnEv4=
X-Received: by 2002:a05:6000:2a85:b0:3b4:9b82:d44c with SMTP id ffacd0b85a97d-3b5e7895ab4mr891751f8f.22.1752094223654;
        Wed, 09 Jul 2025 13:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE1w3J00YPL8I55yK8bWSN+SXYfjvI3DXscGYJTRL4cPf1Ou6B7lHV1yBOavQwWmOlOuh6yQ==
X-Received: by 2002:a05:6000:2a85:b0:3b4:9b82:d44c with SMTP id ffacd0b85a97d-3b5e7895ab4mr891741f8f.22.1752094223234;
        Wed, 09 Jul 2025 13:50:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50503c4sm39872225e9.11.2025.07.09.13.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:50:22 -0700 (PDT)
Date: Wed, 9 Jul 2025 16:50:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20250709164820-mutt-send-email-mst@kernel.org>
References: <20250709221905.61e77ab8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709221905.61e77ab8@canb.auug.org.au>

On Wed, Jul 09, 2025 at 10:19:05PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vhost tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> In file included from /home/sfr/next/next/arch/x86/events/amd/ibs.c:12:
> /home/sfr/next/next/include/linux/pci.h: In function 'pci_set_disconnect_work':
> /home/sfr/next/next/include/linux/pci.h:2738:14: error: implicit declaration of function 'pci_device_is_present'; did you mean 'pci_dev_present'? [-Wimplicit-function-declaration]
>  2738 |         if (!pci_device_is_present(pdev))
>       |              ^~~~~~~~~~~~~~~~~~~~~
>       |              pci_dev_present
> 
> Caused by commit
> 
>   b7468115b604 ("pci: report surprise removal event")
> 
> I have reverted that commit and the 4 following ones (just in case).
> 
> -- 
> Cheers,
> Stephen Rothwell

got it, the issue is !CONFIG_PCI. Fixing up. Thanks!


