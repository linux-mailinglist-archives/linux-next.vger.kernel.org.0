Return-Path: <linux-next+bounces-5504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622CA3C93A
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 20:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9591896814
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 19:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70CB22CBCC;
	Wed, 19 Feb 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghTLHW9U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E21ADC86;
	Wed, 19 Feb 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739995140; cv=none; b=ek10/C2doNluNLxDudZLE0fSc+YLdU09KvriCggBiM2F5fvklvawznQWprM7FD7lNkrGRSBZAsU+R60GhD5in9YeUoMpvOOap1E4SYHnV4eZMIe3Y0d/2lGd1FNoKxKMiqco/MJ7sqqeh3HcufKF15MgYbAfvXEHBfzJI5b1kQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739995140; c=relaxed/simple;
	bh=a5qxwcE82nIIvSDBTEECxWJflY1e7knKakCW4OMIQr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pA9XwU1bE43McMBnm78Elrapx0VhvzZYimt7nryvdqwug/iOUgLD2mEGuOfk78od0vbGKOVl9BvugaikcJfE0cnTntGXk7OjTUel3FRP94624tLc9Ycau0achjLOirPmIDsWn8hu1+XbBaOVEdCYsISoLcC+Qo0tK7TOD2EaCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghTLHW9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B98BC4CEDD;
	Wed, 19 Feb 2025 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739995140;
	bh=a5qxwcE82nIIvSDBTEECxWJflY1e7knKakCW4OMIQr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghTLHW9U0WYIhhe8YAtRO7BOR/wye0txg3VlkHm28gF2nX/gyw37/YBQK8sXtWIR0
	 5HOakH/5JIVq0eX5YHzuNEwAWmT1xBSzx6adBI6NMRCN584VusM942gqiD5NNIgKQE
	 0PYUWk46V+OU+jSI1fQ7GGj8zLGEYVNGY2upJKx5hzyQD3HckSHpCATWjmN/DxfL7A
	 afOqePdFA05qS84rHSUeE3lCC6t/Fg9pPxebEqPSWcqyurZr16+xFBSjDbgMaQzId4
	 vE3NRUb8JG0BS4QgH1PbCA1tQIvb+ifTAP4a/YZoT5VztMwXq7jz+mcYUERwasc3tb
	 /Ykxi5zrMr2Jw==
Message-ID: <06bc4404-ec60-4f38-a568-6600969f6f96@kernel.org>
Date: Wed, 19 Feb 2025 11:58:58 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vineet Gupta <vgupta@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>,
 Linus Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
 <8e27ccd9-47c4-45f0-ad93-b88d603108b4@kernel.org>
 <20250216221113.03080b52@canb.auug.org.au>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250216221113.03080b52@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/25 03:11, Stephen Rothwell wrote:
> Hi Vineet,
>
> On Wed, 12 Feb 2025 22:02:09 +0530 Vineet Gupta <vgupta@kernel.org> wrote:
>> On 2/12/25 04:26, Stephen Rothwell wrote:
>>> The following trees are going to be removed from linux-next because they
>>> have not been updated in more than a year.  If you want a tree restored,
>>> just let me know (and update its branch).
>>>
>>> Tree			Last commit date
>>>   URL
>>>   comits (if any)
>>> ----			----------------
>>> arc			2023-09-10 16:28:41 -0700
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-next  
>> Ack: We don't need 2 next tending trees for ARC any longer.
> This is supposed to be the development tree.  The only other one I have
> is arc-current
> (git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-curr)
> which is for bug fixes.  So do you really not do any development any more?

For quite some time I've been using just # for-curr for both fixes/features, as
dev as slowed down.
Things might change if and when work picks up on ARCv3/arc64 bit for now
for-curr suffices.

Thx,
-Vineet

