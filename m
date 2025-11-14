Return-Path: <linux-next+bounces-8999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6FAC5E3BA
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1DF7427164
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B44728466D;
	Fri, 14 Nov 2025 16:21:52 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B1280318;
	Fri, 14 Nov 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137312; cv=none; b=SEoakYlRDOGDorm6mgWM9eR9T2qU8xvCJsIn8o3pXqrIf8ijCqCUN/ATiiamjFa45HjGiq5YYIInb4YfGLZdAhOWA8QhqHHLrWhPV84ZO1rvUFWQsWXg2ctym4Zyoow+YqvR/8YtABnx9A05M29rJX2aXWD47DJ8NsgomFtZYT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137312; c=relaxed/simple;
	bh=uLmzv/sogGwsIY1/UG1DgTp8Y8WS13OvUkbzJSVQnbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XU+Cu5qgA4GSVom2FOogJsFWFag1nlPS+5noFsc0GlOUrarwEHEYRcwZVzybWJARF9LNEm3pj1D8b+wQyOR8pCHkvk5yO2wEMBLgZheEngcRTv4EDV9UwyfWFSNTiT9rkyMC2Km1Qo5i4xhgvsGOUSc4NkVYngsP1AelGePyRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id D1B96140438;
	Fri, 14 Nov 2025 16:21:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id AA1EA6000C;
	Fri, 14 Nov 2025 16:21:44 +0000 (UTC)
Date: Fri, 14 Nov 2025 11:22:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114112202.08e1e3c1@gandalf.local.home>
In-Reply-To: <20251114160017.CrDJHi5w@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<20251114133532.mmdi2dca@linutronix.de>
	<20251114104633.0721bdbe@gandalf.local.home>
	<20251114160017.CrDJHi5w@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: AA1EA6000C
X-Stat-Signature: hr855p4zih6o5cturrr941e6gkaxcmrq
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+DdojnmFdhFcXIJJcLxn6sgl1e8IezqSE=
X-HE-Tag: 1763137304-212207
X-HE-Meta: U2FsdGVkX1/QdoO3eG5IcQ+hi5rAGn3vcV7n3Cup23AcvXlCYAHKFiD3hqBG3CZs3WQuNMa0lM2o3Eni1riXD3dtczTUzH4/a1SEGNTR6L99se8P+Z4JP16l5UY6kvaF2qXikqEhQVE7dbyATBDG/Zi0YQTN8KgX43iiqKXqV9lixjh/MV8sx9mxr3B0wxygOASdCj7Bi80JXOaaYJPxJg9KZO4ZwnSIoII8NeqEFaw3lR4mBIsbCTYuzH9XQGHi0OlnnKBjR0xBMcDr52VAhIk9zcq7CHaDWMAzJw/QJAY7C0wgvnAz0AirjkZVswEO

On Fri, 14 Nov 2025 17:00:17 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> > It doesn't disable preemption, but is here to keep the latency
> > preempt_count counting the same in both PREEMPT_RT and non PREEMPT_RT. =
You
> > know, the stuff that shows up in the trace:
> >=20
> >   "d..4." =20
>=20
> urgh.
>=20
> We did that to match the reality with the tracer. Since the tracer
> disabled preemption we decremented the counter from preempt_count to
> record what was there before the trace point started changing it.
> That was tracing_gen_ctx_dec(). Now I see we have something similar in
> tracing_gen_ctx_dec_cond().
> But why do we need to disable migration here? Why isn't !RT affected by
> this. I remember someone had a trace where the NMI was set and migrate
> disable was at max which sounds like someone decremented the
> migrate_disable counter while migration wasn't disabled=E2=80=A6

It's to match this code:

--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -100,6 +100,25 @@ void for_each_tracepoint_in_module(struct module *mod,
 }
 #endif /* CONFIG_MODULES */
=20
+/*
+ * BPF programs can attach to the tracepoint callbacks. But if the
+ * callbacks are called with preemption disabled, the BPF programs
+ * can cause quite a bit of latency. When PREEMPT_RT is enabled,
+ * instead of disabling preemption, use srcu_fast_notrace() for
+ * synchronization. As BPF programs that are attached to tracepoints
+ * expect to stay on the same CPU, also disable migration.
+ */
+#ifdef CONFIG_PREEMPT_RT
+extern struct srcu_struct tracepoint_srcu;
+# define tracepoint_sync() synchronize_srcu(&tracepoint_srcu);
+# define tracepoint_guard()                            \
+       guard(srcu_fast_notrace)(&tracepoint_srcu);     \
+       guard(migrate)()
+#else
+# define tracepoint_sync() synchronize_rcu();
+# define tracepoint_guard() guard(preempt_notrace)()
+#endif
+

Where in PREEMPT_RT we do not disable preemption around the tracepoint
callback, but in non RT we do. Instead it uses a srcu and migrate disable.

The migrate_disable in the syscall tracepoint (which gets called by the
system call version that doesn't disable migration, even in RT), needs to
disable migration so that the accounting that happens in:

  trace_event_buffer_reserve()

matches what happens when that function gets called by a normal tracepoint
callback.

-- Steve

