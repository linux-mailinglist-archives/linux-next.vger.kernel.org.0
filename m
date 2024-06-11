Return-Path: <linux-next+bounces-2514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D1903EB8
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 16:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191E81C2252B
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 14:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3391A17D37F;
	Tue, 11 Jun 2024 14:27:40 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9317C213;
	Tue, 11 Jun 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718116060; cv=none; b=FWhpAtRUMnZN/DOSKqbNUzNG0nZQjt7Yh448Vq6nuOkomTHhUtWgbuCcPrXmr3zwrhUEAZfWFuSjVkL8gGTKS+If0EIVPr8U1X2R4ohDo2Jid5MYCosko5HUCLTQ0KjawWCnc+c4Cm0Tj21TcBAgWkWMTyqqy9EnUPGWSyLEpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718116060; c=relaxed/simple;
	bh=O9iNCsRX5AytNqXzYMKTdNeMRspnlADgSYyNwNs4k8g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=B5ztp0lVJu+2hqowZp4Obk/w4JpJZjIWQbNZ4ohnl70C/a43k/tSWO8uLYma3irR8/IFjATZTadOBsGK9m5LeU7tMwr5ykTWbb35iSbz/HQgH1UrNo7j8u31pW8xLsY591zGsmjjTUyIfNRSkfM7gBPVJ7t0GezCQ3kCqvxUxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 45BERALG067643;
	Tue, 11 Jun 2024 23:27:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Tue, 11 Jun 2024 23:27:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 45BERADV067640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Jun 2024 23:27:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a1b092fb-ddde-4126-8950-153239764e3d@I-love.SAKURA.ne.jp>
Date: Tue, 11 Jun 2024 23:27:08 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tomoyo tree with the net-next
 tree
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240611112046.1d388eae@canb.auug.org.au>
 <32ed65af-8d7a-46c0-ae34-c082b60302bb@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <32ed65af-8d7a-46c0-ae34-c082b60302bb@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/06/11 10:20, Stephen Rothwell wrote:
> I fixed it up (I just used the former) and can carry the fix as
> necessary.

I updated "rtnetlink: print rtnl_mutex holder/waiter for debug purpose"
patch, and I think that you no longer need to carry the fix.

This patch already found a suspicious culprit, and I added
"net/sched: Sleep before rechecking index at tcf_idr_check_alloc()" patch as
https://sourceforge.net/p/tomoyo/tomoyo.git/ci/35a1fb207602fb5eacf6fe5b8a35456d5dabd631/
to see if hung task message still appears.


