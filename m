Return-Path: <linux-next+bounces-6229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2FA88AD0
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 20:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4901898A5F
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 18:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D867928E5E0;
	Mon, 14 Apr 2025 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dzSCGL7S"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA5288CB0;
	Mon, 14 Apr 2025 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654383; cv=none; b=E2Ctk+Xp4eV0fiHmbeIL8qlp9YFjXWE8j/qqkPm2r/7YjzeXQTmxgLdKCY7Gx2gX5JHutcJwMjvTw02xJ5Gb2ZpiDUErgidIwKt2/CW+kFsZjtbRZ41eP4UoLQ6tXDSgmdHNWDCMeY0FPqp78iO3f3DTGbJNhHppZLcTsXiiawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654383; c=relaxed/simple;
	bh=gY2+/IaOxZ9WI5uEFp9Ue+W+KfbiBOHIE2dibrrD68E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRKVpLKhFD14NGhMSiYgzm79JpW6XPRgqJdJJdrf1u6cCkYwNPfQCVeI2B7hqcS4CNmVgSc0InoXunq9Mf/tXE1Mmj+n3Ph684oro8njCx+3LqqpDuB3fsAwOnbDErfHFASki7h2w9HkT/anraEj98TgDlNChMi9Ju37UXEvaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dzSCGL7S; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pJ/36NqTPbfU92mLQwOP/jkuDkZAtiM1YNatxAkLpzM=; b=dzSCGL7Szdc4KTgwrVRHBaxS1o
	rmMPX72z2Ph1B/x7b58EZ8ngWIX7cDyHRa2SzdR6nC1hFOGQos/44y06FY15vd6wQOjgV3fxmkKGk
	bYkr5YqOOi9ozHs+wO+ebA701S7p3okKaysfZNzy995LOWjl9Po3U5AEkQZbgsnxSDhL3lG2cjwRm
	icivkRnnb3njIZfaOgCUPyqD9UVkMc+AmwUaJHXz3a2P+69LVF5Ms6c4TqTpWrZc+CK6U5qaKV1Ik
	9dDL4QsuwH3bKJ1dDYJMXvBrJkyB4qotRKmYjTE+bE4Lj/zzr5ItI4sLJDnGBbNsy6QoRtJtsrVbj
	GGRmHmDw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OIc-0000000DFZe-15DV;
	Mon, 14 Apr 2025 18:12:51 +0000
Message-ID: <8d70668e-fd0e-4cd5-b33f-16f3250b90b8@infradead.org>
Date: Mon, 14 Apr 2025 11:12:36 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 14 (UML [2])
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um@lists.infradead.org
References: <20250414171511.6c7c80af@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250414171511.6c7c80af@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/25 12:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250411:
> 


on i386 defconfig:

../arch/um/kernel/um_arch.c:480:6: warning: no previous prototype for 'text_poke_sync' [-Wmissing-prototypes]
  480 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~


on x86_64 defconfig:

../arch/um/kernel/um_arch.c:480:6: warning: no previous prototype for 'text_poke_sync' [-Wmissing-prototypes]
  480 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
/usr/lib64/gcc/x86_64-suse-linux/14/../../../../x86_64-suse-linux/bin/ld: arch/x86/kernel/module.o: in function `write_relocate_add':
/home/rdunlap/lnx/next/linux-next-20250414/UM64/arch/x86/um/../kernel/module.c:209:(.text+0x1e7): undefined reference to `smp_text_poke_sync_each_cpu'


-- 
~Randy


