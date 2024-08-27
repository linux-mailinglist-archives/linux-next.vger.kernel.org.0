Return-Path: <linux-next+bounces-3455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C570A961315
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 17:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF861F24617
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B151C6F55;
	Tue, 27 Aug 2024 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPtt+5X6"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B6D1C5788
	for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724773320; cv=none; b=q4B/BrEvC6hWekaIimi52w7Yzm9CS88XsegG5KwNq3B0fCx484G3FsQoMYE6x7M4e7ghAk2UyDwwQZM2niibzKuzF3BexSRNBVrDeEG/mBOLkLsNp2SG7/EYjQp6rKH1LXpbWNFHQg54BVAVsDfrcTpT+9I9rzSETToxDnoD9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724773320; c=relaxed/simple;
	bh=ZAWhcKduUxTafb6/Wx9uvfL0qKweULJ0YIrs2j6Xqe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XNGSo5UyY/O+q60fobGe7jkNGOUF+616YzQr3gLkl8LCFugSMUQZSn4LwY2rKzglzIZohaED0cuJVHS6MTMh++lW/YbGZirFkE8NvSWq8w506K1Ts5t5ezmBv02M2iNugADpRC4/YADS8OQKS1StyPx0LRMP6RlRXP516y9obG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPtt+5X6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724773317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6Px/4/l19JcNl/fwMiblMY++s/BJTa8xB5nFkqhBcc=;
	b=cPtt+5X6ekdK4gfGcrsXE0801E38PfjPxQQk0mvESndCNdFWsUHi8s5N2xIyaTdJadxyYV
	7Mo98jwhXAjnhJISRmjVHazULXd56ddKH9eTIHy80+2bKAIoO1U+NuzuVJroaFogL0mhY2
	GjfgyYlGA8dAgXSkRKorTsZtokefvsY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Srfx3w53Pk6L7o99YOgVBg-1; Tue, 27 Aug 2024 11:41:55 -0400
X-MC-Unique: Srfx3w53Pk6L7o99YOgVBg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5334af2a79eso5696818e87.1
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 08:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724773314; x=1725378114;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6Px/4/l19JcNl/fwMiblMY++s/BJTa8xB5nFkqhBcc=;
        b=L8GPAY8YWWn+CRhU1CKomZdq2A/ZPVfoG/q7D0qsBFow2jUr7D2cPckJK8sMjkAuuF
         paNAh6V1uk2+e1gm30BEd3ffTK+jKg4fgn1uc6ORL0XFYUCBc+IBc+TfvGzgmz5Gd03c
         5K0hi0gAIvmpbT0vryEOeUyUOBh5wSTiMaWyz/oYTHfQM0X9G+u9O0595oahTv5SSrGJ
         OeQOkxfM+ZMCG7EQorFN2CqY2+IXkv+5d23J+LyLGozQsb5hFTxJJWZFecDS8ouYCmcc
         9OXKKKEYMnzUAHmByOvxQLc4Kq0kIiHL7WzmrDPoOZ09ApzvEUsTal28QgX5Kfaucvxz
         cphA==
X-Forwarded-Encrypted: i=1; AJvYcCUvudY65btc3igYS6LkVOYKLSFP9nm6uHT/mxax62zb8pWaB/xsvPqOjSVbAMivU+02UU4C1se4PLZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSvuApAdc7Jh+/ZEgVlyUUr/EojOaYCA8zQPp6z9QYahE9SBc
	r/gMPt+eTAG8sIM93GkyrNJm/9VBdLFmeCYr/ZKu/KXfy9Bti8CcNwr+Vs+LuL6cTq1NiZXOdtu
	3mdemhxoauBQ2YUN3nmTVnstLNbvcGlZqxziZ/mEKmH6iOTUiLb538gKNffU=
X-Received: by 2002:a05:6512:1111:b0:530:e0fd:4a97 with SMTP id 2adb3069b0e04-534387e89d7mr10671849e87.0.1724773314272;
        Tue, 27 Aug 2024 08:41:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGya5Cog7WzH/edbQ2/bZc/cQt4hmmJzKjOW3d0Qk6T3JTXf/LNCy4sxIbNx60ZPcbIN9Vw2w==
X-Received: by 2002:a05:6512:1111:b0:530:e0fd:4a97 with SMTP id 2adb3069b0e04-534387e89d7mr10671806e87.0.1724773313471;
        Tue, 27 Aug 2024 08:41:53 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549cd4esm123171166b.55.2024.08.27.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:41:53 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Date: Tue, 27 Aug 2024 17:41:52 +0200
Message-ID: <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 27/08/24 12:03, Valentin Schneider wrote:
> On 26/08/24 09:31, Paul E. McKenney wrote:
>> On Mon, Aug 26, 2024 at 01:44:35PM +0200, Valentin Schneider wrote:
>>>
>>> Woops...
>>
>> On the other hand, removing that dequeue_task() makes next-20240823
>> pass light testing.
>>
>> I have to ask...
>>
>> Does it make sense for Valentin to rearrange those commits to fix
>> the two build bugs and remove that dequeue_task(), all in the name of
>> bisectability.  Or is there something subtle here so that only Peter
>> can do this work, shoulder and all?
>>
>
> I suppose at the very least another pair of eyes on this can't hurt, let me
> get untangled from some other things first and I'll take a jab at it.

I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
commit. I've also taken out the dequeue from switched_from_fair() and put
it at the very top of the branch which should hopefully help bisection.

The final delta between that branch and tip/sched/core is empty, so it
really is just shuffling inbetween commits.

Please find the branch at:

https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr

I'll go stare at the BUG itself now.


