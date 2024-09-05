Return-Path: <linux-next+bounces-3603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2B96CD88
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 06:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9808DB21526
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 04:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661F4219E1;
	Thu,  5 Sep 2024 04:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqIOHnSt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB47FD;
	Thu,  5 Sep 2024 04:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725508821; cv=none; b=afQ8Swx20ir1SXIx0RSMqZxhrZKJHz4GuDzhbQLhOQF1t6AA/xznjXEftYFnA3LJFiAasXdz7ycJ2ws0A+Fpt6KV6oA8jjl6SgdU3JBKLSbJ73EY569EHCNzUcBdZHuxHXS3brbpcuWeUd4EXO8N7u1+OE/B1QYC/jnMf9KnQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725508821; c=relaxed/simple;
	bh=e17X/Vtiaq2Ou/rWKrsM1T8duG2MejA2cCY1ViuDvOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=up1+e7ZhOhq0uBCnGG0m9hm1EsIVh+iqOIv4sly37HsxuOwP17gS5q+YelwmZsyrKSCIwnBMfMKqceHuIKa6kvSs3ZpIipF5q9hb07g1cDIdquctnwmMrZZmZ7rYPKwtcGp0FLCaJLhL8PXAiYw+LnNyveziGxlfArfwV3Qdqd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqIOHnSt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E32FC4CEC4;
	Thu,  5 Sep 2024 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725508820;
	bh=e17X/Vtiaq2Ou/rWKrsM1T8duG2MejA2cCY1ViuDvOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PqIOHnSt9yXRYp6udd7+0ESxkOiKapOn59+ajurcRW0qgBzKG95CRLSvoHbuuwRsI
	 YCiDQhXtVpArYbyBntaeq0HP8cYLSRir87RSWyC3T3mOz9A2f9IL3FwoVizxqLAOSq
	 pqLkMn0ilut38VncnG2PCwNWjkTmI5BBYUtAXh5yMKrOiEQgJKJHMRlX8lrVzJvNRj
	 uVsBL9tmRT3QBqu0Lv7wYBsT9ZJ3axOjASI0+BfjH8EoOcGSPt14EMsE0338DhIMZK
	 WO5n5TZ95RjAtBt085/4jSURS/VSGDqwo2BpKmEat5fORlzSxUoC2EKbXs397JNFd7
	 x2bJyqCaX2dzQ==
Message-ID: <56456d5d-40b0-4d6c-9abf-7cbae1c70b92@kernel.org>
Date: Thu, 5 Sep 2024 12:00:16 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the f2fs
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20240902092405.7c26e742@canb.auug.org.au>
 <20240905101845.0a47926a@canb.auug.org.au>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240905101845.0a47926a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/9/5 8:18, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 2 Sep 2024 09:24:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>>
>>    fs/f2fs/data.c
>>
>> between commits:
>>
>>    f13c7184e62e ("f2fs: convert f2fs_write_begin() to use folio")
>>    357dd8479f8b ("f2fs: convert f2fs_write_end() to use folio")
>> (and maybe others)
>>
>> from the f2fs tree and commits:
>>
>>    a0f858d450ce ("f2fs: Convert f2fs_write_end() to use a folio")
>>    dfd2e81d37e1 ("f2fs: Convert f2fs_write_begin() to use a folio")
>>    a225800f322a ("fs: Convert aops->write_end to take a folio")
>>    1da86618bdce ("fs: Convert aops->write_begin to take a folio")
>>
>> from the vfs-brauner tree.
>>
>> This was too much for me to fix up, so I just used the f2fs tree from
>> next-20240830 for today.  Please discuss this and fix things up.
> 
> I took another shot at this and *I think* I figured it out - see below
> and I have also attached the final version of this file.  Please check
> and advise.

The fix looks fine.

Thanks,


