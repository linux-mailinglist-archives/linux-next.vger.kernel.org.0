Return-Path: <linux-next+bounces-9490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB0ACD0C13
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 17:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5951830848AC
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 16:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6370235CBB0;
	Fri, 19 Dec 2025 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiEknfgd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1C035CBAE;
	Fri, 19 Dec 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159500; cv=none; b=cMUKWysVdVJqZ/A7DLACFtw3okrasrd+++08dEkSNWKsEwxL7X6hsUHPlZWTekvBPhPp18gEL81dVVOFlBwOJQSb3T4O/FcDwClTU4DovOYCASrL2gMBVHauE97MYjIMmPnFyuZFoRa7TwZojK5GUvklrK+b2W90k7rk9EbFWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159500; c=relaxed/simple;
	bh=RHg8X/l3glpqIdUZM5I2Tv5UDvNNl7f0frkrqi1P0FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zsu15eXuGcDQYMGYJXBGcT9WYs8jKME8auh5HKGZ9ejUBcsYPB3vhdADOxBbISwmd2/r/1s8gfmeAyLkULm84TfRwRfLiUXFXrF9IGKtyLp8dt6lf4lqXSgE6vhNWii97sTCLXeJyx/bCpLa5VjBvBp7lq6ojFctJjAFvhM0N04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiEknfgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1B4C4CEF1;
	Fri, 19 Dec 2025 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766159499;
	bh=RHg8X/l3glpqIdUZM5I2Tv5UDvNNl7f0frkrqi1P0FA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fiEknfgd5eKhTjXqh8hELSxmFy7F/bd0avN12+g8X8vLEwdSmLtyRa/R/Efm3WISq
	 kyr9MQBoEFypfXavlMhgbdG32mWMGRpaaGZEVqAsnPhgYl0vv/6+pQoigSVeBwq3rh
	 58uel6Yo2zYP36HgU6+sYXPgCjFK5JIaDzFdH+SdzHGqiLPnqkMPyC/4qN8r7mFXL/
	 JOhsYUzLq/t6RBe9aM81m/3+Zz17pBqjQ8dTMdxvLi2w+76HjSY8aM756d/c2Wo7AZ
	 78/cIxE3riP0IAeCVJLYNjHXa9DghI77R+GcF5hhwf6iql9uJNKEe9AN3PVKlkc2eU
	 JjE9yeY+bpO6A==
Message-ID: <5cec0446-92d8-4348-8190-9491bffa1538@kernel.org>
Date: Fri, 19 Dec 2025 16:51:36 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MPTCP tree in linux-next
Content-Language: en-GB, fr-BE
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 MPTCP Linux <mptcp@lists.linux.dev>, linux-next@vger.kernel.org,
 Mat Martineau <martineau@kernel.org>
