Return-Path: <linux-next+bounces-176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA0C8001EC
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 04:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D72411C20A88
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 03:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9A817E1;
	Fri,  1 Dec 2023 03:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="AYWCthT3"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1CA1711;
	Thu, 30 Nov 2023 19:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701400357;
	bh=F+eemxID8zfTy/ruTCOTo0d3EXe5X2w1QPkRpR78dqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AYWCthT3Cc4OavkvdIPlxGVT5FPG5D0Kcpf9gVQ4prm9G7rkEb2GPFX9FzsImp7ed
	 cqQrqeLBqaSYkB1cE2WZicIwpuZk+lXzMO/orjH6HZ6sVSqimW9T/yyVkgkXKI8VRk
	 SONQqxKO1u3+xEnnJKMZ/faR7CiXyf5gLYr1sQEgA9fbKj4s3sdDZjIfTBo3vwpz/P
	 rHWkHyGH9BU1p6184e238DoUma4l6EVcDT1fc9QAF65xbXE4lI0zFlBgtgV//6eQyv
	 KGpDj3InY9LhNYovM/Jo9ik2rdyIe/WTlaC1F2j9jtkvTUa+GjyI7jxjHti+S8WAM5
	 ZLISLjLJq4lZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShJ5c58N9z4wdD;
	Fri,  1 Dec 2023 14:12:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the mm tree
In-Reply-To: <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
References: <20231127132809.45c2b398@canb.auug.org.au>
 <20231127144852.069b2e7e@canb.auug.org.au>
 <20231201090439.7ae92c13@canb.auug.org.au> <87sf4m27dz.fsf@mail.lhotse>
 <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
Date: Fri, 01 Dec 2023 14:12:27 +1100
Message-ID: <87msuu1uqs.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:
> On Fri, 01 Dec 2023 09:39:20 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> > I am still carrying this patch (it should probably go into the mm
>> > tree).  Is someone going to pick it up (assuming it is correct)?
>> 
>> I applied it to my next a few days ago, but I must have forgotten to
>> push. It's in there now.
>
> I'll keep a copy in mm.git, to keep the dependencies nice.  I added
> your acked-by.

Sure thing. Thanks.

cheers

