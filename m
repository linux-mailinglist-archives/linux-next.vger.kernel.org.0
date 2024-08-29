Return-Path: <linux-next+bounces-3501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C577964776
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 16:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC04B24397
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 13:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F291E18FDB2;
	Thu, 29 Aug 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNgSIzLy"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA142A96
	for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939412; cv=none; b=F20dk3/gQP+aNVdjZIs3hjQgmcHXAqvUjE3Hz9aPElPf7nm39SKb5icE7TQ0UYbACj7ZQHDqoZRVxjajhFNl6lCBNP1NQYtFfjLUPG2Tm20IjbAHn4gW1sLAGO0HpbRLqVmGN//5U6aHN2vzHkfc296dd0YTmWGTKyxqr6QDTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939412; c=relaxed/simple;
	bh=Zqnxe60NX0J45tBi8upIuccnsXnVk32jl9i7ZxtGV1c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ikiIzKxZIgxwhQwKL87Lrrb/3XmRngKmKSsEDs9duMc2VQ3zgzO1S80vat+dh30Vz2kCdqRis99iCTUC/oxvWoWkofIwkeZbeBUSZMzzNbX0hNAeZpq3RkOy37ndd8vUAbQhpN1QQA4auhV2vGbSKY/1+Ic9fCbI6nIR/5S+Y0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNgSIzLy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724939410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dqxAkUsCZdsmGpFV5oP8e7LMXSQ2NdK7SdPznVjJ+cM=;
	b=UNgSIzLyR9s6/Mx1vxQttxFLl8rSoWQoU12CPkrH8bis6xh0UmXGNSHfM/VMuZ/14O+elZ
	nIAIdaRa1SK4Z8gRpb2o17Tsz+FH5Vt3n8fzXBWMgwyVUUbEKbcerhU0myt+iVpT11HM/X
	Sgs6xFMgiJAKhoj4M8KP0gXdOEOxxXM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-zznkyzBINpOHDOobX67q3A-1; Thu, 29 Aug 2024 09:50:09 -0400
X-MC-Unique: zznkyzBINpOHDOobX67q3A-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e117c61d98cso898143276.0
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 06:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939408; x=1725544208;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqxAkUsCZdsmGpFV5oP8e7LMXSQ2NdK7SdPznVjJ+cM=;
        b=ugOM4V5+eNG5N8+7QGFJ4vbXswENNnGmuz8BayL3BWh2jCgocVBqjPoSQZqAuc0vD+
         YgQtP9LT9GCrLDB2lcq/Y8RUV7CJuMffa0pHJW9aU79F8MxwTyKX+0EtyAMu2za56tsk
         1elLOERW1JPrYykoQZr8sEcGBj2OiBBEiDPZdisRdwTVmDFUQy4fg0OOzCC8cAgX3l+w
         Eef6LvYE/jdFvtA9VhiymoDEyHfdslyCAQdLW9ksmMGSReX1R8wK89UQ2ZckW/G0a67H
         JByz52z9FsX6axcdfcjkwBhY29/IglBWN7YzxIyhnM6HSPZe93kHGc9mG1mBoBr2XhD3
         imUg==
X-Forwarded-Encrypted: i=1; AJvYcCXBal67AFuD4CbmJV3scRYssEeXrfBmlp/B6wu82m3UqIdh39O7eJlZDpByYSsRcGUnck1yN/qF7UKs@vger.kernel.org
X-Gm-Message-State: AOJu0YzvAqu2J+yH/zoFkUn3jOcLMLU1CMXXnYnwgSzH029itOFJfzyZ
	YCnnY5oXV4/9/WkZUI7grbZAHc0oUY7dKL0iZnBdo2nT4fHdHZExv0XMDlxyoixfiWDS7vi7UUP
	KQrfY8z7o1JbAP1TeiWTJaDk+lUe3TqJp5KVaBbXFsxKYN6TPhT3a4LQBrNs77Ur68kM=
X-Received: by 2002:a05:6902:2503:b0:e0b:b2a7:d145 with SMTP id 3f1490d57ef6-e1a5af293bamr2336890276.55.1724939408348;
        Thu, 29 Aug 2024 06:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG51/7pj3/Y34+vI76qM8cIEt41NGzhy/buW5H9XX6T2WeO9FmOTiIamrB3RsEcZ+JljzQvA==
X-Received: by 2002:a05:6902:2503:b0:e0b:b2a7:d145 with SMTP id 3f1490d57ef6-e1a5af293bamr2336867276.55.1724939407888;
        Thu, 29 Aug 2024 06:50:07 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d8e806sm51155185a.135.2024.08.29.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:50:06 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
