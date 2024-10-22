Return-Path: <linux-next+bounces-4362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE359A99DE
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 08:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86741F22CEC
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 06:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB447F460;
	Tue, 22 Oct 2024 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBIDA6Ou"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C6126C02
	for <linux-next@vger.kernel.org>; Tue, 22 Oct 2024 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578800; cv=none; b=XCFSEMqyCMg8hUryOzPzSmKv2XJdU6p7S7oupPyrYw2Zg+MypYiTXltHpT7NiuxQDek1uyPDUWJdGVUufvo8/zm+HWqfcMS+CXYqD1mIHePz07uSRnXHAcioJVf87RiT7P8d6YWaGssyi5FipZ2RBgBGe/XhFFtjCFkskcM+/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578800; c=relaxed/simple;
	bh=OhQKWcGpuVJpVP6Zwqeg9OuvfVXAYyyFs0xT5Qq+Eqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0Tg3wUHcCLhWGm9FuiLU6vbBh3JXkstBykscCeDYvoWegtRajTSS5utgPrTWhLi1Sh8RFuaI/6J8mtaapHiVuv1h9LUwtFib5QLbrpGDnhVngU8C7JCT8GXZN20jDo3CYTZv2PNx7exgX8cXigMPqMyRH9mJi1/oRsI54nZpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBIDA6Ou; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729578797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xofopRhCnvK59dW3Gfk8k5gnZGMhbg0rK63yxBmFv+I=;
	b=ZBIDA6OurdaqmHWrYTMrvVh6hjtKAqoqOB2cRFeEQOe1x/OKppbHIf8Zy9iyW9UUuKsM7t
	yk3exWA4S14TS9O5JKwrE928PzzZF+kA1S3/2Eof6SjGI2B3H4WwbNNMhx1MoIUbR4Ul7s
	XvOIQQzzFBJBnLLQI3yl/BY/PMC3C2I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-G_64o-2sPO2m6aAxBpipGQ-1; Tue, 22 Oct 2024 02:33:15 -0400
X-MC-Unique: G_64o-2sPO2m6aAxBpipGQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99cb787d2cso348921166b.2
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 23:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578794; x=1730183594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xofopRhCnvK59dW3Gfk8k5gnZGMhbg0rK63yxBmFv+I=;
        b=SLLWlqIOOdBCIctPNMMxC7PR2pTFO/RBWodiyAoLdpIccb5BHj0vaj4F2SZ/6ZNATG
         +P8wipXsZ7wmxaswHUdite3y+NsnrZU2MCoMHek1e4ETxh+6NWDo3ykv20mzZjKikfgz
         yd1urkcAG+8CSkfFTOoyj/PAnsi55hVyKmslyR4DA1N8Uvl3j5Db0mF5d36c23CkUP3i
         hdC7W7UkHMNZ6YVp3MpWT4guQn4ZBTvPflAGW4hxtWKgExbMycTuPd8/qZWcJtqe9tJl
         kYE6quUvi0RGcxhUcC1795YitbkkWm4NLlw7YOYZrpV5sOyFXrDYQT9B5SapgOZs03RT
         Hpow==
X-Forwarded-Encrypted: i=1; AJvYcCU4/JCBVrQ//YxLGf7z1o5WOilkTS84xGArC+wokTaGvtWGMz3jgovxT9moHFSszdCIxw9UV4vX6690@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtv/26U+nlID5x2GAsAteZgaSUUXkitUCYgfbxwNXj/NOZwcqX
	UB7hCA//CY6WwqDwrSKw9SbNZH7UrVR2CGRs+5QBfCpr36CubtgKz89ew9R5D6bo5zVrPODyviF
	XGbqO1pK9gJVaSFtOcFEmR2lBFazQQe0dBVjxdp8COJDSnYVTgsovt5jWKy4Y0nT9/4P8GYXR6+
	YAK3B8Q8cwFjZL9V4LkeKCloHfLtTywwbMkSR9a41fEYRVO5o=
X-Received: by 2002:a17:907:60cd:b0:a9a:f82:7712 with SMTP id a640c23a62f3a-a9aad371758mr126220466b.52.1729578794330;
        Mon, 21 Oct 2024 23:33:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU/Citu7XHyZ2ET9XBtwUDQzZljKMmz9eb3r2F1w6OgpBC9v60RvtXgM1XdjzBWI0mJS+ixhhNN1s5JastDYE=
X-Received: by 2002:a17:907:60cd:b0:a9a:f82:7712 with SMTP id
 a640c23a62f3a-a9aad371758mr126218266b.52.1729578793884; Mon, 21 Oct 2024
 23:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop> <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop> <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop> <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop> <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop> <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
