Return-Path: <linux-next+bounces-9010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2BC5EAEF
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F67435C5FE
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EBC340DB1;
	Fri, 14 Nov 2025 17:40:22 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21F341648;
	Fri, 14 Nov 2025 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142022; cv=none; b=tQo58xc4U1jY+GotT9r+89Ue+JwimuBPNyFYBg0iH85FFEtKRO4W9fa09SPax8eZDTnc7tMDdvG5wp/Kold2mHDYwu6oEXqofjK0ctkkzCMWyK0lvT+2KhZkgIZMwufzrJrNXKKsUWaRUEyGgb2SAV+7yniVdzZfw9cGjaf4T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142022; c=relaxed/simple;
	bh=99NdwDFZJn/cCp/dcNoJetsRLN6GI95BBSiRaN3xBWc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhKA4is9hWYmIcSnRIYFab3FAJ+/5tds91b/Pky6huZXeFdcD/V73HwBaM2VdS0vIGOoeuDyGf2u0damfhiYOZe65gM3138KWd2uPs6Friz1oBYQs2I+MSIrJqLPSSBLOMOJc6s7km3YT8FIQ+vSZysZsdDlBJuM+LDBI38XHsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 5D23612E280;
	Fri, 14 Nov 2025 17:40:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 11B7019;
	Fri, 14 Nov 2025 17:40:14 +0000 (UTC)
Date: Fri, 14 Nov 2025 12:40:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, yonghong.song@linux.dev
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114124033.78500cf3@gandalf.local.home>
In-Reply-To: <747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<20251114133532.mmdi2dca@linutronix.de>
	<20251114104633.0721bdbe@gandalf.local.home>
	<20251114160017.CrDJHi5w@linutronix.de>
	<20251114112202.08e1e3c1@gandalf.local.home>
	<20251114163330.pi9Nm3Vb@linutronix.de>
	<348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
	<20251114171052.gJRc-2A3@linutronix.de>
	<747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 11B7019
X-Stat-Signature: 7x6eg9pujow64f7tmf9yg4fqwosrfop1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+mODEt8u8m3VhtgyRdzT5SOY26JZgkzfQ=
X-HE-Tag: 1763142014-455411
X-HE-Meta: U2FsdGVkX1+Q2S3fcasH8LS7M8YdYVzm2CRlpojEqI+k9IJ9IXSYy+gjACEJ2f9bMNM5Yfu0gUPC/OUP5WzMYYWzwtAkxfkIlRI2A5ZU2GxzU/skFKXOniQK69M40rJ/hvCOp0flDJ2RTVpGm0sW99ulq8VtmfLXBYy9kHTJhz939gu2FHaHtnSYoLlouIRJyGmzpSn37N4cZn7HP3eBofzKgQ7pR6Lc9hrEeQspcRaZ1mhCs2Dg9SNxb4KfmTlHZ3uBbLeSh6Eop+OLr6UkU+Ijbcf9Iyj6Y2p5SHVHyu5y+qx7VsIV+QxAyv7eVj53gpDerZakozlK18K0q0quhYvMDU/YA2Bh

On Fri, 14 Nov 2025 09:25:06 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > This means srcu_read_lock_notrace() is much more overhead compared to
> > rcu_read_lock_sched_notrace()?
> > I am a bit afraid of different bugs here and there.  
> 
> No, the concern is instead overhead due to any actual preemption.  So the
> goal is to actually disable preemption across the BPF program *except*
> in PREEMPT_RT kernels.

If this is a BPF issue only, can we move this logic into the tracepoint
callbacks that BPF uses?

Because, as we can see in this patch. This logic has a ripple effect
throughout the tracing code where it may not be needed.

I see that the callbacks seem to call the bpf_func directly. Could there be
some kind of wrapper around these?

-- Steve

