Return-Path: <linux-next+bounces-3422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE595F014
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E14851C218C9
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4458C127B56;
	Mon, 26 Aug 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwJcvjwV"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5A154C0A
	for <linux-next@vger.kernel.org>; Mon, 26 Aug 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724672683; cv=none; b=ExMi0++lc/2z0zKHh8d/rUuHAHHs3JAxX9Lo6y5/AWMxyEL2xfdMD3JDC+1V9EDeIhN5bjfOkPIkbm2J8Odw6TJb4UMZzucHDpZ3rxCW+xBbRym58wcdtlLvDhBuBQxHqe9tOnHXBspUbtthjLhWklDUGn/QB9UJBblYkJRv5OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724672683; c=relaxed/simple;
	bh=QMoiVkem092bBrW+vcjJE8l/rIxpqA/yoiRitJ8s7MQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Blh3jJ72PutrBgv6ZGoTw2D9hcinrdJisyLCjM/Ij2FNXn5WP2v0lLfRif1HZcuWgZvEztlG+DG29/ikB68ucKmI1gdw9aKUna9IIkQ5CEkSYXpK2OX37Y7G4pE1B9+W+ViehyQBRx0nkkFcyCgQ76MLXBSJsrZ/H8X5TXujGtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwJcvjwV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724672680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMcvCAYN0TBa/AYjsCCHKi8+uqeaC3C3bN4VRG7FPiI=;
	b=dwJcvjwV1AST/iHYVf+NQExL0+lx+gCRl7ZMUGWifmRMUhRliKcOi7QT+dMkjldZVMBwA3
	Yw6wvI0XdS/SfKKGpLtVB0q3EBplmdNsVqyWVLM5L8ST/h68jTl6m9xus0p0l2p5VgmhI8
	5s8poOoKJ5BW6ScpNiSgNtsLE22aHaY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-Ho-fX5ZiPIW4GGNUhmM-sQ-1; Mon, 26 Aug 2024 07:44:38 -0400
X-MC-Unique: Ho-fX5ZiPIW4GGNUhmM-sQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-371aa2e831fso2504638f8f.3
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2024 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724672678; x=1725277478;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMcvCAYN0TBa/AYjsCCHKi8+uqeaC3C3bN4VRG7FPiI=;
        b=pUmDBtNaS4dgCSN3hVd28NiSh0b6YTgFx6qEgUPqjI3ChPuP8u5fBJJe3cHKOdtWN9
         QxkXkCHR8aqFDu8bQ3sPk1i9C8VHDwBxKqOBl7kXSa+6b+RgsXm3i9EG+riOUpJJ2TaR
         4AC/owOKu8gQfe/LeG6QiRj6cgui3skc7RoqeyQBO/BEVXNo6YFMgLUvKvoBebGWWyG3
         +i2wIdGJG5eHndRkuAz/K9h/qzO3/nR0LWeaxAZdD2SVXkYEWhZnRgF6ZZvMJCiPH9gk
         iI/9pHvyOEH0zAH3lMmiKnRb2vaYWeoNN6sDwMVWcvvaLL3sslHb3r4XEbGuE/YfGZiJ
         VDHA==
X-Forwarded-Encrypted: i=1; AJvYcCVvOdRmw/nugsbHJnYs861J+Y/U5EzSuswkHQ1Yi/lHGcLMawl8MzkVDgh6jf6NTyOJisLJ11uIvNJw@vger.kernel.org
X-Gm-Message-State: AOJu0YykwuGyDaIc175MghxqXmDbJaoF51iGskWnueEAFYP5G+TVEpqo
	D+TGR6sOThGvsK7ZfhM/c6aTIuzTcMMCxJf4ZdLJ9wsK1ovdM4kbFEeTj0xswgcS6NkEqwN3Auv
	iclhzxtFJ/W/7CFx0HafdySQwcYWi+k3R483SoxDrPGCu0ar2U7xE09yjxbs=
X-Received: by 2002:adf:f8ce:0:b0:36b:a404:500b with SMTP id ffacd0b85a97d-373118ecd49mr6807930f8f.51.1724672677577;
        Mon, 26 Aug 2024 04:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECF7Yhz3U9aDF5Z9hdecPK4g6U9TUuM+pe3fmYCQy8Hv15W+MeDoHJfCmQZoIKXMB0iw/MiQ==
X-Received: by 2002:adf:f8ce:0:b0:36b:a404:500b with SMTP id ffacd0b85a97d-373118ecd49mr6807910f8f.51.1724672676770;
        Mon, 26 Aug 2024 04:44:36 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef815d2sm186355345e9.24.2024.08.26.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 04:44:36 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
In-Reply-To: <20240823074705.GB12053@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
Date: Mon, 26 Aug 2024 13:44:35 +0200
Message-ID: <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23/08/24 09:47, Peter Zijlstra wrote:
> On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
>
>> 2e0199df252a ("sched/fair: Prepare exit/cleanup paths for delayed_dequeu=
e")
>>
>> The preceding commit is very reliable.
>>
>> Only instead of (or maybe as well as?) introducing the dequeue_rt_stack()
>> bug, the 2e0199df252a commit introduced a build bug:
>>
>> ------------------------------------------------------------------------
>>
>> In file included from kernel/sched/fair.c:54:
>> kernel/sched/fair.c: In function =E2=80=98switched_from_fair=E2=80=99:
>> kernel/sched/sched.h:2154:58: error: =E2=80=98__SCHED_FEAT_DELAY_ZERO=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98__SCH=
ED_FEAT_LATENCY_WARN=E2=80=99?
>>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED=
_FEAT_##x))
>>       |                                                          ^~~~~~~=
~~~~~~
>> kernel/sched/fair.c:12878:21: note: in expansion of macro =E2=80=98sched=
_feat=E2=80=99
>> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
>>       |                     ^~~~~~~~~~
>> kernel/sched/sched.h:2154:58: note: each undeclared identifier is report=
ed only once for each function it appears in
>>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED=
_FEAT_##x))
>>       |                                                          ^~~~~~~=
~~~~~~
>> kernel/sched/fair.c:12878:21: note: in expansion of macro =E2=80=98sched=
_feat=E2=80=99
>> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
>>       |                     ^~~~~~~~~~
>>
>
> Oh gawd, last minute back-merges :/
>
> Does the below help any? That's more or less what it was before Valentin
> asked me why it was weird like that :-)
>

Woops...