In-Reply-To: <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 22 Oct 2024 08:33:03 +0200
Message-ID: <CAP4=nvTZba12trRn_cqunhD+VXaFBVfjzNddzf1ELaO31rTTzw@mail.gmail.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
To: paulmck@kernel.org
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, 
	linux-next@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 10. 10. 2024 v 13:24 odes=C3=ADlatel Tomas Glozar <tglozar@redhat.c=
om> napsal:
>
> Unfortunately, the following rcu stalls appear to have resulted in
> abnormal termination of the VM, which led to the ftrace buffer not
> being dumped into the console. Currently re-running the same test with
> the addition of "ftrace_dump_on_oops panic_on_warn=3D1" and hoping for
> the best.
>

Adding ftrace_dump_on_oops and panic_on_warn fixed the tracing issue.
The last 20 lines on CPU 1, where the WARN was triggered, are:

[21031.703970] rcu_tort-6861      1dN.4. 21027715638us : sched_wakeup:
comm=3Dksoftirqd/1 pid=3D26 prio=3D97 target_cpu=3D001
[21031.705308] rcu_tort-6861      1d..2. 21027715639us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DR+ =
=3D=3D>
next_comm=3Dksoftirqd/1 next_pid=3D26 next_prio=3D97
[21031.707388] ksoftirq-26        1d.s3. 21027715645us : sched_wakeup:
comm=3Drcu_preempt pid=3D16 prio=3D97 target_cpu=3D000
[21031.710718] ksoftirq-26        1d..2. 21027715649us : sched_switch:
prev_comm=3Dksoftirqd/1 prev_pid=3D26 prev_prio=3D97 prev_state=3DS =3D=3D>
next_comm=3Drcu_torture_boo next_pid=3D6861 next_prio=3D98
[21031.719409] rcu_tort-6861      1d..2. 21027719648us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DR+ =
=3D=3D>
next_comm=3Drcu_preempt next_pid=3D16 next_prio=3D97
[21031.723490] rcu_pree-16        1d..2. 21027719657us : sched_switch:
prev_comm=3Drcu_preempt prev_pid=3D16 prev_prio=3D97 prev_state=3DI =3D=3D>
next_comm=3Drcu_torture_boo next_pid=3D6861 next_prio=3D98
[21031.725527] rcu_tort-6861      1dN.3. 21027724637us : sched_wakeup:
comm=3Dksoftirqd/1 pid=3D26 prio=3D97 target_cpu=3D001
[21031.726817] rcu_tort-6861      1d..2. 21027724638us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DR+ =
=3D=3D>
next_comm=3Dksoftirqd/1 next_pid=3D26 next_prio=3D97
[21031.728867] ksoftirq-26        1d.s3. 21027724644us : sched_wakeup:
comm=3Drcu_preempt pid=3D16 prio=3D97 target_cpu=3D008
[21031.732215] ksoftirq-26        1d..2. 21027724648us : sched_switch:
prev_comm=3Dksoftirqd/1 prev_pid=3D26 prev_prio=3D97 prev_state=3DS =3D=3D>
next_comm=3Drcu_torture_boo next_pid=3D6861 next_prio=3D98
[21031.751734] rcu_tort-6861      1d..2. 21027729646us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DR+ =
=3D=3D>
next_comm=3Drcu_preempt next_pid=3D16 next_prio=3D97
[21031.755815] rcu_pree-16        1d..2. 21027729656us : sched_switch:
prev_comm=3Drcu_preempt prev_pid=3D16 prev_prio=3D97 prev_state=3DI =3D=3D>
next_comm=3Drcu_torture_boo next_pid=3D6861 next_prio=3D98
[21031.757850] rcu_tort-6861      1dN.4. 21027734637us : sched_wakeup:
comm=3Dksoftirqd/1 pid=3D26 prio=3D97 target_cpu=3D001
[21031.759147] rcu_tort-6861      1d..2. 21027734638us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DR+ =
=3D=3D>
next_comm=3Dksoftirqd/1 next_pid=3D26 next_prio=3D97
[21031.761193] ksoftirq-26        1d.s3. 21027734643us : sched_wakeup:
comm=3Drcu_preempt pid=3D16 prio=3D97 target_cpu=3D009
[21031.764531] ksoftirq-26        1d..2. 21027734648us : sched_switch:
prev_comm=3Dksoftirqd/1 prev_pid=3D26 prev_prio=3D97 prev_state=3DS =3D=3D>
next_comm=3Drcu_torture_boo next_pid=3D6861 next_prio=3D98
[21031.871062] rcu_tort-6861      1d..2. 21027768837us : sched_switch:
prev_comm=3Drcu_torture_boo prev_pid=3D6861 prev_prio=3D98 prev_state=3DI =
=3D=3D>
next_comm=3Dkworker/1:1 next_pid=3D5774 next_prio=3D120
[21031.882721] kworker/-5774      1d..2. 21027768847us : sched_switch:
prev_comm=3Dkworker/1:1 prev_pid=3D5774 prev_prio=3D120 prev_state=3DI =3D=
=3D>
next_comm=3Dkworker/1:2 next_pid=3D6636 next_prio=3D120
[21031.889173] kworker/-6636      1dN.3. 21027768851us :
dl_server_stop <-dequeue_entities
[21031.902411] kworker/-6636      1dN.3. 21027768863us :
dl_server_start <-enqueue_task_fair

