Return-Path: <linux-next+bounces-1436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21286DEA8
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 10:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94CD32862C7
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7FD6A8D1;
	Fri,  1 Mar 2024 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="STKB+k3p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F946A8C2
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709286877; cv=none; b=R1FyCUmgoWm6A6RiYEmGMWdceJiw1RL6PFaRWKje8WAsZhmAJfNiLY07q8EkxEQy/GtjZthyljAwoQtCOD+Xv528QEFxOtMyM2P2UqTmf3Fml5OQz+n6HHAnQzV1K8nuC6GV74W/eJDypHs6IVg+2UgKYB1ngcGDqqQY/c0lstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709286877; c=relaxed/simple;
	bh=XlFSQmLoyKEKApC1BXa+78A5Gq0xaC5YgOEm6bH/AYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kjuj8BjzIC83KLMsHevLKKPLRUs1fpp0Hkcs2W2/yYAxJZO8fGxnv5za1CofcZT6Ywj60gAx97jKAAzZYk73gC6nHsVOpHmAUPXaSA6ano6HSmsl6Ny30jqmSWqQI9L4RPrjuSpeXAoeVVEKWPh4MSG946AUKtLTfunUMkYd7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=STKB+k3p; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso9271a12.0
        for <linux-next@vger.kernel.org>; Fri, 01 Mar 2024 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709286874; x=1709891674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3IcY2AWDZM/o4uocVm/qTXRkmDcY4LreF8rf3+er4Y=;
        b=STKB+k3pZenod8TIdvHiRffqS6eBm7EftMBV/jTyJQXZK+hlEpBOaw1MksWNw1vIvT
         g499nCZ1/PMsbZIEjm+GnFwke2uMT3hsHwDgFi/4YCqTU2hKqw4FIgd2Y6rKPHzHjs5r
         Psr90jQ8dZVyh7A3pghvL+ZkD8oNmV+EmXMJCj+4oLuHUpuemegLDhfyNYTY21kAodI9
         MhgiqHuCejROpphPdCz+ioe4Rq1SF6KR1aF3WA1HX6L5FxwImHi7u5ov97JgQ9Jghx6Z
         +SphZdKFHTssdUFfhi27raybfTwAl3HcbJZd/NcF6tyJYY9xGzuIN1yQXBYlRbzKzo6x
         Qw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709286874; x=1709891674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3IcY2AWDZM/o4uocVm/qTXRkmDcY4LreF8rf3+er4Y=;
        b=XbKpl/b5BFhpdY68NXH9PTXS8B8vaYINXwZVAE3dWoNDP07nFZ4t0uuAzkV4Pq1Ezr
         oB3kVG1rNN/12V/EemCDEwlYjsd1shd0cRhPrz4R+pN8WPZxz9VqwMxbIAgV59XdNtym
         5XHrz4vJicCxBhQwp0mwJSliPZwerb438SLA9g3S2xpz1JmpsY2q8ws5IrnGWRbueBIh
         rBaXPTjM0vmVoUpc9xJtX1pSWafjYwBj2JtKRhnD0dXKsZya/ZKkBziV0Ij/4lhzSgCG
         A96KbfgrnUz8bDTWIrWku8CPzgufW3BhTwZ2oG0HOTvEj4NX4Pvh8U1hJn4s3zqrMG4s
         ZVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXUk9VMOqnlxcHO4sZHRMxmX4YHjHny7XpyAMsa/AWRoAZlO9Q6NGELDhUYe33KW34hPTaVg4BIcwzK+26mt2vmBbVOYLQbR3KmsQ==
X-Gm-Message-State: AOJu0Yw8BmHy0HdJiWVl8nxYdmtiDg2zxABAnQXfethwvZvqOlg3tv16
	GvVssF3zf3Q3iINmaFNiREr83oushxGmSEogQFY+qzqixjgOv6+alydQBaWkuqDe1zFgTkP4iO2
	bW2slAVBFP+7+Jz0UDNnqA3RSlFLpBt6YQ6Gn
X-Google-Smtp-Source: AGHT+IH0j1FMjPnFtCgzvOaqhTTv78rOtrbXeAAhMppFFm3NZtNVJfdcRuK2VQASYHZqcq/2eBr5Q5S8swbazxxp1w4=
X-Received: by 2002:a05:6402:26d4:b0:566:9818:af4c with SMTP id
 x20-20020a05640226d400b005669818af4cmr132529edd.4.1709286873819; Fri, 01 Mar
 2024 01:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301121108.5d39e4f9@canb.auug.org.au> <CANn89iKpsHTQ9Zqz4cbCGOuj8sp5CCYGHe3Wvk2cyQL4HPADkw@mail.gmail.com>