References: <f39f437e-7ff9-4f52-bc6f-974f54f42260@kernel.org>
 <38d74d9e-9da0-41b8-9721-3de9aa355c21@sirena.org.uk>
 <09460b1f-ce96-4d8d-a94d-0d0890981cb0@kernel.org>
 <56a0f49e-b5ab-47f2-a0b2-2ad4e991d056@sirena.org.uk>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 xsFNBFXj+ekBEADxVr99p2guPcqHFeI/JcFxls6KibzyZD5TQTyfuYlzEp7C7A9swoK5iCvf
 YBNdx5Xl74NLSgx6y/1NiMQGuKeu+2BmtnkiGxBNanfXcnl4L4Lzz+iXBvvbtCbynnnqDDqU
 c7SPFMpMesgpcu1xFt0F6bcxE+0ojRtSCZ5HDElKlHJNYtD1uwY4UYVGWUGCF/+cY1YLmtfb
 WdNb/SFo+Mp0HItfBC12qtDIXYvbfNUGVnA5jXeWMEyYhSNktLnpDL2gBUCsdbkov5VjiOX7
 CRTkX0UgNWRjyFZwThaZADEvAOo12M5uSBk7h07yJ97gqvBtcx45IsJwfUJE4hy8qZqsA62A
 nTRflBvp647IXAiCcwWsEgE5AXKwA3aL6dcpVR17JXJ6nwHHnslVi8WesiqzUI9sbO/hXeXw
 TDSB+YhErbNOxvHqCzZEnGAAFf6ges26fRVyuU119AzO40sjdLV0l6LE7GshddyazWZf0iac
 nEhX9NKxGnuhMu5SXmo2poIQttJuYAvTVUNwQVEx/0yY5xmiuyqvXa+XT7NKJkOZSiAPlNt6
 VffjgOP62S7M9wDShUghN3F7CPOrrRsOHWO/l6I/qJdUMW+MHSFYPfYiFXoLUZyPvNVCYSgs
 3oQaFhHapq1f345XBtfG3fOYp1K2wTXd4ThFraTLl8PHxCn4ywARAQABzSRNYXR0aGlldSBC
 YWVydHMgPG1hdHR0YmVAa2VybmVsLm9yZz7CwZEEEwEIADsCGwMFCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AWIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZUDpDAIZAQAKCRD2t4JPQmmgcz33
 EACjROM3nj9FGclR5AlyPUbAq/txEX7E0EFQCDtdLPrjBcLAoaYJIQUV8IDCcPjZMJy2ADp7
 /zSwYba2rE2C9vRgjXZJNt21mySvKnnkPbNQGkNRl3TZAinO1Ddq3fp2c/GmYaW1NWFSfOmw
 MvB5CJaN0UK5l0/drnaA6Hxsu62V5UnpvxWgexqDuo0wfpEeP1PEqMNzyiVPvJ8bJxgM8qoC
 cpXLp1Rq/jq7pbUycY8GeYw2j+FVZJHlhL0w0Zm9CFHThHxRAm1tsIPc+oTorx7haXP+nN0J
 iqBXVAxLK2KxrHtMygim50xk2QpUotWYfZpRRv8dMygEPIB3f1Vi5JMwP4M47NZNdpqVkHrm
 jvcNuLfDgf/vqUvuXs2eA2/BkIHcOuAAbsvreX1WX1rTHmx5ud3OhsWQQRVL2rt+0p1DpROI
 3Ob8F78W5rKr4HYvjX2Inpy3WahAm7FzUY184OyfPO/2zadKCqg8n01mWA9PXxs84bFEV2mP
 VzC5j6K8U3RNA6cb9bpE5bzXut6T2gxj6j+7TsgMQFhbyH/tZgpDjWvAiPZHb3sV29t8XaOF
 BwzqiI2AEkiWMySiHwCCMsIH9WUH7r7vpwROko89Tk+InpEbiphPjd7qAkyJ+tNIEWd1+MlX
 ZPtOaFLVHhLQ3PLFLkrU3+Yi3tXqpvLE3gO3LM7BTQRV4/npARAA5+u/Sx1n9anIqcgHpA7l
 5SUCP1e/qF7n5DK8LiM10gYglgY0XHOBi0S7vHppH8hrtpizx+7t5DBdPJgVtR6SilyK0/mp
 9nWHDhc9rwU3KmHYgFFsnX58eEmZxz2qsIY8juFor5r7kpcM5dRR9aB+HjlOOJJgyDxcJTwM
 1ey4L/79P72wuXRhMibN14SX6TZzf+/XIOrM6TsULVJEIv1+NdczQbs6pBTpEK/G2apME7vf
 mjTsZU26Ezn+LDMX16lHTmIJi7Hlh7eifCGGM+g/AlDV6aWKFS+sBbwy+YoS0Zc3Yz8zrdbi
 Kzn3kbKd+99//mysSVsHaekQYyVvO0KD2KPKBs1S/ImrBb6XecqxGy/y/3HWHdngGEY2v2IP
 Qox7mAPznyKyXEfG+0rrVseZSEssKmY01IsgwwbmN9ZcqUKYNhjv67WMX7tNwiVbSrGLZoqf
 Xlgw4aAdnIMQyTW8nE6hH/Iwqay4S2str4HZtWwyWLitk7N+e+vxuK5qto4AxtB7VdimvKUs
 x6kQO5F3YWcC3vCXCgPwyV8133+fIR2L81R1L1q3swaEuh95vWj6iskxeNWSTyFAVKYYVskG
 V+OTtB71P1XCnb6AJCW9cKpC25+zxQqD2Zy0dK3u2RuKErajKBa/YWzuSaKAOkneFxG3LJIv
 Hl7iqPF+JDCjB5sAEQEAAcLBXwQYAQIACQUCVeP56QIbDAAKCRD2t4JPQmmgc5VnD/9YgbCr
 HR1FbMbm7td54UrYvZV/i7m3dIQNXK2e+Cbv5PXf19ce3XluaE+wA8D+vnIW5mbAAiojt3Mb
 6p0WJS3QzbObzHNgAp3zy/L4lXwc6WW5vnpWAzqXFHP8D9PTpqvBALbXqL06smP47JqbyQxj
 Xf7D2rrPeIqbYmVY9da1KzMOVf3gReazYa89zZSdVkMojfWsbq05zwYU+SCWS3NiyF6QghbW
 voxbFwX1i/0xRwJiX9NNbRj1huVKQuS4W7rbWA87TrVQPXUAdkyd7FRYICNW+0gddysIwPoa
 KrLfx3Ba6Rpx0JznbrVOtXlihjl4KV8mtOPjYDY9u+8x412xXnlGl6AC4HLu2F3ECkamY4G6
 UxejX+E6vW6Xe4n7H+rEX5UFgPRdYkS1TA/X3nMen9bouxNsvIJv7C6adZmMHqu/2azX7S7I
 vrxxySzOw9GxjoVTuzWMKWpDGP8n71IFeOot8JuPZtJ8omz+DZel+WCNZMVdVNLPOd5frqOv
 mpz0VhFAlNTjU1Vy0CnuxX3AM51J8dpdNyG0S8rADh6C8AKCDOfUstpq28/6oTaQv7QZdge0
 JY6dglzGKnCi/zsmp2+1w559frz4+IC7j/igvJGX4KDDKUs0mlld8J2u2sBXv7CGxdzQoHaz
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <56a0f49e-b5ab-47f2-a0b2-2ad4e991d056@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 16:49, Mark Brown wrote:
> On Fri, Dec 19, 2025 at 04:31:25PM +0100, Matthieu Baerts wrote:
>> On 19/12/2025 15:30, Mark Brown wrote:
>>> On Fri, Dec 19, 2025 at 01:35:51PM +0100, Matthieu Baerts wrote:
> 
>> If 'linux-next' already contains a merge between 'net' and 'net-next',
>> maybe it is fine to merge a branch also containing this merge? But I
>> guess that's possibly not recommended if conflicts are solved differently.
> 
> Yeah, if the resolution is the same it's not an issue - it's if they
> diverge somehow that there's a concern.
> 
>> Perhaps it is enough to work in a "best-effort" way and to provide a
>> "pending-fixes" branch with only fixes on top of 'net', and "for-next"
>> with patches that applies on top of "net-next". Conflicted patches are
>> skipped until the next 'net' / 'net-next' sync.
> 
> You could always start with that and figure out the complicated stuff
> later.

Indeed, I will do that!

>>> If you were to switch to sending a PR of the actual commits in -next
>>> that'd make life easier but that'd need you to work out the workflow
>>> with whoever you're sending the patches to.  I guess you could adopt a
>>> hybrid flow where you use TopGit with regeneration until you send the PR
>>> and then freeze the patches included in the PR?  You could use the PR as
>>> a base for new stuff while it's in flight.  There are trees that are
>>> managed in a patch queues that use a workflow a bit like that.
> 
>> Indeed, it might be better to do that. I will check later to put that in
>> place. I guess we mainly have to change the way patches are sent.
> 
> Sounds good.

Thank you, I will contact you later when this new workflow is in place!

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


