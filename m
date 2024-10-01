Return-Path: <linux-next+bounces-4043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2998BCD0
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 14:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0157DB23583
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 12:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DA31C245F;
	Tue,  1 Oct 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKNEDlAt"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D2F1C2DC4
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787168; cv=none; b=GUHinZrQ6U7NHOX/iMbPuEvBXx4FuLuyToMK6bf4TedDoBA5p5eosnHnpBa4uiy/AqtwjbiP05oCRDmMpNJBPyt9NTve0Mlu+5OAEqm+8iw9x+eug8vVM5QlbyAmnitOJjQdViTTwYMb9pls7Cz+kLMled6i2ZZMlgj5GIkARoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787168; c=relaxed/simple;
	bh=3A6vNta9SvTLyYbuZA6Y9cFT4NVEjyyhoIMiYJsbc60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H3PaqYW2h50aN94+13hXbxOJyfnB8m92BRxoJzUGmm2w0v4v2KfnM8FOnRrG6sZrtVjlwAo/2+gp+yLL1+A7xjdbzD/my+dbJVBMyqo15HZayf5BvIk6STuUwxOi41aA6x82d1B3YS9vZHeE6cUJibRix92gkq7dv/iOFuzkY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKNEDlAt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727787166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GEPx7v6OMKseDg9pVfYwY8ZmnNisp90m0mp2T3pN8ko=;
	b=bKNEDlAthm3It718uoy/u8DojxP5IEcduqu+JXpM/vxDyUQpNSTYWwEojLRue2vlSh/Yby
	uVFR5UrKkpSxqHeF3PJztZj0fe7aF4sRDLPnqQ+zpcZOxXnalLx5R8fubytG24m42J/rEW
	loKSAU3Rmq9ho0mdVVTSg2TFg++GL5Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-CGrwOlAZNTOabJeASuK10w-1; Tue, 01 Oct 2024 08:52:45 -0400
X-MC-Unique: CGrwOlAZNTOabJeASuK10w-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a9a85e4a85so1261373785a.0
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2024 05:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787163; x=1728391963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEPx7v6OMKseDg9pVfYwY8ZmnNisp90m0mp2T3pN8ko=;
        b=ea8W6Q7qX/+X7LPVGSgLhQMbqZYcpm0ki5qdX7LvfMzMhDqA0OrFw2lecQRKfS3zPZ
         xZXDM64XF9Awji2mOP/Y7yFY+JGk8WIWncY0rMdDDdMLo1Vpxs6TuUKZLZCml56hEjZo
         UjqgZhcFiiEzWVhMxMYa06WJAyBQyhwEBcYO7AC2bFxCHOlNmxUPtH1WAIyr47v1sdx1
         TszkPPlnODnrD/Czb/4WA2DD+qhDsmqVNntxRsugpL11ADebggdq3jL/WkTb5mVfXMW+
         YjylZI9hyCe/nyeeCiep3aWGvxPOXcPi1BlL9XztagLhpv+oLMA9N8tnFsitvjAOJzPd
         wpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc73e3LrPwkrn+WqlYGsluP9qahj3+zpi2afzbaqP5IZG5Nc116DAHC8/A11R4okXP2tl9EArgwVxh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2WPjAcd6i9omEiZSRaVDIVWNhPMVyE5ncxThwCd/gulLXoNt
	RMo1dcKnshnYroqfTV3Om1u6Bk4faShM1PQi6swNXV9d3zwDs44rY5UnORFPQqy0lCcmqcobXhC
	mbiPg1x9ll7npQvdOQao/+GFXUjUI+8N3sK9EmKYUa/Wvmhd4KG2LW3EVO59Bu9KCmOg=
X-Received: by 2002:a05:620a:2946:b0:7ac:e931:f158 with SMTP id af79cd13be357-7ae378dbba3mr2612318385a.53.1727787162864;
        Tue, 01 Oct 2024 05:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc2vx2t9dX9fiRJfJxGZjbq1Mw82t9tHhJSNRuUJgNwVDEGGHA3aFaYZ0NFxy4voUaTAhpag==
X-Received: by 2002:a05:620a:2946:b0:7ac:e931:f158 with SMTP id af79cd13be357-7ae378dbba3mr2612314985a.53.1727787162455;
        Tue, 01 Oct 2024 05:52:42 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782b961sm499235085a.75.2024.10.01.05.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:52:40 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, kernel-team@meta.com, Tomas Glozar
 <tglozar@redhat.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
References: <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
Date: Tue, 01 Oct 2024 14:52:37 +0200
Message-ID: <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 01/10/24 03:10, Paul E. McKenney wrote:
> On Mon, Sep 30, 2024 at 10:44:24PM +0200, Valentin Schneider wrote:
>> On 30/09/24 12:09, Paul E. McKenney wrote:
>> >
>> > And Peter asked that I send along a reproducer, which I am finally getting
>> > around to doing:
>> >
>> >       tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 12h --configs "100*TREE03" --trust-make
>> >
>>
>> FYI Tomas (on Cc) has been working on getting pretty much this to run on
>> our infra, no hit so far.
>>
>> How much of a pain would it be to record an ftrace trace while this runs?
>> I'm thinking sched_switch, sched_wakeup and function-tracing
>> dl_server_start() and dl_server_stop() would be a start.
>>
>> AIUI this is running under QEMU so we'd need to record the trace within
>> that, I'm guessing we can (ab)use --bootargs to feed it tracing arguments,
>> but how do we get the trace out?
>
> Me, I would change those warnings to dump the trace buffer to the
> console when triggered.  Let me see if I can come up with something
> better over breakfast.  And yes, there is the concern that adding tracing
> will suppress this issue.
>
> So is there some state that I could manually dump upon triggering either
> of these two warnings?  That approach would minimize the probability of
> suppressing the problem.
>

Usually enabling panic_on_warn and getting a kdump is ideal, but here this
is with QEMU - I know we can get a vmcore out via dump-guest-memory in the
QEMU monitor, but I don't have an immediate solution to do that on a
warn/panic.

Also I'd say here we're mostly interested in the sequence of events leading
us to the warn (dl_server_start() when the DL entity is somehow still
enqueued) rather than the state of things when the warn is hit, and for
that dumping the ftrace buffer to the console sounds good enough to me.

>                                                       Thanx, Paul