In-Reply-To: <CANn89iKpsHTQ9Zqz4cbCGOuj8sp5CCYGHe3Wvk2cyQL4HPADkw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 1 Mar 2024 10:54:19 +0100
Message-ID: <CANn89iKsbT_qAdAiP6R6HRxic1YE3J6afMhWzF27Pbn2ifeCyg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, Jiri Pirko <jiri@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:09=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Fri, Mar 1, 2024 at 2:11=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > Hi all,
> >
> > After merging the net-next tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > In file included from <command-line>:
> > In function 'tcp_struct_check',
> >     inlined from 'tcp_init' at net/ipv4/tcp.c:4700:2:
> > include/linux/compiler_types.h:442:45: error: call to '__compiletime_as=
sert_940' declared with attribute error: BUILD_BUG_ON failed: offsetof(stru=
ct tcp_sock, __cacheline_group_end__tcp_sock_write_rx) - offsetofend(struct=
 tcp_sock, __cacheline_group_begin__tcp_sock_write_rx) > 99
> >   442 |         _compiletime_assert(condition, msg, __compiletime_asser=
t_, __COUNTER__)
> >       |                                             ^
> > include/linux/compiler_types.h:423:25: note: in definition of macro '__=
compiletime_assert'
> >   423 |                         prefix ## suffix();                    =
         \
> >       |                         ^~~~~~
> > include/linux/compiler_types.h:442:9: note: in expansion of macro '_com=
piletime_assert'
> >   442 |         _compiletime_assert(condition, msg, __compiletime_asser=
t_, __COUNTER__)
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:39:37: note: in expansion of macro 'compileti=
me_assert'
> >    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond),=
 msg)
> >       |                                     ^~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_=
ON_MSG'
> >    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #co=
ndition)
> >       |         ^~~~~~~~~~~~~~~~
> > include/linux/cache.h:108:9: note: in expansion of macro 'BUILD_BUG_ON'
> >   108 |         BUILD_BUG_ON(offsetof(TYPE, __cacheline_group_end__##GR=
OUP) - \
> >       |         ^~~~~~~~~~~~
> > net/ipv4/tcp.c:4687:9: note: in expansion of macro 'CACHELINE_ASSERT_GR=
OUP_SIZE'
> >  4687 |         CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_w=
rite_rx, 99);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   99123622050f ("tcp: remove some holes in struct tcp_sock")
> >
> > I have reverted that commit for today.
> >
>
> I have no idea. Maybe this arch has some unusual alignments on
> u64/u32/u16 fields ?
>
> The patch should not have changed tcp_sock_write_rx group...
>
> My patch reduced tcp_sock_write_tx on x86_64 from 113 to 105 bytes but
> I did not bother changing the assert,
> because the assertion triggers if the size of the group is bigger than
> the numerical value.
>

OK, I think the issue is caused by a hole at the start of
tcp_sock_write_rx group

I will send this patch for review, thanks !

diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 988a30ef6bfe956fa573f1f18c8284aa382dc1cc..55399ee2a57e736b55ed067fc06=
ea620bbe62fd3
100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -304,7 +304,7 @@ struct tcp_sock {
        __cacheline_group_end(tcp_sock_write_txrx);

        /* RX read-write hotpath cache lines */
-       __cacheline_group_begin(tcp_sock_write_rx);
+       __cacheline_group_begin(tcp_sock_write_rx) __aligned(8);
        u64     bytes_received;
                                /* RFC4898 tcpEStatsAppHCThruOctetsReceived
                                 * sum(delta(rcv_nxt)), or how many bytes
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index c82dc42f57c65df112f79080ff407cd98d11ce68..7e1b848398d04f2da2a91c3af97=
b1e2e3895b8ee
100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -4651,7 +4651,7 @@ static void __init tcp_struct_check(void)
        CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock,
tcp_sock_write_tx, tsorted_sent_queue);
        CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock,
tcp_sock_write_tx, highest_sack);
        CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock,
tcp_sock_write_tx, ecn_flags);
-       CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_tx, 113=
);
+       CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_tx, 105=
);

        /* TXRX read-write hotpath cache lines */
        CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock,
tcp_sock_write_txrx, pred_flags);

