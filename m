Return-Path: <linux-next+bounces-4062-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D1998CF64
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 11:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ACB11C21536
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 09:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861EC194AE8;
	Wed,  2 Oct 2024 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyKXPY+c"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E494280038
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859679; cv=none; b=UP5EIHxAajf+FReuEpeS92HPDql+mWf8bwGUC3MTZGhGvvfx8NmZ48LqCGVJii9EOn7iMbkT/jZOxAkJlXJdMMK0GScDIVX3Qm61BqDGHcFaztyIqx8nsW4MR0IwoY8lUtrBVgEgtVIJvlxjYR4ZUzL3OiuOd59TLYGPsRZRi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859679; c=relaxed/simple;
	bh=o7Hs3p5kzPl0PCLFLFRNhiRRnoslwIg5x3LWSomZSNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oe51No0rQ4MXCrs8s8tLoeeYSywsFcADnLiVM6gqDl5rU8Y/SwzqjRAnmkoCb290rOVagbDBGxIuk27HPimSk3aJPlJMRQyPN8KLWqO0xaab9U4FHYOY47KdLQ/8wHAUyoccBXVrzJtEudSexzkfNKVJzz4mVdyGmtEqs47XahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JyKXPY+c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727859676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xg3hLBpw2lXNlF6GTvj5Bh0oaVkp6KYwsqc2vlIMji8=;
	b=JyKXPY+cl3v7mh97e/PmwUdxR2XEdw/XX7o4W9VANjImo5W25rcfNioG9jC4HAs56s0hCe
	qx9zx1XLZTsTsF+zXQVCanajYINz7JMaFIOGRhDCoU++gae6lX9kHwJDGElDomx6u/7dDM
	JDkO6ieb7JJCnmFb+YSREeL27nEgCyw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-_OCEFCCsPX6Xx7NT-LUAYQ-1; Wed, 02 Oct 2024 05:01:15 -0400
X-MC-Unique: _OCEFCCsPX6Xx7NT-LUAYQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8a7f3f191dso38869466b.3
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2024 02:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859674; x=1728464474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xg3hLBpw2lXNlF6GTvj5Bh0oaVkp6KYwsqc2vlIMji8=;
        b=PuXQVuGydGwXKXd6BFbheVJj73yJiPMvzhX5f6UK1mLbuyaUQRIyO5FcQarMqhLxtQ
         Zboldg6cig3mPavVTro9IjtdsNL2vYm3oD0o0BoQdi5z7GqD2Mdo7kgcFczDXqWh+Y+p
         jp+33CgGB+OxrrngAWhkR0qvl3m6gWPGkzGIyCptlV0edfKdj+Zi87IsW9ugdwtXZYk1
         Q0ci8TBdiDndrm9CnpGHQ+kvEvQnhNXLP/nu0s1mrNIu21kUcXuIwLTKEMrj7BOSCg2l
         jf5ERU0rUNLJQOyzpZm/cEsWws7YxoSzZ9v2SFU4CLdlXb2EP28DmKWriG9E/Iq7t2mD
         3YNg==
X-Forwarded-Encrypted: i=1; AJvYcCUI/5/zgXJlKQo8xy25947PNCYgadte+FwE8pKmVIEA628pAY5HdQewFg4kE1j2KZLFquCupx2yHXAl@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqyS1Cosjb+HleipI1pCTijXMToitOsCZAsszgbOz4GfyC8Jk
	b7/3SVkCO+xwnDkzrRNn2FsmrAskwcy1ZEr9zPLqUs+R4/brBi62BX0sl1+QLX5DDkLFBbotb8p
	OzF6vK1Thv+rhxP7HbxsDsNuugz+2+tO059ykk22+coYfhDAektxgEuVxarOuhSpeR9+B4ASz/8
	vfd4DctOmGIQ6Kcq6PRtZU4ZK5NNMhsgak+A==
X-Received: by 2002:a17:907:3f25:b0:a90:1ed4:dec6 with SMTP id a640c23a62f3a-a98f836ec85mr276957866b.43.1727859674405;
        Wed, 02 Oct 2024 02:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1DUJZ7WWAEYAEDtW3rfoL7KwkxfPpeY/J1soLKL+cyng1nlALwHtjzI7myC7aEkqXfEcFzENfHkk52JC5K8A=
X-Received: by 2002:a17:907:3f25:b0:a90:1ed4:dec6 with SMTP id
 a640c23a62f3a-a98f836ec85mr276954166b.43.1727859673929; Wed, 02 Oct 2024
 02:01:13 -0700 (PDT)
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
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
In-Reply-To: <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
From: Tomas Glozar <tglozar@redhat.com>
Date: Wed, 2 Oct 2024 11:01:03 +0200
Message-ID: <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
To: paulmck@kernel.org
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, 
	linux-next@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 1. 10. 2024 v 18:47 odes=C3=ADlatel Paul E. McKenney <paulmck@kerne=
l.org> napsal:
> Huh, 50MB and growing.  I need to limit the buffer size as well.
> How about "trace_buf_size=3D2k"?  The default is 1,441,792, just
> over 1m.
>
Yeah, limiting the size of the buffer is the way to go, we only need
the last n entries before the oops.

> Except that I am not getting either dl_server_start() or dl_server_stop()=
,
> perhaps because they are not being invoked in this short test run.
> So try some function that is definitely getting invoked, such as
> rcu_sched_clock_irq().
>
> No joy there, either, so maybe add "ftrace=3Dfunction"?
>
> No: "[    1.542360] ftrace bootup tracer 'function' not registered."
>
Did you enable CONFIG_BOOTTIME_TRACING and CONFIG_FUNCTION_TRACER?
They are not set in the default configuration for TREE03:

$ grep -E '(FUNCTION_TRACER)|(BOOTTIME_TRACING)'
./tools/testing/selftests/rcutorture/res/2024.09.26-14.35.03/TREE03/.config
CONFIG_HAVE_FUNCTION_TRACER=3Dy
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set

>
> Especially given that I don't have a QEMU monitor for these 100 runs.
>
> But if there is a way to do this programatically from within the
> kernel, I would be happy to give it a try.
>
> > Also I'd say here we're mostly interested in the sequence of events lea=
ding
> > us to the warn (dl_server_start() when the DL entity is somehow still
> > enqueued) rather than the state of things when the warn is hit, and for
> > that dumping the ftrace buffer to the console sounds good enough to me.
>
> That I can do!!!  Give or take function tracing appearing not to work
> for me from the kernel command line.  :-(
>
>                                                         Thanx, Paul
>

Thanks for trying to get details about the bug. See my comment above
about the config options to enable function tracing.

FYI I have managed to reproduce the bug on our infrastructure after 21
hours of 7*TREE03 and I will continue with trying to reproduce it with
the tracers we want.

Tomas


