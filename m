Return-Path: <linux-next+bounces-4970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4EF9F335A
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 15:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56AEC162F93
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1253205E1A;
	Mon, 16 Dec 2024 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hg9DmUcw"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66817BA2
	for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734359917; cv=none; b=uz5pAzL99kDX2OvGpQRtsFJL4WPiFMAJvICKOsnMVbczZ15nGTe4/CR5tZYGOuQJRJvdTjL8zgDPD6cJZybo2LIpQhnkvFOCyB7tOJnO+IZ92b+QTkjq5QxIBl+EbI8qhtquCpizG38iYmWO9UH9miSTq0uuqJSiAULy3Mzx4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734359917; c=relaxed/simple;
	bh=NqFH9M1poRt7bTXpp4KtGXJJB3jbpXnCTAj4fl1xr9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwR6gom0PTXSneClBJQJHTCE1+7RBP4fRGa8wOrEHEfHPz8cL3C0qeBpqwz1nUZYiJ2yLstXc/2u1UqjHGmqe8Ri9D0PQHvOeN8bug/Ys9lL29vI9u/lEV9XPSnxLruBIu7m7J6MENW1FDQXcghhFiAzxhLMw65G0ey9JBFIRaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hg9DmUcw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734359914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hl88bKgUtQBoA+6/xxv7PGibXvEneifgefM4d26Q1/o=;
	b=hg9DmUcwsKRb58yYJn228Z8jbR8hyYMmms8fFz4p9nGkjPmLRJK77DI1K8OVR8wIN7F85u
	o98KqkMFcfyayvb35B3EMnjWMwEVk8szwsyyWEpn0lP1UjR0AJ6tt3T/ok49A3W7JGOucK
	kMP7ykSkm7dPoj2EWTqPcevG95KI9xA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-B92bhXEvP0-HFu9JCrZlWw-1; Mon, 16 Dec 2024 09:38:33 -0500
X-MC-Unique: B92bhXEvP0-HFu9JCrZlWw-1
X-Mimecast-MFC-AGG-ID: B92bhXEvP0-HFu9JCrZlWw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa68952272bso411799266b.2
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 06:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359911; x=1734964711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hl88bKgUtQBoA+6/xxv7PGibXvEneifgefM4d26Q1/o=;
        b=NJiKZux2bhQ+3bcS9j/kF0f8CZhTxjJpRS5r+PZC3AAu1KM7Qpltk8LLCr68hb+iNc
         4jyvFE7NRla7v1LDBYQ09VTJsz2okzQhOfJvJXc7o9LF1jVQdEyJGLls4OcKWv7bS5tB
         FrKdwS5HlexqZ5Hvs949SWJuyi/cWoOuwUyhHHoZ59F9ij2NMtYy2Z/afpDrO7VYk+QU
         ew31KTxBJ/ONysohEVZsZaxGD3imDzCtjWZL+Wl95KSiNkcQLEBVoy2OKHvHcYa4lZJq
         bK4ms7VhDoZS3WpFq8+Y7F3YU+V41YEoRijuoAtg5CMla7PgPyU7WrZ4PkNsZTRFsp0M
         Y0ug==
X-Forwarded-Encrypted: i=1; AJvYcCU/wjaHv7ugwJacdKooQ5BWP2GmkxIJvs+Fvh3D9Uo8fCsUrSkYW+A/0UxrZSlgjGmwtqH1lCKWElnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9JcFAatgBp1KTy32l2XvaJCxk3k6QL5vafQxHBYhvY4zmlg/G
	Billumg1PfhBTiYO2VZKLN9CvHBP0TqnjBNxat1U7/iGBPhtC2OVqhdn3JMginKIzjWzzCbTz2z
	iT8a7xuXPnb1f4YCQ/YeGJzdDprDSv6boXnJObvvLLlfgMUOKM8OJAbx3Foif+KBLWazg4pkhWu
	IbbDIcyklErbbo/al+aMeHEKLST2q5oyYQkA==
X-Gm-Gg: ASbGncvvl7olFOaCRQKTuOwMaWuGaB5DtWL/ok47wXLKk3zrYox/lUOScuSGBf6gysc
	qs0rlMOhveNgI0ikTz5xv/NNtwGzfaKcRgmnLl9q61mcI8XKi8/qnaOTqfAsv34agnHFR+g==
X-Received: by 2002:a17:907:7709:b0:aa6:715a:75b5 with SMTP id a640c23a62f3a-aab77e8a150mr980514366b.46.1734359911305;
        Mon, 16 Dec 2024 06:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHB7tBQb79RZc8CrYX/I076MMpQ2QApIP/IRE0TK+AI+IpOmViY7Ec5Sc6pSayO7yLkQy2O4MXQCAx//+ILKg=
X-Received: by 2002:a17:907:7709:b0:aa6:715a:75b5 with SMTP id
 a640c23a62f3a-aab77e8a150mr980511166b.46.1734359910847; Mon, 16 Dec 2024
 06:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop> <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop> <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
 <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop> <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>
 <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop> <2cd70642-86de-4b26-87c2-94bde7441ce8@paulmck-laptop>
In-Reply-To: <2cd70642-86de-4b26-87c2-94bde7441ce8@paulmck-laptop>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 16 Dec 2024 15:38:20 +0100
Message-ID: <CAP4=nvTqnABSzYXiDfizoaeviqLtC87jG1fnGH4XFV+xQGn-2Q@mail.gmail.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
To: paulmck@kernel.org
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, 
	linux-next@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ne 15. 12. 2024 v 19:41 odes=C3=ADlatel Paul E. McKenney <paulmck@kernel.or=
