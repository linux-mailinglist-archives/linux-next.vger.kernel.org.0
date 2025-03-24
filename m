Return-Path: <linux-next+bounces-5944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86540A6D449
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 07:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CDA016B998
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 06:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A22318DB34;
	Mon, 24 Mar 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="CWFZ056b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF88291E;
	Mon, 24 Mar 2025 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797799; cv=none; b=PH+HrKBCNDhHJGGMDvmBgfzZtmyeEtefomzL8JUyg9nhM1MEeGAnOQ7ih/NK4ojfZiolqEQTanfeb+CZIxGOC5/1kCgQG7yy+8To+p8PH7IPadSgS3CPrioqz5Ci7oLrmMcVY0UNTrFkqNgGU/eYTPHiP/R3F/ykZ6hLNc5XXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797799; c=relaxed/simple;
	bh=Lm4uRu63/KJJw2DC5oteNhnhTDOIM+cXANS37kk/mac=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IlA08TyFyaFjEqok/GvILXIrCqF6ixQRhDzaQJ3x6GItBLvYasJ2g6L3Ymqm4Epi75L3qic7d7nVIrryUDtErTHo71VcRy017uKMgQtljwTZG4NZ0/yiYjaaS23g0mo3BWL0kRGfLRpn9LU6Xg5zvbJnyviZuAaUOwv+RNwXs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=CWFZ056b; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52O6TKu34126578
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 23 Mar 2025 23:29:21 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52O6TKu34126578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1742797761;
	bh=ZSd/+ojTYINNRGW4Jz8s2mPHc2J111xKaaTn8tja+wQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CWFZ056bdNnOMjeX2/RJytFNeN4TOC0ttQgXPv4Qi6JD9T8uG3JdZpUP0eLcpbG7t
	 r2RTJE1mioGwc0031Wy3o8aGEAymzVVEg7RHbCmt8cRw6y7sJla+c1P/I92FhelQ3Q
	 7ZObXH42GcNvq0fS1Eu6f7EHCTHD3i9hM7k5dlDZPHfdwYrzm6/Tw4sz0QRHt1kjwo
	 n7ImHb39Ti9DOj9HSelP7z24wEyvRyTEhIZV4AdnB/D7+pHhhyg1jw4EoObeBRbRuq
	 UXbVZKuRIkiGiwQEidY1EJVQOkviknT+f/g+DHfWLzKBIwIkOV6DWYKM61R3hsz/cc
	 5+mG/mXIA/Qmg==
Date: Sun, 23 Mar 2025 23:29:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>, Tor Vic <torvic9@mailbox.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
User-Agent: K-9 Mail for Android
In-Reply-To: <20250324172723.49fb0416@canb.auug.org.au>
References: <20250324172723.49fb0416@canb.auug.org.au>
Message-ID: <6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 23, 2025 11:27:23 PM PDT, Stephen Rothwell <sfr@canb=2Eauug=2Eorg=
=2Eau> wrote:
>Hi all,
>
>After merging the tip tree, today's linux-next build (x86_64 allmodconfig=
)
>failed like this:
>
>cc1: error: bad value 'native' for '-march=3D' switch
>cc1: note: valid arguments to '-march=3D' switch are: nocona core2 nehale=
m corei7 westmere sandybridge corei7-avx ivybridge core-avx-i haswell core-=
avx2 broadwell skylake skylake-avx512 cannonlake icelake-client rocketlake =
icelake-server cascadelake tigerlake cooperlake sapphirerapids emeraldrapid=
s alderlake raptorlake meteorlake graniterapids graniterapids-d arrowlake a=
rrowlake-s lunarlake pantherlake bonnell atom silvermont slm goldmont goldm=
ont-plus tremont gracemont sierraforest grandridge clearwaterforest knl knm=
 x86-64 x86-64-v2 x86-64-v3 x86-64-v4 eden-x2 nano nano-1000 nano-2000 nano=
-3000 nano-x2 eden-x4 nano-x4 lujiazui yongfeng k8 k8-sse3 opteron opteron-=
sse3 athlon64 athlon64-sse3 athlon-fx amdfam10 barcelona bdver1 bdver2 bdve=
r3 bdver4 znver1 znver2 znver3 znver4 znver5 btver1 btver2
>make[3]: *** [scripts/Makefile=2Ebuild:203: scripts/mod/empty=2Eo] Error =
1
>cc1: error: bad value 'native' for '-march=3D' switch
>cc1: note: valid arguments to '-march=3D' switch are: nocona core2 nehale=
m corei7 westmere sandybridge corei7-avx ivybridge core-avx-i haswell core-=
avx2 broadwell skylake skylake-avx512 cannonlake icelake-client rocketlake =
icelake-server cascadelake tigerlake cooperlake sapphirerapids emeraldrapid=
s alderlake raptorlake meteorlake graniterapids graniterapids-d arrowlake a=
rrowlake-s lunarlake pantherlake bonnell atom silvermont slm goldmont goldm=
ont-plus tremont gracemont sierraforest grandridge clearwaterforest knl knm=
 x86-64 x86-64-v2 x86-64-v3 x86-64-v4 eden-x2 nano nano-1000 nano-2000 nano=
-3000 nano-x2 eden-x4 nano-x4 lujiazui yongfeng k8 k8-sse3 opteron opteron-=
sse3 athlon64 athlon64-sse3 athlon-fx amdfam10 barcelona bdver1 bdver2 bdve=
r3 bdver4 znver1 znver2 znver3 znver4 znver5 btver1 btver2
>make[3]: *** [scripts/Makefile=2Ebuild:98: scripts/mod/devicetable-offset=
s=2Es] Error 1
>make[2]: *** [Makefile:1276: prepare0] Error 2
>
>Caused by commit
>
>  0480bc7e65dc ("x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to l=
ocally optimize the kernel with '-march=3Dnative'")
>
>I have reverted that commit for today=2E
>
>$ x86_64-linux-gnu-gcc --version
>x86_64-linux-gnu-gcc (Debian 14=2E2=2E0-12) 14=2E2=2E0
>
>cross build - ppc hosted
>

Cross compiling?

