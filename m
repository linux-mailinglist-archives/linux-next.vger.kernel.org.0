Return-Path: <linux-next+bounces-9071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FEC6807D
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 08:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC58B384065
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 07:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29DD30217D;
	Tue, 18 Nov 2025 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dIbGPdNM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PW3kVN+6"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30913285041;
	Tue, 18 Nov 2025 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451312; cv=none; b=etgtCv5HdIFEafYS3aBxBOrzR8NLGUSaCXySonSiFryrF4Kxl1y97kXXe3FhPlptflLGJLQMuOQ8yfsJ3SDiVsrDJjybhgP3EDQi4MkMS5383+howvnIJcJZCMUXV0hcdp9CNeFpdan4zMBIZeJSaXuFysuXGwZFDNWRkM0nLIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451312; c=relaxed/simple;
	bh=unQVZkOTgl3G3126wMu9HRLCzww8GAec0f5crPxZ/x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbEkZy/55kLCAMTl9zZH80WzpIIUW4Z+rtenibqphQyE9A/w5rBrw//HEeJd7tf12G4c8uoYcBHcgCrM7GUuV8bCL5/QNLWwqJ7VrVgw9lOl0xosBI+rJ4antZ4yaaOO4QcZYCVCKIVcmxv3d3+/jBui1C3McVRKiB6luJzgd+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dIbGPdNM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PW3kVN+6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 18 Nov 2025 08:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763451309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i0VzkDDDaYkTOtuTXdcVpod+WKGj4UsCO+GO8+K195Q=;
	b=dIbGPdNM0IqXnJSvANE9crJ/SKiJ0k1CGPPHijajOGEIkvnif5QG0uWTOLesD+MSjifvXE
	BMOZafwOM3CcXuOJTswNPjAGfONob5ibSrRsCX/aXD9NjdQWra/dU5vzPvR/66xlG/hP5r
	mL7In5micqa1FSXG7LP5tpUIsBPEGv2p2g1HuQ8ZyZIueXviEySV32KuhTdKZeHlVNs2cS
	a7AZZs4hC5SfVu0Dyg+Dc/n2e61pN/+e3rL3dUZsTtDhNN4BsoPG/T3faBDdAKub0oZUQs
	PcO0T55OVsABKavuXsYVvjQQUCvw/3TPZy7xzGLh6mNP41jWgyki4oAnWXgCRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763451309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i0VzkDDDaYkTOtuTXdcVpod+WKGj4UsCO+GO8+K195Q=;
	b=PW3kVN+6PVzTt6Nc3WVBJVsQ5ysdfNYufZKGravDyemiB7j4pQOOvQpaHFjVBpcZybkqsg
	wGmsYFuxoCBpF6AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: paulmck@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251118073508.JdhVECQD@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
 <5d6033df-b651-4daa-a804-dd142f441358@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d6033df-b651-4daa-a804-dd142f441358@linux.dev>

On 2025-11-14 10:31:45 [-0800], Yonghong Song wrote:
> > I believe that migration needs to be disabled at this point, but I am
> > again adding Yonghong on CC for his perspective.
> 
> Yes, migration needs to be disabled for rt kernel in order to let
> bpf program running properly.

Why is disabling migration special in regard to RT kernels vs !RT?
Why do we need to disable migration given that bpf_prog_run_array()
already does that? Is there a different entry point? 
My point why is it required to disable migration on trace-point entry
for BPF given that the BPF-entry already does so.

Sebastian

