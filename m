Return-Path: <linux-next+bounces-6942-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B88AC5AEA
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 21:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E241BA62BB
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 19:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2120828A3E4;
	Tue, 27 May 2025 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irXj7xkv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9A248F72;
	Tue, 27 May 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375044; cv=none; b=LjuJjYjevA0C/PGMqaKFNvr/1gyqpSeiMBDVtS29N3nEkp/265ABDqlG4bGQPcWXoVZwaMqW8bjICxhNy/Z52PAWzUsu7wxeeIAAs9GOYmxdd5ueLU2XvTFt+KNyLL9GGy5hGosBvRFEU/uMgUxKxbHCdA4xmsbv63NpwLwOwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375044; c=relaxed/simple;
	bh=CumLlkFXZ5kxVzIS20826e1InW2i+7hmjFmqw2Io/5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhEzmTvIjMA4GCpm6iJLq5UYhZ53WoYquqOqgJp23gj54b9iAc6qFqcDIH4aQw964vEEUYgPx3vAtGDAlq1aGEKYYAUnBPlAfA0GpOS8LoRCZxVlFZb2M25IYu/10EVxyP+q9LpOdGBSKh3CPCOa83K0F35pX2v6VaNk8trggl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irXj7xkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E52C4CEE9;
	Tue, 27 May 2025 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748375043;
	bh=CumLlkFXZ5kxVzIS20826e1InW2i+7hmjFmqw2Io/5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=irXj7xkvpT4uJqtbdqzhbrmwwLSr9YdMXBSVSEAzTxuU0wKHnQnZ2Z0MOnF7yHKDR
	 gcOH0Pm882DNz5PY/eMPmeSoef7loVKklWe/7auQMkTEmfF9bi63ufgF2FzpYxLKs5
	 a0kEC0xhE3AA9z+49ZWLmW0SH7+zPJ1Z9LaTRm7eAhV/StgNv69pCqIJu8DyHx4j9o
	 4XuKh4vQ276IXhgKsHCrS8Wlslc4q5gWmQl6Xcor1MXftrT54dyk7Gv1kGKuSA1q4r
	 qMOhhHk6EFqN3oQkz66DOIlU7sdKtcYjPKwnFJbu0yol+uwztqBhb4OJdfFUiPmOYg
	 LwxnWXGC1tI2w==
Message-ID: <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org>
Date: Tue, 27 May 2025 21:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 27 (drivers/platform/x86/amd/amd_isp4.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250527203231.3c6c0b9d@canb.auug.org.au>
 <04577a46-9add-420c-b181-29bad582026d@infradead.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <04577a46-9add-420c-b181-29bad582026d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-May-25 8:56 PM, Randy Dunlap wrote:
> 
> 
> On 5/27/25 3:32 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250526:
>>
> 
> on x86_64, when
> # CONFIG_MODULES is not set
> 
> ../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
> ../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
>   154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>       |                                   ^~

Hmm, this should not check the owner->name at all.

Instead the i2c_designware_amdisp should set adap->name to something
unique and then this should check adap->name.

Regards,

Hans




