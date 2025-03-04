Return-Path: <linux-next+bounces-5632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0926A4D2F5
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 06:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B6A3ADE9E
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 05:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6A21DBB13;
	Tue,  4 Mar 2025 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A4O9VTCB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB801C84A8;
	Tue,  4 Mar 2025 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741065940; cv=none; b=RS18yyswOTlCxa2QDiN/1O/41S6Ks5F/ImP1q0H6OgO5j3ct7EeMX+9aO6skeGIaCnpmbUZs7jbT++hq0ET8E/OJyJMHsrqJswxsoAezYszkWaGASeZDAyIJj/z1Hhpt+hCgwJrGyBz0ioQH7cHoLMObe9kZZ7SoIQAzbq77uuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741065940; c=relaxed/simple;
	bh=yufR5BZrqjyqGIWtajAmw1B10wOKwfMS4y1pR6xF0jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pbwWxJB3fA3RsFP1n+rkVuberr+QlzmelghQWTrbjMExdKCLBkbLVmNT5e5naE+wEzFwD9XZ4Bb/BRf3kbwFhgxi9E2Pz/PS3K4Vvnn9A7ufbvJqQZbWrysLOyjAsGN8KhQPcWjIvkfU67B49xdMXOuxfZ4ZNmng55sQBNBWx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A4O9VTCB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741065934;
	bh=iOpVniZ53Nx0Ms4uAYPg05TFSXLSXXsH0CbYFM9XcQc=;
	h=Date:From:To:Cc:Subject:From;
	b=A4O9VTCBM7JVuzjWvEYdOebq1jYYtCNn26gC1gJSrFj3vm/njaYhpMjfOr3msbtVI
	 vPIQDz7f9JIqCbQ28Zs2vY00V+NLMBHMjxmlBeW3LOvbDUjT++eK6rzgK7CDcWSwf3
	 nJFfYxr9EU6MJaIrUua2etJP4bN1B59xE8mMN+PQOIfIuQDCfjjteO/kkNw0Dsm9yA
	 oDcpj0PdzcqqDquYlTip5klPb7kI5vm6Bg/1pm/TjIevT9+Hs9z8IRQl5INuxjNlD1
	 /OYlz85/k81A9NNyoPY+PXAYJSacHbOeaaAwZUHyXI9yqv2o8M+WBrIyDyYDrVVAJl
	 k1ZzHcHRd8Zng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6PK90mNqz4x2g;
	Tue,  4 Mar 2025 16:25:32 +1100 (AEDT)
Date: Tue, 4 Mar 2025 16:25:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20250304162402.475eb3bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/asm-generic/percpu.h:7,
                 from arch/x86/include/asm/percpu.h:597,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/wait.h:9,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:7,
                 from kernel/events/core.c:11:
kernel/events/core.c: In function 'this_cpc':
include/linux/percpu-defs.h:220:45: error: initialization from pointer to non-enclosed address space
  220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
      |                                             ^
include/linux/percpu-defs.h:251:9: note: in expansion of macro '__verify_pcpu_ptr'
  251 |         __verify_pcpu_ptr(ptr);                                         \
      |         ^~~~~~~~~~~~~~~~~
kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_ptr'
 1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
      |                 ^~~~~~~~~~~~

(and many more similar)

Presumably caused by commit

  f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'struct pmu' lifetimes")

I have used the tip tree from next-20250303 for today.

-- 
Cheers,
Stephen Rothwell

