Return-Path: <linux-next+bounces-7774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A23B161C9
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 15:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E3C18C7158
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 13:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0262C3258;
	Wed, 30 Jul 2025 13:50:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B446DCE1;
	Wed, 30 Jul 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883437; cv=none; b=ta6grHBc9WPGOijb3eOwlAiQdGe6NvpMxHFYnWtoRN2Ld5BHPy6zbi1fwQvDO8RYyzMSLrAPLyx608JAD4TArFDnpUsM4gQtc4QuWblOT/Ph2KzF0bd6akVCiYbr18ZK5wJVnefSDMjetG+b8CcPdmfSKPHoTv/zpfVgvAWghkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883437; c=relaxed/simple;
	bh=osoHOOmwYbNzBgPO2s/CgOIorcFJt9eeC1NKfpz9teE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp4hg+tNueIavZqBa03Uu7rXs+KNMffrJAHtkhwi/c1AocMrK5ozWQsVHgHZcSTPGQe0hbBeIw5BYZnsqS3Zgpv6HBE3gIqXOiiFiRrk72dOVkWaWSi6F8hKXDhFhFy32tcuzMNihCxZKolV38UVousaWIaIK3uqVo/I8oUVgcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsYKT1Fmbz9sr6;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6arbvrYtM0X6; Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsYKT0PKHz9snk;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 080558B76E;
	Wed, 30 Jul 2025 15:41:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id A6h5hzYvNTWs; Wed, 30 Jul 2025 15:41:48 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 99FFE8B763;
	Wed, 30 Jul 2025 15:41:48 +0200 (CEST)
Message-ID: <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
Date: Wed, 30 Jul 2025 15:41:48 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the fsl tree
To: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250723094558.5bcfca69@canb.auug.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250723094558.5bcfca69@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Le 23/07/2025 à 01:45, Stephen Rothwell a écrit :
> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>    8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an integer")
> 
> This is commit
> 
>    12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integer")
> 
> in the arm-soc tree.
> 


I was going to send a pull request for this fix but I see the duplicate 
patch is already tagged in the soc tree:

$ git tag --contains 12702f0c3834
next-20250728
next-20250730
soc-drivers-6.17

Shall I do anything or just ignore it and drop it from my tree ?

Thanks
Christophe