and then the trace goes silent for that CPU. That corresponds to the
warning after which the panic is triggered:

[21027.819253] WARNING: CPU: 1 PID: 6636 at
kernel/sched/deadline.c:1995 enqueue_dl_entity+0x516/0x5d0
[21027.820450] Modules linked in:
[21027.820856] CPU: 1 UID: 0 PID: 6636 Comm: kworker/1:2 Not tainted
6.11.0-g2004cef11ea0-dirty #1
[21027.821993] Hardware name: Red Hat KVM/RHEL, BIOS 1.16.3-2.el9 04/01/201=
4
[21027.822883] Workqueue:  0x0 (rcu_gp)
[21027.823363] RIP: 0010:enqueue_dl_entity+0x516/0x5d0
[21027.824002] Code: ff 48 89 ef e8 8b cf ff ff 0f b6 4d 54 e9 0e fc
ff ff 85 db 0f 84 d0 fe ff ff 5b 44 89 e6 48 89 ef 5d 41 5c e9 db d6
ff ff 90 <0f> 0b 90 e9 fa fa ff ff 48 8b bb f8 09 00 00 48 39 fe 0f 89
de fb
[21027.827134] RSP: 0000:ffff8cbd85713bf0 EFLAGS: 00010086
[21027.827817] RAX: 0000000000000001 RBX: ffff8919dc86cc28 RCX: 00000000000=
00002
[21027.828749] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8919dc8=
6cc28
[21027.829678] RBP: ffff8919dc86cc28 R08: 0000000000000001 R09: 00000000000=
001f4
[21027.830608] R10: 0000000000000000 R11: ffff8919c1efe610 R12: 00000000000=
00001
[21027.831537] R13: 0000000000225510 R14: ffff8919dc86c380 R15: ffff8919dc8=
6c3c0
[21027.832468] FS:  0000000000000000(0000) GS:ffff8919dc840000(0000)
knlGS:0000000000000000
[21027.833521] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[21027.834277] CR2: 0000000000000000 CR3: 000000001e62e000 CR4: 00000000000=
006f0
[21027.835204] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[21027.836127] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[21027.837049] Call Trace:
[21027.837388]  <TASK>
[21027.837671]  ? __warn+0x88/0x130
[21027.838107]  ? enqueue_dl_entity+0x516/0x5d0
[21027.838665]  ? report_bug+0x18e/0x1a0
[21027.839181]  ? handle_bug+0x54/0x90
[21027.839640]  ? exc_invalid_op+0x18/0x70
[21027.840145]  ? asm_exc_invalid_op+0x1a/0x20
[21027.840696]  ? enqueue_dl_entity+0x516/0x5d0
[21027.841259]  dl_server_start+0x36/0xf0
[21027.841751]  enqueue_task_fair+0x220/0x6b0
[21027.842291]  activate_task+0x26/0x60
[21027.842761]  attach_task+0x35/0x50
[21027.843213]  sched_balance_rq+0x663/0xe00
[21027.843739]  sched_balance_newidle.constprop.0+0x1a5/0x360
[21027.844455]  pick_next_task_fair+0x2f/0x340
[21027.845000]  __schedule+0x203/0x900
[21027.845470]  ? sync_rcu_do_polled_gp+0xba/0x110
[21027.846068]  schedule+0x27/0xd0
[21027.846483]  worker_thread+0x1a7/0x3b0
[21027.846974]  ? __pfx_worker_thread+0x10/0x10
[21027.847539]  kthread+0xd6/0x100
[21027.847955]  ? __pfx_kthread+0x10/0x10
[21027.848455]  ret_from_fork+0x34/0x50
[21027.848923]  ? __pfx_kthread+0x10/0x10
[21027.849420]  ret_from_fork_asm+0x1a/0x30
[21027.849934]  </TASK>

Apparently, dl_server_start is not called twice so it has to be
something else messing up with the dl_se->rb_node.

Tomas


