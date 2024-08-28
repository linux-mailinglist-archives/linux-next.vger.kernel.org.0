Return-Path: <linux-next+bounces-3483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4C962FAD
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 20:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7041C23D88
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 18:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C61119E83D;
	Wed, 28 Aug 2024 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3fqkUio"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05B1D696
	for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724869034; cv=none; b=UlElC/WCI2YMHF6ajtZm3QcWennJ2g7IcNfqQP66RiPOhZJUJqZhKaC2B0C+5fm+0+BYrHLfjr2Rh6b+VXH00QH73MCH3/hGFcQTJtAAZy3T2+sPVPEd7nnBWtuWxWm1Hv+SxnqkMq4WHkcXs5deP63VKrH3gPSEP64NRFy70SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724869034; c=relaxed/simple;
	bh=FDVcTJV0BXbWzV5YbE4APsTof7/49Ez4Qa7pfi2wvLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iL+TnVH87kw3y277EFatPKRm61jdKOpnn0Nnx/IhKEBaoSzOt+02u5yau/AdOMXtRqqSf1ofZTZYqTnnc6HvFL9Vukf1cKeY68IXlGWQMEvPfvKcJq0zA0J3EmKLivRWl0cTvaWf7/De5YqCjR5wuG82ZNwJllC1GILl8+yqrmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3fqkUio; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724869031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hPcSd8zJJKxBEIyv9qutLiv0SREJjU3bqjzWOoPhTSc=;
	b=X3fqkUioacnHHGj9YrfRo9fFYiGC7w52f9eK9T8bh3KxgPepHBA4952VWlpgPTK+zx70Gy
	VjQLEK9jXJK1x8199qfORdpXJJiXUGD+8akAoifrvulOLRMU+2R5pKk9jE6nHm+/3qSIEp
	IzrovsBfbbg2LNBFJgfATYZ3eMZ78N8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-JhY2GuFkNBOn6xUJyiEhkA-1; Wed, 28 Aug 2024 14:17:10 -0400
X-MC-Unique: JhY2GuFkNBOn6xUJyiEhkA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44fe92a34d2so104086051cf.0
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 11:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724869030; x=1725473830;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPcSd8zJJKxBEIyv9qutLiv0SREJjU3bqjzWOoPhTSc=;
        b=tnNkFT3xKSRKdrKnVb56uy2J86ZARi0RgC1px7mvJYyaMlGqJJ+HT6nOqTaeVuBQ9V
         3InecLcl8h5b94GHLFkWVt/ou72lpwVdIeQ3hHSV6MYW/UTpo/afmVWxp9Ufuq7dE6Jo
         df6K47AtH82KYvPXzhWi6yvyWX9Cv577MuMskF9LnfTxIU4S64caGqPencd5jAxH32Rv
         xiYU1Qxgco5RSEskzJTXgpIh1WO3sgxQQEZrS7+M6QuXmhDC8jbS6P9ZyZY1f9hie4Av
         pXHk/F3bPx6ssRzTWwDqSouRd2Bxv3x8v4BMFo5B6//s1GYkDAtzCbRRVjRBgmkYZmiX
         F6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+hCsu5OS0JN9/p6ZZbyqyvk9sOZDZ404PfUvj2wK0sGXUzIFX/1vazx8m2gYXbI+I0avw4X6jW3nz@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnD3orhqIbTxLKuJs0ZDO0lCH/pjixT935bkPIcbPC+pXFMd0
	yTa3HNmdHYzH45Am2LiOR7Taw+k1mUzhcCWnvVkd7DxjQKZojK6VjgYO4yLid2t9qdxNow9Wd2d
	JmyXQT7ZIA1ugn3zSVpF4cS0AGl4sjEZlqDIplQxUNwKDTHnLAVZZgODad/k=
X-Received: by 2002:a05:622a:17cf:b0:44f:5eb0:ea76 with SMTP id d75a77b69052e-4567f707fecmr3374211cf.60.1724869030027;
        Wed, 28 Aug 2024 11:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFryRd0ObHFoM12Zfr+CDdLF4P/ACJM0CBkkshMWhr25Iwdqt3C1EdT62DUFAZlRzrEhrpXMg==
X-Received: by 2002:a05:622a:17cf:b0:44f:5eb0:ea76 with SMTP id d75a77b69052e-4567f707fecmr3373731cf.60.1724869029416;
        Wed, 28 Aug 2024 11:17:09 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe196bf5sm64122591cf.76.2024.08.28.11.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:17:08 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
References: <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
Date: Wed, 28 Aug 2024 20:17:06 +0200
Message-ID: <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 28/08/24 09:35, Paul E. McKenney wrote:
> On Wed, Aug 28, 2024 at 04:32:41PM +0200, Valentin Schneider wrote:
>> On 28/08/24 21:44, Chen Yu wrote:
>> >
>> > One question, although there is no DEQUEUE_DELAYED flag, it is possible
>> > the delayed task could be dequeued from CFS tree. Because the dequeue in
>> > set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():
>> >
>> >       bool sleep = flags & DEQUEUE_SLEEP;
>> >
>> >       if (flags & DEQUEUE_DELAYED) {
>> >
>> >       } else {
>> >               bool delay = sleep;
>> >               if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
>> >                  !entity_eligible(cfs_rq, se) {
>> >               //do not dequeue
>> >               }
>> >       }
>> >
>> >       //dequeue the task    <---- we should reach here?
>> >
>>
>> You're quite right, so really here the main missing bit would be the final
>> __block_task() that a DEQUEUE_DELAYED dequeue_entities() would get us.
>
> 50*TREE03 passed, yay!  Thank you both!!!
>

Fantastic, I'll hammer this into a "proper" patch then. Thanks again for
all the testing!

> I started a 500*TREE03.
>
> Yes, the odds all 50 passing given the baseline 52% failure rate is
> something like 10^-16, but software bugs are not necessarily constrained
> by elementary statistics...
>

:-)

>                                                       Thanx, Paul


