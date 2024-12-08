Return-Path: <linux-next+bounces-4900-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2829E8803
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 22:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6C4161ECE
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B872A19049B;
	Sun,  8 Dec 2024 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tBZLCt2R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5FE189F3B;
	Sun,  8 Dec 2024 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733691986; cv=none; b=GASW3INrygjNDMgCE1Byq6ueHZ1tqjR+2FJUksnJg9MPCe1APX6l04gf8VeVXpHdqIwBjTfvbh/3tcoQ+c99qPWyv7l63IWx7y4Lypz7EUSk0nMwJ8JU18rKxcAW9HUoGEg9ehjXu8a3nf8QBZblBp/hmAQezXzDvcu9jM6VMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733691986; c=relaxed/simple;
	bh=TNrJNz8/f0CavaubT6JPMvUn9xlSfhYaI7hUALfck40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvuhGuQ5Z7iZUhHKyBYyY4fLNuQ9RBxa6jJAfXzbl7gyMRmG2JgBSONz4kII8tD9k6wP/aBbtDXjhzjrVpefzvBmhE63r0A47Flmgek2/FBi7UrlAzau15OJY+1aoh2PG1Nd5osOa2qnI5ngdkllN6G/P1gzpxjdotcDRIp0Y6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=tBZLCt2R; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [192.168.192.84] (unknown [50.39.104.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 880CE3FB5C;
	Sun,  8 Dec 2024 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733691975;
	bh=cX7GJ7sNrdE006M6dOvd3MpjBBGorsWdgwQGvVR8vm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=tBZLCt2RQcJfskdQ7j0i/E7Ub9W6YzF0O/YdfXT40B1TivlnfrP4u6TMwrNCbcSsn
	 BQar+2ILdPBWhLbpFDWUF9ugeDD7rLjaAKWhM9GxNLg4m6Mpizzf2mzAzns1UPAZq7
	 yPmGqaAJgi5t4UJSNpBa/Za387qw7xQ5v2oC/7ySqcNe2yEztyskYCtO1uKWz6h4a6
	 3XcXuOfB+gzi2hKJnbGjEFqUJuomNusdpjFIsWsl/rr6kAzE4TfIW4xmhcNtVslGWK
	 hssoIWiBdWVw1camDTJq2/JnouOWr3fZvYMUHNc6w9W6uXVuE5jzkeEQ4Js/kY055m
	 D2Ai4YFlGfHBQ==
Message-ID: <aa6fe535-c6f5-4cec-b5fd-2a11899ad453@canonical.com>
Date: Sun, 8 Dec 2024 13:06:11 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the apparmor tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241209074350.0f91cd13@canb.auug.org.au>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20241209074350.0f91cd13@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/24 12:43, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 

Sorry, looks like the push of my 6.13~rc1 merge failed for some reason. I have manually done it
and it should be fixed now

>    1432b850e9f3 ("apparmor: lift new_profile declaration to remove C23 extension warning")
>    e2d0dd4fbff2 ("apparmor: replace misleading 'scrubbing environment' phrase in debug print")
>    2b8b30835a39 ("parser: drop dead code for XXX_comb macros")
>    4ce19f6feaf3 ("apparmor: Remove unused parameter L1 in macro next_comb")
>    9a7d70cd5b7e ("Docs: Update LSM/apparmor.rst")
>    572b0240ab22 ("apparmor: audit_cap dedup based on subj_cred instead of profile")
>    3262d1f3a44d ("apparmor: add a cache entry expiration time aging out capability audit cache")
>    db448fcb9f42 ("apparmor: document capability.c:profile_capable ad ptr not being NULL")
>    973e9b1e8e76 ("apparmor: fix 'Do simple duplicate message elimination'")
>    2d7d55704a7b ("apparmor: document first entry is in packed perms struct is reserved")
>    dd977e6130f0 ("apparmor: test: Fix memory leak for aa_unpack_strdup()")
>    e81345416df0 ("apparmor: Remove deadcode")
>    81eae8aed8a5 ("apparmor: Remove unnecessary NULL check before kvfree()")
>    08c7de530d83 ("apparmor: domain: clean up duplicated parts of handle_onexec()")
>    30c434a8acc9 ("apparmor: Use IS_ERR_OR_NULL() helper function")
>    e7e0f73d0ab2 ("apparmor: add support for 2^24 states to the dfa state machine.")
>    ee650b3820f3 ("apparmor: properly handle cx/px lookup failure for complain")
>    2b05c4cd52bc ("apparmor: allocate xmatch for nullpdb inside aa_alloc_null")
> 
> These are commits
> 
>    04b5f0a5bfee ("apparmor: lift new_profile declaration to remove C23 extension warning")
>    8acf7ad02d1b ("apparmor: replace misleading 'scrubbing environment' phrase in debug print")
>    9133493a76d7 ("parser: drop dead code for XXX_comb macros")
>    211551768291 ("apparmor: Remove unused parameter L1 in macro next_comb")
>    d00c2359fc18 ("Docs: Update LSM/apparmor.rst")
>    74a96bbe1294 ("apparmor: audit_cap dedup based on subj_cred instead of profile")
>    fee7a2340f18 ("apparmor: add a cache entry expiration time aging out capability audit cache")
>    8532503eac69 ("apparmor: document capability.c:profile_capable ad ptr not being NULL")
>    9b897132424f ("apparmor: fix 'Do simple duplicate message elimination'")
>    a2081b78e212 ("apparmor: document first entry is in packed perms struct is reserved")
>    7290f5923191 ("apparmor: test: Fix memory leak for aa_unpack_strdup()")
>    75535669c9c1 ("apparmor: Remove deadcode")
>    648e45d724ed ("apparmor: Remove unnecessary NULL check before kvfree()")
>    ab6875fbb9d3 ("apparmor: domain: clean up duplicated parts of handle_onexec()")
>    c03093730616 ("apparmor: Use IS_ERR_OR_NULL() helper function")
>    9208c05f9fdf ("apparmor: add support for 2^24 states to the dfa state machine.")
>    db93ca15e5ae ("apparmor: properly handle cx/px lookup failure for complain")
>    17d0d04f3c99 ("apparmor: allocate xmatch for nullpdb inside aa_alloc_null")
> 
> in Linus' tree.
> 


