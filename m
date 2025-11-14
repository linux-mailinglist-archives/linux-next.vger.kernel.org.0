Return-Path: <linux-next+bounces-9015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34322C5EFD3
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 20:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9043B5078
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 19:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F45D2ECD26;
	Fri, 14 Nov 2025 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yccn6tLr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E802ECD21;
	Fri, 14 Nov 2025 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147423; cv=none; b=kcD31CnToUya6+4iVekaVe6zTmsjytW2/E9XL9Z3Ns5a6NemOoC8PdvOOINHgpZINp1g/0qSw7LcfmF0StM6GmuZtzeRWq1zM3WyVHMHrebwXmgctPcNpYtK4o6Z4L9j8hXCZHR8vbDwvYYFV5yrpQxtco0AriQ5+e+PlASToxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147423; c=relaxed/simple;
	bh=3jr4eGQpKoCYTJMqY1LF1U4T3w31iSz/F/HHgO9SNcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgLXXgv0qIreykrAAa4O7SBzV5Wlb7x0xNbdX/tFmODCFQUsA4qT8hBFJJVBmeGnMrirzfxmU7hNsTPOP0Di69s3xGZIZRjhZ1qHB+yxEk6CEfIz1Z4IjE8l1Jbep3InQlDoutrIt0M2+5DdfkjjtVoX1MRZo8sRubkWJUOPrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yccn6tLr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D680EC116D0;
	Fri, 14 Nov 2025 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763147423;
	bh=3jr4eGQpKoCYTJMqY1LF1U4T3w31iSz/F/HHgO9SNcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yccn6tLriwe1MS416t5k7M/Lcb/pOoaLzOBpXXlV9F2tGUAg2FywSLY2soFMccNVa
	 MVFv/OIBIK0vDy286C1Xknz8otxVysUPb+B2Ye10Z9NbtFREKmxUGU7DLS1rOZsykS
	 SlZTodJxctEIai0PBId3NB9QiIP829+g4ji5E4A8Qcc6GgbsgaRLMqvdHVRIPgT896
	 4rBRohNCASi1vQsU18xR3ApgzSjPWzHdGRnS03Cl+NBzHWqSAGnHXOx6Euo+wVE0jP
	 pILqV2HIfJrX9LYwwALbmvuAKQ6kui9Fw2DHLLTGXXUNnqMs2qXyull5sv3MrQyLba
	 QD/PDruKuAv2Q==
Message-ID: <56ae38d8-4aea-453a-961f-c640c1eb6ca8@kernel.org>
Date: Fri, 14 Nov 2025 13:10:18 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Ang Tien Sung <tiensung.ang@altera.com>,
 Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mahesh Rao <mahesh.rao@altera.com>
References: <20251114143214.4e4cbbbd@canb.auug.org.au>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20251114143214.4e4cbbbd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/25 21:32, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>    drivers/firmware/stratix10-svc.c
> 
> between commit:
> 
>    d0fcf70c680e ("firmware: stratix10-svc: fix bug in saving controller data")
> 
> from the char-misc.current tree and commit:
> 
>    bcb9f4f07061 ("firmware: stratix10-svc: Add support for async communication")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

The fix looks good.

Thank you,

Dinh

