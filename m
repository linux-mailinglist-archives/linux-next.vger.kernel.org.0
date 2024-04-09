Return-Path: <linux-next+bounces-1847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00C89D1D3
	for <lists+linux-next@lfdr.de>; Tue,  9 Apr 2024 07:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8943C1F261D2
	for <lists+linux-next@lfdr.de>; Tue,  9 Apr 2024 05:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B001D5465D;
	Tue,  9 Apr 2024 05:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZ8d+Jvh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EFA4F887
	for <linux-next@vger.kernel.org>; Tue,  9 Apr 2024 05:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712639455; cv=none; b=dVNYy7O4Hwb/xBqaQQ9Ie3TUWQx+BN+0Ll4loTeA50OI+eque9x+WT1dQaZlQ0bcYj9LiSpKi5AFartw8Jl4II7guo5TBUr+CE8Zpl/RTnoo0vJTfjGphwiWm/73QB6gaLB17YPiupCx8ahvM//vG0H6IpBKb3US5rdjoW03bXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712639455; c=relaxed/simple;
	bh=dwC0o7kN4aSLHYFcGLA7pQ1nKIAPVAEBs/g7lOmupm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpMOUthHBrEjtm9cbuSIpEKbuaIcMBRYhlCNFW6Hs8KmiUO+re1aDj9E7/1ugohEcNrV3jo6wZuqthvbuC7qyQfQKJNpaKVi3Py1/Co4npqTGo7cdv4GXkheyzzrODP1Jc9L4WS6CjXgp4u1wOagnsWZcFFa2FfRs/dUvfdATd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZ8d+Jvh; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36a0c8c5f18so112435ab.0
        for <linux-next@vger.kernel.org>; Mon, 08 Apr 2024 22:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712639453; x=1713244253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XlSx76m7+cP8h9FQAUilr+n4nM0QWD1BsxQ6mGdrTY=;
        b=LZ8d+JvhU0dfzdAauzAr21cDEFP8pmQMBUOvpQR+zvwbfV2uIMYHgWpqtBGhFFkt7k
         PQBXHHwoI7VvpeOsgA+WNOx9IMCmYAVWcCkjcSaXwUAZ0UZhDY5/ZR+kG41SV7xIsyPx
         BBN0+EBnC4bWZKQp9p5KmaRFgpo+MlYDEqvAJOUhDimsDdAcpoCdxP0hKpShenTKWr/4
         RUC7FtjbPi4m5Ke39pPv2I/kI9PqMxwpJIojh8Uc0QkvNPIMpvdJRjVE11FKCoC6uCgs
         QVTqY2luI2rKAzFW2l0Xq783GIw69/Qon6mE3kN0+GBwnxKp/lR+CFzqpgDCUFVZ1Lpv
         auMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712639453; x=1713244253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XlSx76m7+cP8h9FQAUilr+n4nM0QWD1BsxQ6mGdrTY=;
        b=UareEZopRMJE0+4Fikg7lMTcuTg+SRbyqcATdmXubILge2H2H/X7rUxOfokAVBjzfW
         sWmlRqF8BKQLdmkGQBhEOpWOIYnaVsj07uiekPkOP30mmDYkL7XgvnBHZg0gKBD0JXfS
         VT6q8sGIP8WYPfn7HuUCgu6j1sYgPLo8MVsrx6yRYmmOaNP7y7FxCqfcpNmognFCoMN8
         UHgZhvFuTHiUJ1cSLxTQIJo9smjzuBrzrJq4TNT14uzw4KTLWT+W6SG0q2IVmamjLyaA
         dKmI75IjGbce7YfZtgvrUItSYJ0rHLRliLOZU8Q31jQ5dVc1PhLI5wTU7X8hbGJyOBFz
         1E6A==
X-Forwarded-Encrypted: i=1; AJvYcCUV+CQmt0O4IhvEGeNOE9FpFbN1U/jSsYM7DjEiyURvWOPmsOE9+bLUHRjvpom1+CkjLEjfDmsDcsugsDSNAyUB5Bdy3Gk0gRQlWw==
X-Gm-Message-State: AOJu0YznIPP4u5j2GdOqfEBqSOvVcxC0s03JiGg2Z55B42964kpeXGDN
	HW709l7udpttCyeFmhQ3LWTYGiP34UNb8kZOd4fr5O8kDgJZdcFA/H6LOJMNiN8JeG8NR2etcmO
	dPrP9JkrIL4stPjgAQh12aqX2JfiK02490uWp
X-Google-Smtp-Source: AGHT+IGMo6dxSPis7iuqkMcLFOGFh/Ddc4f+n+qMm9pmVjMFPYyo1L6wu+/u23iR1UJEY5zWQc7ums+QX5vvLk8O1Og=
X-Received: by 2002:a05:6e02:13d2:b0:369:e9b7:768d with SMTP id
 v18-20020a056e0213d200b00369e9b7768dmr130351ilj.18.1712639452945; Mon, 08 Apr
 2024 22:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409114028.76ede66a@canb.auug.org.au>
In-Reply-To: <20240409114028.76ede66a@canb.auug.org.au>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Apr 2024 07:10:40 +0200
Message-ID: <CANn89iJyXNKycL1kd_KP8NH-qU7siv8BGW5PGLexjmqaXXGciA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 3:40=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from <command-line>:
> In function 'tcp_struct_check',
>     inlined from 'tcp_init' at net/ipv4/tcp.c:4703:2:
> include/linux/compiler_types.h:460:45: error: call to '__compiletime_asse=
rt_940' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct=
 tcp_sock, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct=
 tcp_sock, __cacheline_group_begin__tcp_sock_write_txrx) > 92
>   460 |         _compiletime_assert(condition, msg, __compiletime_assert_=
, __COUNTER__)
>       |                                             ^
> include/linux/compiler_types.h:441:25: note: in definition of macro '__co=
mpiletime_assert'
>   441 |                         prefix ## suffix();                      =
       \
>       |                         ^~~~~~
> include/linux/compiler_types.h:460:9: note: in expansion of macro '_compi=
letime_assert'
>   460 |         _compiletime_assert(condition, msg, __compiletime_assert_=
, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime=
_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), m=
sg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
>    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #cond=
ition)
>       |         ^~~~~~~~~~~~~~~~
> include/linux/cache.h:108:9: note: in expansion of macro 'BUILD_BUG_ON'
>   108 |         BUILD_BUG_ON(offsetof(TYPE, __cacheline_group_end__##GROU=
P) - \
>       |         ^~~~~~~~~~~~
> net/ipv4/tcp.c:4673:9: note: in expansion of macro 'CACHELINE_ASSERT_GROU=
P_SIZE'
>  4673 |         CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_wri=
te_txrx, 92);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Presumably caused by commit
>
>   d2c3a7eb1afa ("tcp: more struct tcp_sock adjustments")
>
> I have reverted that commit for today.

Yeah, a build bot gave us a warning yesterday, I will fix this today.

Thanks.

