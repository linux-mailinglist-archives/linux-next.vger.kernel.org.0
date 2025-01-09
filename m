Return-Path: <linux-next+bounces-5115-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5BA06F4F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 08:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA1F1880723
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A9214A73;
	Thu,  9 Jan 2025 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDpM53y5"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E7204688
	for <linux-next@vger.kernel.org>; Thu,  9 Jan 2025 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408753; cv=none; b=Ef1ClUf2OWceUJwsQ413aynGM7MVHVpJvpMB4Jlaq/q3augLN/GfI8YqzQGUT5cSokSG8IG9qmPdWnl+dvXRkcWi8XQzdsCrzloYr3oSlfs1NOPsnM84TwKdS8oWPNXop/K8mgkkPSMWXcKvqoH0pJlgMsClOQgLyzfVC0yPCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408753; c=relaxed/simple;
	bh=/CUzzRk+Qda4e6GHIRlcYZVLMgm91JbHtdCsRwfFMps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpvuAnAWLYs5M+SODGxCHR9NtyamrPNRR0GO6ynJBo6U3TnOo5uxnBARuFKIhfGc1pxBhap8QFm28tuWCTJYRwWAdEHy8BXfn9w+oLu6/r0biKbWtC/ZVBhnSxTP789pb//t8i00aCPpkPgQz3+kweBDOygrt3o9Dur1GmvH0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDpM53y5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736408750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymnJsSjVrLE1YDzsII/G++v/UNJFs/iKC+VRKbG6UQE=;
	b=WDpM53y53bkI/dN9mcWQQAK3ycavsqC2t1apJ57SxRBffiZDtQIWy1ZxOdtfBwcDjPe/Jx
	mqYdvOgIFhtr2BKfeSt3F6YCdRb8xz8yutHGqIWOZrA6BiGhvSUaO4otJZp/W73JWwcHgt
	BDRen7kA61CBZGC+86JmQylgGgHMkBw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-NftEgcfkOi6y7GCZ5LobzA-1; Thu, 09 Jan 2025 02:45:47 -0500
X-MC-Unique: NftEgcfkOi6y7GCZ5LobzA-1
X-Mimecast-MFC-AGG-ID: NftEgcfkOi6y7GCZ5LobzA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aab9f30ac00so58853266b.3
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2025 23:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408746; x=1737013546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymnJsSjVrLE1YDzsII/G++v/UNJFs/iKC+VRKbG6UQE=;
        b=Uyhq/CxzJD2VUoniS+q55aFq5yOWYeqtNsKPU6Qdj/W/C46xmPOq1N97+w+KfoeAtS
         KjB/DxR01O2VymBe7gW/kJSUdTOH1x52k1PK5xIdvycpVuKDMT3AD8OIVSOAfEYE8esF
         F0xO3cKHCCYt6E4japkpiFj3KIx6Nixno5c6cnP+0rcu45zuON7uUfJd4hrzTShMEJId
         b8TIawYKzWrieDZciwwUs6iR1bV7xM0Urf0u2BFzgDMYx2vHkrQkUpDeqw9gCELWuvPB
         knJcOgIp9W7zPuWIAlp7+PfY5pQK+84N9plOKHfzEhzNLVdRzjD523ZZMPOFDtaW9Fm8
         38Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVlN119rEctMO6QGrz9AxXl+dM+zUR1Msrso2DkyT0el0QYiDc8cid5OM+cp4rWOK1trSvyJrQRUyv0@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7bUN7JWI5iyEfnBpslw7iar4sKuzW9ZnZtlhVsYn6PmLefZc
	cwPhj79lkpSna7/NcwAmTCs2LELtSplusMQeRxm8qkN+6pX37NYvt9i9DC+3xV026Ia+fEg34Y/
	xdk2HLuExCuklLCuTULSluSEdQSWNJhbAX0JMRAelgIH5LQp4EBFkYifyNOfFyGctzMk=
