Return-Path: <linux-next+bounces-2508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BB902E50
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 04:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E66D1C217BD
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 02:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA0D15AAC6;
	Tue, 11 Jun 2024 02:26:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE4EDF;
	Tue, 11 Jun 2024 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718072787; cv=none; b=X74gGIKn6DrGWat67h5qtqMx3ULPjCZWnTnU9pLFlumssYLHeQS0vKpQrkY1cn2YVErHfEXnUFagzH1kruoIG25/C3BbPx0JTsG2HrW72mxcxl3Ua6rSHUtbAteicwHBmkM7qoQM3niVD2PypaeO8TViw56VDQFXY5YB1iVKd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718072787; c=relaxed/simple;
	bh=DpPKG26OlOwoaR/kz0W0ObH2DRhYXXZxHiIkgLp74Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTs7Svzh8i/Qy7ODyvOiBVXEp9XsSN1DzNU/MqlH+EBHDjvgI8ArqQFc3TM4MCATdcSB6AWFFgwGTjnQkNk14LDOjn9HDbF+/QpNOrFSa1gAL3xV6i8mWePX+k7QO2u87LLunGkanGDqH3SHHD6IZ5ZhrsDIICnxaTF5aOxdvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav314.sakura.ne.jp (fsav314.sakura.ne.jp [153.120.85.145])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 45B2PqW6018882;
	Tue, 11 Jun 2024 11:25:53 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav314.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp);
 Tue, 11 Jun 2024 11:25:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 45B2PqRb018879
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Jun 2024 11:25:52 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <32ed65af-8d7a-46c0-ae34-c082b60302bb@I-love.SAKURA.ne.jp>
Date: Tue, 11 Jun 2024 11:25:51 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tomoyo tree with the net-next
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240611112046.1d388eae@canb.auug.org.au>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20240611112046.1d388eae@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/06/11 10:20, Stephen Rothwell wrote:
> It looks like the tomoyo tree commit should just be completely dropped?

Thank you for notification.

I want a tree for testing orphaned patches (which nobody is willing to take,
and as a result bugs remain unfixed for years) before sending to Linus, and
a tree for testing debug patches (where nobody can debug without additional
code, and as a result bugs remain unfixed for years).

I am for now using the tomoyo tree for such purpose because linux-next tree
is tested by syzbot. I appreciate if network people can carry c2bfadd666b5
("rtnetlink: print rtnl_mutex holder/waiter for debug purpose") in one of
trees syzbot tests.


