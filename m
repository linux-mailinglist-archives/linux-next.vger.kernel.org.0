Return-Path: <linux-next+bounces-7780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8047B16327
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 16:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 921A87AB32C
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9522DC320;
	Wed, 30 Jul 2025 14:50:42 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9096F2DBF6E;
	Wed, 30 Jul 2025 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887042; cv=none; b=Hz4LgPmaSY99JkSRxnDpvOXkOX9iWQVlVQbaiN19rephIUVZ21s5ithpw+FfUhEiCq+qKvmlvHLrdyxxCYnsVdyH53jt1vqva6sfOpWyxibgcv70yJbrSzY1wme81d9+xfnWRKgrIRZdhEv26FTZqz9WHccAf4zvb28ZZ5EwsiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887042; c=relaxed/simple;
	bh=ipMp8TX+lrqL/DeEImPv43Slyek9RxaFSPed91niKYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QegSUMU3UIfx4bm760/gqYBU39UhKrG23qEhsGa1zpUUf9OxUfGajLokITLMXyGJDM58o7Rl5l8+hNjHrxRSa/AiOUy0OZpCEtEaKg9oGCBMLtAlFa82kg4vjm+8HJCfvpdMmcwgqKkO/vF+LhuwbMZ91ZUIc9ioLFENzmZx8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsZFZ1tCWz9s92;
	Wed, 30 Jul 2025 16:23:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTpZs2Ci7_Z8; Wed, 30 Jul 2025 16:23:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsZF53rFRz9sZD;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EB158B76E;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0bwy9QcKhoSZ; Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A8928B763;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Message-ID: <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
Date: Wed, 30 Jul 2025 16:23:05 +0200
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
 linux-next <linux-next@vger.kernel.org>
References: <20250723094558.5bcfca69@canb.auug.org.au>
 <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
 <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/07/2025 à 15:55, Arnd Bergmann a écrit :
> On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
>>
>> Le 23/07/2025 à 01:45, Stephen Rothwell a écrit :
>>
>> I was going to send a pull request for this fix but I see the duplicate
>> patch is already tagged in the soc tree:
>>
>> $ git tag --contains 12702f0c3834
>> next-20250728
>> next-20250730
>> soc-drivers-6.17
>>
>> Shall I do anything or just ignore it and drop it from my tree ?
> 
> Linus has already pulled the soc-drivers-6.17 tags, so I think
> both copies of the patch ended up in mainline and there is nothing
> left you can do to change that.

The one in my tree is in Linux next, nowhere else for the time being as 
far as I know, as it was not included in the pull request I sent three 
weeks ago.

Christophe

