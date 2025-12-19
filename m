Return-Path: <linux-next+bounces-9486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A7ACCFD26
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 13:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4931A300B2B7
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 12:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F1234C837;
	Fri, 19 Dec 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5cc4x0G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC134C822;
	Fri, 19 Dec 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147756; cv=none; b=WbeyRGegjiH6c0GqllMLErLXOuecXx8WeZURaBV2R0rw/6K1eiR9uRKOECfLEpo5XZwgNoxbpe1pVRKfhfslbviwA/2wHAdTpLvuZp10jVfiG/vy7VGXw84gngKGY+SuhiqHNindqTadsvxKVAvYoaCYGH8UWZWOvMdPxXSncyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147756; c=relaxed/simple;
	bh=9zYOtg+wFL7dDm3vqw07D5tk1iNur6XnZok5rS3Up8A=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=ezu88m41U9D5iY+gxe2J7IBDU8MUIoeshUfteZojlOz9gL0tKEBbEFQMaP24HMxmOxlQUMyAFSEsksxnTn0w84hLNecqOSYw0RIhAvHJ8/3ALo1vHjoNYKn/+WWzbqcGPdoh/09Yt0FhaqlfJDjsYu87DkMiKgoi3Di43xq3xM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5cc4x0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60355C4CEF1;
	Fri, 19 Dec 2025 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766147756;
	bh=9zYOtg+wFL7dDm3vqw07D5tk1iNur6XnZok5rS3Up8A=;
	h=Date:From:To:Cc:Subject:From;
	b=l5cc4x0GRS9OozapkdzOvy/6ljnJpXMzfqiNSmrwW4Scx5S+EFN/CriH8hFe0orHv
	 pIUE82PyXaNIRuTt9xhFlFoc/Rd2uhT8fYnyzATAdRtTVOIPeqT2gC6T/ik+6laMEr
	 Z/sgTEW51LGMMa6uzYfOMOcKHrCjFY++xQ+TqJB/vsKJJk4TcQ8e2GBZHpBBTM47bZ
	 XUDbo+Nt0ncXqJRE+Bvpy8r0zqCrWnjHAB/BmZC5rtpep5X8LwuO//1pkkcMVPECpu
	 psDr4ApCstEC7jtDX0fIojyyGzUCF/jm2jj2C4/HJPuw3ds/QQ+jZSSRCahc4toeUm
	 h8Ild6yVSLEUw==
Message-ID: <f39f437e-7ff9-4f52-bc6f-974f54f42260@kernel.org>
Date: Fri, 19 Dec 2025 13:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthieu Baerts <matttbe@kernel.org>
Content-Language: en-GB, fr-BE
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: MPTCP Linux <mptcp@lists.linux.dev>, linux-next@vger.kernel.org,
 Mat Martineau <martineau@kernel.org>
Subject: MPTCP tree in linux-next
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark, Stephen,

First, thank you, Stephen, for all the work you did around linux-next,
and Mark for taking over!

I'm currently maintaining MPTCP with Mat, and I wonder if that would be
OK to add the MPTCP tree in linux-next. We never asked before, mainly
because we handle our tree [1] with TopGit on top of both 'net' and
'net-next' trees, but technically, I'm sure we can find a way to have
branches that would suit linux-next.

Currently, we "export" commits from the TopGit tree in two branches:
'export' and 'export-net':

- 'export-net' is on top of 'net', but it also contains patches that are
useful for our CI: fixes from other trees, temp workarounds, instruction
files for the CI, extra debugging, etc.

- 'export' is on top of 'net-next' and 'export-net', so with the extra
commits for the CI.

For linux-next, I guess we should remove these extra commits for the CI,
right?

Would it be OK to add one new branch containing both the fixes (for
'net') and the new features (for 'net-next') on top of 'net-next'?
Sometimes, we have new features that depend on fixes that are not in
'net' yet. Having one branch should help here.

With one branch on top of 'net-next', we might still have issues if some
of our fixes for 'net' cannot be applied on top of 'net-next'. A
solution would be to have our branch on top of 'net' and containing:

- MPTCP fixes
- a merge commit with 'net-next'
- MPTCP features

Would that also work for you? Or do you prefer having only the MPTCP
commits on top of 'net-next'? Or two branches, one on top of 'net' and
one on top of 'net-next' (without the patches that depends on the ones
in 'net', not in 'net-next' yet)?


Two important notes:

- A synchronisation with 'net' and 'net-next' is done by our CI once a
day, except during the weekend or in case of conflicts.

- Our patches are currently sent as "patches", not in a pull request, so
patches will be applied with a different SHA.

We can certainly easily change both points if that would help you: when
the sync is done, and send PR instead of patches. I guess we could have
situations where when 'linux-next' is rebuilt, a patch would appear in
both Networking and MPTCP trees, which can confuse Git. Maybe changing
our workflow can help to prevent such issues.

One last thing: no hurry here, especially at this period of the year!

[1] https://github.com/multipath-tcp/mptcp_net-next

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


