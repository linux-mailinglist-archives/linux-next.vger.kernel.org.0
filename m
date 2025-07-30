Return-Path: <linux-next+bounces-7779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB0B16324
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 16:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4E53A574E
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C862D9EEF;
	Wed, 30 Jul 2025 14:50:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5BC1C5D57;
	Wed, 30 Jul 2025 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887037; cv=none; b=DDRNHb7l/CuFU5YzFGBSxC+lu+tORt9MSAvke2joKoOomCYFSyWnuJ7TkJ5ac4c1mUqaxwAT6ckCNtTKQj7Gr7tsfidxhsJ2v+NVu/CKFHefD7UPALwGtHrYh3nxvU86lrN6FdGhaEklwcQ39ULLELeMaCynE5yTlAND3dCb7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887037; c=relaxed/simple;
	bh=5yrtCX1rakIYpyeza+67Nx1m0XD8w3FmoiKcIKuQ+Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwXao+yzCxRNe16ATKezHjzCekCcCt5+cIx39TKHnD6S4r71FJQa4nyVq8qd7H4FWAHt1hOLqZh7Onp3fORcIuSlUzJhQdeWFvoIwfM0c+AHrali+7h3fYEi1VClambiCl/JqRHOHL/9SwSIYiFwZHGG+hNstQMsu0E+/Zysazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsZPW0HHCz9snk;
	Wed, 30 Jul 2025 16:30:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsGl8q2AKTJb; Wed, 30 Jul 2025 16:30:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsZPH0JDCz9sps;
	Wed, 30 Jul 2025 16:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 042698B76E;
	Wed, 30 Jul 2025 16:30:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jj0F2l6esWm3; Wed, 30 Jul 2025 16:30:10 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBF298B763;
	Wed, 30 Jul 2025 16:30:10 +0200 (CEST)
Message-ID: <f10f6457-1a19-47cf-86d1-eb787badd6dd@csgroup.eu>
Date: Wed, 30 Jul 2025 16:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the jc_docs tree
To: Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Vishal Parmar <vishistriker@gmail.com>,
 Brigham Campbell <me@brighamcampbell.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250730102931.6334022c@canb.auug.org.au>
 <87cy9hx272.fsf@trenco.lwn.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87cy9hx272.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/07/2025 à 15:01, Jonathan Corbet a écrit :
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
>> Hi all,
>>
>> After merging the jc_docs tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in toctree: arch/powerpc/htm
>>
>> Introduced by commit
>>
>>    c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
>>
>> interacting with commit
>>
>>    19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
>>
>> from the powerpc tree.
> 
> Did that just get added there?  I've had that fix since early June...I'd
> rather not drop it (and have to redo my 6.17 pull request) now if
> possible...
> 

There was a ping from Randy about it recently so that Maddy added it the 
powerpc tree, see 
https://lore.kernel.org/all/5ac25ceb-023d-409d-8e7e-014d010c5028@infradead.org/

Christophe

