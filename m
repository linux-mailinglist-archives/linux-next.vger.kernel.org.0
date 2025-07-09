Return-Path: <linux-next+bounces-7441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9EAFF291
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 22:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E893AA6C5
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBE825A2DD;
	Wed,  9 Jul 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0lRNgGP"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A825A2B4
	for <linux-next@vger.kernel.org>; Wed,  9 Jul 2025 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091240; cv=none; b=iqacRoTzxtJGME5FDx30j68uQO6eUP1nLUQx1dlLaHbOZTCOsN/bxhypza1EiGuBPgZ5VnWbkrJDttzRaUjXsyRE4XZbpb7A8lEpTDv1f6Xo/gua1MLf0Yt8BQwb1EteuGp+alkSdoehAY2LIuLziLVRtO/c7H0NgiZgmv5FrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091240; c=relaxed/simple;
	bh=XRgcaPUjA2xmhy8xzFx9Agw0cbTX49MkDneqWPcRbns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDIBUyltkZer5yVc19HjZMxZeXsMw/T3xRU0ZJrcmYpzIrn47jRns9jqxfqXlM6twavfY0OAyzxUkMnaa6AsRVZI1egNDVU4376Fkv517Y4TKWw0HWXUKNa9pZKc+fPUYOOatdrg4Vu9FMHXQoOjSh8MepgGgWklWiR8sIEaK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0lRNgGP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752091235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KEO+y01DHcpAzZ1glkzdPAC2WZqiXMak0HQsMG2O0i0=;
	b=T0lRNgGPHHrX1xqHqz5GlIw2QOtiA3IuXnjOcUZkpnfB/jMwAAuQlUVXI8j+rzBAt+ZL+u
	US+XCSB8I1daVZ1YpWAqbXRVsPLWWU5mtuT9qzql7Mg5pTuakdsiDqfB3+S1IcrlRaN7/X
	TdYNf5nDxGODxkO52Y/kiA2HKvxhuCA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-om1oiYDzPcuh52nMYPBovA-1; Wed, 09 Jul 2025 16:00:32 -0400
X-MC-Unique: om1oiYDzPcuh52nMYPBovA-1
X-Mimecast-MFC-AGG-ID: om1oiYDzPcuh52nMYPBovA_1752091231
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso1210175e9.0
        for <linux-next@vger.kernel.org>; Wed, 09 Jul 2025 13:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752091231; x=1752696031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEO+y01DHcpAzZ1glkzdPAC2WZqiXMak0HQsMG2O0i0=;
        b=UyQh/wYWzsunDUCWBlpuuw9MoR8RYLdd9HhAyDEv7T/hTHVmM5u2HrC8qKkOAtczGs
         nkTmv8rZmHB32ZdxtLv8cTwmvu9ObHqqgoV4TZLuC/1ZGV2mQtmwA8iht05sdgyIm5ti
         XFu8GilhTxRoyjdWjNCOwopSoB2hqQKaX2ywKMZl/TBe7EohBZ91wnn0f3cHnu8Tz/5g
         w9Tzvpwy2HnQzg73SdYgEc1neQgkIMYaS1F/R7ecxI+u9cSXuhqlMuXYaqrsqBQAeWNp
         vOxPrtKfrKqEskGSxngzPs/jrZWwsvoDSpkvN/grHMv+muZPNsRwXu/jDB0Tza+SkAWO
         8gNw==
X-Forwarded-Encrypted: i=1; AJvYcCX71vovee2qoJtv8JK5RQDLWCkDrq+1iaKAcj3SA/tTtHQZIMHwj0APxO3vdhvVIKxqLbCkd19XSloV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyd8NoTxqrU2WOBCgjR0OBUYSgRel/wxm+TpPSYKjGV3D0G/mv
	BmF4ifE0vSCPdHDJdZFF27PTzB7ca2GVJJ8n6veKrrVnZ+XC/BPtIqHTfuNuXYOU5VStdTQBjua
	fkMHF0ej4n+R1tZNKh9bLIIe0rliDxq8yz8AN3iiMr6r6CaImdvCHTla+wUI6aspSxtu2Prw=
X-Gm-Gg: ASbGncv9S6EdpG/UwLSFwb3R2NyZZHV7bD9SQX6u6pVU5fWKTv959s7OtPkeOXyw79F
	TH93DpTNA852a80cfzmdkOdN2yc7TicnXSC/nBD3JZ4Qa1ycg7MC6jSsgz0KDY9XCaZeFl73SS+
	BxPdVVMzeI12xwvasSTBIETHlcNhe/1/VpDvvGUKtJOfiuZ4dLcDaKqwNqb2PRDfQ3+ORbRpBAq
	ihnyt5tSm4rsCWx7nFerJmDzcT/xwhYURoAEeqGWXxomVWXM7EAFmZja2iromVeqkpBmCeuMphh
	Khr+Ev3XtVzBd1k=
X-Received: by 2002:a05:600c:35ca:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-454db8307c1mr8031605e9.32.1752091231101;
        Wed, 09 Jul 2025 13:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6EqizbffultQ5UtCg8NuiwKwoWE+lK/p3pWMASqoLLv09C1oxwgfQ7sLGmuyt4kakXife3g==
X-Received: by 2002:a05:600c:35ca:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-454db8307c1mr8031375e9.32.1752091230750;
        Wed, 09 Jul 2025 13:00:30 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b472446fddsm17151822f8f.66.2025.07.09.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:00:30 -0700 (PDT)
Date: Wed, 9 Jul 2025 16:00:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20250709155616-mutt-send-email-mst@kernel.org>
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



Weird:
$ git grep pci_device_is_present include/linux/pci.h 
include/linux/pci.h:bool pci_device_is_present(struct pci_dev *pdev);
include/linux/pci.h:    if (!pci_device_is_present(pdev))

and of course I did build it ... which commit should I test?

-- 
MST


