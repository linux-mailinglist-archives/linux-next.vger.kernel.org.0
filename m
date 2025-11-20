Return-Path: <linux-next+bounces-9103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0417C7244B
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 06:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 8BC792ECE9
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448BD2EFD8C;
	Thu, 20 Nov 2025 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiyD48s8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6292E0916;
	Thu, 20 Nov 2025 05:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763617324; cv=none; b=f6pRByBCuMOUrYxb+rcG5M2p78vC4LUgwDV/dKGglcgMX3Eo+iyTJ0KfIRv9SbYYXHuqrxOyiGTQLk9Qv1feaHwGNz0PVA5PiT4Blm1lD2AkulVQ622BFTVUnDn7I44DvTdwrcH6Mpf/FNDUaqaqFHn08kw3Y3rQlSLRt0Wdxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763617324; c=relaxed/simple;
	bh=g95Dfm7QlpxmPnHz9JFjxyR1EEHAWaXRrZ6I80N2WSc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bykUA0zlGBN9GW5sD1LoxlRi+Hg/9ormD6GvGIbx34fa19A/Ts0AjDJDcNd9ZXCn0x5jE+vIXD2AvvI1XuJSffjmBK0sDclx8kIYg/n7vHWtEbCHXCk3cprcrLbKeuFFF6l7Ljp/TAH629OnPzE7Udy28eTZXpzRMI/68closzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiyD48s8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FC0C4CEF1;
	Thu, 20 Nov 2025 05:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763617323;
	bh=g95Dfm7QlpxmPnHz9JFjxyR1EEHAWaXRrZ6I80N2WSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZiyD48s8Lr5yiYoPELUfwhf4mN+nKcj5WjCYKDFrGDzMEnL3fQadyjLm0hHBtUg4B
	 2sFrQkx9NXh9wPyEXrCOKKyv4nlwW+s5ksLkQq0gSa7k/n9wX/h8KUvjwzx/ccdXFy
	 bFRLEzrfxV4AfMbLQIDAq8SFx7zKw4xmKeKYMSSTT9qvMAK061asqsCWBxSSWPtXz0
	 rpAefiaiJCuH7dArCaISlgcC2FfbXJUcbnuYQs9XN62QPfqYkkOAVlsmggbc87fjpu
	 Vk37uAjP/vhkF2CsRD6STPFGFjcH8KJwAqvlPzKf7SpH3eK/2zb7m2sQylgmI0vRnc
	 xWxEukLXu4duw==
Date: Thu, 20 Nov 2025 14:42:01 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kselftest tree
Message-Id: <20251120144201.5e911aed3cfd12fa3068bdea@kernel.org>
In-Reply-To: <20251120162349.0c84ab13@canb.auug.org.au>
References: <20251120162349.0c84ab13@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 16:23:49 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the ftrace tree as a different commit
> (but the same patch):
> 
>   a2f7990d3309 ("selftests: tracing: Update fprobe selftest for ftrace based fprobe")
> 
> This is commit
> 
>   5810077b5219 ("selftests: tracing: Update fprobe selftest for ftrace based fprobe")
> 
> in the ftrace tree.

Ah, sorry I should remove this patch from my tree.

Thanks,

> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

