Return-Path: <linux-next+bounces-3460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC5961885
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 22:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266EE282D8B
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 20:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C42015B115;
	Tue, 27 Aug 2024 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TarepLfc"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3103156C5E
	for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790632; cv=none; b=XYUjkreQi19kt3rQe/WnwNumxzKHWSJ+7qTABGbENodlTzJEIb+5ywz/LtFmejBJmJkinI5pFjsaoOElajwzsJ1QqGcCwk2tTAZyU1vz2NFPSF0cl6ttDrmqOMNfXuDB+QglSVgLSbLlsy5rtP6qZvMnCE+4hPraaEX/02p5b78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790632; c=relaxed/simple;
	bh=DawOFcf5AvQ3uqzdkNrh+jArPYwELaOHKFfilJEtFpo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iIwKg5I5aijZ1NphJDqtlAWefTDrcJ9iCfcXiQ6IUGd1rCO8YUZnWKZaU2JAxrm/ddCsX081a+0IR81FBzM/zZefFeM/3eZOrQ8rwLoS9OBIEebkFSnK6vtSUHYydz8nif39pSJEyU2xn0yij2e5+T4pSYlOl8sSjg9/hUCSW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TarepLfc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724790629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrNqCdsW3/4Cu+elSHQrVxE9Lte4vVhhYbprkgABLJk=;
	b=TarepLfco2GsmzdxB3LhWOor6+HD/KYkhKSojt3zsMfKM8UwYf+a4aLJatEV/D6tvdqI1M
	O4oLNwIcP5P1WXKEyzrSsvLjuJgYzZnU+u3Wm2qcidHB4bqQ9r1bcqwPl5o4ucCEJTJmSJ
	MKaBjr0VXY+wKk2db2y0f65KYEjYVEo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-7Flf40PANU6bJVjV98zOUg-1; Tue, 27 Aug 2024 16:30:28 -0400
X-MC-Unique: 7Flf40PANU6bJVjV98zOUg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37189fa7ad6so4270538f8f.0
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 13:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724790627; x=1725395427;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrNqCdsW3/4Cu+elSHQrVxE9Lte4vVhhYbprkgABLJk=;
        b=RbKiDVm/yWJRgfUcYCPpCpNJlxdKmQnCzmXHFMpxkgVrzvt8p3v4+hPnji9LLnF6lC
         kxZAu6iXxm2jz0B5skLF6mqouhfA2rYaVSNGBJOqr4AfEggtW54uxopL7FD34untCZvG
         a+TfCfOYbNzUoM4x9P1qWp80hvmOmPrKgoWZ0jwMFlU+IvNL/i0zZ5UTBVBxx6MR7FMu
         4oZ/a1m+q6q3TWUURZ+GNoBXHHCQjoCG3ykQN1AluvkuHiZBEhikbS8KfqGrwDGElUDy
         vXQWWBPIwQ3QLeAWamxfPnVBCJTt2Rm8aQFvlGzEKMRUW+8wSxsyu/jKqOmIptrhhm/N
         Re6g==
X-Forwarded-Encrypted: i=1; AJvYcCVsG5I04Ss+4y/ic0ynxI9yJ2B36xRBGT8ErK369weDY1hX9zEGQwjU+YZVDGcMZ7k5tcFO5oS0/1d3@vger.kernel.org
X-Gm-Message-State: AOJu0YznFUcFIiSI0PR0ysOlNLpl2prrodxOFnPjTcz5OKvDTddRhB6c
	5ej5dxRo8rYvw7KkQTKtmYuJnd+zbsLTwNCSWSUB123ST+bdrCUCJsKPzUKirvp8ktYTWt6KH/X
	THb7B6gUpxaTg2lqaOmIUCe+xwZtRrjLQnQ7n4P5Fm+QXw0oU9t1luNRfv7w=
X-Received: by 2002:a5d:67cc:0:b0:371:8283:94c1 with SMTP id ffacd0b85a97d-373117be78bmr11579985f8f.0.1724790626966;
        Tue, 27 Aug 2024 13:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqKHyQsdDDBnGt7ZSYZjBCsuGR7UU9hsI/9Tug+uTr1ipNKf2Uo3/icQ1xYFn6O3aW8AueDA==
X-Received: by 2002:a5d:67cc:0:b0:371:8283:94c1 with SMTP id ffacd0b85a97d-373117be78bmr11579957f8f.0.1724790626129;
        Tue, 27 Aug 2024 13:30:26 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac515a2a5sm199976025e9.20.2024.08.27.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 13:30:25 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
Date: Tue, 27 Aug 2024 22:30:24 +0200
Message-ID: <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27/08/24 11:35, Paul E. McKenney wrote:
> On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
>> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
>> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order=
 any
>> > commit. I've also taken out the dequeue from switched_from_fair() and =
put
>> > it at the very top of the branch which should hopefully help bisection.
>> >
>> > The final delta between that branch and tip/sched/core is empty, so it
>> > really is just shuffling inbetween commits.
>> >
>> > Please find the branch at:
>> >
>> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete=
-builderr
>> >
>> > I'll go stare at the BUG itself now.
>>
>> Thank you!
>>
>> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
>> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
>> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"=
),
>> which has stood up to heavy hammering in earlier testing.
>
> And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
> Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
> CPU stall warnings, and the last one was an oddball "kernel BUG at
> kernel/sched/rt.c:1714"=C2=A0followed by an equally oddball "Oops: invalid
> opcode: 0000 [#1] PREEMPT SMP PTI".
>
> Just to be specific, this is commit:
>
> df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switc=
hing from fair")
>
> This commit's predecessor is this commit:
>
> 2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
>
> This predecessor commit passes 50 runs of TREE03 with no failures.
>
> So that addition of that dequeue_task() call to the switched_from_fair()
> function is looking quite suspicious to me.  ;-)
>
>                                                       Thanx, Paul

Thanks for the testing!

The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
a put_prev/set_next kind of issue...

So far I'd assumed a ->sched_delayed task can't be current during
switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
think that still holds: we can't get a balance_dl() or balance_rt() to drop
the RQ lock because prev would be fair, and we can't get a
newidle_balance() with a ->sched_delayed task because we'd have
sched_fair_runnable() :=3D true.

I'll pick this back up tomorrow, this is a task that requires either
caffeine or booze and it's too late for either.