g> napsal:
>
> And the fix for the TREE03 too-short grace periods is finally in, at
> least in prototype form:
>
> https://lore.kernel.org/all/da5065c4-79ba-431f-9d7e-1ca314394443@paulmck-=
laptop/
>
> Or this commit on -rcu:
>
> 22bee20913a1 ("rcu: Fix get_state_synchronize_rcu_full() GP-start detecti=
on")
>
> This passes more than 30 hours of 400 concurrent instances of rcutorture'=
s
> TREE03 scenario, with modifications that brought the bug reproduction
> rate up to 50 per hour.  I therefore have strong reason to believe that
> this fix is a real fix.
>
> With this fix in place, a 20-hour run of 400 concurrent instances
> of rcutorture's TREE03 scenario resulted in 50 instances of the
> enqueue_dl_entity() splat pair.  One (untrimmed) instance of this pair
> of splats is shown below.
>
> You guys did reproduce this some time back, so unless you tell me
> otherwise, I will assume that you have this in hand.  I would of course
> be quite happy to help, especially with adding carefully chosen debug
> (heisenbug and all that) or testing of alleged fixes.
>

The same splat was recently reported to LKML [1] and a patchset was
sent and merged into tip/sched/urgent that fixes a few bugs around
double-enqueue of the deadline server [2]. I'm currently re-running
TREE03 with those patches, hoping they will also fix this issue.

Also, last week I came up with some more extensive tracing, which
showed dl_server_update and dl_server_start happening right after each
other, apparently during the same run of enqueue_task_fair (see
below). I'm currently looking into that to figure out whether the
mechanism shown by the trace is fixed by the patchset.

--------------------------

rcu_tort-148       1dN.3. 20531758076us : dl_server_stop <-dequeue_entities
rcu_tort-148       1dN.2. 20531758076us : dl_server_queue: cpu=3D1
level=3D2 enqueue=3D0
rcu_tort-148       1dN.3. 20531758078us : <stack trace>
 =3D> trace_event_raw_event_dl_server_queue
 =3D> dl_server_stop
 =3D> dequeue_entities
 =3D> dequeue_task_fair
 =3D> __schedule
 =3D> schedule
 =3D> schedule_hrtimeout_range_clock
 =3D> torture_hrtimeout_us
 =3D> rcu_torture_writer
 =3D> kthread
 =3D> ret_from_fork
 =3D> ret_from_fork_asm
rcu_tort-148       1dN.3. 20531758095us : dl_server_update <-update_curr
rcu_tort-148       1dN.3. 20531758097us : dl_server_update <-update_curr
rcu_tort-148       1dN.2. 20531758101us : dl_server_queue: cpu=3D1
level=3D2 enqueue=3D1
rcu_tort-148       1dN.3. 20531758103us : <stack trace>
rcu_tort-148       1dN.2. 20531758104us : dl_server_queue: cpu=3D1
level=3D1 enqueue=3D1
rcu_tort-148       1dN.3. 20531758106us : <stack trace>
rcu_tort-148       1dN.2. 20531758106us : dl_server_queue: cpu=3D1
level=3D0 enqueue=3D1
rcu_tort-148       1dN.3. 20531758108us : <stack trace>
 =3D> trace_event_raw_event_dl_server_queue
 =3D> rb_insert_color
 =3D> enqueue_dl_entity
 =3D> update_curr_dl_se
 =3D> update_curr
 =3D> enqueue_task_fair
 =3D> enqueue_task
 =3D> activate_task
 =3D> attach_task
 =3D> sched_balance_rq
 =3D> sched_balance_newidle.constprop.0
 =3D> pick_next_task_fair
 =3D> __schedule
 =3D> schedule
 =3D> schedule_hrtimeout_range_clock
 =3D> torture_hrtimeout_us
 =3D> rcu_torture_writer
 =3D> kthread
 =3D> ret_from_fork
 =3D> ret_from_fork_asm
rcu_tort-148       1dN.3. 20531758110us : dl_server_start <-enqueue_task_fa=
ir
rcu_tort-148       1dN.2. 20531758110us : dl_server_queue: cpu=3D1
level=3D2 enqueue=3D1
rcu_tort-148       1dN.3. 20531760934us : <stack trace>
 =3D> trace_event_raw_event_dl_server_queue
 =3D> enqueue_dl_entity
 =3D> dl_server_start
 =3D> enqueue_task_fair
 =3D> enqueue_task
 =3D> activate_task
 =3D> attach_task
 =3D> sched_balance_rq
 =3D> sched_balance_newidle.constprop.0
 =3D> pick_next_task_fair
 =3D> __schedule
 =3D> schedule
 =3D> schedule_hrtimeout_range_clock
 =3D> torture_hrtimeout_us
 =3D> rcu_torture_writer
 =3D> kthread
 =3D> ret_from_fork
 =3D> ret_from_fork_asm

[1] - https://lore.kernel.org/lkml/571b2045-320d-4ac2-95db-1423d0277613@ovn=
.org/
[2] - https://lore.kernel.org/lkml/20241213032244.877029-1-vineeth@bitbytew=
ord.org/

> Just let me know!
>
>                                                         Thanx, Paul

Tomas


