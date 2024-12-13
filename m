Return-Path: <linux-next+bounces-4953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EDC9F1943
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 23:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13C11889A2A
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 22:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379251A256C;
	Fri, 13 Dec 2024 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7LW0jvn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC61990CE;
	Fri, 13 Dec 2024 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734129625; cv=none; b=N01r389DIfGctlbkUz6bW5unt/9fqw0m285CzfTNEIVWuSPtZQ3AgZcT03oMFOlONdkMwSMyyUdg3+EE0YewOlLbLT+MdbAkFVZIfZiuM2S56Fsu/0X2Asku2HUxHCQvZRAajAgJ0hnyyBP+KTKVKQrwgV2RsKaswwLRx7+UuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734129625; c=relaxed/simple;
	bh=L3+E52jPvapoDr089XoJFI1tZopW2zLI3ccFO6zuXZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8udUKk2kYQSmrGlFtpQcJfeHNaOQmT+WThk42NaVEPXcSpnPVI9ddmMtMq3SDv2y+CGAWMrpN3pkTFSKhlXc6T57n4d4/AywqToQG6iLI/UoDzbXsJC3gspZSe+hyC8239/7PaTD4j7/+veMPHxLTqpoyoVHCU76Tb9sQfZtns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7LW0jvn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBBFC4CED0;
	Fri, 13 Dec 2024 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734129624;
	bh=L3+E52jPvapoDr089XoJFI1tZopW2zLI3ccFO6zuXZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L7LW0jvn3CJhEO7cX+7KwyLHXnrL2JBZM2COZv7BvL4mzsQBInARh+L8bSYFEc7Vr
	 fu++KIeWCyuUCPlYwxQdbyprYOe6JG6LSaVxYX/X6aKvMWYzBx4+erf/Y0iecJcd9p
	 6jEtOPgheqjCZJqgil6D89aZRyJmhAq01MimMSnzhodTy0kUcvfNGA9W03jq0UsUzh
	 DAyD0wIiJBu5zxBcQ3ltM+uEzHADGRNRDBptQy7aU4gtOXzIZXt7J/qNxZIuJbVtop
	 zUGLUIMf5DfkCsXda6HcRTRhgrcHYFW24uN7IRoAlsyZIa9MqtukkNrVUQHd+4G2oT
	 oQnnjJp3b1JYw==
Message-ID: <8d89daf6-54b0-4d4a-94ed-e19307362b85@kernel.org>
Date: Fri, 13 Dec 2024 14:40:23 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the arc-current
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vineet Gupta <vgupta@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241213155620.5966dbfb@canb.auug.org.au>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20241213155620.5966dbfb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/24 20:56, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   0d535742b039 ("ARC: build: Try to guess GCC variant of cross compiler")
>
> is missing a Signed-off-by from its committer.

This is fixed now.

Thx,
-Vineet

