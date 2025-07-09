Return-Path: <linux-next+bounces-7444-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B2AFF34F
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 22:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088471C474B7
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 20:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B11D2566D1;
	Wed,  9 Jul 2025 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="asuZQm3m"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69AC23AE62
	for <linux-next@vger.kernel.org>; Wed,  9 Jul 2025 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094551; cv=none; b=RmpKGZeuNhZnRisyvVNOok0d+vH0n+DNRNTWAiL6AE9qo37QAAyG03fzpIfDZighrNglizBE480wIDKp+AJ4LCMEmHD74sDySOtp7ZFYL5xagcijjoT2kkKTdKrLQVObl3z1PK3C7zQtwkG/RtweF9UfMLtDueVDXon9dA9VJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094551; c=relaxed/simple;
	bh=XzDzRk1vGfiNCPslKWqmbDqIYuYeqD89trWJuumtsro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiWnFhaBnZbcGn7NlOBZ2upARsVnNgh4lzYNKyKB+/TSB2p0Tfh8El400HMdrU0ymP5AkwxkBxg0czVqYF6DI64F130G9DPWD1WuSliEiTRmIBinQI+AgchtFpxoxR9zc02faWrKoT8nY/unW4ftqvn2eAFpY9JgnEFwFnx03Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=asuZQm3m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752094548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xIp9/NRPhy2+LTOMOMLpJCUzNZlMcoIeNR8roytz2o4=;
	b=asuZQm3mVDiWGpug/Dn5JipGlZOmNHwSTClOjV9gr8QkRtFgPNIkeCeSNjuytoO0WsDC5n
	/Gc2XCBDh1ifmG8YaA+bpXFJoAf3c+O0IPN0bz62e5BQOB+wpe8dG21fBkjOoICt0nadMO
	2W8qoPAhEjSFExhTW0CE9d9Wc6JkQUA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-gVuz_GYAOrOAWZEYqyqyLw-1; Wed, 09 Jul 2025 16:55:47 -0400
X-MC-Unique: gVuz_GYAOrOAWZEYqyqyLw-1
X-Mimecast-MFC-AGG-ID: gVuz_GYAOrOAWZEYqyqyLw_1752094546
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450db029f2aso1163315e9.3
        for <linux-next@vger.kernel.org>; Wed, 09 Jul 2025 13:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752094546; x=1752699346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIp9/NRPhy2+LTOMOMLpJCUzNZlMcoIeNR8roytz2o4=;
        b=aCr2WxNjZoFbPiP7OJWdRoG0XmE9lEw/00UZT675pTtE82GLxyJQdF2ZKzCLZvzo6v
         91Q1aOmQpGyUD15tEts3w+WNkhJIHRwykrhMw8p1B4qRYNzI5Yj2gJaCeqvM5dQIY0CS
         PGGiZTyRv8LjQvc9jnOQgxZ/+WN3C4XaFDaxZkHz0jkDcecse5e8xSJiYO6m4Sfe7rNl
         /NHjkj6Ui+jOLRdq8pNSPeXWsvSnaiMXg8nz47mzOyjWX7IIf3qzC3gPCFSX20ynrHEp
         gloPdddLf2chnszSz/anbC0mRSZQpD+hL3+uBEzyHKW3nEc1ogC7+dtmkz2PJUcLRi5H
         4K8w==
X-Forwarded-Encrypted: i=1; AJvYcCWoGwk9RTgwh3s5ykF7kxUavMTO9Ur84K+pb1cLkLYQJvrFPPDlZnTRg1cPvGA96bjinCUXX/Drh4eO@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuosBXX9UUCFB68J+3vJ1hSQnObl1OYEhnitpWSJCZ7MzZmcP
	BooY39uqNnBJ/MqS1n4PDqwJZ36gRSuAjtD9SAIvkUC2+Ge5v7tOjX0+/+dA9EBaXnH5uVZaEJk
	hSPbMrar0OjlX3Xdccde/y/ROmNW8Dr6Y+SpOmbxOuQcN87P3AB5OrVd3+bTcYVUO2+XUTyk=
