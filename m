Return-Path: <linux-next+bounces-7722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50CB12263
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 18:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229A71CC44B2
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C811B2EE619;
	Fri, 25 Jul 2025 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0veXjJ5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB201F462D;
	Fri, 25 Jul 2025 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462577; cv=none; b=q1MIgL9Ah4fCnn3yG8V0sCjGNkndNBpWYTwu8YR/IFDnUMITEVNQQnWYKFBMfM6ENNQyfbmbnyy7SBty5eRsqTjNOiZ8ZqqXBVBnAd3HRRSXmQ+JHAhxwNxr7gIWVqQkuVGNr1w2sAxnGh9l69guRQe5V4Hhs1oh9so/BQXRpDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462577; c=relaxed/simple;
	bh=SLJ6zyvsEGx5dOBajxkJt0bN0i9JPXLTqdPwVoPQIUw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rlwRnNIbDr6Q0anAdanGOxdOQOqPhKstH2ZtG9g6Fd1MiR2YISFxzfW5mk8/O4n37MVUuh0OQ3h/hxQ6k6zOR5e3leqT8yR+VCDz93oGeafm20lCIap1gXgLLMY5eSK8mfB/bSGI5IFyqUVSfR/oYLAx8Vu64ZNJEu3uEUaLjHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0veXjJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AABC4AF09;
	Fri, 25 Jul 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753462577;
	bh=SLJ6zyvsEGx5dOBajxkJt0bN0i9JPXLTqdPwVoPQIUw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q0veXjJ5AllllDvPqyCs+XzSugi5QMZq9GopnRU3jcqhT+YxdHLejTX1a74CizcoR
	 a2MpPoGzSmcKc7O2+pDqdeWJvV9Mlcr5KZncs73E16ikEhZzaag6dj7TpIuim61CEz
	 8kIHg+GhS6fpD+txcxoc+CfQFKAuf9DcR6xEDyoP8ZlXRi/5aO/aNgIIPJx7xMleVE
	 xflzhAI3bsErR9KjC5041QfpbyxzfXCagAWxDdQR3bAbfL2jdpSwb76aF53pYaOtnT
	 ProvhS0jSTDCzTHh81Ag8YHt9JC2TFASf8j03XL6O++deitpRjWNtfM0rrHdWsKJu7
	 jLIDLWxzSOC9g==
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41030F40068;
	Fri, 25 Jul 2025 12:56:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Fri, 25 Jul 2025 12:56:16 -0400
X-ME-Sender: <xms:MLeDaNF6dv7PQxROA8isd4i-9cDyPoPdoNjpOALPNZy_-9U5zyMjZw>
    <xme:MLeDaCUtbIl7e7x4ncci20DZ6ioXzM7fOfdbL0YSoNrTbiIAKzZH1uGI2TD4_gAIg
    W1yPDMmdHR_-gXbrI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekgedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfuvhgvnhcu
    rfgvthgvrhdfuceoshhvvghnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epfeejteffgffhleeujeevgedtfedtveejffdtueefgffgveeutddtudeiteekheehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudehjeegtdelvdefuddqvdeitdeltdekleeiqdhsvhgvnheppehkvghrnh
    gvlhdrohhrghesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlvggv
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MLeDaBcIntZ09L9UW813uReK9zZ9tl-FNN_Qi_S1M-tunEKchocwrw>
    <xmx:MLeDaG13nDdAnx4JJ_hvMOiOVwb5CO-Z2U4z5Oj1f3rYtzYY2FHZuQ>
    <xmx:MLeDaILCz22HFGOu9Xudqp5IQQvjdyeNd3pT94mp1vn0dfZAHtaMcw>
    <xmx:MLeDaFFbmwl8F3-HYXF6fPLTHcIzwXzkMIIB1YUHO30PxmAvrlWmUQ>
    <xmx:MLeDaEXFxYz5-1B-LljESDYwvxjtpFSlMSjuJcd-KSAzbHE80FxV5574>
Feedback-ID: iea1648cf:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0BCFA2CE0071; Fri, 25 Jul 2025 12:56:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T417e00d05cb532a6
Date: Fri, 25 Jul 2025 18:55:54 +0200
From: "Sven Peter" <sven@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <e152b574-a064-4f5b-9f96-ee0188ba440a@app.fastmail.com>
In-Reply-To: <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
 <20250725113539.GB11056@google.com>
 <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 25, 2025, at 13:48, Arnd Bergmann wrote:
> On Fri, Jul 25, 2025, at 13:35, Lee Jones wrote:
>> On Fri, 25 Jul 2025, Stephen Rothwell wrote:
>>
>>> The following commit is also in the arm-soc tree as a different commit
>>> (but the same patch):
>>> 
>>>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
>>> 
>>> This is commit
>>> 
>>>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")
>>
>> Odd.  I don't see an applied email for this.

I mentioned I was going to apply it in
https://lore.kernel.org/asahi/a67fcfc9-e708-47db-8605-e20a8b54b0d1@kernel.org/
and also sent out
https://lore.kernel.org/asahi/175292958117.11653.12996215497191655678.b4-ty@kernel.org/
via b4 ty a few days ago. You should've been CCed, no idea why the
email didn't reach your inbox :(

>>
>> This was applied to MFD and a pull-request was provided for the other 
>> subsystems:
>>
>> https://lore.kernel.org/all/20250724102529.GA11056@google.com/
>
> This is the one I pulled in
>
> https://lore.kernel.org/all/20250722163258.62424-1-sven@kernel.org/
>
> I did not see anything from Sven about a shared commit. I can
> throw it out again without too much trouble if you already have
> the contents. The only other commit in that branch is 
> 65293c3276de ("soc: apple: Drop default ARCH_APPLE in Kconfig"),
> which I'm sure can wait as it only changes the default.

Yeah, feel free to just drop that entire PR.
I'll just include that commit in the ones I'll send next cycle.


Sven

