Return-Path: <linux-next+bounces-7317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99895AF6877
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 05:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0494B4E61B2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 03:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BFC21FF58;
	Thu,  3 Jul 2025 03:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NEkbXzRA"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB921F9F70;
	Thu,  3 Jul 2025 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511999; cv=none; b=IDaYrpHc7POBEZGtjB0fcuCmfgV6UuPSrX6TbekZMNE51Kt8L1Lwz0uyX/uD+6VWtZuCKlelUxtNIx/WPeC9FVqvhXg1NE49aBC/sRJG0W58/hnrcuHqwnQ2vzvJa7o23RArf+LUlOY5RvfERpsgtqo4yUHRlN2XZ5t8Dzs1obI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511999; c=relaxed/simple;
	bh=S4MdmLz5kvO+TfADE3dciuG8vqZI4EcYjO9DqEGjMT0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qZd6rnsAvUDSUH7GqB/0o8Q0ca1mYpn8cOr3hZuyiT060kWI5PMwhcawOWnFxK1RERA26mGaZKpm49yNb4TlxU9t+7BPfUpD8RNIj9BRfXDePFTYRbqmd0VlJbsTBblqfWgi3/WVaStsNsy2+IpS2hxaEoJKNxpq7ngQOih1sUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NEkbXzRA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p3egnjH8N3g8fMDqOGgnG16mVm4AhG4oaDJ8AwYwbbA=; b=NEkbXzRAUkqln2yRMEiEEsHdBN
	CuK3Cps2vYn3s4SDxP7pvtk8QnkVY4ZcMDBpJBOwQ0b5+Nnk0BsqeP/RfAfsDDT3lOLbIPBH3Vs2e
	eU5Puj1UANT5R27ZrkgjoquUlaz9j3SX2dAnjaYr1it3AlZJQgfbrxjyXtjrs5Dy73yamZjbshLs0
	ZwvKGs3sRwUopyh/sGglTOmfAfv3x0SfqisOdfMsEH67VtZeqyoTMLP+N45Ulb9xjoZU54MQ8XCnK
	874vUtFsnnn2NOzvm/lQhV6JUHckXTv7uoFpOKwIodpQ29cDoVPpYtBrGLhqzHEiPq6LkZ7/F8uAu
	kpnbFKvw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXAHQ-00000007bpd-1ULU;
	Thu, 03 Jul 2025 03:06:33 +0000
Message-ID: <08e97c2e-18eb-4c74-81d3-9caa53a9aa9b@infradead.org>
Date: Wed, 2 Jul 2025 20:06:29 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 13 (objtool: __sev_es_nmi_complete+0x58)
 (& July 02)
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20250613154204.42392ad4@canb.auug.org.au>
 <12838efb-238f-4bdd-af81-06c6408cee4f@infradead.org>
Content-Language: en-US
In-Reply-To: <12838efb-238f-4bdd-af81-06c6408cee4f@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/13/25 7:59 PM, Randy Dunlap wrote:
> 
> 
> On 6/12/25 10:42 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250612:
>>
> 
> on x86_64:
> 
> vmlinux.o: error: objtool: __sev_es_nmi_complete+0x58: call to __kcsan_check_access() leaves .noinstr.text section
> 
> 
> Full randconfig file is attached.
> 

I am still seeing this on linux-next 20250702.

Adding BP, Joerg, Ard to Cc: list.

-- 
~Randy


