Return-Path: <linux-next+bounces-7808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0BB17C36
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829643A7353
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AA319C542;
	Fri,  1 Aug 2025 04:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P1yf/8DV"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A962E36F5;
	Fri,  1 Aug 2025 04:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023588; cv=none; b=p5mjZRxqJdeapo+Iexm8GRB0iRBuBNfz9zm6TBXen1wdWfJBFI/6UJB8oAgjxT0pi+fKMvmm282c6ovmjCU49pCxPYzkCA1RjXZAzytBuTODvMEQhgD48+D/yXItaQ7ipneREGvnrZWWNwwvU9tl+HD0DaUaoVIAqPY+E6fYtN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023588; c=relaxed/simple;
	bh=7guHzuGZcQYyMMqHtdh9YC2fHPLufgyBGJ5WzCqVxMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nlm3GQ7EgetzZt3oWtaS1WRVtRJyTEFOdM9BBbnr40ngUbpt1SJqpRXiczVaqd/XSVTfWrdckrAM1MfPeSfEdhJgjl/87ESnrLMyBrnxEUaeTK7oaW1+14Ja7240sI4XKINoQ3oG9PhVkyROfZ7bihAn8HJ0niRUOtPYZWApxIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P1yf/8DV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4B3hC59/18jVmKxVk7eYY+g94+2+67TAoLvcbjcEIQs=; b=P1yf/8DVMvPuxtkA0hyuFlFovN
	Akl/PG4LgJfJ6/IHTDcZSojAfTo4r9vYcXCBnVzxKPM5OjWislkUhYmFaMhyEZcr5V8Z7OmbXr9Uo
	kdA0jUVtKme11ZZ43+WKxy91FNJUSV5LPQljGNAjnL+F3f3aGLZVGPwVVegY3yKWvqAtSociHXLSK
	7wrXQrYi+v9BfX//hc6Wn8e3jv4BQ2aM98VcqQ4IP7Ocp/SqTk5xT0DLONu4wZySWref8oCd0oJip
	v47jKbooHAE799xVTvGoCyZ4Xb6eV7xMgOdftI8adFFq8Sx9gHv5i4avakw48OH3i7VfCuS1bJ3DI
	+j0K4kXg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhez-00000004ybI-1ZA2;
	Fri, 01 Aug 2025 04:46:25 +0000
Message-ID: <24f3c4d1-ce5b-4a67-91e4-8c34caa82aed@infradead.org>
Date: Thu, 31 Jul 2025 21:46:24 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the drm-msm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250708192038.6b0fd31d@canb.auug.org.au>
 <20250801144016.4e00f355@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250801144016.4e00f355@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/31/25 9:40 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 8 Jul 2025 19:20:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-msm tree, today's linux-next build (htmldocs)
>> produced these warnings:
>>
>> drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>>
>> Introduced by commit
>>
>>   471920ce25d5 ("drm/gpuvm: Add locking helpers")
> 
> I am still seeing those warnings.  That commit is now in Linus' tree.

Bagas sent a patch for this. It will apparently (& hopefully) be merged via
the MSM tree.

-- 
~Randy