X-Gm-Gg: ASbGncsKmGI27YRng4zBrFfYZiTK/C0vseBRHPRaYnb9oxoOkVslIExAzB8jZxXXQTE
	LGoWQ/taFYLYp6CHN9ZMnWuuG4NFmyRv2zGFFNkD1eDA58TZMg6f3slSjx/nPAa8UKJhYwsw3zw
	3r2qseXPKEvS/Dwqo6+GgFjEnSvphY6nnOF5wpGVFxaomrXV6w/A6lcjHw0n3H37mWjH+xR8VHU
	rjjCLfSj88iPmpM4ZiOjXBP3i0aeomvUAMIlTnnJqYAUfFW27A=
X-Received: by 2002:a17:907:9997:b0:ab2:c0c8:3841 with SMTP id a640c23a62f3a-ab2c0c83ac9mr264416766b.4.1736408745665;
        Wed, 08 Jan 2025 23:45:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE9JlyP9HNuF5sXNdjplu2MfO3TpaDnFLxxEflpena+gduLn2sTGi64eMXensHdWzjZtPArw==
X-Received: by 2002:a17:907:9997:b0:ab2:c0c8:3841 with SMTP id a640c23a62f3a-ab2c0c83ac9mr264415066b.4.1736408745349;
        Wed, 08 Jan 2025 23:45:45 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c96461dasm42569466b.168.2025.01.08.23.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:45:44 -0800 (PST)
Date: Thu, 9 Jan 2025 02:45:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vhost tree
Message-ID: <20250109024408-mutt-send-email-mst@kernel.org>
References: <20250109144054.6bdf0189@canb.auug.org.au>
 <20250108212355.6e6fad4a57d23eeedecc6852@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108212355.6e6fad4a57d23eeedecc6852@linux-foundation.org>

On Wed, Jan 08, 2025 at 09:23:55PM -0800, Andrew Morton wrote:
> On Thu, 9 Jan 2025 14:40:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > The following commits are also in the mm tree as different commits
> > (but the same patches):
> > 
> >   e981e8d8b23e ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)")
> >   a4bba3b65c20 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
> >   b9ad8a711a3c ("virtio-mem: remember usable region size")
> >   a8328b40b3b0 ("virtio-mem: mark device ready before registering callbacks in kdump mode")
> >   ef78030ec96f ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel")
> >   a127bc45d3de ("fs/proc/vmcore: factor out freeing a list of vmcore ranges")
> >   98c5f8c3827a ("fs/proc/vmcore: factor out allocating a vmcore range and adding it to a list")
> >   5488433f810c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
> >   23365031b34f ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
> >   006f0492f363 ("fs/proc/vmcore: disallow vmcore modifications while the vmcore is open")
> >   26b866c242e5 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
> >   5c04c6205add ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
> > 
> > These are commits
> > 
> >   9e85e500e8b3 ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)")
> >   5605b723bbc2 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
> >   3a365d7b1a60 ("virtio-mem: remember usable region size")
> >   e4c56e7d625f ("virtio-mem: mark device ready before registering callbacks in kdump mode")
> >   342dc629fe62 ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel")
> >   44df29fb6c95 ("fs/proc/vmcore: factor out freeing a list of vmcore ranges")
> >   10a41d9df694 ("fs/proc/vmcore: factor out allocating a vmcore range and adding it to a list")
> >   e8685745122c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
> >   cfc7a194e459 ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
> >   19b42b73afa4 ("fs/proc/vmcore: disallow vmcore modifications while the vmcore is open")
> >   527d8662c520 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
> >   9a775759ac92 ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
> > 
> > in the mm-unstable branch of the mm tree.
> 
> Thanks, I dropped the mm.git copy.

I looked at a wrong tree and thought these were forgotten,
so I put them in mine.
Andrew, good thing I saw your mail before dropping mine ;)
Can I get your ack on the mm things pls?

-- 
MST


