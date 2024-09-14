Return-Path: <linux-next+bounces-3857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0603978E82
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 08:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585CE1F23922
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 06:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C815E1CCEDF;
	Sat, 14 Sep 2024 06:50:51 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D076825634;
	Sat, 14 Sep 2024 06:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726296651; cv=none; b=PeeOGQCSFbQnTytr94ua2sdHR7R8zex4iqKyrIa+0B1SRpGgsm5wKv4h/37zcRF6GitZDhOym9vlw0+rSZcCPTjMIWIkDJI8DcrWn4PAzG/6lL6o6bBLaGrYdVyE5JemqeLHZcUAXLH9Uzb/gVCkMqJAiiFgEfKn8ABZOwY2Sao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726296651; c=relaxed/simple;
	bh=OpHsdnn3hde6Gfx9ognkZFS3zIi7a702ZdtBcEsLG18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbkZg5G4ZrTjT3yODuJZoeWgQ66qn/Ci4xwigcN50Fnq6aN7zi7R/zt+3OGcCOLKg531pN8w2VAHVd67NCIW8TSeeYk8JOQLDIn18yY1taM3aA5NWuQ21ySU1oObLVylnLGo5WcEYlDRlTrkeC3LCSxn+RInayqn78MvntVjwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X5MJR3rhBz9sxD;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dq3uoKnkcrG6; Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X5MJR2xwPz9sxC;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E0A58B764;
	Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4kDiXHNHMIzl; Sat, 14 Sep 2024 08:50:47 +0200 (CEST)
Received: from [192.168.233.150] (unknown [192.168.233.150])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AF0CE8B763;
	Sat, 14 Sep 2024 08:50:46 +0200 (CEST)
Message-ID: <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>
Date: Sat, 14 Sep 2024 08:50:46 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
To: Matthew Wilcox <willy@infradead.org>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Simon Horman <horms@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
 <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 13/09/2024 à 21:22, Matthew Wilcox a écrit :
> On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
>> +++ b/include/linux/page-flags.h
>> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
>>   {
>>   	unsigned long head = READ_ONCE(page->compound_head);
>>   
>> -	if (unlikely(head & 1))
>> -		return head - 1;
>> +	if (unlikely(head & 1UL))
>> +		return head & ~1UL;
>>   	return (unsigned long)page_fixed_fake_head(page);
> 
> NAK, that pessimises compound_head().
> 

Can you please give more details on what the difference is ?

I can't see what it pessimises. In both cases, you test if the value is 
odd, when it is odd you make it even.

Christophe