X-Gm-Gg: ASbGncsjCsGy/D0F7CW0N6bC4bYs/k4JUP4SJq2S0vDs06mi6rRZ2X8/4bi2IEADMPt
	9agvm1nLNmMVxva7GDd832M3lxs43aEZ67Nba9wXr/V7aN9ELhY8/NYBnZo08AT3fX7KCnB70im
	p6M3qd5n2/TWdbThJlDgKrKa6lKI7BbjZa2z7qkrWPcIMP14GSbK5uRNnQ2CCmCODYj2C2PysMx
	Dw+PygABXbg+e1u8b5aSO86cRBtnIjO7tsvnxRGUX1yb75XTainYDW8isUebReYINf8woI1hbU8
	8cclRGSzdss+igg=
X-Received: by 2002:a05:600d:3:b0:445:49e:796b with SMTP id 5b1f17b1804b1-454dba8d8a4mr8203685e9.17.1752094545940;
        Wed, 09 Jul 2025 13:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA0EX5mCNSFaO3IMjRPLIrDmEC4QNJB9NGJ5evjYUf2XMKmpq4NVz9GiJiOeP0QPX4EYOFeA==
X-Received: by 2002:a05:600d:3:b0:445:49e:796b with SMTP id 5b1f17b1804b1-454dba8d8a4mr8203565e9.17.1752094545563;
        Wed, 09 Jul 2025 13:55:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d512c2bfsm36939635e9.39.2025.07.09.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:55:45 -0700 (PDT)
Date: Wed, 9 Jul 2025 16:55:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20250709165533-mutt-send-email-mst@kernel.org>
References: <20250709221905.61e77ab8@canb.auug.org.au>
 <20250709155616-mutt-send-email-mst@kernel.org>
 <fdfc2aa4-09d6-4e5c-ae24-8d99b8bbe207@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdfc2aa4-09d6-4e5c-ae24-8d99b8bbe207@infradead.org>

On Wed, Jul 09, 2025 at 01:51:53PM -0700, Randy Dunlap wrote:
> 
> 
> On 7/9/25 1:00 PM, Michael S. Tsirkin wrote:
> > On Wed, Jul 09, 2025 at 10:19:05PM +1000, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> After merging the vhost tree, today's linux-next build (x86_64
> >> allnoconfig) failed like this:
> >>
> >> In file included from /home/sfr/next/next/arch/x86/events/amd/ibs.c:12:
> >> /home/sfr/next/next/include/linux/pci.h: In function 'pci_set_disconnect_work':
> >> /home/sfr/next/next/include/linux/pci.h:2738:14: error: implicit declaration of function 'pci_device_is_present'; did you mean 'pci_dev_present'? [-Wimplicit-function-declaration]
> >>  2738 |         if (!pci_device_is_present(pdev))
> >>       |              ^~~~~~~~~~~~~~~~~~~~~
> >>       |              pci_dev_present
> >>
> >> Caused by commit
> >>
> >>   b7468115b604 ("pci: report surprise removal event")
> >>
> >> I have reverted that commit and the 4 following ones (just in case).
> >>
> >> -- 
> >> Cheers,
> >> Stephen Rothwell
> > 
> > 
> > 
> > Weird:
> > $ git grep pci_device_is_present include/linux/pci.h 
> > include/linux/pci.h:bool pci_device_is_present(struct pci_dev *pdev);
> > include/linux/pci.h:    if (!pci_device_is_present(pdev))
> > 
> 
> in x86_64 allnoconfig, CONFIG_PCI is not enabled.
> 
> The function is only defined when CONFIG_PCI is enabled.
> 
> 
> > and of course I did build it ... which commit should I test?
> > 
> 
> The one that Stephen listed above?
> 
> -- 
> ~Randy

Fixed now, thanks!