References: <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
Date: Thu, 29 Aug 2024 15:50:03 +0200
Message-ID: <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 29/08/24 03:28, Paul E. McKenney wrote:
> On Wed, Aug 28, 2024 at 11:39:19AM -0700, Paul E. McKenney wrote:
>>
>> The 500*TREE03 run had exactly one failure that was the dreaded
>> enqueue_dl_entity() failure, followed by RCU CPU stall warnings.
>>
>> But a huge improvement over the prior state!
>>
>> Plus, this failure is likely unrelated (see earlier discussions with
>> Peter).  I just started a 5000*TREE03 run, just in case we can now
>> reproduce this thing.
>
> And we can now reproduce it!  Again, this might an unrelated bug that
> was previously a one-off (OK, OK, a two-off!).  Or this series might
> have made it more probably.  Who knows?
>
> Eight of those 5000 runs got us this splat in enqueue_dl_entity():
>
>       WARN_ON_ONCE(on_dl_rq(dl_se));
>
> Immediately followed by this splat in __enqueue_dl_entity():
>
>       WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node));
>
> These two splats always happened during rcutorture's testing of
> RCU priority boosting.  This testing involves spawning a CPU-bound
> low-priority real-time kthread for each CPU, which is intended to starve
> the non-realtime RCU readers, which are in turn to be rescued by RCU
> priority boosting.
>

Thanks!

> I do not entirely trust the following rcutorture diagnostic, but just
> in case it helps...
>
> Many of them also printed something like this as well:
>
> [  111.279575] Boost inversion persisted: No QS from CPU 3
>
> This message means that rcutorture has decided that RCU priority boosting
> has failed, but not because a low-priority preempted task was blocking
> the grace period, but rather because some CPU managed to be running
> the same task in-kernel the whole time without doing a context switch.
> In some cases (but not this one), this was simply a side-effect of
> RCU's grace-period kthread being starved of CPU time.  Such starvation
> is a surprise in this case because this kthread is running at higher
> real-time priority than the kthreads that are intended to force RCU
> priority boosting to happen.
>
> Again, I do not entirely trust this rcutorture diagnostic, just in case
> it helps.
>
>                                                       Thanx, Paul
>
> ------------------------------------------------------------------------
>
> [  287.536845] rcu-torture: rcu_torture_boost is stopping
> [  287.536867] ------------[ cut here ]------------
> [  287.540661] WARNING: CPU: 4 PID: 132 at kernel/sched/deadline.c:2003 enqueue_dl_entity+0x50d/0x5c0
> [  287.542299] Modules linked in:
> [  287.542868] CPU: 4 UID: 0 PID: 132 Comm: kcompactd0 Not tainted 6.11.0-rc1-00051-gb32d207e39de #1701
> [  287.544335] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [  287.546337] RIP: 0010:enqueue_dl_entity+0x50d/0x5c0
> [  287.603245]  ? __warn+0x7e/0x120
> [  287.603752]  ? enqueue_dl_entity+0x54b/0x5c0
> [  287.604405]  ? report_bug+0x18e/0x1a0
> [  287.604978]  ? handle_bug+0x3d/0x70
> [  287.605523]  ? exc_invalid_op+0x18/0x70
> [  287.606116]  ? asm_exc_invalid_op+0x1a/0x20
> [  287.606765]  ? enqueue_dl_entity+0x54b/0x5c0
> [  287.607420]  dl_server_start+0x31/0xe0
> [  287.608013]  enqueue_task_fair+0x218/0x680
> [  287.608643]  activate_task+0x21/0x50
> [  287.609197]  attach_task+0x30/0x50
> [  287.609736]  sched_balance_rq+0x65d/0xe20
> [  287.610351]  sched_balance_newidle.constprop.0+0x1a0/0x360
> [  287.611205]  pick_next_task_fair+0x2a/0x2e0
> [  287.611849]  __schedule+0x106/0x8b0


Assuming this is still related to switched_from_fair(), since this is hit
during priority boosting then it would mean rt_mutex_setprio() gets
involved, but that uses the same set of DQ/EQ flags as
__sched_setscheduler().

I don't see any obvious path in

dequeue_task_fair()
`\
  dequeue_entities()

that would prevent dl_server_stop() from happening when doing the
class-switch dequeue_task()... I don't see it in the TREE03 config, but can
you confirm CONFIG_CFS_BANDWIDTH isn't set in that scenario?

I'm going to keep digging but I'm not entirely sure yet whether this is
related to the switched_from_fair() hackery or not, I'll send the patch I
have as-is and continue digging for a bit.


