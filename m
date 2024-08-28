Return-Path: <linux-next+bounces-3481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB4962A4D
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 16:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B381F22214
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 14:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE1D188CC2;
	Wed, 28 Aug 2024 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKuSbgWZ"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710515B12F
	for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855569; cv=none; b=hV0dsTbU0h+mJOlr7t39IQ3W1L3q/N/zI5q/cZSs4LOAHf1XkmeBcI6Il5I/j6nIn6w6PsSFrWhajhssE4Ck8e/x0DHnpOuf0CcHl+aBmX1SmAAr95ZPebyD/jtoXwvrX4XVaDPUZXlHbge4r2XD6CoG4fM7VnvBmnsThuCmQu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855569; c=relaxed/simple;
	bh=+Mi2184h1xZbm62FMSLev7eEVMAKf6S9jAtm+YVcphM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ptnBGaP6v+h2V54tq1jlNwODqnuDZ2u8A/cISJq6j194802y6RX+lWdAQUU06rptiU11sCCA2dDQR2QByLeHyxkg9bj0YoeJZKuFC+7MQStfYfUKr52Aj9fPTYIM+BUdLzqCTSCENwWH/+OI5CATALZ92zv/xdC0ueoHF9vN5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKuSbgWZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724855567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsM63adfZcwGf4NsV84R7NLIWrT1HGZo+VbRPOwF6oA=;
	b=BKuSbgWZ6jRWW7hfPEIp+nzUu3wY6hLSSRD15nW9FRHQR1anHPoMpuC52iL8GGpv0jA56n
	SFuz66/8m8znwovx7VHqMiS7DfUoppp+PcmITQrDPXT1AH8aa+FmstExvE732X8jM3qVU0
	oevE0mA119haMFjHaFEo1q6pNg9OxwE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-EoKBxGtWOfu1GJQD7FrbYw-1; Wed, 28 Aug 2024 10:32:46 -0400
X-MC-Unique: EoKBxGtWOfu1GJQD7FrbYw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a7fa54e84aso59075885a.1
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 07:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724855565; x=1725460365;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsM63adfZcwGf4NsV84R7NLIWrT1HGZo+VbRPOwF6oA=;
        b=dtViSF2a28lvva/nkM0sPfAR3dCBMvKaupBtwkTOXK6rjMRYp9YT1Ujy1TEOMz8OOM
         xKd459+9/9FyLKlQ34nJnmdCfpmG4IVZ4TXvVp5AmTYlXRH0ApdDZqwSvQWLsVhyB/+N
         Xo4rqu6apYxxIjqMs0+iTHVGe+VaxCNb5PWTH+90f/j0cBT+0PFJlpdK1B3CbxPlLolC
         OtTCvxbal+VsVutr+Bo1uu6Z6b7YHkalCPvCDEK1fHdjJm2xQLjihZ3+TDP61qP2h5aI
         WXX7Ypp8oRag4MXo9SwhtEKDobIK4xiVCEeFkTD2pkazFVZT2IEFRCZPvOM5dp3k2hDk
         95BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAbAYkFNBnhMApLlJ+GWSXG7Z5JRdjNL+o0uP5ahAwssHa7Qc3OahA85WX3r95Kkt1BT7xd5saclyv@vger.kernel.org
X-Gm-Message-State: AOJu0YziMWebZwygV0dAzJgZjcv7xaPOXLnmkgiolMsCb30Q3W7mCtBP
	nI8s2brv9BFJgJv1WEUNoDLgQV3y7HwlY/ZudU8VxvvfPqmayYAIJ2ifEuWIQ5rbvrZ0ZcFOofX
	n0L6+a4lfOGXn/6oqUv1WZvx16Icid8Luy5R7N3Zus8aMndXBx/1YEkPiGc0=
X-Received: by 2002:a05:620a:1787:b0:79d:5f82:a404 with SMTP id af79cd13be357-7a6897b93c2mr1851436485a.64.1724855565466;
        Wed, 28 Aug 2024 07:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcjPgRwEqxCEbVdyXP9/wd97fgzbg61BJQVqKe1ofnQVu3KgIAfdqj85Uugxx7xe0cGJMthw==
X-Received: by 2002:a05:620a:1787:b0:79d:5f82:a404 with SMTP id af79cd13be357-7a6897b93c2mr1851432285a.64.1724855565000;
        Wed, 28 Aug 2024 07:32:45 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a802abbdd2sm5005485a.131.2024.08.28.07.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:32:43 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: paulmck@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
References: <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
Date: Wed, 28 Aug 2024 16:32:41 +0200
Message-ID: <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 28/08/24 21:44, Chen Yu wrote:
> Hi,
>
> On 2024-08-28 at 14:35:45 +0200, Valentin Schneider wrote:
>> On 27/08/24 13:36, Paul E. McKenney wrote:
>> > On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
>> >>
>> >> Thanks for the testing!
>> >>
>> >> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
>> >> a put_prev/set_next kind of issue...
>> >>
>> >> So far I'd assumed a ->sched_delayed task can't be current during
>> >> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
>> >> think that still holds: we can't get a balance_dl() or balance_rt() to drop
>> >> the RQ lock because prev would be fair, and we can't get a
>> >> newidle_balance() with a ->sched_delayed task because we'd have
>> >> sched_fair_runnable() := true.
>> >>
>> >> I'll pick this back up tomorrow, this is a task that requires either
>> >> caffeine or booze and it's too late for either.
>> >
>> > Thank you for chasing this, and get some sleep!  This one is of course
>> > annoying, but it is not (yet) an emergency.  I look forward to seeing
>> > what you come up with.
>> >
>> > Also, I would of course be happy to apply debug patches.
>> >
>> >                                                       Thanx, Paul
>>
>> Chen Yu made me realize [1] that dequeue_task() really isn't enough; the
>> dequeue_task() in e.g. __sched_setscheduler() won't have DEQUEUE_DELAYED,
>> so stuff will just be left on the CFS tree.
>>
>
> One question, although there is no DEQUEUE_DELAYED flag, it is possible
> the delayed task could be dequeued from CFS tree. Because the dequeue in
> set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():
>
>       bool sleep = flags & DEQUEUE_SLEEP;
>
>       if (flags & DEQUEUE_DELAYED) {
>
>       } else {
>               bool delay = sleep;
>               if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
>                  !entity_eligible(cfs_rq, se) {
>               //do not dequeue
>               }
>       }
>
>       //dequeue the task    <---- we should reach here?
>

You're quite right, so really here the main missing bit would be the final
__block_task() that a DEQUEUE_DELAYED dequeue_entities() would get us.


