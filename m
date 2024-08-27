Return-Path: <linux-next+bounces-3450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EE96069C
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 12:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BB4C1F22F3E
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 10:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041D1991AB;
	Tue, 27 Aug 2024 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODSW7ZcT"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63945149E0E
	for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753006; cv=none; b=N2bB2bCXcH7qbRlo1iu9fjILhDlMqNoFkAyE8q1FCKOWvTpF0Mf6jBTB/ZPprU5u3Fei5teLc7SzYjPF7Y8TSuv/dawZR1KXzrqBYlFJ3lrUODK9w7HNlOYkmkgeZBCw1qD/aghbZa4WOjIQG2OvOks/w26AOe2ItoGNY13surI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753006; c=relaxed/simple;
	bh=iXIy2MGZMO16gh3hzCW5LPWaQ1Od2aiOtgKYiO9W/Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gXAde8W9P93DnTTJl3yqVA5srxaKP7RI8vcrAUUQAHJW9BHAHZHPtzSBNxrrHL6P18WCZxRJl24sfI1XcoMe/rHXMAmX5CpHbySu6HnVot1LsereJ+z9gyhc5SIQuBU4r5+Gyif22MfSfY4AOw2QDeEiWUD5Lo2M+9UDmRPUITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODSW7ZcT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724753004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ePo7LbhktsoCxUNbD8OGtiEOqKS27VH/hUgT/iOtx/g=;
	b=ODSW7ZcTcskynJV7ICCvtXSXUkA66zOytTBZ7RjHCfHxnxuwUUC58szVvYt/zHxaORQS8q
	4tFuBTEI5p5cDNYYiXeshEltREqfmPQUa+ut6rP68ppJHamcX+xrtdKmTnZS1TEXhUnwIf
	uEIDJl5PXwkbCSUsjqszyCprqnh1V4o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-SSw72pLQOYC4Kb3PFvXUOw-1; Tue, 27 Aug 2024 06:03:23 -0400
X-MC-Unique: SSw72pLQOYC4Kb3PFvXUOw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6bbbe0e2d11so62691526d6.2
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 03:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753001; x=1725357801;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePo7LbhktsoCxUNbD8OGtiEOqKS27VH/hUgT/iOtx/g=;
        b=hR9RXrVazwCfj/X0pCOwrz/+D+N6O0G7H0ttcE2wkLmJsvqWYlThFk7vVYrBa+B/kN
         0XYEJvPOVSr800ZWUfJcH0tkrrOf+yDWmJyjXt2Ua88qljH+G+y0sj7NrllzTBaWctev
         QoGQEUHh6wO5DxWX1M7tipmYoBot5WOI7aivzcq10+8HT0pPoc8U+X1ADSN94cfFcrTs
         XedxtbHqqActZtffxmBYkvgnDIaRfSVI5bODyG+Trpt2yaRMLm1O6YA2z4THzFVYWRx1
         gXRMDM0edQyYKSoOo6xHO+WMKm1pHo0vNQ4/D0UqDIkUQP7sDK0xD/DPlWZ8qY6/tR47
         1fLw==
X-Forwarded-Encrypted: i=1; AJvYcCWJCgM3ZgU2XS0cZXBg4kIues04a92YTp9urh2liaZvBYMK1yAPXkQMkRZXRwbYHbJWgQIr2vBaSFMy@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9gK4Y5hgFVoIxD3ACeaal93vQ60PvjbnCRSJtkdH4pPX2i8l
	3bBN9jCylsf3iJe9W27hOcvU8f6bQeJ2JpSfzUzd8rpIaXXzKNHBtMOQdcsXRptrj0yt/1nGAfv
	NmHdrWs51JcXxWTF0VG5ZgE3Cr2w1mY7yvCYRYrh04lVC9iq1dIFTCW7mkb9oItu7+xE=
X-Received: by 2002:a05:6214:33c9:b0:6b5:e099:4d69 with SMTP id 6a1803df08f44-6c16dc6687bmr156669176d6.26.1724753001584;
        Tue, 27 Aug 2024 03:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaRoJeLC3RAwa6KhbDHYXuNtUK+CzXSM6BtZhXz/RxTCfBKmYUvq3UUrOeMINPe03dW2zkHg==
X-Received: by 2002:a05:6214:33c9:b0:6b5:e099:4d69 with SMTP id 6a1803df08f44-6c16dc6687bmr156668846d6.26.1724753001148;
        Tue, 27 Aug 2024 03:03:21 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d4ecb7sm54932126d6.42.2024.08.27.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:03:20 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
Date: Tue, 27 Aug 2024 12:03:17 +0200
Message-ID: <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 26/08/24 09:31, Paul E. McKenney wrote:
> On Mon, Aug 26, 2024 at 01:44:35PM +0200, Valentin Schneider wrote:
>> 
>> Woops...
>
> On the other hand, removing that dequeue_task() makes next-20240823
> pass light testing.
>
> I have to ask...
>
> Does it make sense for Valentin to rearrange those commits to fix
> the two build bugs and remove that dequeue_task(), all in the name of
> bisectability.  Or is there something subtle here so that only Peter
> can do this work, shoulder and all?
>

I suppose at the very least another pair of eyes on this can't hurt, let me
get untangled from some other things first and I'll take a jab at it.


