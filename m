Return-Path: <linux-next+bounces-7443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C78AFF33C
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 22:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF6F1BC72FE
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 20:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA6922837F;
	Wed,  9 Jul 2025 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F0sJg+cI"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8802248BE;
	Wed,  9 Jul 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094329; cv=none; b=naeDHcc6EiQEw9uTKZmH9KnvnYPqjF9vZgVOI8OzWi76fR9Gqb2bi2Kbo9Qerd5m4AcC+CNTeqv7byP46ld5r85nOo1Nwiwl8G+intJaFOCA5F0E5NIKDjifBK6uK4yjhNP58RiTWXh2XaXKuedDy8IOyBfB0QUS0ZUjOU8Td4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094329; c=relaxed/simple;
	bh=C8gPsJ8mU/cUAFdgmI+YXtfIoQ0CwL1xRcgrObfQesA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvD3yCJaybqKBs/7MZ4zBcD1suwn0L+AXJHcjHOPLMbKGtjlJQD9+snsFlPiozekHl/RJ99BRW+x5gavjbd1F4kVGGbZavFICIM8sTrcOTl35Uvb2JEa2cx7xtyTvrUls1LvUFe9UNdYFlY3Y1VYpEn5L5Utk+zXxLrhJmsNNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F0sJg+cI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+z09U7hNkXUwNOo+zF/smoMKFtItC8hIKyQs9E2DqxA=; b=F0sJg+cIBqPNIs/VSO09qF38Uf
	sy6zTuAV1PQcLe4Ps15oB+kcTUIRG5YS2yiX3QdOAOz9TZNg/kqKXccjMQ65qCEKNSU9GQ8G6txx4
	uafe/h6tsZkKxV0V2XnbKkS/rdHucTESJilaKJ6ldsUEfjZ26hTlOkbf3BAh9xMGNsxGC/vHYRswa
	s2mhsN/alt5phVp8vAKE9CePFpMftD6GMFIHPSmqQiAgRvMLQOPpJB2EJ3xXkHXUrqu1c+ZbO/CvR
	+5jNK7g11L07ZAxXFxqacQtBXiSv4HJ9uY/9yn6XVRp0x1tvuwHh7ZZc2XZz9kHQ6CoajYET9yx9y
	MaXQ1EOg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZblm-00000005txy-27zN;
	Wed, 09 Jul 2025 20:51:58 +0000
Message-ID: <fdfc2aa4-09d6-4e5c-ae24-8d99b8bbe207@infradead.org>
Date: Wed, 9 Jul 2025 13:51:53 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the vhost tree
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250709221905.61e77ab8@canb.auug.org.au>
 <20250709155616-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250709155616-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/25 1:00 PM, Michael S. Tsirkin wrote:
> On Wed, Jul 09, 2025 at 10:19:05PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the vhost tree, today's linux-next build (x86_64
>> allnoconfig) failed like this:
>>
>> In file included from /home/sfr/next/next/arch/x86/events/amd/ibs.c:12:
>> /home/sfr/next/next/include/linux/pci.h: In function 'pci_set_disconnect_work':
>> /home/sfr/next/next/include/linux/pci.h:2738:14: error: implicit declaration of function 'pci_device_is_present'; did you mean 'pci_dev_present'? [-Wimplicit-function-declaration]
>>  2738 |         if (!pci_device_is_present(pdev))
>>       |              ^~~~~~~~~~~~~~~~~~~~~
>>       |              pci_dev_present
>>
>> Caused by commit
>>
>>   b7468115b604 ("pci: report surprise removal event")
>>
>> I have reverted that commit and the 4 following ones (just in case).
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
> 
> 
> 
> Weird:
> $ git grep pci_device_is_present include/linux/pci.h 
> include/linux/pci.h:bool pci_device_is_present(struct pci_dev *pdev);
> include/linux/pci.h:    if (!pci_device_is_present(pdev))
> 

in x86_64 allnoconfig, CONFIG_PCI is not enabled.

The function is only defined when CONFIG_PCI is enabled.


> and of course I did build it ... which commit should I test?
> 

The one that Stephen listed above?

-- 
~Randy


