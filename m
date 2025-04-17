Return-Path: <linux-next+bounces-6285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F385A913CE
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 08:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58B80444E5A
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7140B1E3DDB;
	Thu, 17 Apr 2025 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8UJKG25"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0019EED3;
	Thu, 17 Apr 2025 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870517; cv=none; b=deTz2IqwZ6yIdg+MMi/evPgqcmajHXecS1vRS3zOusUcceKutd5MP4n73oAnSQ+HG1iLxUP6uTP9gyueIfibgh/92goj1WwFY4lYXtX/bF0MS+LXAc7k1lChz84bBjSadZTTUjpPp+nYLg+yr59+4UbY4ymHAIon6jO2HzZm1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870517; c=relaxed/simple;
	bh=C8arQBwpPkSffq/LZellazFh1S9XbpPVP05/qcryMf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiCR5JDN28ziigCeehjI604QWNndvlpRYQe/3Wr5468r6pjjQ1JlZ+26QZHGovmsJQa1UjkS4ugsvL2MgFyLwmQ6gv8extVLOio+AIiE5xxtg1xqFR/PzkRw4Se6GN0q7z7Yyvn446UNTkDd9cVoA/6WrD7RFvnMd6vG0OCh5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8UJKG25; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C634C4CEE4;
	Thu, 17 Apr 2025 06:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744870516;
	bh=C8arQBwpPkSffq/LZellazFh1S9XbpPVP05/qcryMf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8UJKG25Ug4NxP/Ok4v38Ldu6w6o0hc7q1TeqpUGYGPXHP0B/efrcSlhqj6w0FWkv
	 ZDY2AnR1kqn02I1irKH1vkQVkU55XN6a0gzEkJDl6bGOy4b3ZkWWP3dHJqQ13n/1k1
	 UzOE500wVoLxwsB3v7sq80DMNOBK8dB35T2RJElV8doEsFx9tRHykTrTiR5tGhYAXs
	 7Mcti3H0eD1tpgDqJj5q1aO+jOCsYINBMEw2ttscd0xJhuMtCa8MGM5lxKONAGv5Ox
	 bAf9RewDOTCAKV1cm6+42YHVZ1dZoyO0XGKmbvO2KUshOg0HMI1+dcBXALvUhh4pYN
	 W3b+F5Jf0S5hA==
Date: Wed, 16 Apr 2025 20:15:15 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	helpdesk@kernel.org
Subject: Re: linux-next: build failure after merge of the workqueues tree
Message-ID: <aACcc6VmbON_fy3J@slm.duckdns.org>
References: <20250415140116.13544ac6@canb.auug.org.au>
 <CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>
 <Z_50QbWczACrwL5f@slm.duckdns.org>
 <20250417142636.0e73728a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142636.0e73728a@canb.auug.org.au>

Hello,

On Thu, Apr 17, 2025 at 02:26:36PM +1000, Stephen Rothwell wrote:
...
> I am still seeing this failure.  Forgot to push out?

Hah, we might be seeing some caching problem.

  htejun@slm ~/o/wq (for-next)> git rev-list for-next \^master --oneline
  24cdab5787a0 workqueue: Better document teardown for delayed_work
  htejun@slm ~/o/wq (for-next)> git push git@gitolite.kernel.org:pub/scm/linux/kernel/git/tj/wq.git for-next:for-next
  Everything up-to-date
  htejun@slm ~/o/wq (for-next)> git fetch -f git@gitolite.kernel.org:pub/scm/linux/kernel/git/tj/wq.git for-next:tmp 
  htejun@slm ~/o/wq (for-next)> git rev-list tmp \^master --oneline
  24cdab5787a0 workqueue: Better document teardown for delayed_work
  htejun@slm ~/o/wq (for-next)> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next:tmp2                                                    
  From https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq
   * [new branch]                for-next   -> tmp2
  htejun@slm ~/o/wq (for-next)> git rev-list tmp2 \^master --oneline
  2762750ac5c6 workqueue: Better document teardown for delayed_work
  345e029b561e rust: workqueue: remove HasWork::OFFSET

Cc'ing helpdesk@kernel.org. Imma leave the tree as-is for debugging. The
tree only has a documentation patch, so it's fine to skip for linux-next for
now. I'll wait a couple days and if the problem doesn't get resolved, I'll
try to update the branch and see whether the stale cache clears.

Thanks.

-- 
tejun

