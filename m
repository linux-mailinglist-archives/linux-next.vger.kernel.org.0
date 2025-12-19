Return-Path: <linux-next+bounces-9488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1ECD0825
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 16:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6069E306343E
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1F0349AF2;
	Fri, 19 Dec 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imeMdfLB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0CA34844C;
	Fri, 19 Dec 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158291; cv=none; b=AXPUB78IllPN0/RQGX2aG2MslMRNSARYqKPSGcVwcpuycwd4X1SJ4T/t7H3ZiG4NlsS94P4QsU/1uV3KjOUZ+0eofjtDqtdFjskph7lIYZNbWmlj9i5sGx4MRCHygr+AbuK/MmBSjVhg+LBxXa+0Jx/w9yGFUW4A7Ytb/EmAxzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158291; c=relaxed/simple;
	bh=RvjtL0Rb60cKJ8tuurDRLiVBZa3JOe/Q0me7W6ggEfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3QXmnUhBA/ZBvrFRP6JGET6RUEoDFXEYfcQHMHh9y+bRCGp5Ed/KuctrK7FzksroK8Igh2zaM5b9h5/R4abPyKgd1e5k9MN2JITj1FN0BVvpE9YKZ5/ESA15sQ3kEnn8P1YZcyjyrGcOLWr2zp9D5HP4zHZxCL468dC0ITm5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imeMdfLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C443AC113D0;
	Fri, 19 Dec 2025 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766158291;
	bh=RvjtL0Rb60cKJ8tuurDRLiVBZa3JOe/Q0me7W6ggEfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=imeMdfLBF8xq0b5li6OfgpCQuHlrFwGQvo872oxMCYRBVF+zLP3/pqLfLpudVvLgH
	 NAhakYUl810eWZt3iJDDTPbp/ILanFeuZN/0/ZoQZw1OgE547vgcGlyddRadBVkdbV
	 SRlc7Vo/l+MV8OlwbeLPhcYRjw7J22vzipre1vjWwwJi7meWWATNpztufhw7phGTY0
	 uTGfy/H8KTWaZBqIEM49VZxnpue1CKu0ZB+ICELWsHFwcojGg/ffhCu9M0Yz1e8WUl
	 cMy7WHCJjWGj4uua71K5J74wk00lJkfKjq7mZKoxfaLEY3vV3CC53/aCRqaQgRutYi
	 IoGX7BlOYSSHA==
Message-ID: <09460b1f-ce96-4d8d-a94d-0d0890981cb0@kernel.org>
Date: Fri, 19 Dec 2025 16:31:25 +0100
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
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <38d74d9e-9da0-41b8-9721-3de9aa355c21@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

Thank you for your reply!

On 19/12/2025 15:30, Mark Brown wrote:
> On Fri, Dec 19, 2025 at 01:35:51PM +0100, Matthieu Baerts wrote:
> 
>> Currently, we "export" commits from the TopGit tree in two branches:
>> 'export' and 'export-net':
>>
>> - 'export-net' is on top of 'net', but it also contains patches that are
>> useful for our CI: fixes from other trees, temp workarounds, instruction
>> files for the CI, extra debugging, etc.
>>
>> - 'export' is on top of 'net-next' and 'export-net', so with the extra
>> commits for the CI.
>>
>> For linux-next, I guess we should remove these extra commits for the CI,
>> right?
> 
> Right, we only want changes that are intended to go to Linus.

Thank you, that makes sense!

>> Would it be OK to add one new branch containing both the fixes (for
>> 'net') and the new features (for 'net-next') on top of 'net-next'?
>> Sometimes, we have new features that depend on fixes that are not in
>> 'net' yet. Having one branch should help here.
> 
> One branch is certainly OK, though it is desirable to have fixes
> separately since as well as the main -next branch we also build
> pending-fixes which includes only fixes, the goal being to validate that
> there's no unintended dependencies on non-fix changes.  That's not
> essential though.

Ah yes, I forgot about pending-fixes. It is easy to create such branch
containing only fixes.

>> With one branch on top of 'net-next', we might still have issues if some
>> of our fixes for 'net' cannot be applied on top of 'net-next'. A
>> solution would be to have our branch on top of 'net' and containing:
>>
>> - MPTCP fixes
>> - a merge commit with 'net-next'
>> - MPTCP features
>>
>> Would that also work for you? Or do you prefer having only the MPTCP
>> commits on top of 'net-next'? Or two branches, one on top of 'net' and
>> one on top of 'net-next' (without the patches that depends on the ones
>> in 'net', not in 'net-next' yet)?
> 
> We generally don't want that merge unless it'd get sent to Linus
> eventually so your second option feels like a better choice here for my
> money (Stephen might have a better idea here though?).  I don't know how
> promptly net-next gets the fixes merged up, or how often dependencies on
> fixes is an issue.

Typically, the Net maintainers send a PR to Linus once a week, with the
content of 'net'. Once merged, 'net' points to Linus' merge commit, and
'net-next' is then merged with 'net'.

(Before each merge window, 'net' is merged with 'net-next'.)

When we have new features depending on new fixes, the fixes are sent
first to be included in 'net'. Then we wait for 'net-next' to get those
fixes (max 1 week), and we send the new features to be included in
'net-next'.

If 'linux-next' already contains a merge between 'net' and 'net-next',
maybe it is fine to merge a branch also containing this merge? But I
guess that's possibly not recommended if conflicts are solved differently.

> Do other net subtrees have workflows for this, I'd
> imagine they run into similar issues?

Good point. I don't see any special case for that. I see that some repos
have 'for-next' branches like 'wireless' and 'wireless-next', but it
looks like it is not the good time to look because for the moment
'net-next' is closed.

Perhaps it is enough to work in a "best-effort" way and to provide a
"pending-fixes" branch with only fixes on top of 'net', and "for-next"
with patches that applies on top of "net-next". Conflicted patches are
skipped until the next 'net' / 'net-next' sync.

>> - Our patches are currently sent as "patches", not in a pull request, so
>> patches will be applied with a different SHA.
> 
> The main issue with that would be that it would create work with the
> duplicate commit detection and reporting we do which would get annoying
> for all concerned.  I suspect the actual merges would mostly end up
> fine, git tends to figure this stuff out fairly well.

Ah yes, I see. We could adapt when the automated sync is done, but
that's probably not enough.

>> We can certainly easily change both points if that would help you: when
>> the sync is done, and send PR instead of patches. I guess we could have
>> situations where when 'linux-next' is rebuilt, a patch would appear in
>> both Networking and MPTCP trees, which can confuse Git. Maybe changing
>> our workflow can help to prevent such issues.
> 
> If you were to switch to sending a PR of the actual commits in -next
> that'd make life easier but that'd need you to work out the workflow
> with whoever you're sending the patches to.  I guess you could adopt a
> hybrid flow where you use TopGit with regeneration until you send the PR
> and then freeze the patches included in the PR?  You could use the PR as
> a base for new stuff while it's in flight.  There are trees that are
> managed in a patch queues that use a workflow a bit like that.

Indeed, it might be better to do that. I will check later to put that in
place. I guess we mainly have to change the way patches are sent.

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


