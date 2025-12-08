Return-Path: <linux-next+bounces-9372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2EFCABB1F
	for <lists+linux-next@lfdr.de>; Mon, 08 Dec 2025 01:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D13A63011A45
	for <lists+linux-next@lfdr.de>; Mon,  8 Dec 2025 00:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB8C45BE3;
	Mon,  8 Dec 2025 00:18:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175922083;
	Mon,  8 Dec 2025 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765153095; cv=none; b=PYkCNIeH1JDdvguUA7Yi0+CNy7fC5pqh3n9/1hRpBi/sLi/6H7NVz3yctOPZ3tTnw56961J8yGxkLbr+es5nE9FyPDq5N3lanoN9vgn8KEB+K5ostSrKXJm6Iw61rDNyjeMH17g2O/wLEjRfkj4a+oGW7/blsXUJ7ICMh4/pGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765153095; c=relaxed/simple;
	bh=M+Mh4Q+nozt4i1gx//qkqSfG6e7z8XKsmxYGFVD6wdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyTI2GmXt0GUnnP2NRBQ0hft23M8DvoSke/5W2HMfqVxhdbVIMFajYR85E+HxZWmXkp20nDffUdjDyv3Eal7+/4RJUyhklFP3+ob2z3sdSmRA+5DxTPwJl8+ZYHpuBtflGSKR+cdCcenSD1ZSzrKNp1N3mwg1ZmzvoD+2wEA0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 04D39BBEC2;
	Mon,  8 Dec 2025 00:18:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id F3A3D2002F;
	Mon,  8 Dec 2025 00:18:00 +0000 (UTC)
Date: Sun, 7 Dec 2025 19:17:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251207191756.3ac61680@debian>
In-Reply-To: <8e93322e-9e0d-4414-b9ce-7c098477dbe8@paulmck-laptop>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<aRdBVFSmgvPWuY2k@localhost.localdomain>
	<054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>
	<aRxu_ycww5U9qxJR@localhost.localdomain>
	<f79a2e18-d9c3-40db-97ed-c334b90cf3ba@paulmck-laptop>
	<370911ae-ce3c-4ebd-a348-452c73c06597@paulmck-laptop>
	<8e93322e-9e0d-4414-b9ce-7c098477dbe8@paulmck-laptop>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: F3A3D2002F
X-Stat-Signature: twg1gf1hosqpb5rxtdbrp5i6fpydkuic
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18H3R1Eroeyso9bB2Gcbr29d3dB/rgl6MM=
X-HE-Tag: 1765153080-852249
X-HE-Meta: U2FsdGVkX1+8KMvfnbUJnpY9OaKOZrcnpRjwzvo+saw/ulhoaXOgdPCKVgj869y3FUG+/kGfqde14lf8ImB3TPG5myPivE7Jg5QLha1odFP+R/viNo4Lo3w5c6Zj3aqxk24r5sJSCA+CwBeU/Jr3SatGYsiIpK1u2drQfOxNHgUUzeORuUvIaVwBedSnfJzqozoiqQ9CAYomDqunj3pUjybVqb7R/zEkuS1+AmCeJJUQMx1p5H3KCx+oFfezZ9HhuXUeckTBS+AhrV/ktuS6ZRYOKP8TlpGPyligZ0gXUTMMP0S/IxXtvXdYv7WQuH1Ti3DQdE7Y4e0EyeoXbXUuuQWn7YaVP6Kp

On Sun, 7 Dec 2025 12:43:32 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> If I continue to hear no objections in the next 20 hours or so, I will
> push this into -next:
> 
> fca6fa23c5a5 ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")

Hi Paul,

Can you repost the patch as a normal patch (start its own thread) so
that I can look at it separately. I'm currently in Tokyo so I'll likely
get distracted a lot this week.

-- Steve

