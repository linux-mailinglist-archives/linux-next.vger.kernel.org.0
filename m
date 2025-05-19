Return-Path: <linux-next+bounces-6842-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54EABC8D8
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 23:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8FC188B20D
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 21:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713C321B1B9;
	Mon, 19 May 2025 21:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p0JwauQB"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E952147E3;
	Mon, 19 May 2025 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747688583; cv=none; b=jCSLbZX4NPAOjzD9t1nPh3W2nEcuo+lU4PDZ8RiGolJECoBsRsci0ZOJoWXpqYdzMBruzicem8+VCNTrnCJhISX9W929OdyKwx3PUXBjMM6jEbrrvzdQJ8rAqCy/hL0qJ/yThv0IwSENkrrpa7Q+zQbs8+mpFTwbG27VDrwbb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747688583; c=relaxed/simple;
	bh=7U/axw3c96G3KZyqqTSpkGyN0xao2Ygmb7qu8mEBDWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dypMOqNH5ouP2nTGZMilv6KQz/PTSEDbZpetzRkUnw6dw1PLc+I3bzvtEOEQxYEJhl1ZqROO0qT+JQqJyG+FDjtQS8Vis8qFjfbKskL7haBRGAuehIbHIjd7feMmRJ1a0jgthN8kwTDC6C6taFWfsMVMGjjq2/v5cq5cuVBJqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p0JwauQB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=XnVcxol6IAUWMiF4y5ipcRr+NUh+ZpC4QFAUGSMFyJA=; b=p0JwauQB1YwLE32IPCtswKO9v5
	j7sDIXh0kreEPFao/akUY90xKg8PwaABUo3PowS1DmV4kLv3JDGLRPnQWqJ46OfiDGgA+rbI5cXc2
	oSasXPDQSHHJsnYnh9DDN86AMJ4jNmp38V+A7kv7J5GtMoNv20uCbC0oA6veYv1HinNALUQ7jrlYu
	SrnUIESs/f+nIUOEvJEarnsJA6SlEboks3eKOhYOjQm40bMgrPxxF9wzAfoEr9vxfFwriOv5O80DF
	CwM/d/RhUqgsMMtQBGla7g/ngTwG+WoMwI8KtsLd0OBgMCX+JwbHpne7QP2tXtLUVQfVZqd17P/jv
	3/KhavlA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7dT-00000002O6f-1auQ;
	Mon, 19 May 2025 21:02:59 +0000
Message-ID: <7b32e541-16c9-4691-8545-e124337cc25e@infradead.org>
Date: Mon, 19 May 2025 14:02:57 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 16 (futex kernel-doc)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20250516202417.31b13d13@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250516202417.31b13d13@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/16/25 3:24 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250515:
> 

$ make htmldocs

WARNING: ../kernel/futex/futex.h:207 struct member 'drop_hb_ref' not described in 'futex_q'
b04b8f3032aae (Sebastian Andrzej Siewior)


-- 
~Randy


