Return-Path: <linux-next+bounces-9272-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7092FC9538A
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 19:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AEDDD342314
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 18:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F93221DB1;
	Sun, 30 Nov 2025 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YUCS/lyl"
X-Original-To: linux-next@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA372AD3D
	for <linux-next@vger.kernel.org>; Sun, 30 Nov 2025 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764528598; cv=none; b=hhGZCOa7HyQv6y3uA+m3SyRYxi/hZmPi+tF1mXAVUG2PI6ASx+e25MDLCklv3AZio+dQKswkBXp69HYgMyE0oazqT/mUrRuem8s2VFO52EsfgKCUG9tgTZyEiHVtOXXGCNwLjMmOvS1m7rf3ZmGXgVUFHeyFi6n7to8O9PH53Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764528598; c=relaxed/simple;
	bh=Rxs5/jnq5a1H1YRI6NV2G94VksSh1p76fDqDuAZYW48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYBCHlaAogXsud+a847TmcC58B4ncXwPe1aOR9qZfDYVgURohtSDhOOsZ3vF8LysYb1FcaoBuJpVcd948oWzFURcTe78ttErVael8gKnpPbGr/hwA294UlIp3YvmXGtvTZDXxSB4sPzZO5GoumUY/4APNtMj4EUwoC8W/mrwAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YUCS/lyl; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <59631498-2013-4224-adcf-f0afe6e7ff14@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764528584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0J6I0HX2tOkKevS1PugqNw40kuaRlnXbhkBMNEpiBmI=;
	b=YUCS/lylvh7nmSsnbT5n1+qMxznlKXXpVpykdzNBtH9mwUaqz1jCL9KA5iKe/0AfprrByf
	0kT+Fs64SOPvzXXVw74i9UsV6jf6oJLNWWHP0u5f4A0vfldTXlut16uWV07zIb0Tit60To
	bC6VS08lW0mtGTcFf8t9i/2q1MlGa8o=
Date: Sun, 30 Nov 2025 10:49:36 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Content-Language: en-GB
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: paulmck@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
 <5d6033df-b651-4daa-a804-dd142f441358@linux.dev>
 <20251118073508.JdhVECQD@linutronix.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20251118073508.JdhVECQD@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 11/17/25 11:35 PM, Sebastian Andrzej Siewior wrote:
> On 2025-11-14 10:31:45 [-0800], Yonghong Song wrote:
>>> I believe that migration needs to be disabled at this point, but I am
>>> again adding Yonghong on CC for his perspective.
>> Yes, migration needs to be disabled for rt kernel in order to let
>> bpf program running properly.
> Why is disabling migration special in regard to RT kernels vs !RT?
> Why do we need to disable migration given that bpf_prog_run_array()
> already does that? Is there a different entry point?

bpf_prog_run_array() has two callers. One is trace_call_bpf() in
kernel/trace/bpf_trace.c, and the other is lirc_bpf_run() in
drivers/media/rc/bpf-lirc.c. The migration disable/enabled is
needed for lirc_bpf_run().

> My point why is it required to disable migration on trace-point entry
> for BPF given that the BPF-entry already does so.

In trace_call_bpf(), we have
    if (unlikely(__this_cpu_inc_return(bpf_prog_active) != 1)) { ... }
So migriate_disable() is necessary.

>
> Sebastian


