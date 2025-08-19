Return-Path: <linux-next+bounces-8015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5EB2C034
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 13:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A0C16F7A5
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 11:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0BE326D72;
	Tue, 19 Aug 2025 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WstJvNo4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309A27876E;
	Tue, 19 Aug 2025 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602527; cv=none; b=L+J13ijpZ0TYjSvLdJO/X+Tcvy8ptHyFmnLpjNyNvbyeKCgKYRmZCocE4jop7mUSAYEllQYyfZ+tUmbwJ5Ls1ydgQVH5qnjGIIIDQpVsvh5CwEDVoqc7skevVLWamwIS1ILiAZMzH0Vk6fgXjfNAW5BbR71dVgm3cPprdX+8P0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602527; c=relaxed/simple;
	bh=XMExnmBFXcPk0dOstqKXSh1ltQZmTlVHsRz4D0fsUKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9jA9h4TOHUm8djDpsKxPbXa1EXyKXx70KsZ6ZdsqwAw4sh2VffQOsL/rwLT9UkY9YKBrdZQtuRvHXwyci4deBjmDpHzwcwn/yrQd11zBjR8uQTlxN9R4HzzvLkTIJoE8vvTCPXhYABzJIW6t+snqbXKD6J7ctQIf3YejgGBNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WstJvNo4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14644C4CEF1;
	Tue, 19 Aug 2025 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755602527;
	bh=XMExnmBFXcPk0dOstqKXSh1ltQZmTlVHsRz4D0fsUKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WstJvNo4qGxW6wSZOMSm7zjXcOuIJpxUYj8mkMl1WLTpvtzIhmUZCwke9Cmo7hmw/
	 HCSH2r65NAEem7/S5T/s2H5DLKM25b3n1SnkWo2ym/kFuyN8Vj+OtzCHLU0Etbvdiq
	 GjaQYWZcXhhZOpvFJHRTMkLSCGgtGgeU+0ZiMzJoJrw03ULCiQUwndYcjG+SFk+5zl
	 LMNxspv6SGGlEqadBoqQPSyf7KqIN1wm4/GQ5paZMOMWAjxA0A/iWCCc+Ex8zMBxdF
	 bGzHEv1Dcl7usw0FPI1AtYuPr12ZSe+tkNGbCFfUUijws8lmhmj/AT4VGLPczLAAOW
	 ghxHLstB3n1nQ==
Message-ID: <5c527946-31c4-45a9-a804-f873ce0db4a4@kernel.org>
Date: Tue, 19 Aug 2025 12:22:04 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the nvmem tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Srinivas Kandagatla <srini@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250819134039.5742c60e@canb.auug.org.au>
 <3861530.VQhiAETyHQ@diego>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <3861530.VQhiAETyHQ@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/25 12:14 PM, Heiko Stübner wrote:
> Hi,
> 
> Am Dienstag, 19. August 2025, 05:40:39 Mitteleuropäische Sommerzeit schrieb Stephen Rothwell:
>> After merging the nvmem tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
>> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
>>    13 |         u32 baud_rate;
>>       |         ^~~
> 
> [...]
> 
>>
>> Caused by commit
>>
>>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controllers")
>>
>> I have used the nvmem tree from next-20250818 for today.
> 
> bah, sorry about messing this up.
> 
> While I encountered this, and fixed that with the pending
>   https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.de/
> 
> I completely missed that the nvmem driver applied alone would break
> without that change :-( .

I have now reverted this change, @Heiko Please let me know if you want
to take this to mfd tree or vice-versa.

--srini
> 
> I've send
>   https://lore.kernel.org/all/20250819111044.2714855-1-heiko@sntech.de/
> 
> as a fix that removes the issue for the nvmem driver.
> 
> 
> Heiko
> 
> 


